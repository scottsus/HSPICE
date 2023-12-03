** Simple RC Circuit

.PARAM VDD = 0.8

** Supply Sources
VSUP VS 0  'VDD/2'

** Circuit Components
R1   VS VO 1x
C1   VO 0  1f

** Initial Condition
.IC V(VO)='VDD'

** Analysis Setup
.TRAN 0.1u 1u

** Control Information
.OPTION POST BRIEF NOMOD PROBE MEASOUT


** Print and Measurement
.PRINT V(VO)
.MEASURE TRAN RTL TRIG AT=0 TARG V(VO) VAL=0.6 FALL=1
.MEASURE TRAN AVG_CUR AVG I(C1) FROM 0 to 'RTL'
.MEASURE TRAN AVG_PWR AVG P(C1) FROM 0 to 'RTL'

.END

