*version 9.1 124621680
u 336
U? 3
DSTM? 4
? 21
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB lab-6-4.stl
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
pageloc 1 0 3452 
@status
n 0 105:05:02:15:36:18;1117751778 e 
s 2832 105:05:02:15:40:14;1117752014 e 
*page 1 0 1520 970 iB
@ports
port 247 HI 300 140 h
port 12 LO 300 110 h
port 226 LO 300 190 h
@parts
part 2 74151A 330 110 h
a 0 sp 11 0 12 160 hln 100 PART=74151A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 1 ap 9 0 40 -2 hln 100 REFDES=U1
part 3 DigStim 300 220 h
a 0 x 13 13 -41 4 hln 70 STIMULUS=S0
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 -27 -1 hcn 100 REFDES=DSTM1
part 4 DigStim 300 230 h
a 0 x 13 13 -41 9 hln 70 STIMULUS=S1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 -27 4 hcn 100 REFDES=DSTM2
part 5 DigStim 300 240 h
a 0 x 13 13 -41 14 hln 70 STIMULUS=S2
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 1 ap 9 0 -27 9 hcn 100 REFDES=DSTM3
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 329 nodeMarker 410 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=17
part 330 nodeMarker 320 240 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=18
part 332 nodeMarker 320 230 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=19
part 334 nodeMarker 320 220 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=20
@conn
w 267
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 150 310 150 309
s 330 140 310 140 307
s 310 150 310 140 311
s 310 170 330 170 315
s 310 170 310 150 313
s 310 200 330 200 318
s 310 200 310 170 316
s 310 140 300 140 320
w 275
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 110 330 110 322
a 0 up 33 0 310 109 hct 100 LVL=
w 274
a 0 up 0:33 0 0 0 hln 100 LVL=
s 330 160 320 160 291
s 320 130 330 130 295
s 320 160 320 130 293
s 330 180 320 180 296
s 320 180 320 160 298
s 330 190 320 190 300
s 320 190 320 180 302
s 300 190 320 190 327
w 211
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 390 140 410 140 210
a 0 sr 3 0 405 138 hcn 100 LABEL=F
a 0 up 33 0 405 139 hct 100 LVL=
w 11
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 240 320 240 214
a 0 up 33 0 300 239 hct 100 LVL=
a 0 sr 3 0 316 238 hcn 100 LABEL=A2
s 320 240 330 240 331
w 9
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 230 320 230 216
a 0 up 33 0 300 229 hct 100 LVL=
a 0 sr 3 0 316 228 hcn 100 LABEL=A1
s 320 230 330 230 333
w 82
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 220 320 220 218
a 0 up 33 0 300 219 hct 100 LVL=
a 0 sr 3 0 316 218 hcn 100 LABEL=A0
s 320 220 330 220 335
@junction
j 330 240
+ p 2 S2
+ w 11
j 330 230
+ p 2 S1
+ w 9
j 330 220
+ p 2 S0
+ w 82
j 390 140
+ p 2 Z
+ w 211
j 330 130
+ p 2 I0
+ w 274
j 330 200
+ p 2 I7
+ w 267
j 330 160
+ p 2 I3
+ w 274
j 330 180
+ p 2 I5
+ w 274
j 320 160
+ w 274
+ w 274
j 330 190
+ p 2 I6
+ w 274
j 320 180
+ w 274
+ w 274
j 310 170
+ w 267
+ w 267
j 310 150
+ w 267
+ w 267
j 330 170
+ p 2 I4
+ w 267
j 330 150
+ p 2 I2
+ w 267
j 330 140
+ p 2 I1
+ w 267
j 300 140
+ s 247
+ w 267
j 310 140
+ w 267
+ w 267
j 300 110
+ s 12
+ w 275
j 330 110
+ p 2 \E\
+ w 275
j 300 220
+ p 3 *OUT
+ w 82
j 300 230
+ p 4 *OUT
+ w 9
j 300 240
+ p 5 *OUT
+ w 11
j 300 190
+ s 226
+ w 274
j 320 190
+ w 274
+ w 274
j 410 140
+ p 329 pin1
+ w 211
j 320 240
+ p 330 pin1
+ w 11
j 320 230
+ p 332 pin1
+ w 9
j 320 220
+ p 334 pin1
+ w 82
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
