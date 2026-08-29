*version 9.1 700678756
u 154
U? 2
DSTM? 5
? 27
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-3-1.stl
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
pageloc 1 0 4481 
@status
n 0 105:04:28:08:02:39;1117292559 e 
s 2832 105:04:28:16:11:08;1117321868 e 
*page 1 0 1520 970 iB
@ports
port 84 HI 230 80 h
@parts
part 2 7447A 250 80 h
a 0 sp 11 0 40 100 hln 100 PART=7447A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 40 -2 hln 100 REFDES=U1
part 17 DigStim 200 140 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM1
a 0 x 13 13 -41 9 hln 70 STIMULUS=A
part 18 DigStim 200 160 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM2
a 0 x 13 13 -41 9 hln 70 STIMULUS=B
part 19 DigStim 200 180 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM3
a 0 x 13 13 -41 9 hln 70 STIMULUS=C
part 20 DigStim 200 200 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM4
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM4
a 0 x 13 13 -41 9 hln 70 STIMULUS=D
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 139 nodeMarker 330 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=16
part 140 nodeMarker 330 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=17
part 141 nodeMarker 330 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=18
part 142 nodeMarker 330 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=19
part 143 nodeMarker 330 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=20
part 144 nodeMarker 330 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=21
part 145 nodeMarker 330 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=22
part 146 nodeMarker 210 200 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=23
part 148 nodeMarker 210 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=24
part 150 nodeMarker 210 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=25
part 152 nodeMarker 210 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=26
@conn
w 93
s 250 100 240 100 92
s 250 90 240 90 87
s 240 80 250 80 91
s 240 90 240 80 89
s 240 100 240 90 94
s 240 80 230 80 111
w 16
a 0 sr 0 0 0 0 hln 100 LABEL=g
s 310 150 330 150 15
a 0 sr 3 0 320 148 hcn 100 LABEL=g
w 14
a 0 sr 0 0 0 0 hln 100 LABEL=f
s 310 140 330 140 13
a 0 sr 3 0 320 138 hcn 100 LABEL=f
w 12
a 0 sr 0 0 0 0 hln 100 LABEL=e
s 310 130 330 130 11
a 0 sr 3 0 320 128 hcn 100 LABEL=e
w 10
a 0 sr 0 0 0 0 hln 100 LABEL=d
s 310 120 330 120 9
a 0 sr 3 0 320 118 hcn 100 LABEL=d
w 8
a 0 sr 0 0 0 0 hln 100 LABEL=c
s 310 110 330 110 7
a 0 sr 3 0 320 108 hcn 100 LABEL=c
w 6
a 0 sr 0 0 0 0 hln 100 LABEL=b
s 310 100 330 100 5
a 0 sr 3 0 320 98 hcn 100 LABEL=b
w 4
a 0 sr 0 0 0 0 hln 100 LABEL=a
s 310 90 330 90 3
a 0 sr 3 0 320 88 hcn 100 LABEL=a
w 110
a 0 sr 0 0 0 0 hln 100 LABEL=A0
s 210 140 220 140 153
a 0 sr 3 0 215 138 hcn 100 LABEL=A0
s 220 140 220 120 126
s 220 120 250 120 127
s 200 140 210 140 21
w 28
a 0 sr 0:3 0 215 158 hcn 100 LABEL=A1
s 210 160 230 160 151
a 0 sr 3 0 215 158 hcn 100 LABEL=A1
s 230 130 250 130 67
s 230 160 230 130 72
s 200 160 210 160 59
w 32
a 0 sr 0:3 0 215 178 hcn 100 LABEL=A2
s 210 180 240 180 149
a 0 sr 3 0 215 178 hcn 100 LABEL=A2
s 240 140 250 140 69
s 240 180 240 140 78
s 200 180 210 180 58
w 96
a 0 sr 0 0 0 0 hln 100 LABEL=A3
s 210 200 250 200 147
a 0 sr 3 0 215 198 hcn 100 LABEL=A3
s 250 200 250 150 37
s 200 200 210 200 71
@junction
j 310 100
+ p 2 OUTB
+ w 6
j 310 110
+ p 2 OUTC
+ w 8
j 310 130
+ p 2 OUTE
+ w 12
j 310 140
+ p 2 OUTF
+ w 14
j 310 150
+ p 2 OUTG
+ w 16
j 250 100
+ p 2 \LT\
+ w 93
j 250 90
+ p 2 \RBI\
+ w 93
j 250 80
+ p 2 \BI\/\RBO\
+ w 93
j 240 90
+ w 93
+ w 93
j 250 140
+ p 2 INC
+ w 32
j 250 150
+ p 2 IND
+ w 96
j 250 130
+ p 2 INB
+ w 28
j 250 120
+ p 2 INA
+ w 110
j 230 80
+ s 84
+ w 93
j 240 80
+ w 93
+ w 93
j 200 140
+ p 17 *OUT
+ w 110
j 200 160
+ p 18 *OUT
+ w 28
j 200 180
+ p 19 *OUT
+ w 32
j 200 200
+ p 20 *OUT
+ w 96
j 330 150
+ p 139 pin1
+ w 16
j 330 140
+ p 140 pin1
+ w 14
j 330 130
+ p 141 pin1
+ w 12
j 330 110
+ p 143 pin1
+ w 8
j 330 100
+ p 144 pin1
+ w 6
j 210 200
+ p 146 pin1
+ w 96
j 210 180
+ p 148 pin1
+ w 32
j 210 160
+ p 150 pin1
+ w 28
j 210 140
+ p 152 pin1
+ w 110
j 310 90
+ p 2 OUTA
+ w 4
j 330 90
+ p 145 pin1
+ w 4
j 310 120
+ p 2 OUTD
+ w 10
j 330 120
+ p 142 pin1
+ w 10
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
