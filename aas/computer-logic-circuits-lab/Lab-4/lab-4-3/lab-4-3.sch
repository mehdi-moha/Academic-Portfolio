*version 9.1 3830943271
u 58
U? 4
DSTM? 5
? 11
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-4-3.stl
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
pageloc 1 0 3627 
@status
n 0 105:04:28:11:44:07;1117305847 e 
s 0 105:04:28:11:46:53;1117306013 e 
*page 1 0 1520 970 iB
@ports
@parts
part 22 DigStim 170 130 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -36 9 hln 70 STIMULUS=A0
part 23 DigStim 170 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -36 9 hln 70 STIMULUS=A1
part 24 DigStim 170 190 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM3
a 0 x 13 13 -36 9 hln 70 STIMULUS=A2
part 25 DigStim 170 210 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM4
a 1 ap 9 0 -22 -1 hcn 100 REFDES=DSTM4
a 0 x 13 13 -36 9 hln 70 STIMULUS=A3
part 4 7486 280 160 h
a 0 sp 11 0 40 50 hln 100 PART=7486
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 9 -3 hln 100 REFDES=U3A
part 3 7486 190 190 h
a 0 sp 11 0 40 50 hln 100 PART=7486
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 9 -3 hln 100 REFDES=U2A
part 2 7486 190 130 h
a 0 sp 11 0 40 50 hln 100 PART=7486
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 9 -3 hln 100 REFDES=U1A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 49 nodeMarker 370 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 50 nodeMarker 180 210 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 52 nodeMarker 180 190 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 54 nodeMarker 180 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 56 nodeMarker 180 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
@conn
w 12
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 200 260 200 15
s 280 180 270 180 11
s 270 180 270 200 13
a 0 up 33 0 272 190 hlt 100 LVL=
w 6
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 140 260 140 5
s 280 160 270 160 9
s 270 160 270 140 7
a 0 up 33 0 272 150 hlt 100 LVL=
w 33
a 0 sr 0 0 0 0 hln 100 LABEL=A3
a 0 up 0:33 0 0 0 hln 100 LVL=
s 180 210 190 210 51
a 0 sr 3 0 180 208 hcn 100 LABEL=A3
a 0 up 33 0 180 209 hct 100 LVL=
s 170 210 180 210 32
w 31
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 180 190 190 190 53
a 0 sr 3 0 180 188 hcn 100 LABEL=A2
a 0 up 33 0 180 189 hct 100 LVL=
s 170 190 180 190 30
w 29
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 180 150 190 150 55
a 0 sr 3 0 180 148 hcn 100 LABEL=A1
a 0 up 33 0 180 149 hct 100 LVL=
s 170 150 180 150 28
w 27
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 180 130 190 130 57
a 0 sr 3 0 180 128 hcn 100 LABEL=A0
a 0 up 33 0 180 129 hct 100 LVL=
s 170 130 180 130 26
w 35
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=Pe
s 350 170 370 170 34
a 0 up 33 0 360 169 hct 100 LVL=
a 0 sr 3 0 360 168 hcn 100 LABEL=Pe
@junction
j 190 130
+ p 2 A
+ w 27
j 170 130
+ p 22 *OUT
+ w 27
j 170 150
+ p 23 *OUT
+ w 29
j 190 150
+ p 2 B
+ w 29
j 190 190
+ p 3 A
+ w 31
j 170 190
+ p 24 *OUT
+ w 31
j 170 210
+ p 25 *OUT
+ w 33
j 190 210
+ p 3 B
+ w 33
j 260 200
+ p 3 Y
+ w 12
j 260 140
+ p 2 Y
+ w 6
j 350 170
+ p 4 Y
+ w 35
j 280 160
+ p 4 A
+ w 6
j 280 180
+ p 4 B
+ w 12
j 370 170
+ p 49 pin1
+ w 35
j 180 210
+ p 50 pin1
+ w 33
j 180 190
+ p 52 pin1
+ w 31
j 180 150
+ p 54 pin1
+ w 29
j 180 130
+ p 56 pin1
+ w 27
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
