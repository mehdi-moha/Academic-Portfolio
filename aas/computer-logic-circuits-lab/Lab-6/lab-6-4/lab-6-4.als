* Schematics Aliases *

.ALIASES
X_U1            U1(Ebar=$D_LO S0=A0 S1=A1 S2=A2 I0=$D_LO I1=$D_HI I2=$D_HI
+  I3=$D_LO I4=$D_HI I5=$D_LO I6=$D_LO I7=$D_HI Z=F Zbar=$N_0001 PWR=$G_DPWR
+  GND=$G_DGND )
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=A0 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=A1 )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=A2 )
_    _(F=F)
_    _(A0=A0)
_    _(A1=A1)
_    _(A2=A2)
_    _($G_DPWR=$G_DPWR)
_    _($G_DGND=$G_DGND)
.ENDALIASES

