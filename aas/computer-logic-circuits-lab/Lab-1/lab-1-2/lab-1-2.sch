*version 9.1 1062564365
u 12
U? 2
DSTM? 2
? 3
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 6ms
.STMLIB lab-1-2.stl
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
pageloc 1 0 1259 
@status
n 0 105:04:28:17:25:54;1117326354 e 
s 2832 105:04:31:18:12:33;1117588353 e 
*page 1 0 1520 970 iB
@ports
@parts
part 2 CD4069UB 280 80 h
a 0 sp 11 0 40 50 hln 100 PART=CD4069UB
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 40 -2 hln 100 REFDES=U1A
part 3 DigStim 260 80 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -46 9 hln 70 STIMULUS=Input
a 1 ap 9 0 -32 -1 hcn 100 REFDES=DSTM1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 8 nodeMarker 370 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 9 nodeMarker 270 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
@conn
w 7
a 0 sr 0 0 0 0 hln 100 LABEL=Output
s 330 80 370 80 6
a 0 sr 3 0 350 78 hcn 100 LABEL=Output
w 5
a 0 sr 0:3 0 270 78 hcn 100 LABEL=Input
s 260 80 270 80 4
a 0 sr 3 0 270 78 hcn 100 LABEL=Input
s 270 80 280 80 10
@junction
j 280 80
+ p 2 A
+ w 5
j 330 80
+ p 2 G
+ w 7
j 370 80
+ p 8 pin1
+ w 7
j 270 80
+ p 9 pin1
+ w 5
j 260 80
+ p 3 *OUT
+ w 5
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
