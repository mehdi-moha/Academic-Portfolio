*version 9.1 830333864
u 111
U? 2
DSTM? 2
? 13
@libraries
@analysis
.TRAN 1 0 0 0
+0 0.001s
+1 2s
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
.STMLIB lab-10-1.stl
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
pageloc 1 0 2584 
@status
n 0 105:04:30:01:11:14;1117440674 e 
s 2832 105:04:30:02:32:02;1117445522 e 
*page 1 0 1520 970 iB
@ports
port 3 LO 280 120 h
port 41 LO 280 200 h
@parts
part 2 7490A 310 120 h
a 0 sp 11 0 40 110 hln 100 PART=7490A
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP14
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 40 0 hln 100 REFDES=U1
part 15 DigStim 300 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 x 13 13 -46 9 hln 70 STIMULUS=CLK
a 1 ap 9 0 -32 4 hcn 100 REFDES=DSTM1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 101 nodeMarker 390 190 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=9
part 102 nodeMarker 390 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=10
part 103 nodeMarker 390 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=11
part 104 nodeMarker 390 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=12
@conn
w 37
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 120 310 120 18
s 310 130 300 130 24
s 300 130 300 120 26
s 300 120 280 120 44
a 0 up 33 0 290 119 hct 100 LVL=
w 40
s 310 190 300 190 28
s 300 200 300 190 38
s 310 200 300 200 36
s 300 200 280 200 46
w 43
a 0 up 0:33 0 0 0 hln 100 LVL=
s 300 150 310 150 69
a 0 up 33 0 300 149 hct 100 LVL=
w 64
a 0 up 0:33 0 0 0 hln 100 LVL=
s 370 190 390 190 63
a 0 up 33 0 380 189 hct 100 LVL=
w 62
a 0 up 0:33 0 0 0 hln 100 LVL=
s 370 170 390 170 61
a 0 up 33 0 380 169 hct 100 LVL=
w 60
a 0 up 0:33 0 0 0 hln 100 LVL=
s 370 150 390 150 59
a 0 up 33 0 380 149 hct 100 LVL=
w 84
a 0 up 0:33 0 0 0 hln 100 LVL=
s 240 170 310 170 82
s 240 230 240 170 80
s 390 130 400 130 105
s 370 130 390 130 100
s 400 130 400 230 76
s 400 230 240 230 78
a 0 up 33 0 320 229 hct 100 LVL=
@junction
j 310 200
+ p 2 R02
+ w 40
j 310 190
+ p 2 R01
+ w 40
j 310 120
+ p 2 R91
+ w 37
j 310 130
+ p 2 R92
+ w 37
j 280 120
+ s 3
+ w 37
j 300 120
+ w 37
+ w 37
j 280 200
+ s 41
+ w 40
j 300 200
+ w 40
+ w 40
j 370 150
+ p 2 QB
+ w 60
j 370 170
+ p 2 QC
+ w 62
j 370 190
+ p 2 QD
+ w 64
j 300 150
+ p 15 *OUT
+ w 43
j 310 150
+ p 2 CKA
+ w 43
j 310 170
+ p 2 CKB
+ w 84
j 390 190
+ p 101 pin1
+ w 64
j 390 170
+ p 102 pin1
+ w 62
j 390 150
+ p 103 pin1
+ w 60
j 370 130
+ p 2 QA
+ w 84
j 390 130
+ p 104 pin1
+ w 84
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
