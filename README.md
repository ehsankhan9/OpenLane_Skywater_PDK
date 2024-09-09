# Overview
This repository provides a comprehensive guide for setting up OpenLANE, an automated RTL to GDSII flow, and the SkyWater 130nm PDK. OpenLANE integrates a variety of open-source tools and custom scripts for performing complete ASIC implementation, from RTL all the way down to GDSII.

#### OpenLANE 
It is an open-source flow that automates the process of designing a chip. It handles the full digital design process, from reading RTL code, generating the gate-level netlist, optimizing it, placing and routing the design, and verifying the physical layout with DRC and LVS checks. All this happens in an automated and streamlined fashion using the integrated tools.

#### SkyWater 130nm PDK
This is a set of technology files provided by SkyWater Technology Foundry for their 130nm process node. The PDK includes process-related data such as transistor models, design rules, and physical libraries, which are required to create tape-out-ready designs that adhere to the fabrication rules of the foundry.

#### Comprehensive Flow
 This setup allows designers to go through the entire ASIC design process starting from RTL-level description of a digital circuit, followed by synthesis, floorplanning, placement, clock tree synthesis, routing, timing analysis, and eventually the generation of the GDSII file. The GDSII file is the final step before sending the design for fabrication. Each stage in the flow involves a specific tool from the toolchain integrated into OpenLANE.

#### Installation Ease
The repository simplifies the process by providing make commands, making it easier to install dependencies and tools without requiring users to manually configure each tool. Docker is used to ensure a consistent environment, making it easier to run the flow across different systems. By following this guide, you will be able to install and configure OpenLANE and the SkyWater PDK on your local system, enabling you to explore full-scale digital design flows, complete with physical design and tape-out-ready GDSII files.

# Installation Guide
This guide provides instructions for installing Docker, OpenLane, SkyWater PDK and klayout. Follow these steps to set up your environment.

## Prerequisites
Before you start, ensure you have a working Ubuntu system. You will need `sudo` privileges to install the required packages.

## Installation Steps

###  1. Clone Repository
Clone git repository:
```bash
git clone https://github.com/ehsankhan9/OpenLane_Skywater_PDK
```
Change directory:
```bash
cd OpenLane_Skywater_PDK
```
### 2. Install Dependencies
Install the necessary dependencies. Open a terminal and run:
```bash
make install_dependencies
```

### 3. Install Docker
To install Docker, execute the following command:
```bash
make install_docker
```

### 4. Install Skywater PDK
To install skywater pdk , execute the following command:
```bash
make install_skywater_pdk
```

### 5. Install OpenLane
To install OpenLane, execute the following command:
```bash
make install_openlane
```

### 6. Test OpenLane Installation
To verify that OpenLane has been installed correctly and is working as expected:
```bash
make test
```

### 7. Install Klayout
To install klayout:
```bash
make install_klayout
```

### 8. Verify Klayout
To verify klayout installed:
```bash
klayout -v
```

## Run

### To Synthesize Design

Change directory:
```bash
cd OpenLane
```

Monut openlane flow:
```bash
make mount
```

Give path of your design then execute following command:
```bash
./flow.tcl -design /path/to/your/design
```

### To View Schematics
For view schematic or gds file, go to OpenLane directory:
```bash
cd OpenLane
```

To view schematics, give path of RUN_(time_stamp) folder which is inside the run folder:
```bash
sudo python3 ./gui.py --viewer klayout /path/to/your/design/runs/RUN_(time_stamp)
```







