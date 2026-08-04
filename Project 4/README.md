# Vending Machine in Verilog

## Description

This project implements a vending machine controller using a Finite State Machine (FSM).

### Features

- Accepts ₹5 and ₹10 coins
- Product price = ₹15
- Dispenses product when ₹15 is reached
- Returns ₹5 change if ₹20 is inserted
- Asynchronous reset
- Compatible with VS Code and Icarus Verilog

## Files

- vending_machine.v
- vending_machine_tb.v

## Compile

```bash
iverilog -o vending_machine vending_machine.v vending_machine_tb.v
```

## Run

```bash
vvp vending_machine
```

