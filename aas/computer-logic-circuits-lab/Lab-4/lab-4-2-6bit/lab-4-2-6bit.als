* Schematics Aliases *

.ALIASES
U_DSTM10          DSTM10(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B3 )
U_DSTM9          DSTM9(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B2 )
U_DSTM8          DSTM8(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B1 )
U_DSTM7          DSTM7(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B0 )
U_DSTM4          DSTM4(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A3 )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A2 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A1 )
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A0 )
X_U2            U2(A3=Input_A3 A2=Input_A2 A1=Input_A1 A0=Input_A0 B3=Input_B3
+  B2=Input_B2 B1=Input_B1 B0=Input_B0 AgtB_IN=$D_LO AeqB_IN=$D_HI AltB_IN=$D_LO
+  AgtB=$N_0006 AeqB=$N_0005 AltB=$N_0004 PWR=$G_DPWR GND=$G_DGND )
U_DSTM12          DSTM12(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B5 )
U_DSTM11          DSTM11(PWR=$G_DPWR GND=$G_DGND OUT0=Input_B4 )
U_DSTM5          DSTM5(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A4 )
U_DSTM6          DSTM6(PWR=$G_DPWR GND=$G_DGND OUT0=Input_A5 )
X_U1            U1(A3=$D_LO A2=$D_LO A1=Input_A5 A0=Input_A4 B3=$D_LO B2=$D_LO
+  B1=Input_B5 B0=Input_B4 AgtB_IN=$N_0006 AeqB_IN=$N_0005 AltB_IN=$N_0004
+  AgtB=$N_0010 AeqB=$N_0009 AltB=$N_0008 PWR=$G_DPWR GND=$G_DGND )
_    _(Input_B3=Input_B3)
_    _(Input_B2=Input_B2)
_    _(Input_B1=Input_B1)
_    _(Input_B0=Input_B0)
_    _(Input_A3=Input_A3)
_    _(Input_A2=Input_A2)
_    _(Input_A1=Input_A1)
_    _(Input_A0=Input_A0)
_    _(Input_B5=Input_B5)
_    _(Input_B4=Input_B4)
_    _(Input_A4=Input_A4)
_    _(Input_A5=Input_A5)
_    _($G_DPWR=$G_DPWR)
_    _($G_DGND=$G_DGND)
.ENDALIASES

