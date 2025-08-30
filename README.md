# Asius 3X

```
git clone https://github.com/AsiusAI/3x
cd 3x
git submodule update --init --recursive
```

## Building OS

```
cd armbian-build
mkdir userpatches && cp ../custom.sh userpatches/custom.sh

./compile.sh BOARD=orangepi5-ultra RELEASE=noble BUILD_MINIMAL=yes BRANCH=vendor NETWORKING_STACK="network-manager"

sudo dd if=output/images/Armbian-unofficial_25.11.0-trunk_Orangepi5-ultra_noble_vendor_6.1.115_minimal.img of=/dev/sda bs=4M status=progress conv=fsync
```