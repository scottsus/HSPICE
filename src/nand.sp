** NAND2 PTM45nm

.include CMOSP.inc
.include CMOSN.inc

.param VDD_VAL = 1.0
.param L_VAL   = 45e-9
.param P_W_VAL = 180e-9
.param N_W_VAL = 120e-9

V_SUP   VDD 0 VDD_VAL
V_PIN_A V_A 0 PULSE 0 VDD_VAL 1ns 10ps 10ps 1ns 2ns
V_PIN_B V_B 0 PULSE 0 VDD_VAL 1ns 10ps 10ps 2ns 4ns

M_PU_A OUT  V_A VDD  VDD CMOSP L=L_VAL W=P_W_VAL
M_PU_B OUT  V_B VDD  0   CMOSP L=L_VAL W=N_W_VAL
M_PD_A OUT  V_A V_AB VDD CMOSN L=L_VAL W=P_W_VAL
M_PD_B V_AB V_B 0    0   CMOSN L=L_VAL W=N_W_VAL

.IC V(V_AB)=0

.TRAN 0.1ns 10n

.OPTION POST BRIEF NOMOD PROBE MEASOUT

.PRINT V(V_A) V(V_B) V(OUT)

.END