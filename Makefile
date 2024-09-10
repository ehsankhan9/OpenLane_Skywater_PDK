################################################################################
#  +  Author      : Muhammad Ehsan                                             #
#  +  Date        : 07-Sep-2024                                                #
#  +  Description : This makefile is for installing openlane and skywater_pdk. #
################################################################################

all: install_dependencies install_docker install_skywater_pdk install_openlane install_klayout

install_dependencies:
	@echo "Installing Dependencies..."
	sudo apt update
	sudo apt-get update
	sudo apt install -y build-essential python3 python3-pip make git
	sudo apt install -y libcairo2-dev libx11-dev libxkbcommon-x11-dev
	sudo apt-get install -y ca-certificates curl gnupg lsb-release
	sudo apt-get install -y g++ git libqt5svg5-dev qttools5-dev libqt5xmlpatterns5-dev \
		qtmultimedia5-dev libqt5multimediawidgets5 libqt5multimedia5-plugins libqt5multimedia5
	sudo apt-get install -y ruby ruby-dev python3-dev libexpat1-dev libssl-dev
	@echo "Dependencies Installed."

install_docker:
	@echo "Installing Docker..."
	sudo apt update
	sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
	sudo rm -f /etc/apt/sources.list.d/docker.list
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker $$USER
	@echo "Docker Installed."

install_openlane:
	@echo "Installing OpenLane..."
	git clone https://github.com/The-OpenROAD-Project/OpenLane
	cd OpenLane && make
	@echo "OpenLane Installed."
	
install_skywater_pdk:
	@echo "Installing Skywater PDK..."
	git clone https://github.com/google/skywater-pdk
	cd skywater-pdk && \
	git submodule update --init libraries/sky130_fd_io/latest && \
	git submodule update --init libraries/sky130_fd_pr/latest && \
	git submodule update --init libraries/sky130_fd_sc_hd/latest && \
	git submodule update --init libraries/sky130_fd_sc_hvl/latest && \
	make timing
	@echo "Skywater PDK Installed."
test:
	@echo "Testing OpenLAne...."
	cd OpenLane && make test
	
install_klayout:
	@echo "Installing Klayout..."
	sudo apt install klayout
	@echo "Klayout Installed."
	
	
