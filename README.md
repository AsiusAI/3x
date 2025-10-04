# Asius 3X

```
git clone https://github.com/AsiusAI/3x
cd 3x
git submodule update --init --recursive
```


## Install ubuntu rockchip

https://github.com/Joshua-Riek/ubuntu-rockchip/releases/download/v2.4.0/ubuntu-24.04-preinstalled-server-arm64-orangepi-5-max.img.xz

flash this with Balena Etcher to the M.2 SSD. The Max version is okay for Ultra, the only difference should be the HDMI input/output port


ubuntu-24.04-preinstalled-server-arm64-orangepi-5-max.img


## Getting OV13855 camera working

See what overlays exist I used `orangepi-5-max-cam1.dtbo` overlay


```
# Check what devices exist, should have orangepi-5-max-cam1.dtbo overlay
ls /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay | grep cam1


sudo nano /etc/default/u-boot

# Edit this line
# U_BOOT_FDT_OVERLAYS="device-tree/rockchip/overlay/orangepi-5-max-cam0.dtbo device-tree/rockchip/overlay/orangepi-5-max-cam1.dtbo device-tree/rockchip/overlay/orangepi-5-max-cam2.dtbo"

sudo u-boot-update

sudo reboot


# See if finds cameras
dmesg | grep ov13855
# Should show something like `Detected OV00d855 sensor, REVISION 0xb0`

# Get test image
# To find the device use `v4l2-ctl --list-devices` (the first dev from rkisp_mainpath)
v4l2-ctl -d /dev/video33 --set-fmt-video=width=4224,height=3136,pixelformat='NV12' --stream-mmap --stream-skip=10 --stream-count=1 --stream-to=processed.yuv && ffmpeg -f rawvideo -pix_fmt nv12 -s 4224x3136 -i processed.yuv -y img.jpg
```


## For building Armbian OS

```
git clone https://github.com/armbian/build && cd armbian-build

./compile.sh BOARD=orangepi5-ultra RELEASE=noble BUILD_DESKTOP=yes DESKTOP_ENVIRONMENT=gnome DESKTOP_APPGROUPS_SELECTED='' DESKTOP_ENVIRONMENT_CONFIG_NAME=config_base BRANCH=vendor NETWORKING_STACK="network-manager" PREFER_DOCKER=no KERNEL_CONFIGURE=no

sudo dd if=output/images/Armbian-unofficial_25.11.0-trunk_Orangepi5-ultra_noble_vendor_6.1.115_gnome_desktop.img of=/dev/sda bs=4M status=progress conv=fsync
```


## A

cp orangepi-5-imx415-c1.dtbo /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay

/usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/rk3588-orangepi-5-max.dtb

device-tree/rockchip/overlay/orangepi-5-max-cam0.dtbo
device-tree/rockchip/overlay/orangepi-5-max-cam1.dtbo
device-tree/rockchip/overlay/orangepi-5-max-cam2.dtbo



sudo ./build.sh --suite noble --flavor server --board orangepi-5-max



## Getting openpilot to work

./tools/op.sh setup

./tools/op.sh venv

sudo apt update
sudo apt install libx11-dev libxcursor-dev libxrandr-dev libxi-dev libxinerama-dev
cd ~/3x/openpilot/third_party/raylib && ./build.sh

./tools/op.sh build

./launch_openpilot.sh

## Todo

- fix the max vs ultra 2nd hdmi display issue
- op fullscreen
- op use imx415
- run op on boot and without a login screen
- use ubuntu-rockchip server version?
- op working with panda
- 






sudo apt update

git clone https://github.com/asius.ai/3x
cd 3x
git submodule update --init --recursive openpilot
cd openpilot
./tools/op.sh setup
./tools/op.sh venv

sudo apt install libx11-dev libxcursor-dev libxrandr-dev libxi-dev libxinerama-dev
./third_party/raylib/build.sh

./tools/op.sh build


mkdir -p /home/ubuntu/.comma/persist/comma/ && ssh-keygen -t rsa -N "" -f /home/ubuntu/.comma/persist/comma/id_rsa


sudo apt install tmux

sudo mkdir /data && sudo chown ubuntu /data

sudo apt install xserver-xorg openbox xterm mesa-utils xinit





# DEV=GPU (on orangepi official os)


sudo add-apt-repository ppa:liujianfeng1994/panfork-mesa
sudo add-apt-repository ppa:liujianfeng1994/rockchip-multimedia
sudo apt update

sudo apt install rockchip-multimedia-config
sudo apt install libmali-g610-x11

sudo reboot

clinfo



# OS problems

## Orange Pi 1.0.0 Jammy with Linux 5.10.160-rockchip-rk3588 from OrangePi website

Pros:
- desktop with display works
- openpilot with panda works
- GPU=1 works in tinygrad

Cons:
- can't get any image from cameras, but they are recognized in dmesg
- larger OS
- no way to build it myself
- no community support


## ubuntu-rockchip

Pros:
- can build it myself (although it takes very long)
- cameras work fine, even IMX415
- not sure but maybe even openpilot worked

Cons:
- development stopped
- large OS
- build

## Armbian

Pros:
- build easy and fast
- small OS
- will receive updates

Cons:
- cameras not working (because rkif and rkisp don't exist)

Unknown:
- openpilot
- GPU=1 tinygrad