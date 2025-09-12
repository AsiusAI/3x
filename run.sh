dtc -@ -I dts -O dtb -o orangepi-5-max-cam0.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam0.dts
dtc -@ -I dts -O dtb -o orangepi-5-max-cam1.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam1.dts
dtc -@ -I dts -O dtb -o orangepi-5-max-cam2.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam2.dts

dtc -@ -I dts -O dtb -o rk3588-orangepi-5-max.dtb imx415/max/rockchip/rk3588-orangepi-5-max.dts

sudo cp orangepi-5-max-cam0.dtbo /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay
sudo cp orangepi-5-max-cam1.dtbo /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay
sudo cp orangepi-5-max-cam2.dtbo /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/overlay

sudo cp rk3588-orangepi-5-max.dtb /usr/lib/firmware/6.1.0-1025-rockchip/device-tree/rockchip/

# then run sudo u-boot-update && sudo reboot