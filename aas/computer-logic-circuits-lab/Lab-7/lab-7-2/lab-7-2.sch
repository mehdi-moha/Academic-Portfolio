*version 9.1 570793834
u 109
U? 2
DSTM? 4
? 40
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ms
+1 8ms
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
pageloc 1 0 4793 
@status
n 0 105:04:30:01:32:41;1117441961 e 
s 2832 105:04:30:17:10:47;1117498247 e 
*page 1 0 1520 970 iB
@ports
port 4 LO 300 110 h
port 9 HI 300 170 h
port 3 LO 300 180 h
@parts
part 18 STIM1 320 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM3
a 0 ap 9 0 -29 8 hln 100 REFDES=DSTM3
a 0 u 0 0 0 70 hln 100 TIMESTEP=1m
a 0 u 0 0 0 80 hln 100 COMMAND1=0 0
a 0 u 0 0 0 90 hln 100 COMMAND2=4c 1
part 16 STIM1 320 130 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM1
a 0 ap 9 0 -29 8 hln 100 REFDES=DSTM1
a 0 u 0 0 0 80 hln 100 COMMAND1=0 0
a 0 u 0 0 0 90 hln 100 COMMAND2=1m 1
a 0 u 0 0 0 100 hln 100 COMMAND3=2m 0
a 0 u 0 0 0 110 hln 100 COMMAND4=3m 1
a 0 u 0 0 0 120 hln 100 COMMAND5=4m 0
a 0 u 0 0 0 130 hln 100 COMMAND6=5m 1
a 0 u 0 0 0 140 hln 100 COMMAND7=6m 0
a 0 u 0 0 0 150 hln 100 COMMAND8=7m 1
part 17 STIM1 320 140 h
a 0 u 0 0 0 110 hln 100 COMMAND4=6c 1
a 0 a 0:13 0 0 0 hln 100 PKGREF=DSTM2
a 0 ap 9 0 -29 8 hln 100 REFDES=DSTM2
a 0 u 0 0 0 70 hln 100 TIMESTEP=1m
a 0 u 0 0 0 80 hln 100 COMMAND1=0 0
a 0 u 0 0 0 90 hln 100 COMMAND2=2c 1
a 0 u 0 0 0 100 hln 100 COMMAND3=4c 0
part 2 74AS138 340 110 h
a 0 sp 11 0 38 100 hln 100 PART=74AS138
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=DIP16
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=U1
a 0 ap 9 0 11 -1 hln 100 REFDES=U1
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 95 nodeMarker 430 180 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=29
part 96 nodeMarker 430 170 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=30
part 97 nodeMarker 430 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=31
part 98 nodeMarker 430 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=32
part 99 nodeMarker 430 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=33
part 100 nodeMarker 430 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=34
part 101 nodeMarker 430 120 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=35
part 102 nodeMarker 430 110 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=36
part 103 nodeMarker 330 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=37
part 105 nodeMarker 330 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=38
part 107 nodeMarker 330 130 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=39
@conn
w 6
s 300 110 340 110 48
w 13
s 300 170 340 170 50
w 15
s 300 180 340 180 52
w 80
a 0 sr 0 0 0 0 hln 100 LABEL=Q7
s 400 180 430 180 79
a 0 sr 3 0 415 178 hcn 100 LABEL=Q7
w 82
a 0 sr 0 0 0 0 hln 100 LABEL=Q6
s 400 170 430 170 81
a 0 sr 3 0 415 168 hcn 100 LABEL=Q6
w 84
a 0 sr 0 0 0 0 hln 100 LABEL=Q5
s 400 160 430 160 83
a 0 sr 3 0 415 158 hcn 100 LABEL=Q5
w 86
a 0 sr 0 0 0 0 hln 100 LABEL=Q4
s 400 150 430 150 85
a 0 sr 3 0 415 148 hcn 100 LABEL=Q4
w 88
a 0 sr 0 0 0 0 hln 100 LABEL=Q3
s 400 140 430 140 87
a 0 sr 3 0 415 138 hcn 100 LABEL=Q3
w 90
a 0 sr 0 0 0 0 hln 100 LABEL=Q2
s 400 130 430 130 89
a 0 sr 3 0 415 128 hcn 100 LABEL=Q2
w 92
a 0 sr 0 0 0 0 hln 100 LABEL=Q1
s 400 120 430 120 91
a 0 sr 3 0 415 118 hcn 100 LABEL=Q1
w 94
a 0 sr 0 0 0 0 hln 100 LABEL=Q0
s 400 110 430 110 93
a 0 sr 3 0 415 108 hcn 100 LABEL=Q0
w 24
a 0 sr 0 0 0 0 hln 100 LABEL=A2
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 150 330 150 74
a 0 sr 3 0 325 148 hcn 100 LABEL=A2
a 0 up 33 0 325 149 hct 100 LVL=
s 330 150 340 150 104
w 22
a 0 sr 0 0 0 0 hln 100 LABEL=A1
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 140 330 140 76
a 0 sr 3 0 325 138 hcn 100 LABEL=A1
a 0 up 33 0 325 139 hct 100 LVL=
s 330 140 340 140 106
w 20
a 0 sr 0 0 0 0 hln 100 LABEL=A0
a 0 up 0:33 0 0 0 hln 100 LVL=
s 320 130 330 130 78
a 0 up 33 0 325 129 hct 100 LVL=
a 0 sr 3 0 325 128 hcn 100 LABEL=A0
s 330 130 340 130 108
@junction
j 340 150
+ p 2 C
+ w 24
j 320 140
+ p 17 pin1
+ w 22
j 340 140
+ p 2 B
+ w 22
j 320 130
+ p 16 pin1
+ w 20
j 340 130
+ p 2 A
+ w 20
j 300 110
+ s 4
+ w 6
j 340 110
+ p 2 \G2B\
+ w 6
j 300 170
+ s 9
+ w 13
j 340 170
+ p 2 G1
+ w 13
j 300 180
+ s 3
+ w 15
j 340 180
+ p 2 \G2A\
+ w 15
j 320 150
+ p 18 pin1
+ w 24
j 400 110
+ p 2 Y0
+ w 94
j 400 120
+ p 2 Y1
+ w 92
j 400 130
+ p 2 Y2
+ w 90
j 400 140
+ p 2 Y3
+ w 88
j 400 150
+ p 2 Y4
+ w 86
j 400 160
+ p 2 Y5
+ w 84
j 400 170
+ p 2 Y6
+ w 82
j 400 180
+ p 2 Y7
+ w 80
j 430 180
+ p 95 pin1
+ w 80
j 430 170
+ p 96 pin1
+ w 82
j 430 160
+ p 97 pin1
+ w 84
j 430 150
+ p 98 pin1
+ w 86
j 430 140
+ p 99 pin1
+ w 88
j 430 130
+ p 100 pin1
+ w 90
j 430 120
+ p 101 pin1
+ w 92
j 430 110
+ p 102 pin1
+ w 94
j 330 150
+ p 103 pin1
+ w 24
j 330 140
+ p 105 pin1
+ w 22
j 330 130
+ p 107 pin1
+ w 20
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
