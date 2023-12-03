** Simple CMOS Inverter using PTM 45 nm Node

.include CMOSP.inc
.include CMOSN.inc

** Circuit Netlist

** Supply and Input Sources
VSUP VDD 0 1.0
VPIN IN  0 PULSE 0 1.0 1ns 10ps 10ps 2ns 4ns

** Transistors
M_PU OUT IN VDD VDD CMOSP L=45e-9 W=180e-9
M_PN OUT IN 0   0   CMOSN L=45e-9 W=120e-9

** Analysis Setup
.TRAN 0.1ns 5n

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT

** Print and Measurement
.PRINT V(IN) V(OUT)
.MEASURE TRAN AVG_PWR AVG P(M_PU)

.END