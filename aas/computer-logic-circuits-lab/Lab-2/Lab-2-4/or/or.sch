*version 9.1 167924144
u 111
U? 5
DSTM? 4
? 13
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB or.stl
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
pageloc 1 0 3719 
@status
n 0 105:04:27:15:21:27;1117232487 e 
s 0 105:04:28:07:30:56;1117290656 e 
*page 1 0 1520 970 iB
@ports
@parts
part 2 74AS02 190 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 56 DigStim 150 70 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 57 DigStim 150 90 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 58 DigStim 150 140 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=A2
part 3 74AS02 290 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 4 74AS02 400 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 6 -2 hln 100 REFDES=U3A
part 5 74AS02 500 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 6 -2 hln 100 REFDES=U4A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 104 nodeMarker 590 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 105 nodeMarker 170 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 107 nodeMarker 170 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=11
part 109 nodeMarker 170 70 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=12
@conn
w 13
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 80 280 80 18
s 280 80 280 90 20
s 280 70 280 80 14
s 280 90 290 90 16
s 290 70 280 70 12
a 0 up 33 0 285 69 hct 100 LVL=
w 22
a 0 up 0:33 0 0 0 hln 100 LVL=
s 360 80 380 80 41
s 380 80 380 100 40
s 380 100 400 100 23
a 0 up 33 0 390 99 hct 100 LVL=
w 7
a 0 up 0:33 0 0 0 hln 100 LVL=
s 490 100 490 110 8
s 490 110 490 120 74
s 470 110 490 110 27
a 0 up 33 0 480 109 hct 100 LVL=
s 500 100 490 100 6
s 490 120 500 120 10
w 31
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 570 110 590 110 92
a 0 sr 3 0 580 108 hcn 100 LABEL=F
a 0 up 33 0 580 109 hct 100 LVL=
w 50
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 140 380 140 106
a 0 sr 3 0 170 138 hcn 100 LABEL=A2
s 150 140 170 140 63
a 0 up 33 0 170 139 hct 100 LVL=
s 380 120 380 140 34
s 400 120 380 120 32
w 62
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 90 190 90 108
a 0 sr 3 0 170 88 hcn 100 LABEL=A1
s 150 90 170 90 61
a 0 up 33 0 170 89 hct 100 LVL=
w 60
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 70 190 70 110
a 0 sr 3 0 170 68 hcn 100 LABEL=A0
s 150 70 170 70 59
a 0 up 33 0 170 69 hct 100 LVL=
@junction
j 150 140
+ p 58 *OUT
+ w 50
j 400 120
+ p 4 B
+ w 50
j 150 90
+ p 57 *OUT
+ w 62
j 190 90
+ p 2 B
+ w 62
j 150 70
+ p 56 *OUT
+ w 60
j 190 70
+ p 2 A
+ w 60
j 470 110
+ p 4 Y
+ w 7
j 490 110
+ w 7
+ w 7
j 260 80
+ p 2 Y
+ w 13
j 280 80
+ w 13
+ w 13
j 360 80
+ p 3 Y
+ w 22
j 400 100
+ p 4 A
+ w 22
j 290 90
+ p 3 B
+ w 13
j 290 70
+ p 3 A
+ w 13
j 570 110
+ p 5 Y
+ w 31
j 500 100
+ p 5 A
+ w 7
j 500 120
+ p 5 B
+ w 7
j 590 110
+ p 104 pin1
+ w 31
j 170 140
+ p 105 pin1
+ w 50
j 170 90
+ p 107 pin1
+ w 62
j 170 70
+ p 109 pin1
+ w 60
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
