# About the Project
This project presents a simulation of a Vehicular Ad Hoc Network (VANET) by integrating SUMO for realistic traffic mobility and NS-3 for network communication. The simulation models dynamic vehicle movement based on real-world map data and evaluates the performance of routing protocols such as AODV, OLSR, AOMDV and DSDV. Key performance metrics including Packet Delivery Ratio (PDR), End-to-End Delay, Throughput, and Routing Overhead are analyzed under varying network conditions such as node density, vehicle speed, bandwidth, and packet size. The system enables flexible experimentation by allowing parameters to be modified through command-line inputs, making it suitable for comparative analysis of routing protocols in highly dynamic vehicular environments.
<hr>

## File Structure
<img width="702" height="654" alt="image" src="https://github.com/user-attachments/assets/c97ba473-6298-4175-8b33-892ad15a8d34" />
<hr>

## Steps to Follow:
1. Install Sumo in your Linux System
   - Commands<br>
     `sudo apt update && sudo apt install sumo sumo-tools sumo-doc -y`<br>
     `sumo --version`<br>
     `sudo apt install sumo-gui`<br>
     `sumo-gui`<br>
2. Install ns-3.40(or any other version in your Linux System)
   - Commands<br>
     `sudo apt update
      sudo apt install build-essential gcc g++ python3 python3-dev \
      cmake ninja-build git qtbase5-dev mercurial \
      libgtk-3-dev libxml2 libxml2-dev \
      libboost-all-dev -y`<br>
     `wget https://www.nsnam.org/releases/ns-allinone-3.40.tar.bz2
      tar -xjf ns-allinone-3.40.tar.bz2`<br>
     `cd ns-allinone-3.40/ns-3.40`<br>
     `./ns3 build`<br>
     `./ns3 run hello-simulator`<br>
     `sudo apt install netanim`<br>
     `NetAnim`
3.  Now create the Folder Structure
4.  Go to OpenStreetmap to download the map and store it in the osm_map directory and name the file as map.osm
5.  `netconvert --osm-files osm_map/map.osm -o sumo_files/city.net.xml`<br>
6.  `python3 /usr/share/sumo/tools/randomTrips.py \
-n sumo_files/city.net.xml \
-o sumo_files/city.rou.xml \
-b 0 -e 300 \
--period 15
--fringe factor 5`<br>
7. `sumo -c sumo_files/city.sumocfg \--fcd-output trace_files/fcd.xml`<br>
8. `python3 /usr/share/sumo/tools/traceExporter.py \
-i trace_files/fcd.xml \
--ns2mobility-output trace_files/mobility.tcl`<br>
9. `sumo-gui -c sumo_files/city.sumocfg`<br>
10. `cd ~/ns-allinone-3.40/ns-3.40`<br>
11. `nano scratch/vanet_simluation.cc`<br>
12. Write your ns-3 code
13. `./ns3 run scratch/vanet_simulation -- \<br>
--protocol=AODV \
--nodes=50 \
--bandwidth=10 \
--packetSize=1024`
14. `cd ~/ns-allinone-3.40/netanim-3.109`<br>
15. `./NetAnim`<br>
<hr>

## Note
To plot the values or to study the results trend using graph you can use the MATLAB codes present in the results_graph directory.<br>
<hr>

## To Vary the Parameters Value
  ### 1. To Change Bandwidth Value 
        Chane the value in the command line while running ns3 code.
  ### 2. To Change  Data Packets Size 
        Chane the value in the command line while running ns3 code.
  ### 3. To Change Number of Node
        - Delete the city.rou.xml, fcd.xml and mobility.tcl
        - Then follow again from step 6 note in the command change period value to change the number of nodes, like period =1 10, i.e., number of nodes = 300/10 = 30
   ### 4. To Change Node Speed
        - Delete fcd.xml and mobility.tcl
        - Open city.rou.xml
        - Add <vType id="car" accel="2.6" decel="4.5" sigma="0.5" length="5" maxSpeed="10"/> after <routes>
        - Find <trip id="0" .....>
        - Add type="car" like this <trip id="0" type="car" .....> to all the trips
        - Then follow the steps from step 7.
        - Aftewards change the maxspeed value in the city.rou.xml and follow from steps 7 again
