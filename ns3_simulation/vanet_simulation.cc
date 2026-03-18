#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/mobility-module.h"
#include "ns3/internet-module.h"
#include "ns3/yans-wifi-helper.h"
#include "ns3/wifi-module.h"
#include "ns3/applications-module.h"
#include "ns3/netanim-module.h"
#include "ns3/flow-monitor-module.h"

#include "ns3/aodv-module.h"
#include "ns3/olsr-helper.h"
#include "ns3/dsdv-helper.h"
#include "ns3/ns2-mobility-helper.h"

#include <fstream>
#include <iomanip>

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("VanetSimulation");

int main(int argc, char *argv[])
{
    std::string protocol = "AODV";
    uint32_t nodes = 20;
    double bandwidth = 10;
    uint32_t packetSize = 1024;
    double simulationTime = 300;

    CommandLine cmd;
    cmd.AddValue("protocol","Routing protocol",protocol);
    cmd.AddValue("nodes","Number of nodes",nodes);
    cmd.AddValue("bandwidth","Bandwidth Mbps",bandwidth);
    cmd.AddValue("packetSize","Packet size",packetSize);
    cmd.Parse(argc,argv);

    NodeContainer nodeContainer;
    nodeContainer.Create(nodes);

    // Mobility file
    std::string mobilityFile = "/home/ankitseth/Desktop/COAProject/VanetSimulate_project/trace_files/mobility.tcl";

    if (!std::ifstream(mobilityFile))
    {
        std::cout << "ERROR: Mobility file not found\n";
        return 1;
    }

    Ns2MobilityHelper ns2(mobilityFile);
    ns2.Install();

    // VANET WiFi
    WifiHelper wifi;
    wifi.SetStandard(WIFI_STANDARD_80211p);

    YansWifiPhyHelper phy;
    YansWifiChannelHelper channel = YansWifiChannelHelper::Default();
    phy.SetChannel(channel.Create());

    // IMPORTANT: Increase range
    phy.Set("TxPowerStart", DoubleValue(33));
    phy.Set("TxPowerEnd", DoubleValue(33));

    WifiMacHelper mac;
    mac.SetType("ns3::AdhocWifiMac");

    wifi.SetRemoteStationManager("ns3::ConstantRateWifiManager",
        "DataMode", StringValue("OfdmRate6MbpsBW10MHz"),
        "ControlMode", StringValue("OfdmRate6MbpsBW10MHz"));

    NetDeviceContainer devices = wifi.Install(phy, mac, nodeContainer);

    // Routing
    InternetStackHelper internet;

    AodvHelper aodv;
    OlsrHelper olsr;
    DsdvHelper dsdv;

 // AOMDV-like tuning
    aodv.Set("EnableHello", BooleanValue(true));
    aodv.Set("HelloInterval", TimeValue(Seconds(1)));
    aodv.Set("AllowedHelloLoss", UintegerValue(3));
    aodv.Set("ActiveRouteTimeout", TimeValue(Seconds(15)));
    aodv.Set("NetDiameter", UintegerValue(50));
    aodv.Set("NodeTraversalTime", TimeValue(MilliSeconds(40)));

    if(protocol=="AOMDV")
    {
        internet.SetRoutingHelper(aodv);
        std::cout<<"Using AOMDV (AODV-based approximation)\n";
    }
    else if(protocol=="AODV")
        internet.SetRoutingHelper(aodv);
    else if(protocol=="OLSR")
        internet.SetRoutingHelper(olsr);
    else if(protocol=="DSDV")
        internet.SetRoutingHelper(dsdv);
    else{
      std::cout<<"Invalid protocol! Using AOMDV\n";
        internet.SetRoutingHelper(aodv);
    }

    internet.Install(nodeContainer);

    Ipv4AddressHelper ipv4;
    ipv4.SetBase("10.1.0.0","255.255.0.0");
    Ipv4InterfaceContainer interfaces = ipv4.Assign(devices);

    uint16_t port = 8080;
    std::string rate = std::to_string((int)bandwidth) + "Mbps";

    // Sink
    PacketSinkHelper sink("ns3::UdpSocketFactory",
                          InetSocketAddress(Ipv4Address::GetAny(),port));

    ApplicationContainer sinkApps;
    for(uint32_t i=1;i<nodes;i++)
        sinkApps.Add(sink.Install(nodeContainer.Get(i)));

    sinkApps.Start(Seconds(0.0));
    sinkApps.Stop(Seconds(simulationTime));

    // Clients
    ApplicationContainer clientApps;

    for(uint32_t i=0;i<nodes-1;i++)
    {
        OnOffHelper onoff("ns3::UdpSocketFactory",
            Address(InetSocketAddress(interfaces.GetAddress(i+1),port)));

        onoff.SetConstantRate(DataRate(rate),packetSize);

        onoff.SetAttribute("OnTime",
            StringValue("ns3::ConstantRandomVariable[Constant=1]"));
        onoff.SetAttribute("OffTime",
            StringValue("ns3::ConstantRandomVariable[Constant=0]"));

        ApplicationContainer app = onoff.Install(nodeContainer.Get(i));

        // IMPORTANT: Delay start (routing setup time)
        app.Start(Seconds(50.0 + i*0.1));
        app.Stop(Seconds(simulationTime));

        clientApps.Add(app);
    }

    // Animation
    AnimationInterface anim("vanet_animation.xml");
    anim.SetMaxPktsPerTraceFile(5000000);

    // Flow monitor
    FlowMonitorHelper flowmon;
    Ptr<FlowMonitor> monitor = flowmon.InstallAll();

    std::cout << "Simulation started...\n";

    Simulator::Stop(Seconds(simulationTime));
    Simulator::Run();

    std::cout << "Simulation finished...\n";

    monitor->CheckForLostPackets();

    auto stats = monitor->GetFlowStats();

    uint64_t totalTx=0, totalRx=0, totalBytes=0;
    double totalDelay=0;

    for(auto &flow:stats)
    {
        totalTx += flow.second.txPackets;
        totalRx += flow.second.rxPackets;
        totalBytes += flow.second.rxBytes;
        totalDelay += flow.second.delaySum.GetSeconds();
    }

    double pdr = (totalTx>0) ? ((double)totalRx/totalTx)*100 : 0;
    double avgDelay = (totalRx>0) ? totalDelay/totalRx : 0;
    double throughput = totalBytes*8/(simulationTime*1000000);
    double overhead = (totalRx>0) ? (double)(totalTx-totalRx)/totalRx : 0;

    std::cout<<"\n=========== RESULTS ==========="<<std::endl;
    std::cout<<"Protocol: "<<protocol<<std::endl;
    std::cout<<"Nodes: "<<nodes<<std::endl;
    std::cout<<"Tx Packets: "<<totalTx<<std::endl;
    std::cout<<"Rx Packets: "<<totalRx<<std::endl;

    std::cout<<"PDR: "<<std::fixed<<std::setprecision(2)<<pdr<<" %"<<std::endl;
    std::cout<<"Delay: "<<std::fixed<<std::setprecision(6)<<avgDelay<<" s"<<std::endl;
    std::cout<<"Throughput: "<<std::fixed<<std::setprecision(2)<<throughput<<" Mbps"<<std::endl;
    std::cout<<"Routing Overhead: "<<std::fixed<<std::setprecision(3)<<overhead<<std::endl;

    std::cout<<"================================"<<std::endl;

    Simulator::Destroy();
    return 0;
}
