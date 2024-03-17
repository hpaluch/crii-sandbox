# Sandbox project for CoolRunner-II CPLD Starter Board

Here are "work-in-progress" projects for 
[Digilent CoolRunner-II CPLD Starter Board][Digilent CoolRunner-II CPLD Starter Board]

Current sandbox projects:
* [tut01-swleds/](tut01-swleds/) - most-trivial project in Verilog.
  - control LED LD0 & LD1 with Button BTN0
  - control LED LD2 & LD3 with Button BTN1

* [tut02-blink/](tut02-blink/) - most simple blinking LEDs demo
  - BTN0 (right button!) is counter RESET when pressed
  - BTN1 (left button!) is HOLD counter when pressed (internally there is inverted
    signal called `CE` (Counting Enabled))

* [tut03-disp/](tut03-disp/) - hexadecimal counter on 4 digit, 7 segment LED display
  and lowest 4-bits on LEDs
  - BTN0 (right button) to RESET counter
  - BTN1 (left button) to HOLD counter

General notes:
- you need to create manually HDL project - ISE generally does not
  support Git or any other revision system well (Vivado is a bit
  better - it can generate TCL
  script capable of creating full project and adding files to it from CLI)
- keep "Top-level source type:" `HDL` (this includes both Verilog and VHDL)
- selecting XC2C256 device, 144 pins, package TQ144, speed 7ns
  - set filters to:
    - Family: `CoolRunner2 CPLDs`
    - Device: `XC2C256`
    - Package: `TQ144`
    - Speed: `-7`
    - all other options can be left default.
- click Next and Finish to create project
- then add copy of constraint file (`*.ucf`) - it defines used Pins that will be
  mapped to Verilog module.
- next add copy of Verilog top module (`top.v`)
- Run Implement Design - it will create bitstream file `top.jed` (JEDEC)
- Then run iMPACT, select boundary scan
- add `top.jed` and select `Programm`

Required Hardware:

* [Digilent CoolRunner-II CPLD Starter Board][Digilent CoolRunner-II CPLD Starter Board]:
* A-Male to Mini-B USB cable
  - NOT included
  - It is NOT Micro-B!

Required Software:
* Xilinx ISE Webpack 14.7 - official VM, can be downloaded from:
  - https://account.amd.com/en/forms/downloads/xef.html?filename=Xilinx_ISE_14.7_Win10_14.7_VM_0213_1.zip
  - unpack above zip and import `ova/14.7_VM.ova` to your VirtualBox
  - or you can use normal installer, however only Win7 or XP are supported. I tried it under Win10,
    but some features cause crash (for example file dialogs will crash ISE)
  - Workaround for File Dialog crash under Win 10:
    - use 32-bit version of ISE (there is launch icon available)
  - also note that iMPACT works fine (even 64-bit version) under Win10

# Tips

Where to start? Go to
 - [Digilent CoolRunner-II CPLD Starter Board - Documentation][Digilent CoolRunner-II CPLD Starter Board Support]

There are all important files:
- Board Schematic
  - https://reference.digilentinc.com/_media/reference/programmable-logic/coolrunner-ii/coolrunner-ii_sch.pdf
- Digilent's demo source code:
  - https://reference.digilentinc.com/_media/reference/programmable-logic/coolrunner-ii/sourcecrii_demo.zip
- Board Reference manual
  - https://reference.digilentinc.com/reference/programmable-logic/coolrunner-ii/reference-manual

Really nice set of VHDL and Verilog Tutorials from AMD/Xilinx:
- https://www.amd.com/en/corporate/university-program/vivado/vivado-teaching-material/hdl-design.html
- however be aware that these tutorials are for Vivado (while CoolRunner II is supported
  under ISE only)

Resources:
- https://digilent.com/reference/_media/reference/programmable-logic/coolrunner-ii/sourcecrii_demo.zip
  - source of [common/netio.ucf](common/netio.ucf)


[Free Xilinx ISE WebPack license]: https://www.xilinx.com/support/licensing_solution_center.html
[Xilinx ISE Webpack 14.7]: https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/archive-ise.html
[Digilent CoolRunner-II CPLD Starter Board]: https://store.digilentinc.com/coolrunner-ii-cpld-starter-board-limited-time/
[Digilent CoolRunner-II CPLD Starter Board Support]: https://reference.digilentinc.com/reference/programmable-logic/coolrunner-ii/start?redirect=1
[Digilent Analog Discovery 2]: https://store.digilentinc.com/analog-discovery-2-100msps-usb-oscilloscope-logic-analyzer-and-variable-power-supply/
