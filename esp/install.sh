# install packages
sudo apt-get install git wget flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 -y

# clone idf
mkdir -p ~/esp
cd ~/esp
git clone -b v5.2.5 --recursive https://github.com/espressif/esp-idf.git

# install all tools
cd ~/esp/esp-idf
./install.sh all

# add idf init to zshrc
echo 'source ~/esp/esp-idf/export.sh' >> ~/.zshrc

# add user to dialout group
sudo usermod -a -G dialout $USER
