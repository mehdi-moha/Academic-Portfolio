* Schematics Aliases *

.ALIASES
X_U3A           U3A(A=Cin B=$N_0001 Y=$N_0002 PWR=$G_DPWR GND=$G_DGND )
X_U1A           U1A(A=A0 B=A1 Y=$N_0001 PWR=$G_DPWR GND=$G_DGND )
X_U2A           U2A(A=Cin B=$N_0001 Y=SUM PWR=$G_DPWR GND=$G_DGND )
X_U4A           U4A(A=$N_0002 B=$N_0003 Y=Co PWR=$G_DPWR GND=$G_DGND )
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=A0 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=A1 )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=Cin )
X_U5A           U5A(A=A0 B=A1 Y=$N_0003 PWR=$G_DPWR GND=$G_DGND )
_    _(Cin=Cin)
_    _(A0=A0)
_    _(A1=A1)
_    _(SUM=SUM)
_    _(Co=Co)
_    _($G_DGND=$G_DGND)
_    _($G_DPWR=$G_DPWR)
.ENDALIASES

