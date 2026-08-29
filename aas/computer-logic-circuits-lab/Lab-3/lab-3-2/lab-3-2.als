* Schematics Aliases *

.ALIASES
U_DSTM1          DSTM1(PWR=$G_DPWR GND=$G_DGND OUT0=A0 )
U_DSTM2          DSTM2(PWR=$G_DPWR GND=$G_DGND OUT0=A1 )
U_DSTM3          DSTM3(PWR=$G_DPWR GND=$G_DGND OUT0=A2 )
U_DSTM4          DSTM4(PWR=$G_DPWR GND=$G_DGND OUT0=A3 )
X_U1            U1(INA=A0 INB=A1 INC=A2 IND=A3 RBIbar=$D_HI LTbar=$D_LO
+  BIbar/RBObar=$D_HI OUTA=a OUTB=b OUTC=c OUTD=d OUTE=e OUTF=f OUTG=g
+  PWR=$G_DPWR GND=$G_DGND )
_    _(A0=A0)
_    _(A1=A1)
_    _(A2=A2)
_    _(A3=A3)
_    _(a=a)
_    _(b=b)
_    _(c=c)
_    _(d=d)
_    _(e=e)
_    _(f=f)
_    _(g=g)
_    _($G_DGND=$G_DGND)
_    _($G_DPWR=$G_DPWR)
.ENDALIASES

