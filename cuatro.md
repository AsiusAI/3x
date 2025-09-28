# STM32H725AGI6

https://jlcpcb.com/api/file/downloadByFileSystemAccessId/8588886131555913728
UFBGA-169 


## Can transceivers

| CAN  | Enabled | TX  | RX  |
| ---- | ------- | --- | --- |
| CAN1 | B7      | B8  | B9  |
| CAN2 | B10     | B5  | B6  |
| CAN3 | D8      | D12 | D13 |
| CAN4 | B11     | B12 | B13 |

## LEDs

| COLOR | PIN | PWM CHANNEL |
| ----- | --- | ----------- |
| RED   | C6  | 1           |
| GREEN | C7  | 2           |
| BLUE  | C9  | 4           |


## SBU

SBU1 - pin C4, relay A9
SBU2 - pin A1, relay A3


## SPI 
NSS - E11
SCK - E12
MISO - E13
MOSI - E14


## Others

FAN enabled - D3
BOOTKICK - A0l
VBAT_EN? - C12

Power readout? - C5 and A6 (MODE_ANALOG)

SOM GPIO? - C2

fan setup??? - C8

USB D- - A11
USB D+ - A12

VOLT_S? - F11 (MODE_ANALOG)

UART TX - E7
UART RX - E8


BOOT0?
NRST?
CRYSTAL? - 25 MHz crystal.

Detect board - D6 and D7 to GND


Audio???

Fan tachometer - D2


  set_gpio_alternate(GPIOA, 2, GPIO_AF8_SAI4);    // SAI4_SCK_B
  set_gpio_alternate(GPIOC, 0, GPIO_AF8_SAI4);    // SAI4_FS_B
  set_gpio_alternate(GPIOD, 11, GPIO_AF10_SAI4);  // SAI4_SD_A
  set_gpio_alternate(GPIOE, 3, GPIO_AF8_SAI4);    // SAI4_SD_B
  set_gpio_alternate(GPIOE, 4, GPIO_AF3_DFSDM1);  // DFSDM1_DATIN3
  set_gpio_alternate(GPIOE, 9, GPIO_AF3_DFSDM1);  // DFSDM1_CKOUT
  set_gpio_alternate(GPIOE, 6, GPIO_AF10_SAI4);   // SAI4_MCLK_B

# TJA1042T

https://www.nxp.com/docs/en/data-sheet/TJA1042.pdf


# Orangepi 5 Ultra / raspberry pi 5

## Power
5V - 2, 4
GND - 6, 9

## SPI
NSS - 24
SCK - 23
MISO - 21
MOSI - 19

## Debug UART???
TX - 8
RX - 10

## LSM6DSOXTR
I2C_SDA_M0 - 3
I2C_SCL_M0 - 5


# LSM6DSOXTR

https://jlcpcb.com/api/file/downloadByFileSystemAccessId/8588904583816601600

# Power/Buck


