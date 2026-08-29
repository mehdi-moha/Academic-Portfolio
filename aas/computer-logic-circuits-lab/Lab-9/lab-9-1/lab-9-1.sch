*version 9.1 4061450991
u 53
U? 2
DSTM? 3
? 9
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 18ms
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
.STMLIB lab-9-1.stl
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
pageloc 1 0 2888 
@status
n 0 105:04:30:21:35:28;1117514128 e 
s 2832 105:04:30:21:48:38;1117514918 e 
*page 1 0 1520 970 iB
@ports
port 3 LO 240 110 h
@parts
part 27 DigStim 240 180 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -61 4 hln 70 STIMULUS=UP/DOWN
a 1 ap 9 0 -47 -1 hcn 100 REFDES=DSTM1
part 28 DigStim 240 190 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -47 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -61 9 hln 70 STIMULUS=CLK
part 2 CD4029A 260 110 h
a 0 sp 11 0 62 140 hlb 100 PART=CD4029A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 65 10 hln 100 REFDES=U1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 49 nodeMarker 370 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 50 nodeMarker 370 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 51 nodeMarker 370 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 52 nodeMarker 370 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
@conn
w 20
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 170 250 170 19
s 260 140 250 140 15
s 260 130 250 130 11
s 260 120 250 120 6
s 250 110 260 110 10
s 250 120 250 110 8
s 250 130 250 120 13
s 250 140 250 130 17
s 250 170 250 160 21
s 250 160 250 140 25
s 260 160 250 160 23
s 240 110 250 110 4
s 300 220 250 220 29
s 250 220 250 170 31
a 0 up 33 0 252 195 hlt 100 LVL=
w 34
a 0 up 0:33 0 0 0 hln 100 LVL=
s 240 180 260 180 33
a 0 up 33 0 250 179 hct 100 LVL=
w 36
a 0 up 0:33 0 0 0 hln 100 LVL=
s 240 190 260 190 35
a 0 up 33 0 250 189 hct 100 LVL=
w 42
a 0 sr 0 0 0 0 hln 100 LABEL=O4
s 340 140 370 140 41
a 0 sr 3 0 360 138 hcn 100 LABEL=O4
w 44
a 0 sr 0 0 0 0 hln 100 LABEL=O3
s 340 130 370 130 43
a 0 sr 3 0 360 128 hcn 100 LABEL=O3
w 46
a 0 sr 0 0 0 0 hln 100 LABEL=O2
s 340 120 370 120 45
a 0 sr 3 0 360 118 hcn 100 LABEL=O2
w 48
a 0 sr 0 0 0 0 hln 100 LABEL=O1
s 340 110 370 110 47
a 0 sr 3 0 360 108 hcn 100 LABEL=O1
@junction
j 250 120
+ w 20
+ w 20
j 250 130
+ w 20
+ w 20
j 260 170
+ p 2 BIN/DEC
+ w 20
j 260 140
+ p 2 JAM4
+ w 20
j 260 130
+ p 2 JAM3
+ w 20
j 260 110
+ p 2 JAM1
+ w 20
j 260 120
+ p 2 JAM2
+ w 20
j 250 140
+ w 20
+ w 20
j 260 160
+ p 2 \CIN\
+ w 20
j 250 160
+ w 20
+ w 20
j 240 110
+ s 3
+ w 20
j 250 110
+ w 20
+ w 20
j 300 220
+ p 2 PSEN
+ w 20
j 250 170
+ w 20
+ w 20
j 260 180
+ p 2 UP/DOWN
+ w 34
j 240 180
+ p 27 *OUT
+ w 34
j 240 190
+ p 28 *OUT
+ w 36
j 260 190
+ p 2 CLK
+ w 36
j 340 130
+ p 2 Q3
+ w 44
j 340 140
+ p 2 Q4
+ w 42
j 340 120
+ p 2 Q2
+ w 46
j 340 110
+ p 2 Q1
+ w 48
j 370 140
+ p 49 pin1
+ w 42
j 370 130
+ p 50 pin1
+ w 44
j 370 120
+ p 51 pin1
+ w 46
j 370 110
+ p 52 pin1
+ w 48
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
