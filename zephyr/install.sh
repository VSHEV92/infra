# install packages
sudo apt install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget python3-dev python3-venv python3-tk \
  xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

# create python environment
python3 -m venv ~/zephyrproject/.venv
source ~/zephyrproject/.venv/bin/activate

# install west
pip install west
west init ~/zephyrproject

# add west python packages
cd ~/zephyrproject
west update
west zephyr-export
west packages pip --install

# add sdk
cd ~/zephyrproject/zephyr
west sdk install
