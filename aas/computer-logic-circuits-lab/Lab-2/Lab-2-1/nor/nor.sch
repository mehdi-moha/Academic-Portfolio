*version 9.1 698760158
u 72
U? 5
DSTM? 3
? 7
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB nor.stl
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
pageloc 1 0 3355 
@status
n 0 105:04:27:15:23:55;1117232635 e 
s 0 105:04:28:07:23:52;1117290232 e 
*page 1 0 1520 970 iB
@ports
@parts
part 4 74AS00 250 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -2 hln 100 REFDES=U3A
part 5 74AS00 350 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 11 -2 hln 100 REFDES=U4A
part 48 DigStim 100 70 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 49 DigStim 100 130 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 2 74AS00 150 60 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 3 74AS00 150 120 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 67 nodeMarker 440 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 68 nodeMarker 120 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 70 nodeMarker 120 70 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 26
a 0 up 0:33 0 0 0 hln 100 LVL=
s 350 90 340 90 25
s 340 90 340 100 27
s 340 110 350 110 29
s 340 100 340 110 33
s 320 100 340 100 31
a 0 up 33 0 330 99 hct 100 LVL=
w 7
a 0 up 0:33 0 0 0 hln 100 LVL=
s 240 90 250 90 8
s 240 70 240 90 6
a 0 up 33 0 242 80 hlt 100 LVL=
s 220 70 240 70 18
w 13
a 0 up 0:33 0 0 0 hln 100 LVL=
s 240 130 240 110 14
a 0 up 33 0 242 120 hlt 100 LVL=
s 240 110 250 110 16
s 220 130 240 130 12
w 35
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 420 100 440 100 34
a 0 sr 3 0 430 98 hcn 100 LABEL=F
a 0 up 33 0 430 99 hct 100 LVL=
w 43
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 120 130 140 130 69
a 0 sr 3 0 120 128 hcn 100 LABEL=A1
s 140 120 140 130 44
s 140 130 140 140 55
s 100 130 120 130 53
a 0 up 33 0 120 129 hct 100 LVL=
s 150 120 140 120 42
s 140 140 150 140 46
w 37
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 120 70 140 70 71
a 0 sr 3 0 120 68 hcn 100 LABEL=A0
s 140 60 140 70 38
s 140 70 140 80 52
s 100 70 120 70 50
a 0 up 33 0 120 69 hct 100 LVL=
s 150 60 140 60 36
s 140 80 150 80 40
@junction
j 250 110
+ p 4 B
+ w 13
j 250 90
+ p 4 A
+ w 7
j 350 90
+ p 5 A
+ w 26
j 350 110
+ p 5 B
+ w 26
j 320 100
+ p 4 Y
+ w 26
j 340 100
+ w 26
+ w 26
j 420 100
+ p 5 Y
+ w 35
j 100 70
+ p 48 *OUT
+ w 37
j 140 70
+ w 37
+ w 37
j 100 130
+ p 49 *OUT
+ w 43
j 140 130
+ w 43
+ w 43
j 220 70
+ p 2 Y
+ w 7
j 150 60
+ p 2 A
+ w 37
j 150 80
+ p 2 B
+ w 37
j 220 130
+ p 3 Y
+ w 13
j 150 120
+ p 3 A
+ w 43
j 150 140
+ p 3 B
+ w 43
j 440 100
+ p 67 pin1
+ w 35
j 120 130
+ p 68 pin1
+ w 43
j 120 70
+ p 70 pin1
+ w 37
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
