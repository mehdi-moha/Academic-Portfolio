*version 9.1 1704313130
u 406
U? 6
DSTM? 3
? 10
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
.STMLIB xor.stl
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
pageloc 1 0 4006 
@status
n 0 105:04:27:15:44:16;1117233856 e 
s 0 105:04:28:07:31:54;1117290714 e 
*page 1 0 1520 970 iB
@ports
@parts
part 6 74AS00 310 120 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U5
a 0 ap 9 0 11 -2 hln 100 REFDES=U5A
part 5 74AS00 210 160 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U4
a 0 ap 9 0 11 -2 hln 100 REFDES=U4A
part 3 74AS00 120 140 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U2
a 0 ap 9 0 11 -2 hln 100 REFDES=U2A
part 68 DigStim 60 100 h
a 0 x 13 13 4 19 hln 70 STIMULUS=A0
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 13 -1 hcn 100 REFDES=DSTM1
part 2 74AS00 120 90 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -2 hln 100 REFDES=U1A
part 69 DigStim 60 150 h
a 0 x 13 13 4 19 hln 70 STIMULUS=A1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 13 -1 hcn 100 REFDES=DSTM2
part 4 74AS00 210 70 h
a 0 sp 11 0 40 50 hln 100 PART=74AS00
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=A
a 0 a 0:13 0 0 0 hln 100 PKGREF=U3
a 0 ap 9 0 11 -2 hln 100 REFDES=U3A
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 401 nodeMarker 390 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
part 402 nodeMarker 70 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=8
part 404 nodeMarker 70 100 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
@conn
w 14
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 140 310 140 13
s 300 170 300 140 15
a 0 up 33 0 302 155 hlt 100 LVL=
s 280 170 300 170 17
w 170
a 0 up 0:33 0 0 0 hln 100 LVL=
s 200 150 190 150 307
s 200 160 210 160 347
s 200 160 200 150 306
a 0 up 33 0 202 155 hlt 100 LVL=
w 8
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 120 310 120 11
s 300 80 300 120 9
a 0 up 33 0 302 100 hlt 100 LVL=
s 280 80 300 80 7
w 364
a 0 up 0:33 0 0 0 hln 100 LVL=
s 210 90 200 90 363
s 200 90 200 100 378
s 200 100 190 100 379
a 0 up 33 0 195 99 hct 100 LVL=
w 276
a 0 sr 0 0 0 0 hln 100 LABEL=F
a 0 up 0:33 0 0 0 hln 100 LVL=
s 380 130 390 130 275
a 0 sr 3 0 385 128 hcn 100 LABEL=F
a 0 up 33 0 385 129 hct 100 LVL=
w 366
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0:3 0 70 148 hcn 100 LABEL=A1
s 70 150 90 150 403
a 0 sr 3 0 70 148 hcn 100 LABEL=A1
s 110 140 110 150 27
s 110 160 120 160 29
s 120 140 110 140 25
s 110 150 110 160 392
s 60 150 70 150 373
a 0 up 33 0 70 149 hct 100 LVL=
s 200 70 200 60 367
s 210 70 200 70 365
s 200 60 90 60 369
s 90 150 110 150 394
s 90 60 90 150 371
w 356
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0:3 0 70 68 hcn 100 LABEL=A0
s 70 100 80 100 405
a 0 sr 3 0 70 98 hcn 100 LABEL=A0
s 200 190 80 190 171
s 200 190 200 180 316
s 200 180 210 180 343
s 110 90 120 90 23
s 120 110 110 110 19
s 110 110 110 100 21
s 110 100 110 90 362
s 60 100 70 100 352
a 0 up 33 0 70 99 hct 100 LVL=
s 80 100 110 100 376
s 80 190 80 100 374
@junction
j 310 120
+ p 6 A
+ w 8
j 310 140
+ p 6 B
+ w 14
j 380 130
+ p 6 Y
+ w 276
j 280 170
+ p 5 Y
+ w 14
j 210 180
+ p 5 B
+ w 356
j 190 150
+ p 3 Y
+ w 170
j 210 160
+ p 5 A
+ w 170
j 110 100
+ w 356
+ w 356
j 120 90
+ p 2 A
+ w 356
j 120 110
+ p 2 B
+ w 356
j 60 100
+ p 68 *OUT
+ w 356
j 80 100
+ w 356
+ w 356
j 280 80
+ p 4 Y
+ w 8
j 210 90
+ p 4 B
+ w 364
j 190 100
+ p 2 Y
+ w 364
j 120 160
+ p 3 B
+ w 366
j 120 140
+ p 3 A
+ w 366
j 60 150
+ p 69 *OUT
+ w 366
j 110 150
+ w 366
+ w 366
j 210 70
+ p 4 A
+ w 366
j 90 150
+ w 366
+ w 366
j 390 130
+ p 401 pin1
+ w 276
j 70 150
+ p 402 pin1
+ w 366
j 70 100
+ p 404 pin1
+ w 356
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
