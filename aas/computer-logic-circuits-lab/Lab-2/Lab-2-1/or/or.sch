*version 9.1 3601335681
u 49
U? 4
DSTM? 3
? 7
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
pageloc 1 0 2910 
@status
n 0 105:04:27:13:09:28;1117224568 e 
s 0 105:04:28:07:24:42;1117290282 e 
*page 1 0 1520 970 iB
@ports
@parts
part 4 74AS00 250 120 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -2 hln 100 REFDES=U3A
part 2 74AS00 150 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 3 74AS00 150 150 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 31 DigStim 110 100 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -36 9 hln 70 STIMULUS=A0
part 32 DigStim 110 160 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -36 9 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 44 nodeMarker 340 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 45 nodeMarker 120 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 47 nodeMarker 120 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 6
a 0 up 0:33 0 0 0 hln 100 LVL=
s 220 100 240 100 5
s 240 100 240 120 7
a 0 up 33 0 242 110 hlt 100 LVL=
s 240 120 250 120 9
w 12
a 0 up 0:33 0 0 0 hln 100 LVL=
s 250 140 240 140 11
s 240 140 240 160 13
s 240 160 220 160 15
a 0 up 33 0 230 159 hct 100 LVL=
w 18
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 130 340 130 17
a 0 sr 3 0 330 128 hcn 100 LABEL=F
a 0 up 33 0 330 129 hct 100 LVL=
w 26
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 120 160 140 160 46
a 0 sr 3 0 125 158 hcn 100 LABEL=A1
s 150 150 140 150 25
s 140 150 140 160 27
s 140 170 150 170 29
s 140 160 140 170 38
s 110 160 120 160 36
a 0 up 33 0 125 159 hct 100 LVL=
w 20
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 120 100 140 100 48
a 0 sr 3 0 125 98 hcn 100 LABEL=A0
s 150 110 140 110 19
s 140 110 140 100 21
s 140 90 150 90 23
s 140 100 140 90 35
s 110 100 120 100 33
a 0 up 33 0 125 99 hct 100 LVL=
@junction
j 220 100
+ p 2 Y
+ w 6
j 250 120
+ p 4 A
+ w 6
j 250 140
+ p 4 B
+ w 12
j 220 160
+ p 3 Y
+ w 12
j 320 130
+ p 4 Y
+ w 18
j 150 150
+ p 3 A
+ w 26
j 150 170
+ p 3 B
+ w 26
j 110 160
+ p 32 *OUT
+ w 26
j 140 160
+ w 26
+ w 26
j 150 110
+ p 2 B
+ w 20
j 150 90
+ p 2 A
+ w 20
j 110 100
+ p 31 *OUT
+ w 20
j 140 100
+ w 20
+ w 20
j 340 130
+ p 44 pin1
+ w 18
j 120 160
+ p 45 pin1
+ w 26
j 120 100
+ p 47 pin1
+ w 20
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
