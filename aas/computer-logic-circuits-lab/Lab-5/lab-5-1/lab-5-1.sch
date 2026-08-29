*version 9.1 1850227778
u 197
U? 6
DSTM? 4
? 14
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-5-1.stl
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
pageloc 1 0 4283 
@status
n 0 105:04:27:21:24:36;1117254276 e 
s 2832 105:04:28:20:02:08;1117335728 e 
*page 1 0 1520 970 iB
@ports
@parts
part 70 DigStim 160 120 h
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM3
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=A2
part 68 DigStim 160 150 h
a 0 x 13 13 -41 9 hln 70 STIMULUS=A0
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
part 69 DigStim 160 180 h
a 0 x 13 13 -41 9 hln 70 STIMULUS=A1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM2
part 4 7408 230 200 h
a 0 sp 11 0 40 50 hln 100 PART=7408
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -4 hln 100 REFDES=U3A
part 6 7432 410 120 h
a 0 sp 11 0 40 50 hln 100 PART=7432
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 8 -3 hln 100 REFDES=U5A
part 3 7408 230 140 h
a 0 sp 11 0 40 50 hln 100 PART=7408
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -4 hln 100 REFDES=U2A
part 2 7408 230 80 h
a 0 sp 11 0 40 50 hln 100 PART=7408
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -4 hln 100 REFDES=U1A
part 5 7432 330 110 h
a 0 sp 11 0 40 50 hln 100 PART=7432
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 8 -3 hln 100 REFDES=U4A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 190 nodeMarker 500 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 191 nodeMarker 170 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=11
part 193 nodeMarker 170 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=12
part 195 nodeMarker 170 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=13
@conn
w 14
a 0 up 0:33 0 0 0 hln 100 LVL=
s 410 140 400 140 13
s 400 210 300 210 17
a 0 up 33 0 350 209 hct 100 LVL=
s 400 140 400 210 15
w 8
a 0 up 0:33 0 0 0 hln 100 LVL=
s 400 120 410 120 171
a 0 up 33 0 410 119 hct 100 LVL=
w 26
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 150 300 150 25
s 330 130 320 130 29
s 320 130 320 150 27
a 0 up 33 0 322 140 hlt 100 LVL=
w 20
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 90 300 90 19
s 330 110 320 110 23
s 320 110 320 90 21
a 0 up 33 0 322 100 hlt 100 LVL=
w 160
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=F
s 480 130 500 130 159
a 0 up 33 0 490 129 hct 100 LVL=
a 0 sr 3 0 490 128 hcn 100 LABEL=F
w 123
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=A2
s 220 120 170 120 183
a 0 up 33 0 175 119 hct 100 LVL=
a 0 sr 3 0 175 118 hcn 100 LABEL=A2
s 220 120 220 140 72
s 220 140 230 140 51
s 220 100 220 120 49
s 230 100 220 100 47
s 170 120 160 120 192
w 54
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=A1
s 220 180 170 180 181
a 0 up 33 0 175 179 hct 100 LVL=
a 0 sr 3 0 175 178 hcn 100 LABEL=A1
s 220 160 220 180 55
s 230 160 220 160 53
s 220 200 230 200 57
s 220 180 220 200 76
s 170 180 160 180 194
w 144
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=A0
s 210 150 170 150 179
a 0 sr 3 0 175 148 hcn 100 LABEL=A0
a 0 up 33 0 175 149 hct 100 LVL=
s 210 220 210 150 41
s 230 220 210 220 39
s 210 150 210 80 74
s 210 80 230 80 43
s 170 150 160 150 196
@junction
j 230 160
+ p 3 B
+ w 54
j 230 140
+ p 3 A
+ w 123
j 230 200
+ p 4 A
+ w 54
j 220 180
+ w 54
+ w 54
j 230 220
+ p 4 B
+ w 144
j 220 120
+ w 123
+ w 123
j 230 100
+ p 2 B
+ w 123
j 210 150
+ w 144
+ w 144
j 230 80
+ p 2 A
+ w 144
j 160 150
+ p 68 *OUT
+ w 144
j 160 180
+ p 69 *OUT
+ w 54
j 160 120
+ p 70 *OUT
+ w 123
j 410 140
+ p 6 B
+ w 14
j 300 210
+ p 4 Y
+ w 14
j 480 130
+ p 6 Y
+ w 160
j 400 120
+ p 5 Y
+ w 8
j 410 120
+ p 6 A
+ w 8
j 300 150
+ p 3 Y
+ w 26
j 330 130
+ p 5 B
+ w 26
j 300 90
+ p 2 Y
+ w 20
j 330 110
+ p 5 A
+ w 20
j 500 130
+ p 190 pin1
+ w 160
j 170 120
+ p 191 pin1
+ w 123
j 170 180
+ p 193 pin1
+ w 54
j 170 150
+ p 195 pin1
+ w 144
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
