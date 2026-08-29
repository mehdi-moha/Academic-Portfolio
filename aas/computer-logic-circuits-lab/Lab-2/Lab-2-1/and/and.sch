*version 9.1 2270047301
u 39
U? 3
DSTM? 3
? 7
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB and.stl
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
pageloc 1 0 2351 
@status
n 0 105:04:27:13:04:17;1117224257 e 
s 0 105:04:28:07:23:18;1117290198 e 
*page 1 0 1520 970 iB
@ports
@parts
part 3 74AS00 360 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 2 74AS00 270 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 17 DigStim 250 100 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 18 DigStim 250 120 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 34 nodeMarker 450 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 35 nodeMarker 260 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 37 nodeMarker 260 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 5
a 0 up 0:33 0 0 0 hln 100 LVL=
s 360 100 350 100 4
s 350 100 350 110 6
s 350 120 360 120 8
s 350 110 350 120 16
s 340 110 350 110 10
a 0 up 33 0 345 109 hct 100 LVL=
w 24
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 430 110 450 110 23
a 0 sr 3 0 440 108 hcn 100 LABEL=F
a 0 up 33 0 440 109 hct 100 LVL=
w 22
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 120 270 120 36
a 0 sr 3 0 260 118 hcn 100 LABEL=A1
s 250 120 260 120 26
a 0 up 33 0 260 119 hct 100 LVL=
w 20
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 100 270 100 38
a 0 sr 3 0 260 98 hcn 100 LABEL=A0
s 250 100 260 100 25
a 0 up 33 0 260 99 hct 100 LVL=
@junction
j 360 100
+ p 3 A
+ w 5
j 360 120
+ p 3 B
+ w 5
j 340 110
+ p 2 Y
+ w 5
j 350 110
+ w 5
+ w 5
j 430 110
+ p 3 Y
+ w 24
j 250 100
+ p 17 *OUT
+ w 20
j 270 100
+ p 2 A
+ w 20
j 250 120
+ p 18 *OUT
+ w 22
j 270 120
+ p 2 B
+ w 22
j 450 110
+ p 34 pin1
+ w 24
j 260 120
+ p 35 pin1
+ w 22
j 260 100
+ p 37 pin1
+ w 20
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
