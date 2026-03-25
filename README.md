# PWM RGB LED Controller

A multi-channel Pulse Width Modulation (PWM) LED RGB control module implemented with Verilog, utilizing Finite State Machine (FSM) automatic color sequencing and tested with a self-checking testbench

## Overview

This project simulates an LED RGB control module that automatically cycle through red, green, blue, and white colors. The colors are individually controlled with their own PWM channel that will adjust the brightness by continuously switching a signal on and off. The system is composed of 4 Verilog modules that work together in a hardware hierarchy


## Architecture

The PWM module creates a variable duty cycle signal by comparing a continuously running counter with a configurable duty cycle value. The RGB control module instantiates three independent PWM modules, one for each color channel. The FSM cycles through each of the 4 color states and holds each for 5000 clock cycles before transitioning to the next. The testbench verifies  the PWM module an automatic pass/fail check and simulates the full RGB cycle to confirm the correct color order.


## How to run

-- iverilog must be installed --

-- Run PWM simulation --

```bash
iverilog -o sim/pwm_sim src/pwm.v src/pwmtb.v
vvp sim/pwm_sim
```

-- Run RBG system simulation -- 

```bash
iverilog -o sim/rgb_sim src/pwm.v src/rgbcontroller.v src/colorfsm.v src/rgbtb.v
vvp sim/rgb_sim
```


## File Structure

## File Structure

src/
├── pwm.v            - Parametizable PWM module with 8-bit duty cycle resolution
├── pwmtb.v          - Self-checking testbench for PWM module
├── rgbcontroller.v  - RGB controller instantiating 3 independent PWM channels
├── colorfsm.v       - FSM that cycles through red, green, blue, and white states
└── rgbtb.v          - Full system testbench for RGB control module and FSM