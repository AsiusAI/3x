uname -a
sudo cat /boot/armbianEnv.txt 
dtc -I dtb -O dts /boot/dtb/rockchip/overlay/orangepi-5-max-cam0.dtbo 
dmesg | grep ov13855
v4l2-ctl --list-devices
v4l2-ctl -d0 --all
dmesg | grep rkcif
dmesg | grep rkisp
media-ctl -p -d /dev/media0
media-ctl -p -d /dev/media1