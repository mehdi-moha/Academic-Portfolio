*version 9.1 282344360
u 97
DSTM? 5
U? 2
? 12
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-3-2-a.stl
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
pageloc 1 0 5312 
@status
n 0 105:04:28:22:14:01;1117343641 e 
s 2832 105:04:28:22:37:11;1117345031 e 
*page 1 0 1520 970 iB
@ports
port 60 LO 260 100 h
port 77 HI 260 110 h
@parts
part 54 DigStim 220 160 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
part 55 DigStim 220 180 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=B
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
part 56 DigStim 220 200 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=C
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
part 57 DigStim 220 220 h
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM4
a 0 x 13 13 -41 9 hln 70 STIMULUS=D
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM4
part 58 7447A 270 100 h
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
part 82 nodeMarker 350 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 83 nodeMarker 350 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
part 84 nodeMarker 350 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 85 nodeMarker 350 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 86 nodeMarker 350 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=5
part 87 nodeMarker 350 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=6
part 88 nodeMarker 350 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 89 nodeMarker 230 220 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 91 nodeMarker 230 200 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 93 nodeMarker 230 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 95 nodeMarker 230 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=11
@conn
w 7
a 0 up 0:33 0 0 0 hln 100 LVL=
s 260 100 270 100 8
a 0 up 33 0 265 99 hct 100 LVL=
w 76
a 0 up 0:33 0 0 0 hln 100 LVL=
s 270 110 260 110 6
s 270 120 260 120 78
s 260 120 260 110 80
a 0 up 33 0 262 115 hlt 100 LVL=
w 3
a 0 sr 3 0 340 168 hcn 100 LABEL=g
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 170 350 170 2
a 0 sr 3 0 340 168 hcn 100 LABEL=g
a 0 up 33 0 340 169 hct 100 LVL=
w 53
a 0 sr 3 0 340 158 hcn 100 LABEL=f
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 160 350 160 52
a 0 sr 3 0 340 158 hcn 100 LABEL=f
a 0 up 33 0 340 159 hct 100 LVL=
w 51
a 0 sr 3 0 340 148 hcn 100 LABEL=e
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 150 350 150 50
a 0 sr 3 0 340 148 hcn 100 LABEL=e
a 0 up 33 0 340 149 hct 100 LVL=
w 49
a 0 sr 3 0 340 138 hcn 100 LABEL=d
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 140 350 140 48
a 0 sr 3 0 340 138 hcn 100 LABEL=d
a 0 up 33 0 340 139 hct 100 LVL=
w 47
a 0 sr 3 0 340 128 hcn 100 LABEL=c
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 130 350 130 46
a 0 sr 3 0 340 128 hcn 100 LABEL=c
a 0 up 33 0 340 129 hct 100 LVL=
w 45
a 0 sr 3 0 340 118 hcn 100 LABEL=b
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 120 350 120 44
a 0 sr 3 0 340 118 hcn 100 LABEL=b
a 0 up 33 0 340 119 hct 100 LVL=
w 43
a 0 sr 3 0 340 108 hcn 100 LABEL=a
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 110 350 110 42
a 0 sr 3 0 340 108 hcn 100 LABEL=a
a 0 up 33 0 340 109 hct 100 LVL=
w 37
a 0 sr 0:3 0 235 218 hcn 100 LABEL=A3
a 0 up 0:33 0 0 0 hln 100 LVL=
s 230 220 270 220 90
a 0 sr 3 0 235 218 hcn 100 LABEL=A3
s 270 220 270 170 38
s 220 220 230 220 40
a 0 up 33 0 235 219 hct 100 LVL=
w 29
a 0 sr 0:3 0 235 198 hcn 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 230 200 260 200 92
a 0 sr 3 0 235 198 hcn 100 LABEL=A2
s 260 160 270 160 30
s 260 200 260 160 32
s 220 200 230 200 34
a 0 up 33 0 235 199 hct 100 LVL=
w 21
a 0 sr 0:3 0 235 178 hcn 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 230 180 250 180 94
a 0 sr 3 0 235 178 hcn 100 LABEL=A1
s 250 150 270 150 22
s 250 180 250 150 24
s 220 180 230 180 26
a 0 up 33 0 235 179 hct 100 LVL=
w 13
a 0 sr 0:3 0 235 158 hcn 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 230 160 240 160 96
a 0 sr 3 0 235 158 hcn 100 LABEL=A0
s 240 160 240 140 14
s 240 140 270 140 16
s 220 160 230 160 18
a 0 up 33 0 235 159 hct 100 LVL=
@junction
j 220 180
+ p 55 *OUT
+ w 21
j 220 200
+ p 56 *OUT
+ w 29
j 220 220
+ p 57 *OUT
+ w 37
j 260 100
+ s 60
+ w 7
j 260 110
+ s 77
+ w 76
j 330 170
+ p 58 OUTG
+ w 3
j 270 110
+ p 58 \RBI\
+ w 76
j 270 100
+ p 58 \BI\/\RBO\
+ w 7
j 270 140
+ p 58 INA
+ w 13
j 270 150
+ p 58 INB
+ w 21
j 270 160
+ p 58 INC
+ w 29
j 270 170
+ p 58 IND
+ w 37
j 330 110
+ p 58 OUTA
+ w 43
j 330 120
+ p 58 OUTB
+ w 45
j 330 130
+ p 58 OUTC
+ w 47
j 330 140
+ p 58 OUTD
+ w 49
j 330 150
+ p 58 OUTE
+ w 51
j 330 160
+ p 58 OUTF
+ w 53
j 270 120
+ p 58 \LT\
+ w 76
j 220 160
+ p 54 *OUT
+ w 13
j 350 170
+ p 82 pin1
+ w 3
j 350 160
+ p 83 pin1
+ w 53
j 350 150
+ p 84 pin1
+ w 51
j 350 140
+ p 85 pin1
+ w 49
j 350 130
+ p 86 pin1
+ w 47
j 350 120
+ p 87 pin1
+ w 45
j 350 110
+ p 88 pin1
+ w 43
j 230 220
+ p 89 pin1
+ w 37
j 230 200
+ p 91 pin1
+ w 29
j 230 180
+ p 93 pin1
+ w 21
j 230 160
+ p 95 pin1
+ w 13
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
