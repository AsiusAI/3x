# Asius 3X

```
git clone https://github.com/AsiusAI/3x
cd 3x
git submodule update --init --recursive
```


## Install ubuntu rockchip

https://github.com/Joshua-Riek/ubuntu-rockchip/releases/download/v2.4.0/ubuntu-24.04-preinstalled-server-arm64-orangepi-5-max.img.xz

flash this with Balena Etcher to the M.2 SSD. The Max version is okay for Ultra, the only difference should be the HDMI input/output port



## Getting OV13855 camera working

See what overlays exist I used `orangepi-5-max-cam1.dtbo` overlay


```
# Check what devices exist, should have orangepi-5-max-cam1.dtbo overlay
ls /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay | grep cam1


sudo nano /etc/default/u-boot

# Edit this line
# U_BOOT_FDT_OVERLAYS="device-tree/rockchip/overlay/orangepi-5-max-cam1.dtbo"

sudo u-boot-update

sudo reboot


# See if finds cameras
dmesg | grep ov13855
# Should show something like `Detected OV00d855 sensor, REVISION 0xb0`

# Get test image
# To find the device use `v4l2-ctl --list-devices` (the first dev from rkisp_mainpath)
v4l2-ctl -d /dev/video33 --set-fmt-video=width=4224,height=3136,pixelformat='NV12' --stream-mmap --stream-skip=10 --stream-count=1 --stream-to=processed.yuv && ffmpeg -f rawvideo -pix_fmt nv12 -s 4224x3136 -i processed.yuv -y img.jpg
```


## For building Armbian OS (not used currently)

```
git clone https://github.com/armbian/build && cd armbian-build

./compile.sh BOARD=orangepi5-ultra RELEASE=noble BUILD_MINIMAL=yes BRANCH=vendor NETWORKING_STACK="network-manager"

sudo dd if=output/images/Armbian-unofficial_25.11.0-trunk_Orangepi5-ultra_noble_vendor_6.1.115_minimal.img of=/dev/sda bs=4M status=progress conv=fsync
```


## A

cp orangepi-5-imx415-c1.dtbo /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay

/usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/rk3588-orangepi-5-max.dtb

device-tree/rockchip/overlay/orangepi-5-max-cam0.dtbo
device-tree/rockchip/overlay/orangepi-5-max-cam1.dtbo
device-tree/rockchip/overlay/orangepi-5-max-cam2.dtbo



sudo ./build.sh --suite noble --flavor server --board orangepi-5-max