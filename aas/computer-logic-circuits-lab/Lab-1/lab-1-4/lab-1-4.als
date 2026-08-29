* Schematics Aliases *

.ALIASES
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=InputA )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=InputB )
X_U1A           U1A(A=InputA B=InputB Y=Output PWR=$G_DPWR GND=$G_DGND )
_    _(InputA=InputA)
_    _(InputB=InputB)
_    _(Output=Output)
_    _($G_DGND=$G_DGND)
_    _($G_DPWR=$G_DPWR)
.ENDALIASES

