*version 9.1 2258233833
u 23
U? 2
DSTM? 2
? 3
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB not.stl
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1576 
@status
n 0 105:04:27:13:22:43;1117225363 e 
s 2832 105:04:28:07:28:46;1117290526 e 
*page 1 0 1520 970 iB
@ports
@parts
part 2 74AS02 290 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 3 DigStim 250 110 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 17 nodeMarker 380 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=F
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 18 nodeMarker 260 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
@conn
w 14
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 360 110 380 110 13
a 0 sr 3 0 370 108 hcn 100 LABEL=F
a 0 up 33 0 370 109 hct 100 LVL=
w 5
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 110 280 110 19
a 0 sr 3 0 260 108 hcn 100 LABEL=A0
a 0 up 33 0 260 109 hct 100 LVL=
s 280 100 280 110 6
s 280 110 280 120 16
s 290 100 280 100 4
s 280 120 290 120 8
s 250 110 260 110 10
@junction
j 280 110
+ w 5
+ w 5
j 260 110
+ p 18 pin1
+ w 5
j 290 100
+ p 2 A
+ w 5
j 290 120
+ p 2 B
+ w 5
j 360 110
+ p 2 Y
+ w 14
j 380 110
+ p 17 pin1
+ w 14
j 250 110
+ p 3 *OUT
+ w 5
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
