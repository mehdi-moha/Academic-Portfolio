*version 9.1 3934460235
u 16
U? 2
DSTM? 3
? 4
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-1-5-4081.stl
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
pageloc 1 0 1692 
@status
n 0 105:04:28:18:01:19;1117328479 e 
s 2832 105:04:28:20:08:51;1117336131 e 
*page 1 0 1520 970 iB
@ports
@parts
part 2 CD4081B 230 90 h
a 0 sp 11 0 40 50 hln 100 PART=CD4081B
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 40 -2 hln 100 REFDES=U1A
part 3 DigStim 190 90 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -36 9 hln 70 STIMULUS=A
part 4 DigStim 190 110 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -36 9 hln 70 STIMULUS=B
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 11 nodeMarker 340 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 12 nodeMarker 210 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
part 14 nodeMarker 210 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
@conn
w 10
a 0 sr 0 0 0 0 hln 100 LABEL=Output
s 300 100 340 100 9
a 0 sr 3 0 320 98 hcn 100 LABEL=Output
w 8
a 0 sr 0 0 0 0 hln 100 LABEL=InputB
s 210 110 230 110 13
a 0 sr 3 0 210 108 hcn 100 LABEL=InputB
s 190 110 210 110 7
w 6
a 0 sr 0 0 0 0 hln 100 LABEL=InputA
s 210 90 230 90 15
a 0 sr 3 0 210 88 hcn 100 LABEL=InputA
s 190 90 210 90 5
@junction
j 230 90
+ p 2 A
+ w 6
j 190 90
+ p 3 *OUT
+ w 6
j 190 110
+ p 4 *OUT
+ w 8
j 230 110
+ p 2 B
+ w 8
j 300 100
+ p 2 J
+ w 10
j 340 100
+ p 11 pin1
+ w 10
j 210 110
+ p 12 pin1
+ w 8
j 210 90
+ p 14 pin1
+ w 6
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
