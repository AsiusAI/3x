dtc -@ -I dts -O dtb -o orangepi-5-max-cam0.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam0.dts
dtc -@ -I dts -O dtb -o orangepi-5-max-cam1.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam1.dts
dtc -@ -I dts -O dtb -o orangepi-5-max-cam2.dtbo imx415/max/rockchip/overlay/orangepi-5-max-cam2.dts

sudo cp *.dtbo /boot/dtb/rockchip/overlay/