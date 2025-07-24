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

# add rule for jtag
cd /etc/udev/rules.d
sudo wget https://github.com/espressif/openocd-esp32/blob/master/contrib/60-openocd.rules

cat << EOF | sudo tee /etc/udev/rules.d/70-esp32s3-jtag.rules
ATTRS{idVendor}=="303a", ATTRS{idProduct}=="1001", MODE="0660", GROUP="plugdev", TAG+="uaccess"
EOF
sudo udevadm control --reload-rules && sudo udevadm trigger

# add user to dialout and plugdev groups
sudo usermod -a -G dialout $USER
sudo usermod -a -G plugdev $USER
