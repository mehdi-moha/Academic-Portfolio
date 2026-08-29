*version 9.1 427473985
u 54
DSTM? 3
U? 2
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 30ms
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
.STMLIB lab9-1-hex.stl
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
pageloc 1 0 2937 
@status
n 0 105:04:30:21:44:24;1117514664 e 
s 2832 105:04:30:21:45:48;1117514748 e 
*page 1 0 1520 970 iB
@ports
port 46 LO 240 120 h
port 51 HI 240 180 h
@parts
part 43 DigStim 240 190 h
a 0 x 13 13 -61 4 hln 70 STIMULUS=UP/DOWN
a 1 ap 9 0 -47 -1 hcn 100 REFDES=DSTM1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
part 44 DigStim 240 200 h
a 1 ap 9 0 -47 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -61 9 hln 70 STIMULUS=CLK
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
part 45 CD4029A 260 120 h
a 0 sp 11 0 62 140 hlb 100 PART=CD4029A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 ap 9 0 65 10 hln 100 REFDES=U1
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 47 nodeMarker 370 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 48 nodeMarker 370 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 49 nodeMarker 370 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 50 nodeMarker 370 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
@conn
w 5
a 0 sr 3 0 360 118 hcn 100 LABEL=O1
s 340 120 370 120 4
a 0 sr 3 0 360 118 hcn 100 LABEL=O1
a 0 up 33 0 360 119 hct 100 LVL=
w 7
a 0 sr 3 0 360 128 hcn 100 LABEL=O2
s 340 130 370 130 6
a 0 sr 3 0 360 128 hcn 100 LABEL=O2
a 0 up 33 0 360 129 hct 100 LVL=
w 9
a 0 sr 3 0 360 138 hcn 100 LABEL=O3
s 340 140 370 140 8
a 0 sr 3 0 360 138 hcn 100 LABEL=O3
a 0 up 33 0 360 139 hct 100 LVL=
w 11
a 0 sr 3 0 360 148 hcn 100 LABEL=O4
s 340 150 370 150 10
a 0 sr 3 0 360 148 hcn 100 LABEL=O4
a 0 up 33 0 360 149 hct 100 LVL=
w 13
s 240 200 260 200 12
a 0 up 33 0 250 199 hct 100 LVL=
w 15
s 240 190 260 190 14
a 0 up 33 0 250 189 hct 100 LVL=
w 3
s 260 150 250 150 16
s 260 140 250 140 18
s 260 130 250 130 20
s 250 120 260 120 22
s 250 130 250 120 24
s 250 140 250 130 26
s 250 150 250 140 28
s 250 230 250 170 32
a 0 up 33 0 252 205 hlt 100 LVL=
s 250 170 250 150 36
s 260 170 250 170 34
s 240 120 250 120 37
s 300 230 250 230 39
w 53
s 240 180 260 180 52
@junction
j 240 190
+ p 43 *OUT
+ w 15
j 240 200
+ p 44 *OUT
+ w 13
j 340 120
+ p 45 Q1
+ w 5
j 340 130
+ p 45 Q2
+ w 7
j 340 140
+ p 45 Q3
+ w 9
j 340 150
+ p 45 Q4
+ w 11
j 260 200
+ p 45 CLK
+ w 13
j 260 190
+ p 45 UP/DOWN
+ w 15
j 370 150
+ p 47 pin1
+ w 11
j 370 140
+ p 48 pin1
+ w 9
j 370 130
+ p 49 pin1
+ w 7
j 370 120
+ p 50 pin1
+ w 5
j 250 130
+ w 3
+ w 3
j 250 140
+ w 3
+ w 3
j 250 150
+ w 3
+ w 3
j 250 170
+ w 3
+ w 3
j 250 120
+ w 3
+ w 3
j 260 170
+ p 45 \CIN\
+ w 3
j 260 120
+ p 45 JAM1
+ w 3
j 260 130
+ p 45 JAM2
+ w 3
j 260 140
+ p 45 JAM3
+ w 3
j 260 150
+ p 45 JAM4
+ w 3
j 300 230
+ p 45 PSEN
+ w 3
j 240 120
+ s 46
+ w 3
j 260 180
+ p 45 BIN/DEC
+ w 53
j 240 180
+ s 51
+ w 53
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
