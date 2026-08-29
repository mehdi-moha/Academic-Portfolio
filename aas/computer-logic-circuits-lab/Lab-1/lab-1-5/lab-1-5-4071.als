* Schematics Aliases *

.ALIASES
X_U1A           U1A(A=InputA B=InputB J=Output VDD=$G_CD4000_VDD
+  VSS=$G_CD4000_VSS )
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=InputA )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=InputB )
_    _(InputA=InputA)
_    _(InputB=InputB)
_    _(Output=Output)
_    _($G_CD4000_VDD=$G_CD4000_VDD)
_    _($G_CD4000_VSS=$G_CD4000_VSS)
_    _($G_DPWR=$G_DPWR)
_    _($G_DGND=$G_DGND)
.ENDALIASES

