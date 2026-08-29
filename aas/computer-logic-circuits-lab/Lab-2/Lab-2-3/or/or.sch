*version 9.1 2772473129
u 31
U? 3
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
pageloc 1 0 2305 
@status
n 0 105:04:27:13:34:22;1117226062 e 
s 0 105:04:28:07:29:19;1117290559 e 
*page 1 0 1520 970 iB
@ports
@parts
part 3 74AS02 330 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 6 -2 hln 100 REFDES=U2A
part 2 74AS02 230 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS02
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 6 -2 hln 100 REFDES=U1A
part 15 DigStim 200 70 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 16 DigStim 200 90 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 26 nodeMarker 420 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 27 nodeMarker 210 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 29 nodeMarker 210 70 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
@conn
w 5
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 70 320 70 4
s 320 70 320 80 6
s 320 90 330 90 8
s 320 80 320 90 12
s 300 80 320 80 10
a 0 up 33 0 310 79 hct 100 LVL=
w 14
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 400 80 420 80 13
a 0 sr 3 0 410 78 hcn 100 LABEL=F
a 0 up 33 0 410 79 hct 100 LVL=
w 20
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 90 230 90 28
a 0 sr 3 0 215 88 hcn 100 LABEL=A1
s 200 90 210 90 19
a 0 up 33 0 215 89 hct 100 LVL=
w 18
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 70 230 70 30
a 0 sr 3 0 215 68 hcn 100 LABEL=A0
s 200 70 210 70 17
a 0 up 33 0 215 69 hct 100 LVL=
@junction
j 330 70
+ p 3 A
+ w 5
j 330 90
+ p 3 B
+ w 5
j 300 80
+ p 2 Y
+ w 5
j 320 80
+ w 5
+ w 5
j 400 80
+ p 3 Y
+ w 14
j 230 70
+ p 2 A
+ w 18
j 200 70
+ p 15 *OUT
+ w 18
j 200 90
+ p 16 *OUT
+ w 20
j 230 90
+ p 2 B
+ w 20
j 420 80
+ p 26 pin1
+ w 14
j 210 90
+ p 27 pin1
+ w 20
j 210 70
+ p 29 pin1
+ w 18
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
