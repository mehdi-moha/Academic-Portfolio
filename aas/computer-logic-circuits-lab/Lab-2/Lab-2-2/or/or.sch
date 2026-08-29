*version 9.1 1118234828
u 120
U? 7
DSTM? 4
? 9
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
pageloc 1 0 4778 
@status
n 0 105:04:27:15:25:49;1117232749 e 
s 2832 105:04:28:07:26:28;1117290388 e 
*page 1 0 1520 970 iB
@ports
@parts
part 61 DigStim 130 80 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 62 DigStim 130 140 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 63 DigStim 130 210 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=A2
part 2 74AS00 160 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 3 74AS00 160 130 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 4 74AS00 260 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -2 hln 100 REFDES=U3A
part 5 74AS00 160 200 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 11 -2 hln 100 REFDES=U4A
part 6 74AS00 350 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 11 -2 hln 100 REFDES=U5A
part 7 74AS00 450 150 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U6
a 0 ap 9 0 11 -2 hln 100 REFDES=U6A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 113 nodeMarker 540 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 114 nodeMarker 140 210 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 116 nodeMarker 140 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 118 nodeMarker 140 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
@conn
w 9
a 0 up 0:33 0 0 0 hln 100 LVL=
s 250 100 260 100 12
s 250 80 250 100 10
a 0 up 33 0 252 90 hlt 100 LVL=
s 230 80 250 80 8
w 15
a 0 up 0:33 0 0 0 hln 100 LVL=
s 230 140 250 140 18
s 250 140 250 120 16
a 0 up 33 0 252 130 hlt 100 LVL=
s 250 120 260 120 14
w 54
a 0 up 0:33 0 0 0 hln 100 LVL=
s 440 170 450 170 57
s 440 210 440 170 55
s 230 210 440 210 53
a 0 up 33 0 335 209 hct 100 LVL=
w 39
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 110 340 110 44
s 340 110 340 120 46
s 340 100 340 110 40
s 340 120 350 120 42
s 350 100 340 100 38
a 0 up 33 0 345 99 hct 100 LVL=
w 48
a 0 up 0:33 0 0 0 hln 100 LVL=
s 420 110 440 110 51
s 440 110 440 150 49
a 0 up 33 0 442 130 hlt 100 LVL=
s 440 150 450 150 47
w 60
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 520 160 540 160 59
a 0 sr 3 0 530 158 hcn 100 LABEL=F
a 0 up 33 0 530 159 hct 100 LVL=
w 33
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 210 150 210 115
a 0 sr 3 0 140 208 hcn 100 LABEL=A2
s 150 200 150 210 34
s 150 210 150 220 91
s 130 210 140 210 89
a 0 up 33 0 140 209 hct 100 LVL=
s 150 220 160 220 36
s 160 200 150 200 32
w 27
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 140 150 140 117
a 0 sr 3 0 140 138 hcn 100 LABEL=A1
s 150 130 150 140 28
s 150 140 150 150 88
s 130 140 140 140 86
a 0 up 33 0 140 139 hct 100 LVL=
s 150 150 160 150 30
s 160 130 150 130 26
w 21
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 80 150 80 119
a 0 sr 3 0 140 78 hcn 100 LABEL=A0
s 150 70 150 80 22
s 150 80 150 90 85
s 130 80 140 80 83
a 0 up 33 0 140 79 hct 100 LVL=
s 150 90 160 90 24
s 160 70 150 70 20
@junction
j 520 160
+ p 7 Y
+ w 60
j 450 170
+ p 7 B
+ w 54
j 330 110
+ p 4 Y
+ w 39
j 340 110
+ w 39
+ w 39
j 260 100
+ p 4 A
+ w 9
j 130 80
+ p 61 *OUT
+ w 21
j 150 80
+ w 21
+ w 21
j 130 140
+ p 62 *OUT
+ w 27
j 150 140
+ w 27
+ w 27
j 130 210
+ p 63 *OUT
+ w 33
j 150 210
+ w 33
+ w 33
j 230 80
+ p 2 Y
+ w 9
j 160 90
+ p 2 B
+ w 21
j 160 70
+ p 2 A
+ w 21
j 230 140
+ p 3 Y
+ w 15
j 260 120
+ p 4 B
+ w 15
j 160 150
+ p 3 B
+ w 27
j 160 130
+ p 3 A
+ w 27
j 230 210
+ p 5 Y
+ w 54
j 160 220
+ p 5 B
+ w 33
j 160 200
+ p 5 A
+ w 33
j 420 110
+ p 6 Y
+ w 48
j 450 150
+ p 7 A
+ w 48
j 350 120
+ p 6 B
+ w 39
j 350 100
+ p 6 A
+ w 39
j 540 160
+ p 113 pin1
+ w 60
j 140 210
+ p 114 pin1
+ w 33
j 140 140
+ p 116 pin1
+ w 27
j 140 80
+ p 118 pin1
+ w 21
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
