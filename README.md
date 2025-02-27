# VHDL-Oscilloscope

## Overview
The **Simple Oscilloscope** is an FPGA-based signal visualization tool using the **BASYS 3 FPGA** and **AD7819 A/D Converter**. It captures analog signals, converts them into digital data, and displays them on a **VGA monitor**.

## Features
- **Analog-to-Digital Conversion (ADC)** via **AD7819**
- **FPGA-Based Signal Processing** on **BASYS 3**
- **VGA Display Output** for waveform visualization
- **Capture Mode** to freeze and analyze signals
- **Custom Verilog Implementation** for timing and buffering  

## System Design  
- **FPGA:** BASYS 3 (Xilinx Artix-7)  
- **ADC:** AD7819 (8-bit, SPI-based)  
- **Clock:** 100MHz FPGA Clock  
- **Buffering:** 640-element buffer for waveform storage  
- **VGA Output:** 640x480 resolution  

## Repository Structure
- `/docs/` - Reports, schematics, and timing diagrams  
- `/fpga/` - Verilog code for FPGA implementation  
- `/hardware/` - Circuit diagrams and FPGA pin mappings  
- `/software/` - Data processing scripts (if needed)  
- `/assets/` - Images, test results, and oscilloscope output  

## Getting Started
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/SimpleOscilloscope.git
