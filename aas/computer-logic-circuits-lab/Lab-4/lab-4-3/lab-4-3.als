* Schematics Aliases *

.ALIASES
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=A0 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=A1 )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=A2 )
U_DSTM4          DSTM4(PWR=$G_DPWR GND=$G_DGND OUT0=A3 )
X_U3A           U3A(A=$N_0001 B=$N_0002 Y=Pe PWR=$G_DPWR GND=$G_DGND )
X_U2A           U2A(A=A2 B=A3 Y=$N_0002 PWR=$G_DPWR GND=$G_DGND )
X_U1A           U1A(A=A0 B=A1 Y=$N_0001 PWR=$G_DPWR GND=$G_DGND )
_    _(A0=A0)
_    _(A1=A1)
_    _(A2=A2)
_    _(A3=A3)
_    _(Pe=Pe)
_    _($G_DPWR=$G_DPWR)
_    _($G_DGND=$G_DGND)
.ENDALIASES

