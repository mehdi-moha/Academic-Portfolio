*version 9.1 167869500
u 13
U? 2
DSTM? 2
? 3
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 6ms
.STMLIB lab-1-1.stl
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
pageloc 1 0 1375 
@status
n 0 105:04:28:17:32:06;1117326726 e 
s 2832 105:04:31:18:09:21;1117588161 e 
*page 1 0 1520 970 iB
@ports
@parts
part 5 DigStim 200 80 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -46 9 hln 70 STIMULUS=Input
a 1 ap 9 0 -32 -1 hcn 100 REFDES=DSTM1
part 2 7404 220 80 h
a 0 sp 11 0 33 35 hln 100 PART=7404
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 28 8 hln 100 REFDES=U1A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 10 nodeMarker 310 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 11 nodeMarker 210 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
@conn
w 7
a 0 sr 0 0 0 0 hln 100 LABEL=Input
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 80 220 80 12
a 0 sr 3 0 210 78 hcn 100 LABEL=Input
a 0 up 33 0 210 79 hct 100 LVL=
s 200 80 210 80 8
w 4
a 0 sr 0 0 0 0 hln 100 LABEL=Output
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 80 310 80 3
a 0 up 33 0 300 79 hct 100 LVL=
a 0 sr 3 0 290 78 hcn 100 LABEL=Output
@junction
j 270 80
+ p 2 Y
+ w 4
j 200 80
+ p 5 *OUT
+ w 7
j 220 80
+ p 2 A
+ w 7
j 310 80
+ p 10 pin1
+ w 4
j 210 80
+ p 11 pin1
+ w 7
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
