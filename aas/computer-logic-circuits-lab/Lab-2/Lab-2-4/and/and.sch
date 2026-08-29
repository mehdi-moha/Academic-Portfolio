*version 9.1 1905856924
u 132
U? 7
DSTM? 4
? 9
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
pageloc 1 0 4770 
@status
n 0 105:04:27:15:22:14;1117232534 e 
s 0 105:04:28:07:30:08;1117290608 e 
c 105:04:27:15:22:10;1117232530
*page 1 0 1520 970 iB
@ports
@parts
part 63 DigStim 130 70 h
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 64 DigStim 130 130 h
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 65 DigStim 130 180 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=A2
part 6 74AS02 360 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 6 -2 hln 100 REFDES=U5A
part 7 74AS02 460 130 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U6
a 0 ap 9 0 6 -2 hln 100 REFDES=U6A
part 2 74AS02 160 60 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 3 74AS02 160 120 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 5 74AS02 260 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 6 -2 hln 100 REFDES=U4A
part 4 74AS02 160 170 h
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
part 125 nodeMarker 550 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 126 nodeMarker 140 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 128 nodeMarker 140 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 130 nodeMarker 140 70 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
@conn
w 43
a 0 up 0:33 0 0 0 hln 100 LVL=
s 350 90 350 100 44
s 350 100 350 110 54
s 330 100 350 100 52
a 0 up 33 0 340 99 hct 100 LVL=
s 360 90 350 90 42
s 350 110 360 110 46
w 56
a 0 up 0:33 0 0 0 hln 100 LVL=
s 430 100 450 100 82
s 450 130 460 130 55
s 450 100 450 130 81
a 0 up 33 0 452 115 hlt 100 LVL=
w 11
a 0 up 0:33 0 0 0 hln 100 LVL=
s 250 70 250 90 12
a 0 up 33 0 252 80 hlt 100 LVL=
s 250 90 260 90 14
s 230 70 250 70 10
w 17
a 0 up 0:33 0 0 0 hln 100 LVL=
s 250 110 260 110 16
s 250 130 250 110 18
a 0 up 33 0 252 120 hlt 100 LVL=
s 230 130 250 130 20
w 58
a 0 up 0:33 0 0 0 hln 100 LVL=
s 450 150 460 150 57
s 450 180 450 150 59
s 230 180 450 180 61
a 0 up 33 0 340 179 hct 100 LVL=
w 103
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 530 140 550 140 102
a 0 sr 3 0 540 138 hcn 100 LABEL=F
a 0 up 33 0 540 139 hct 100 LVL=
w 37
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 180 150 180 127
a 0 sr 3 0 140 178 hcn 100 LABEL=A2
s 130 180 140 180 72
a 0 up 33 0 140 179 hct 100 LVL=
s 150 180 150 190 80
s 150 170 150 180 38
s 150 190 160 190 40
s 160 170 150 170 36
w 31
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 130 150 130 129
a 0 sr 3 0 140 128 hcn 100 LABEL=A1
s 130 130 140 130 69
a 0 up 33 0 140 129 hct 100 LVL=
s 150 120 150 130 32
s 150 130 150 140 78
s 160 120 150 120 30
s 150 140 160 140 34
w 23
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 140 70 150 70 131
a 0 sr 3 0 140 68 hcn 100 LABEL=A0
s 130 70 140 70 66
a 0 up 33 0 140 69 hct 100 LVL=
s 150 60 150 70 26
s 150 70 150 80 76
s 160 60 150 60 24
s 150 80 160 80 28
@junction
j 260 90
+ p 5 A
+ w 11
j 330 100
+ p 5 Y
+ w 43
j 350 100
+ w 43
+ w 43
j 130 70
+ p 63 *OUT
+ w 23
j 150 70
+ w 23
+ w 23
j 130 130
+ p 64 *OUT
+ w 31
j 150 130
+ w 31
+ w 31
j 460 150
+ p 7 B
+ w 58
j 130 180
+ p 65 *OUT
+ w 37
j 150 180
+ w 37
+ w 37
j 530 140
+ p 7 Y
+ w 103
j 360 90
+ p 6 A
+ w 43
j 360 110
+ p 6 B
+ w 43
j 430 100
+ p 6 Y
+ w 56
j 460 130
+ p 7 A
+ w 56
j 230 70
+ p 2 Y
+ w 11
j 160 60
+ p 2 A
+ w 23
j 160 80
+ p 2 B
+ w 23
j 260 110
+ p 5 B
+ w 17
j 230 130
+ p 3 Y
+ w 17
j 160 120
+ p 3 A
+ w 31
j 160 140
+ p 3 B
+ w 31
j 230 180
+ p 4 Y
+ w 58
j 160 190
+ p 4 B
+ w 37
j 160 170
+ p 4 A
+ w 37
j 550 140
+ p 125 pin1
+ w 103
j 140 180
+ p 126 pin1
+ w 37
j 140 130
+ p 128 pin1
+ w 31
j 140 70
+ p 130 pin1
+ w 23
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
