** DRAM PTM45nm

.include CMOSP.inc
.include CMOSN.inc
.include ../data/dram_sweep_input.txt

.param VDD_VAL = 0.8
.param L_VAL   = 45e-9
.param W_VAL   = 120e-9
.param CAP_VAL = 1f

VSUP X 0 'VDD_VAL/2'
VG   Y 0 0

M1 X Y Z 0 CMOSN L=L_VAL W=W_VAL

C1 Z 0 CAP_VAL

.IC V(Z)=VDD_VAL

.TRAN 0.001u 200u SWEEP data=mydata

.OPTION POST BRIEF NOMOD PROBE MEASOUT

.MEASURE TRAN RTL TRIG AT=0 TARG V(Z) VAL=0.6 FALL=1
.MEASURE TRAN AVG_CUR AVG I(C1) FROM 0 to 'RTL'
.MEASURE TRAN AVG_POW AVG P(C1) FROM 0 to 'RTL'

.END