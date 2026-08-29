*version 9.1 783210148
u 155
U? 3
DSTM? 5
? 14
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-3-2.stl
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
pageloc 1 0 5341 
@status
n 0 105:04:28:22:05:09;1117343109 e 
s 2832 105:04:28:22:36:45;1117345005 e 
*page 1 0 1520 970 iB
@ports
port 143 HI 240 110 h
port 142 LO 240 130 h
@parts
part 59 DigStim 200 170 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
part 60 DigStim 200 190 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=B
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
part 61 DigStim 200 210 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=C
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
part 62 DigStim 200 230 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM4
a 0 x 13 13 -41 9 hln 70 STIMULUS=D
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM4
part 58 7447A 250 110 h
a 0 sp 11 0 40 100 hln 100 PART=7447A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 ap 9 0 40 -2 hln 100 REFDES=U1
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 82 nodeMarker 330 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 83 nodeMarker 330 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
part 84 nodeMarker 330 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 85 nodeMarker 330 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 86 nodeMarker 330 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 87 nodeMarker 330 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 88 nodeMarker 330 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 89 nodeMarker 210 230 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 91 nodeMarker 210 210 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=A3
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 93 nodeMarker 210 190 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=A3
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 95 nodeMarker 210 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=A3
a 0 a 0 0 4 22 hlb 100 LABEL=11
@conn
w 47
a 0 sr 3 0 320 178 hcn 100 LABEL=g
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 180 330 180 46
a 0 sr 3 0 320 178 hcn 100 LABEL=g
a 0 up 33 0 320 179 hct 100 LVL=
w 45
a 0 sr 3 0 320 168 hcn 100 LABEL=f
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 170 330 170 44
a 0 sr 3 0 320 168 hcn 100 LABEL=f
a 0 up 33 0 320 169 hct 100 LVL=
w 43
a 0 sr 3 0 320 158 hcn 100 LABEL=e
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 160 330 160 42
a 0 sr 3 0 320 158 hcn 100 LABEL=e
a 0 up 33 0 320 159 hct 100 LVL=
w 41
a 0 sr 3 0 320 148 hcn 100 LABEL=d
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 150 330 150 40
a 0 sr 3 0 320 148 hcn 100 LABEL=d
a 0 up 33 0 320 149 hct 100 LVL=
w 39
a 0 sr 3 0 320 138 hcn 100 LABEL=c
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 140 330 140 38
a 0 sr 3 0 320 138 hcn 100 LABEL=c
a 0 up 33 0 320 139 hct 100 LVL=
w 37
a 0 sr 3 0 320 128 hcn 100 LABEL=b
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 130 330 130 36
a 0 sr 3 0 320 128 hcn 100 LABEL=b
a 0 up 33 0 320 129 hct 100 LVL=
w 35
a 0 sr 3 0 320 118 hcn 100 LABEL=a
a 0 up 0:33 0 0 0 hln 100 LVL=
s 310 120 330 120 34
a 0 sr 3 0 320 118 hcn 100 LABEL=a
a 0 up 33 0 320 119 hct 100 LVL=
w 5
a 0 sr 0:3 0 215 228 hcn 100 LABEL=A3
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 230 250 230 90
a 0 sr 3 0 215 228 hcn 100 LABEL=A3
a 0 up 33 0 215 229 hct 100 LVL=
s 250 230 250 180 6
s 200 230 210 230 8
a 0 up 33 0 215 229 hct 100 LVL=
w 11
a 0 sr 0:3 0 215 208 hcn 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 210 240 210 92
a 0 sr 3 0 215 208 hcn 100 LABEL=A2
a 0 up 33 0 215 209 hct 100 LVL=
s 240 170 250 170 12
s 240 210 240 170 14
s 200 210 210 210 16
a 0 up 33 0 215 209 hct 100 LVL=
w 19
a 0 sr 0:3 0 215 188 hcn 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 190 230 190 94
a 0 sr 3 0 215 188 hcn 100 LABEL=A1
a 0 up 33 0 215 189 hct 100 LVL=
s 230 160 250 160 20
s 230 190 230 160 22
s 200 190 210 190 24
a 0 up 33 0 215 189 hct 100 LVL=
w 27
a 0 sr 0:3 0 215 168 hcn 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 170 220 170 96
a 0 sr 3 0 215 168 hcn 100 LABEL=A0
a 0 up 33 0 215 169 hct 100 LVL=
s 220 170 220 150 28
s 220 150 250 150 30
s 200 170 210 170 32
a 0 up 33 0 215 169 hct 100 LVL=
w 145
s 250 120 240 120 150
s 240 110 250 110 154
s 240 120 240 110 152
w 149
s 240 130 250 130 148
@junction
j 330 180
+ p 82 pin1
+ w 47
j 330 170
+ p 83 pin1
+ w 45
j 330 160
+ p 84 pin1
+ w 43
j 330 150
+ p 85 pin1
+ w 41
j 330 140
+ p 86 pin1
+ w 39
j 330 130
+ p 87 pin1
+ w 37
j 330 120
+ p 88 pin1
+ w 35
j 250 180
+ p 58 IND
+ w 5
j 250 170
+ p 58 INC
+ w 11
j 250 160
+ p 58 INB
+ w 19
j 250 150
+ p 58 INA
+ w 27
j 310 120
+ p 58 OUTA
+ w 35
j 310 130
+ p 58 OUTB
+ w 37
j 310 140
+ p 58 OUTC
+ w 39
j 310 150
+ p 58 OUTD
+ w 41
j 310 160
+ p 58 OUTE
+ w 43
j 310 170
+ p 58 OUTF
+ w 45
j 310 180
+ p 58 OUTG
+ w 47
j 200 230
+ p 62 *OUT
+ w 5
j 200 210
+ p 61 *OUT
+ w 11
j 200 190
+ p 60 *OUT
+ w 19
j 200 170
+ p 59 *OUT
+ w 27
j 210 230
+ p 89 pin1
+ w 5
j 210 210
+ p 91 pin1
+ w 11
j 210 190
+ p 93 pin1
+ w 19
j 210 170
+ p 95 pin1
+ w 27
j 250 110
+ p 58 \BI\/\RBO\
+ w 145
j 250 120
+ p 58 \RBI\
+ w 145
j 240 110
+ s 143
+ w 145
j 250 130
+ p 58 \LT\
+ w 149
j 240 130
+ s 142
+ w 149
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
