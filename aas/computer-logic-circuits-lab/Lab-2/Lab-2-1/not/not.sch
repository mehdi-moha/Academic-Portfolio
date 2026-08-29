*version 9.1 3531469201
u 31
U? 2
DSTM? 2
? 5
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB not.stl
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
pageloc 1 0 1514 
@status
n 0 105:04:27:15:24:39;1117232679 e 
s 2832 105:04:28:07:24:11;1117290251 e 
*page 1 0 1520 970 iB
@ports
@parts
part 13 DigStim 170 110 h
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
part 2 74AS00 210 100 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 28 nodeMarker 300 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 29 nodeMarker 180 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
@conn
w 10
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 280 110 300 110 23
a 0 sr 3 0 290 108 hcn 100 LABEL=F
a 0 up 33 0 290 109 hct 100 LVL=
w 4
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 180 110 200 110 30
a 0 sr 3 0 185 108 hcn 100 LABEL=A0
s 200 100 200 110 5
s 200 110 200 120 18
s 170 110 180 110 22
a 0 up 33 0 185 109 hct 100 LVL=
s 210 100 200 100 3
s 200 120 210 120 7
@junction
j 170 110
+ p 13 *OUT
+ w 4
j 200 110
+ w 4
+ w 4
j 210 100
+ p 2 A
+ w 4
j 210 120
+ p 2 B
+ w 4
j 280 110
+ p 2 Y
+ w 10
j 300 110
+ p 28 pin1
+ w 10
j 180 110
+ p 29 pin1
+ w 4
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
