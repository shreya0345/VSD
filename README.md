# A 4-week Research Internship on VSDSquadron Mini RISC-V Dev Board

BOARD SPECIFICATIONS:

| Tech specs   |   |    |
|------------|------------|------------|
| *Board* | Name     | VSDSquadron Mini    |
|      | SKU    | VSDSQM    |
| *Microcontroller*    | CH32V003F4U6 chip with 32-bit RISC-V core based on RV32EC instruction set    |     |
| *USB connector* | USB 2.0 Type-C    |     |
| *Pins*     | Built-in LED Pin     | 1X onboard user led (PD6)     |
|      | Digital I/O pins     | 15     |
|      | Analog I/O pins     | 10-bit ADC, PD0-PD7, PA1, PA2, PC4     |
|      | PWM pins     | 14X     |
|      | External interrupts     | 	8 external interrupt edge detectors, but it only maps one external interrupt to 18 I/O ports     |
| *Communication*     | USART     | 	1x, PD6(RX), PD5(TX)     |
|      | I2C     | 1x, PC1(SDA), PC2(SCL)    |
|      | SPI     | 1x, PC5(SCK), PC1(NSS), PC6(MOSI), PC7(MISO)     |
|      | Programmer/debugger     | Onboard RISC-V programmer/debugger, USB to TTL serial port support     |
| *Power*     | I/O voltage     | 3.3 V    |
|      | Input voltage (nominal)     | 5 V    |
|      | Source Current per I/O Pin    | 8 mA     |
|      | Sink Current per I/O Pin     | 8 mA     |
| *Clock speed*     | Processor    | 24 MHz     |
| *Memory*     | SRAM     | 2kb onchip volatile sram,16kb external program memory     |
   

This repo is intended to document the weekly progress.

### The first online meet was held on 16th of Feb 2024 @6PM

<details>
    <summary> TASK 1 </summary>
 
1) install Yosys 

2) install iverilog 

3) install gtkwave

### CLONING RISC-V GNU TOOLCHAIN

# To install git 
sudo apt install git-all   

 make sure to install the dependencies
![git all](https://github.com/shreya0345/VSD/assets/160561583/b260dc73-66f2-4271-9cf8-749a851be015)



### INSTALLING YOSYS, IVERILOG & GTKWAVE.

### 1.YOSYS


git clone https://github.com/YosysHQ/yosys.git
![git clone](https://github.com/shreya0345/VSD/assets/160561583/73f9621b-9be7-45b8-a446-46295d7f4e50)
cd yosys 


sudo apt install make

sudo apt-get install build-essential clang bison flex \libreadline-dev gawk tcl-dev libffi-dev git \ graphviz xdot pkg-config python3 libboost-system-dev\libboost-python-dev libboost-filesystem-dev zlib1g-dev

make config-gcc
![WhatsApp Image 2024-02-20 at 3 35 05 PM (1)](https://github.com/shreya0345/VSD/assets/160561583/74a6046c-346a-4743-a34b-a9ccdf2d6dbe)
make 

sudo make install

![sudo install](https://github.com/shreya0345/VSD/assets/160561583/596086f3-00d2-42cd-801e-463f19fe8ed6)



### 2.iVerilog
installing iVerilog

sudo apt update

sudo apt-get install iverilog
![iverilog](https://github.com/shreya0345/VSD/assets/160561583/e6f86a3e-b0b8-4abd-ba11-d7e5d0dbba2f)

### 3.GTkWave
installing GTkWave

 sudo apt-get install gtkwave 
![gtkwave](https://github.com/shreya0345/VSD/assets/160561583/3cdcd47f-f931-4aec-842a-8e4e800bf091)

</details>

### The Second online meet was held on 20th of Feb 2024 @6PM
<details>
   <summary> TASK 2 </summary>

   ### Block diagram
   
   ![WhatsApp Image 2024-02-22 at 8 45 52 AM](https://github.com/shreya0345/VSD/assets/160561583/2a4928cd-46ec-4c75-973e-c93d21326c65)
   
### Waveform

![WhatsApp Image 2024-02-22 at 9 53 38 AM](https://github.com/shreya0345/VSD/assets/160561583/6dc56fd8-c4c6-4605-854f-ae44d005bdaf)

</details>


### The Third online meet was held on 22nd of Feb 2024 @6PM

<details>
   <summary> Task 3 </summary>
   
![WhatsApp Image 2024-02-27 at 1 28 53 PM ](https://github.com/shreya0345/VSD/assets/160561583/b16dab4d-e6be-44af-baaa-2860399fb538)

![WhatsApp Image 2024-02-27 at 1 29 11 PM ](https://github.com/shreya0345/VSD/assets/160561583/01996acc-d5c8-46a0-98e4-e494277f6ddb)

![WhatsApp Image 2024-02-27 at 1 29 23 PM ](https://github.com/shreya0345/VSD/assets/160561583/26ae9f7a-63d0-4434-bb29-1253de524dbb)

![WhatsApp Image 2024-02-27 at 1 29 30 PM ](https://github.com/shreya0345/VSD/assets/160561583/bb352469-16a0-4fda-bd90-4dc523c2fee7)

![WhatsApp Image 2024-02-27 at 1 33 04 PM](https://github.com/shreya0345/VSD/assets/160561583/091d3196-7a6f-4a2c-a251-d117b8e071cd)

</details>
