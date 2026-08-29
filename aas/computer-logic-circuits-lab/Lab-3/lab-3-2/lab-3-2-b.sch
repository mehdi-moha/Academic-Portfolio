*version 9.1 2624418915
u 96
DSTM? 5
U? 2
? 13
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-3-2-b.stl
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
pageloc 1 0 4999 
@status
n 0 105:04:28:22:33:51;1117344831 e 
s 2832 105:04:28:22:37:30;1117345050 e 
*page 1 0 1520 970 iB
@ports
port 60 LO 270 90 h
port 77 HI 270 100 h
@parts
part 54 DigStim 230 140 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
part 55 DigStim 230 160 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=B
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
part 56 DigStim 230 180 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=C
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
part 57 DigStim 230 200 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM4
a 0 x 13 13 -41 9 hln 70 STIMULUS=D
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM4
part 58 7447A 280 80 h
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
part 80 nodeMarker 260 80 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 81 nodeMarker 360 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
part 82 nodeMarker 360 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 83 nodeMarker 360 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 84 nodeMarker 360 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 85 nodeMarker 360 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 86 nodeMarker 360 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 87 nodeMarker 360 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 88 nodeMarker 240 200 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 90 nodeMarker 240 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 92 nodeMarker 240 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=11
part 94 nodeMarker 240 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=12
@conn
w 76
s 280 90 270 90 6
w 79
s 270 100 280 100 78
w 7
a 0 sr 0 0 0 0 hln 100 LABEL=Pin4
s 260 80 280 80 8
a 0 sr 3 0 270 78 hcn 100 LABEL=Pin4
w 3
a 0 sr 3 0 350 148 hcn 100 LABEL=g
s 340 150 360 150 2
a 0 sr 3 0 350 148 hcn 100 LABEL=g
a 0 up 33 0 350 149 hct 100 LVL=
w 53
a 0 sr 3 0 350 138 hcn 100 LABEL=f
s 340 140 360 140 52
a 0 sr 3 0 350 138 hcn 100 LABEL=f
a 0 up 33 0 350 139 hct 100 LVL=
w 51
a 0 sr 3 0 350 128 hcn 100 LABEL=e
s 340 130 360 130 50
a 0 sr 3 0 350 128 hcn 100 LABEL=e
a 0 up 33 0 350 129 hct 100 LVL=
w 49
a 0 sr 3 0 350 118 hcn 100 LABEL=d
s 340 120 360 120 48
a 0 sr 3 0 350 118 hcn 100 LABEL=d
a 0 up 33 0 350 119 hct 100 LVL=
w 47
a 0 sr 3 0 350 108 hcn 100 LABEL=c
s 340 110 360 110 46
a 0 sr 3 0 350 108 hcn 100 LABEL=c
a 0 up 33 0 350 109 hct 100 LVL=
w 45
a 0 sr 3 0 350 98 hcn 100 LABEL=b
s 340 100 360 100 44
a 0 sr 3 0 350 98 hcn 100 LABEL=b
a 0 up 33 0 350 99 hct 100 LVL=
w 43
a 0 sr 3 0 350 88 hcn 100 LABEL=a
s 340 90 360 90 42
a 0 sr 3 0 350 88 hcn 100 LABEL=a
a 0 up 33 0 350 89 hct 100 LVL=
w 37
a 0 sr 0:3 0 245 198 hcn 100 LABEL=A3
s 240 200 280 200 89
a 0 sr 3 0 245 198 hcn 100 LABEL=A3
s 280 200 280 150 38
s 230 200 240 200 40
a 0 up 33 0 245 199 hct 100 LVL=
w 29
a 0 sr 0:3 0 245 178 hcn 100 LABEL=A2
s 240 180 270 180 91
a 0 sr 3 0 245 178 hcn 100 LABEL=A2
s 270 140 280 140 30
s 270 180 270 140 32
s 230 180 240 180 34
a 0 up 33 0 245 179 hct 100 LVL=
w 21
a 0 sr 0:3 0 245 158 hcn 100 LABEL=A1
s 240 160 260 160 93
a 0 sr 3 0 245 158 hcn 100 LABEL=A1
s 260 130 280 130 22
s 260 160 260 130 24
s 230 160 240 160 26
a 0 up 33 0 245 159 hct 100 LVL=
w 13
a 0 sr 0:3 0 245 138 hcn 100 LABEL=A0
s 240 140 250 140 95
a 0 sr 3 0 245 138 hcn 100 LABEL=A0
s 250 140 250 120 14
s 250 120 280 120 16
s 230 140 240 140 18
a 0 up 33 0 245 139 hct 100 LVL=
@junction
j 230 140
+ p 54 *OUT
+ w 13
j 230 160
+ p 55 *OUT
+ w 21
j 230 180
+ p 56 *OUT
+ w 29
j 230 200
+ p 57 *OUT
+ w 37
j 340 150
+ p 58 OUTG
+ w 3
j 280 90
+ p 58 \RBI\
+ w 76
j 280 120
+ p 58 INA
+ w 13
j 280 130
+ p 58 INB
+ w 21
j 280 140
+ p 58 INC
+ w 29
j 280 150
+ p 58 IND
+ w 37
j 340 90
+ p 58 OUTA
+ w 43
j 340 100
+ p 58 OUTB
+ w 45
j 340 110
+ p 58 OUTC
+ w 47
j 340 120
+ p 58 OUTD
+ w 49
j 340 130
+ p 58 OUTE
+ w 51
j 340 140
+ p 58 OUTF
+ w 53
j 270 90
+ s 60
+ w 76
j 280 100
+ p 58 \LT\
+ w 79
j 270 100
+ s 77
+ w 79
j 280 80
+ p 58 \BI\/\RBO\
+ w 7
j 260 80
+ p 80 pin1
+ w 7
j 360 150
+ p 81 pin1
+ w 3
j 360 140
+ p 82 pin1
+ w 53
j 360 130
+ p 83 pin1
+ w 51
j 360 120
+ p 84 pin1
+ w 49
j 360 110
+ p 85 pin1
+ w 47
j 360 100
+ p 86 pin1
+ w 45
j 360 90
+ p 87 pin1
+ w 43
j 240 200
+ p 88 pin1
+ w 37
j 240 180
+ p 90 pin1
+ w 29
j 240 160
+ p 92 pin1
+ w 21
j 240 140
+ p 94 pin1
+ w 13
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
