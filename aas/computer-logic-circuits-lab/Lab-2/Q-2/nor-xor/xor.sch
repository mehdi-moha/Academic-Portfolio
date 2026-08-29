*version 9.1 586398952
u 137
U? 7
DSTM? 3
? 10
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB xor.stl
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
pageloc 1 0 4446 
@status
n 0 105:04:27:15:52:40;1117234360 e 
s 0 105:04:28:07:33:12;1117290792 e 
*page 1 0 1520 970 iB
@ports
@parts
part 3 74AS02 180 170 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 2 74AS02 180 50 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 6 74AS02 360 110 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 6 -2 hln 100 REFDES=U5A
part 7 74AS02 450 110 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U6
a 0 ap 9 0 6 -2 hln 100 REFDES=U6A
part 5 74AS02 270 150 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 6 -2 hln 100 REFDES=U4A
part 4 74AS02 270 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 6 -2 hln 100 REFDES=U3A
part 22 DigStim 130 60 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 13 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 4 19 hln 70 STIMULUS=A0
part 23 DigStim 130 180 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 13 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 4 19 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 132 nodeMarker 540 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 133 nodeMarker 140 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 135 nodeMarker 140 60 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
@conn
w 31
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 170 260 170 30
s 260 170 260 180 36
s 260 180 250 180 37
a 0 up 33 0 255 179 hct 100 LVL=
w 9
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 70 260 70 8
s 260 70 260 60 57
s 260 60 250 60 58
a 0 up 33 0 255 59 hct 100 LVL=
w 86
a 0 up 0:33 0 0 0 hln 100 LVL=
s 360 130 350 130 85
s 350 160 340 160 91
s 350 130 350 160 87
a 0 up 33 0 352 145 hlt 100 LVL=
w 82
a 0 up 0:33 0 0 0 hln 100 LVL=
s 350 110 360 110 83
s 350 80 340 80 94
s 350 80 350 110 81
a 0 up 33 0 352 95 hlt 100 LVL=
w 98
a 0 up 0:33 0 0 0 hln 100 LVL=
s 450 110 440 110 97
s 440 110 440 120 99
s 440 130 450 130 101
s 440 120 440 130 105
s 430 120 440 120 103
a 0 up 33 0 435 119 hct 100 LVL=
w 107
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 520 120 540 120 106
a 0 sr 3 0 530 118 hcn 100 LABEL=F
a 0 up 33 0 530 119 hct 100 LVL=
w 17
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 180 150 180 134
a 0 sr 3 0 140 178 hcn 100 LABEL=A1
s 180 170 170 170 16
s 170 170 170 180 18
s 170 190 180 190 20
s 170 180 170 190 29
s 260 100 260 90 65
s 260 90 270 90 71
s 260 100 150 100 52
s 150 180 170 180 126
s 150 100 150 180 54
s 130 180 140 180 129
a 0 up 33 0 135 179 hct 100 LVL=
w 33
a 0 sr 0:3 0 145 58 hcn 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 60 160 60 136
a 0 sr 3 0 140 58 hcn 100 LABEL=A0
s 180 70 170 70 10
s 170 70 170 60 12
s 170 50 180 50 14
s 170 60 170 50 117
s 260 140 260 150 43
s 260 150 270 150 48
s 260 140 160 140 32
s 160 60 170 60 120
s 160 140 160 60 34
s 130 60 140 60 131
a 0 up 33 0 145 59 hct 100 LVL=
@junction
j 180 170
+ p 3 A
+ w 17
j 180 190
+ p 3 B
+ w 17
j 130 180
+ p 23 *OUT
+ w 17
j 170 180
+ w 17
+ w 17
j 180 70
+ p 2 B
+ w 33
j 180 50
+ p 2 A
+ w 33
j 270 170
+ p 5 B
+ w 31
j 250 180
+ p 3 Y
+ w 31
j 270 70
+ p 4 A
+ w 9
j 250 60
+ p 2 Y
+ w 9
j 360 130
+ p 6 B
+ w 86
j 340 160
+ p 5 Y
+ w 86
j 360 110
+ p 6 A
+ w 82
j 340 80
+ p 4 Y
+ w 82
j 450 110
+ p 7 A
+ w 98
j 450 130
+ p 7 B
+ w 98
j 430 120
+ p 6 Y
+ w 98
j 440 120
+ w 98
+ w 98
j 520 120
+ p 7 Y
+ w 107
j 170 60
+ w 33
+ w 33
j 270 150
+ p 5 A
+ w 33
j 160 60
+ w 33
+ w 33
j 270 90
+ p 4 B
+ w 17
j 150 180
+ w 17
+ w 17
j 130 60
+ p 22 *OUT
+ w 33
j 540 120
+ p 132 pin1
+ w 107
j 140 180
+ p 133 pin1
+ w 17
j 140 60
+ p 135 pin1
+ w 33
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
