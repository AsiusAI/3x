# Asius 3X

```
git clone https://github.com/AsiusAI/3x
cd 3x
git submodule update --init --recursive
```

## Building OS

```
cd armbian-build
./compile.sh BOARD=orangepi5-ultra RELEASE=noble BUILD_MINIMAL=yes BRANCH=vendor NETWORKING_STACK="network-manager" USER_NAME=asius USER_PASSWORD=asius ROOTPWD=asius
```