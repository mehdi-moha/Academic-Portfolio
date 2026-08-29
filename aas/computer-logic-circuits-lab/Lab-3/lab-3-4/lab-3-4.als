* Schematics Aliases *

.ALIASES
X_U2            U2(INA=$N_0001 INB=$N_0002 INC=$N_0003 IND=$N_0004 RBIbar=$D_HI
+  LTbar=$D_HI BIbar/RBObar=$D_HI OUTA=a OUTB=b OUTC=c OUTD=d OUTE=e OUTF=f
+  OUTG=g PWR=$G_DPWR GND=$G_DGND )
X_U1            U1(C0=CARRY-0 A1=A-1 A2=A-2 A3=A-3 A4=A-4 B1=B-1 B2=B-2 B3=B-3
+  B4=B-4 C4=CARRY-4 SUM1=$N_0001 SUM2=$N_0002 SUM3=$N_0003 SUM4=$N_0004
+  PWR=$G_DPWR GND=$G_DGND )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=A-2 )
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=A-3 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=A-4 )
U_DSTM9          DSTM9(PWR=$G_DPWR GND=$G_DGND OUT0=CARRY-0 )
U_DSTM8          DSTM8(PWR=$G_DPWR GND=$G_DGND OUT0=B-1 )
U_DSTM7          DSTM7(PWR=$G_DPWR GND=$G_DGND OUT0=B-2 )
U_DSTM5          DSTM5(PWR=$G_DPWR GND=$G_DGND OUT0=B-4 )
U_DSTM4          DSTM4(PWR=$G_DPWR GND=$G_DGND OUT0=A-1 )
U_DSTM6          DSTM6(PWR=$G_DPWR GND=$G_DGND OUT0=B-3 )
_    _(a=a)
_    _(b=b)
_    _(c=c)
_    _(d=d)
_    _(e=e)
_    _(f=f)
_    _(g=g)
_    _(A-4=A-4)
_    _(A-3=A-3)
_    _(A-2=A-2)
_    _(A-1=A-1)
_    _(B-4=B-4)
_    _(B-3=B-3)
_    _(B-2=B-2)
_    _(B-1=B-1)
_    _(CARRY-0=CARRY-0)
_    _(CARRY-4=CARRY-4)
_    _($G_DPWR=$G_DPWR)
_    _($G_DGND=$G_DGND)
.ENDALIASES

