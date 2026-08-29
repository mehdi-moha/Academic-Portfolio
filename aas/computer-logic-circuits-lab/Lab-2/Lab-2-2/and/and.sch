*version 9.1 988623780
u 74
U? 5
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
pageloc 1 0 3710 
@status
n 0 105:04:27:13:57:17;1117227437 e 
s 0 105:04:28:07:25:29;1117290329 e 
*page 1 0 1520 970 iB
@ports
@parts
part 3 74AS00 260 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 4 74AS00 350 110 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -2 hln 100 REFDES=U3A
part 2 74AS00 170 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 5 74AS00 440 110 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 11 -2 hln 100 REFDES=U4A
part 41 DigStim 150 70 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 42 DigStim 150 90 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 43 DigStim 150 160 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=A2
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 67 nodeMarker 530 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 68 nodeMarker 160 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 70 nodeMarker 160 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 72 nodeMarker 160 70 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
@conn
w 18
a 0 up 0:33 0 0 0 hln 100 LVL=
s 440 110 430 110 17
s 430 110 430 120 19
s 430 130 440 130 21
s 430 120 430 130 25
s 420 120 430 120 23
a 0 up 33 0 425 119 hct 100 LVL=
w 27
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 80 340 80 26
s 340 80 340 110 28
a 0 up 33 0 342 95 hlt 100 LVL=
s 340 110 350 110 30
w 7
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 70 250 70 6
s 250 70 250 80 13
s 250 90 260 90 15
s 250 80 250 90 40
s 240 80 250 80 36
a 0 up 33 0 245 79 hct 100 LVL=
w 59
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 510 120 530 120 58
a 0 sr 3 0 520 118 hcn 100 LABEL=F
a 0 up 33 0 520 119 hct 100 LVL=
w 33
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 160 160 340 160 69
a 0 sr 3 0 160 158 hcn 100 LABEL=A2
s 150 160 160 160 44
a 0 up 33 0 160 159 hct 100 LVL=
s 340 130 350 130 32
s 340 160 340 130 34
w 49
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 160 90 170 90 71
a 0 sr 3 0 160 88 hcn 100 LABEL=A1
s 150 90 160 90 54
a 0 up 33 0 160 89 hct 100 LVL=
w 47
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 160 70 170 70 73
a 0 sr 3 0 160 68 hcn 100 LABEL=A0
s 150 70 160 70 53
a 0 up 33 0 160 69 hct 100 LVL=
@junction
j 260 70
+ p 3 A
+ w 7
j 260 90
+ p 3 B
+ w 7
j 440 110
+ p 5 A
+ w 18
j 440 130
+ p 5 B
+ w 18
j 420 120
+ p 4 Y
+ w 18
j 430 120
+ w 18
+ w 18
j 330 80
+ p 3 Y
+ w 27
j 350 110
+ p 4 A
+ w 27
j 240 80
+ p 2 Y
+ w 7
j 250 80
+ w 7
+ w 7
j 350 130
+ p 4 B
+ w 33
j 150 160
+ p 43 *OUT
+ w 33
j 150 70
+ p 41 *OUT
+ w 47
j 170 70
+ p 2 A
+ w 47
j 150 90
+ p 42 *OUT
+ w 49
j 170 90
+ p 2 B
+ w 49
j 510 120
+ p 5 Y
+ w 59
j 530 120
+ p 67 pin1
+ w 59
j 160 160
+ p 68 pin1
+ w 33
j 160 90
+ p 70 pin1
+ w 49
j 160 70
+ p 72 pin1
+ w 47
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
