*version 9.1 171688058
u 53
U? 4
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
pageloc 1 0 2892 
@status
n 0 105:04:27:13:27:30;1117225650 e 
s 2832 105:04:28:07:27:20;1117290440 e 
*page 1 0 1520 970 iB
@ports
@parts
part 4 74AS02 310 110 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 6 -2 hln 100 REFDES=U3A
part 2 74AS02 220 80 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 3 74AS02 220 140 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 31 DigStim 180 90 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -36 9 hln 70 STIMULUS=A0
part 32 DigStim 180 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -36 9 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 48 nodeMarker 400 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 49 nodeMarker 190 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 51 nodeMarker 190 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 6
a 0 up 0:33 0 0 0 hln 100 LVL=
s 290 90 300 90 5
s 300 90 300 110 7
a 0 up 33 0 302 100 hlt 100 LVL=
s 300 110 310 110 9
w 12
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 130 300 130 11
s 300 130 300 150 13
a 0 up 33 0 302 140 hlt 100 LVL=
s 300 150 290 150 15
w 18
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 380 120 400 120 17
a 0 sr 3 0 390 118 hcn 100 LABEL=F
a 0 up 33 0 390 119 hct 100 LVL=
w 26
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 190 150 210 150 50
a 0 sr 3 0 195 148 hcn 100 LABEL=A1
s 180 150 190 150 36
a 0 up 33 0 195 149 hct 100 LVL=
s 220 140 210 140 25
s 210 140 210 150 27
s 210 160 220 160 29
s 210 150 210 160 42
w 20
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 190 90 210 90 52
a 0 sr 3 0 195 88 hcn 100 LABEL=A0
s 180 90 190 90 33
a 0 up 33 0 195 89 hct 100 LVL=
s 220 100 210 100 19
s 210 100 210 90 21
s 210 80 220 80 23
s 210 90 210 80 40
@junction
j 290 90
+ p 2 Y
+ w 6
j 310 110
+ p 4 A
+ w 6
j 310 130
+ p 4 B
+ w 12
j 290 150
+ p 3 Y
+ w 12
j 380 120
+ p 4 Y
+ w 18
j 220 100
+ p 2 B
+ w 20
j 220 80
+ p 2 A
+ w 20
j 220 140
+ p 3 A
+ w 26
j 220 160
+ p 3 B
+ w 26
j 180 90
+ p 31 *OUT
+ w 20
j 210 90
+ w 20
+ w 20
j 180 150
+ p 32 *OUT
+ w 26
j 210 150
+ w 26
+ w 26
j 400 120
+ p 48 pin1
+ w 18
j 190 150
+ p 49 pin1
+ w 26
j 190 90
+ p 51 pin1
+ w 20
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
