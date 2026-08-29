*version 9.1 3489708591
u 89
U? 5
DSTM? 3
? 7
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB nand.stl
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
pageloc 1 0 3373 
@status
n 0 105:04:27:15:23:00;1117232580 e 
s 2832 105:04:28:07:28:19;1117290499 e 
*page 1 0 1520 970 iB
@ports
@parts
part 36 74AS02 370 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 6 -2 hln 100 REFDES=U4A
part 60 DigStim 140 80 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 61 DigStim 140 140 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 2 74AS02 180 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 3 74AS02 180 130 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 4 74AS02 280 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 6 -2 hln 100 REFDES=U3A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 84 nodeMarker 460 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 85 nodeMarker 150 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 87 nodeMarker 150 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 38
a 0 up 0:33 0 0 0 hln 100 LVL=
s 370 100 360 100 37
s 360 100 360 110 39
s 360 120 370 120 41
s 360 110 360 120 45
s 350 110 360 110 43
a 0 up 33 0 355 109 hct 100 LVL=
w 25
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 80 270 100 26
a 0 up 33 0 272 90 hlt 100 LVL=
s 270 100 280 100 28
s 250 80 270 80 24
w 31
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 120 280 120 30
s 270 140 270 120 32
a 0 up 33 0 272 130 hlt 100 LVL=
s 250 140 270 140 34
w 47
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 440 110 460 110 46
a 0 sr 3 0 450 108 hcn 100 LABEL=F
a 0 up 33 0 450 109 hct 100 LVL=
w 55
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 150 140 170 140 86
a 0 sr 3 0 155 138 hcn 100 LABEL=A1
s 140 140 150 140 65
a 0 up 33 0 155 139 hct 100 LVL=
s 170 130 170 140 56
s 170 140 170 150 71
s 180 130 170 130 54
s 170 150 180 150 58
w 49
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 150 80 170 80 88
a 0 sr 3 0 155 78 hcn 100 LABEL=A0
s 140 80 150 80 62
a 0 up 33 0 155 79 hct 100 LVL=
s 170 90 170 80 50
s 170 80 170 70 69
s 180 90 170 90 48
s 170 70 180 70 52
@junction
j 280 100
+ p 4 A
+ w 25
j 370 100
+ p 36 A
+ w 38
j 370 120
+ p 36 B
+ w 38
j 350 110
+ p 4 Y
+ w 38
j 360 110
+ w 38
+ w 38
j 440 110
+ p 36 Y
+ w 47
j 140 80
+ p 60 *OUT
+ w 49
j 170 80
+ w 49
+ w 49
j 140 140
+ p 61 *OUT
+ w 55
j 170 140
+ w 55
+ w 55
j 250 80
+ p 2 Y
+ w 25
j 180 90
+ p 2 B
+ w 49
j 180 70
+ p 2 A
+ w 49
j 280 120
+ p 4 B
+ w 31
j 250 140
+ p 3 Y
+ w 31
j 180 130
+ p 3 A
+ w 55
j 180 150
+ p 3 B
+ w 55
j 460 110
+ p 84 pin1
+ w 47
j 150 140
+ p 85 pin1
+ w 55
j 150 80
+ p 87 pin1
+ w 49
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
