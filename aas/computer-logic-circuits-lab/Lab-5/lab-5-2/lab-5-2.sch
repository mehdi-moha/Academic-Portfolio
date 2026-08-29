*version 9.1 957973633
u 197
U? 6
DSTM? 4
? 11
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-5-2.stl
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
pageloc 1 0 4461 
@status
n 0 105:04:28:07:15:42;1117289742 e 
s 2832 105:04:28:19:31:46;1117333906 e 
*page 1 0 1520 970 iB
@ports
@parts
part 4 7400 330 170 h
a 0 sp 11 0 40 50 hln 100 PART=7400
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 10 -3 hln 100 REFDES=U3A
part 2 7486 220 150 h
a 0 sp 11 0 40 50 hln 100 PART=7486
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 9 -3 hln 100 REFDES=U1A
part 3 7486 430 100 h
a 0 sp 11 0 40 50 hln 100 PART=7486
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 9 -3 hln 100 REFDES=U2A
part 5 7400 430 190 h
a 0 sp 11 0 40 50 hln 100 PART=7400
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 10 -3 hln 100 REFDES=U4A
part 6 7400 220 210 h
a 0 sp 11 0 40 50 hln 100 PART=7400
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 10 -3 hln 100 REFDES=U5A
part 131 DigStim 140 100 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 0 x 13 13 -46 9 hln 70 STIMULUS=Cin
a 1 ap 9 0 -32 -1 hcn 100 REFDES=DSTM3
part 129 DigStim 140 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -32 -1 hcn 100 REFDES=DSTM1
a 0 x 13 13 -46 9 hln 70 STIMULUS=A0
part 130 DigStim 140 170 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -32 -1 hcn 100 REFDES=DSTM2
a 0 x 13 13 -46 9 hln 70 STIMULUS=A1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 189 nodeMarker 530 200 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 190 nodeMarker 530 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 191 nodeMarker 170 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 193 nodeMarker 170 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 195 nodeMarker 170 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
@conn
w 46
a 0 up 0:33 0 0 0 hln 100 LVL=
s 430 180 430 190 91
s 400 180 430 180 78
a 0 up 33 0 415 179 hct 100 LVL=
w 116
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 190 310 190 34
s 310 120 430 120 94
a 0 up 33 0 370 119 hct 100 LVL=
s 310 190 310 160 111
s 310 160 310 120 183
s 290 160 310 160 38
w 40
a 0 up 0:33 0 0 0 hln 100 LVL=
s 430 220 430 210 87
s 430 220 290 220 39
a 0 up 33 0 360 219 hct 100 LVL=
w 153
a 0 sr 0 0 0 0 hln 100 LABEL=Co
a 0 up 0:33 0 0 0 hln 100 LVL=
s 500 200 530 200 152
a 0 sr 3 0 515 198 hcn 100 LABEL=Co
a 0 up 33 0 515 199 hct 100 LVL=
w 151
a 0 sr 0 0 0 0 hln 100 LABEL=SUM
a 0 up 0:33 0 0 0 hln 100 LVL=
s 500 110 530 110 150
a 0 sr 3 0 515 108 hcn 100 LABEL=SUM
a 0 up 33 0 515 109 hct 100 LVL=
w 127
a 0 sr 0 0 0 0 hln 100 LABEL=Cin
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 100 140 100 192
a 0 sr 3 0 170 98 hcn 100 LABEL=Cin
s 320 100 170 100 141
a 0 up 33 0 170 99 hct 100 LVL=
s 330 170 320 170 117
s 430 100 320 100 97
s 320 170 320 100 119
w 10
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 170 200 170 194
a 0 sr 3 0 170 168 hcn 100 LABEL=A1
s 140 170 170 170 134
a 0 up 33 0 170 169 hct 100 LVL=
s 220 230 200 230 16
s 200 170 220 170 188
s 200 230 200 170 186
w 12
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 170 150 140 150 196
a 0 sr 3 0 170 148 hcn 100 LABEL=A0
s 210 150 170 150 15
a 0 up 33 0 170 149 hct 100 LVL=
s 210 210 210 150 13
s 220 150 210 150 7
s 220 210 210 210 11
@junction
j 140 170
+ p 130 *OUT
+ w 10
j 220 170
+ p 2 B
+ w 10
j 220 150
+ p 2 A
+ w 12
j 210 150
+ w 12
+ w 12
j 220 210
+ p 6 A
+ w 12
j 140 150
+ p 129 *OUT
+ w 12
j 330 170
+ p 4 A
+ w 127
j 430 100
+ p 3 A
+ w 127
j 320 100
+ w 127
+ w 127
j 140 100
+ p 131 *OUT
+ w 127
j 500 110
+ p 3 Y
+ w 151
j 500 200
+ p 5 Y
+ w 153
j 430 190
+ p 5 A
+ w 46
j 400 180
+ p 4 Y
+ w 46
j 330 190
+ p 4 B
+ w 116
j 430 120
+ p 3 B
+ w 116
j 290 160
+ p 2 Y
+ w 116
j 310 160
+ w 116
+ w 116
j 430 210
+ p 5 B
+ w 40
j 290 220
+ p 6 Y
+ w 40
j 220 230
+ p 6 B
+ w 10
j 200 170
+ w 10
+ w 10
j 530 200
+ p 189 pin1
+ w 153
j 530 110
+ p 190 pin1
+ w 151
j 170 100
+ p 191 pin1
+ w 127
j 170 170
+ p 193 pin1
+ w 10
j 170 150
+ p 195 pin1
+ w 12
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
