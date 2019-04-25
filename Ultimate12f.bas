   10 REM  ULTIMATE NIGHTMARE V1.2
   60 REM (C)1992 TONY KINGSMILL UPDATED FOR RISC OS MARCH 2019
   65 GOSUB 6700
   70 DIM LOC$(50):DIM J(21):DIM OBJ$(21):DIM N(50):DIM S(50):DIM E(50):DIM W(50):DIM V$(40)
   73 TC=0:TLC=1:TT=0
   74 DIM TJ(21)
   75 L=50:T=0
   80 LC=1:OC=0:B=21
   85 MO=3
  120 M=40
  549 REM >>> LOCATION DESCRIPTIONS
  550 DATA "Dirty prison room: Sounds can be heard  in the distance. Exits: SOUTH & EAST."
  560 DATA "Southern part of large cell: There are  no windows - it's lit by a small torch. Exit: NORTH."
  570 DATA "Eastern part of cell: There is a door onone wall. Exit: WEST"
  580 DATA "You are in a passageway. Exits: WEST,   EAST and SOUTH."
  590 DATA "You are in a north - south passageway."
  600 DATA "Passageway. Exits: WEST, SOUTH and EAST"
  610 DATA "Small, gloomy room. You can see a man   chained to a wall in a corner. Exit:    NORTH"
  620 DATA "Passageway. Exits: SOUTH and WEST"
  630 DATA "Prison Kitchen: It's infested with      insects and rats that scurry along the  floor. Exit: NORTH"
  640 DATA "Passageway junction: Exits: NORTH, WEST and SOUTH"
  650 DATA "At the front of the building, you are   standing behind a huge iron gate to the SOUTH, guarded by a very tall and gruesome looking officer. Exits: SOUTH (through the gate) and NORTH"
  660 DATA "Officer's Room: It's filled with lots ofuseless junk. Exit: EAST"
  670 DATA "Narrow Path. Exits: NORTH and SOUTH."
  680 DATA "","","","","","","","",""
  690 DATA "You are at a forest clearing. Between   the dense vegetation, you can see paths leading NORTH and WEST."
  700 DATA "On top of a grassy hill, you can see    two paths, one leading into a large     forest. Exits: EAST and SOUTH."
  710 DATA "You are standing on an exposed cliff    edge. It's very windy, making it        difficult to stand up. Groups of robotic sentry drones fly above you, they swoop down low at times but luckily haven't seen you yet. Exits: NORTH"
  720 DATA "You are gliding over a large mountain,  hanging from a sentry drone. There are no    apparent exits!"
  730 DATA "You are positioned on a cold, desolate  mountain plateau. Patches of snow can   be seen around you. Exits: SOUTH only."
  740 DATA "You're on a plateau. Exits: SOUTH and   EAST."
  750 DATA "You're on a plateau. Exits: NORTH and   EAST."
  760 DATA "You're on a plateau. Exits: NORTH,      SOUTH, EAST and WEST."
  770 DATA "You're on a plateau. Exits: NORTH and   WEST."
  780 DATA "Steep Path: Exits: EAST and WEST"
  790 DATA "You are standing in an icy hollow on    the side of a mountain. It's too        dangerous to go any further north here. Exits: SOUTH."
  800 DATA "Steep Path: Exits: NORTH and EAST"
  810 DATA "You are at the foot of a high mountain. Exits: WEST and NORTH."
  820 DATA "On the southern part of a river bank,   you can see a small rowing boat by the  bank. Exits: EAST and SOUTH."
  830 DATA "You are on the riverbank. Exits: WEST."
  840 DATA "You are in the small rowing boat.       Fortunately it seems quite strong and   has no leaks."
  850 DATA "","","","","","","","","","",""
  860 DATA "You are on a steep path. Exits: WEST    and SOUTH."
 2009 REM >>> MOVEMENT DATA
 2010 DATA 0,2,3,0
 2020 DATA 1,0,0,0
 2030 DATA 0,0,0,1
 2040 DATA 0,5,6,3
 2050 DATA 4,10,0,0
 2060 DATA 0,7,8,4
 2070 DATA 6,0,0,0
 2080 DATA 0,9,0,6
 2090 DATA 8,0,0,0
 2100 DATA 5,11,0,12
 2105 DATA 10,0,0,0
 2110 DATA 0,0,10,0
 2115 DATA 11,14,0,0
 2120 DATA 13,15,16,17
 2125 DATA 14,20,19,18
 2130 DATA 0,19,0,14
 2135 DATA 0,18,14,0
 2140 DATA 17,22,15,0
 2145 DATA 16,0,39,15
 2150 DATA 15,0,21,22
 2155 DATA 0,0,0,20
 2160 DATA 18,0,20,0
 2165 DATA 49,0,0,0
 2170 DATA 0,25,23,0
 2175 DATA 24,0,0,0
 2180 DATA 0,0,0,0
 2185 DATA 0,28,0,0
 2190 DATA 27,29,30,0
 2195 DATA 28,0,31,0
 2200 DATA 33,31,32,28
 2205 DATA 30,0,0,29
 2210 DATA 0,0,50,30
 2215 DATA 0,30,0,0
 2220 DATA 50,0,0,0
 2225 DATA 36,0,0,34
 2230 DATA 38,35,37,0
 2235 DATA 0,0,0,36
 2240 DATA 0,36,0,0
 2245 DATA 41,40,43,19
 2250 DATA 39,0,0,0
 2255 DATA 0,39,42,0
 2260 DATA 0,0,44,41
 2265 DATA 0,0,0,39
 2270 DATA 0,45,0,42
 2275 DATA 44,46,48,0
 2280 DATA 45,0,0,47
 2285 DATA 0,0,46,0
 2290 DATA 0,49,0,45
 2295 DATA 48,23,0,0
 2300 DATA 0,34,0,32
 2509 REM >>> VOCAB DATA
 2510 DATA N,S,E,W,QUIT,HELP,I
 2520 DATA SCOR,SAVE,LOAD,LOOK
 2530 DATA GET,DROP,EXAM,OPEN,GIVE
 2540 DATA WEAR,REMO,FIRE,TIE,THRO
 2550 DATA JUMP,MOVE,ENTE,EXIT
 2560 DATA ROW,SAY,DOOR,BOWL,BLAD
 2570 DATA STON,SUIT,ROPE,ARRO
 2580 DATA BOW,HOOK,AXE,LEAV
 2590 DATA BOAT,ORE
 3009 REM >>> OBJECT DESC.
 3010 DATA "A Stone"
 3020 DATA "A Guard, blocking a closed door."
 3030 DATA "A closed door"
 3040 DATA "A sleeping guard"
 3050 DATA "An open door leading EAST"
 3060 DATA "A Bowl"
 3070 DATA "the grumpy man, muttering some words to you, which are too quite to hear."
 3080 DATA "the man, smiling at you in the corner   of the room. 'GOOD DAY TO YOU' he calls out."
 3090 DATA "An officer's suit"
 3100 DATA "A Rope"
 3110 DATA "An Arrow"
 3120 DATA "A Bow"
 3130 DATA "A miserable guard, who luckily has not  seen you yet."
 3140 DATA "A dead guard"
 3150 DATA "A Hook"
 3160 DATA "A Rope and Hook"
 3170 DATA "A Pick Axe"
 3180 DATA "A crazed man, who blocks a route east."
 3190 DATA "A Dead Man"
 3200 DATA "A pile of leaves"
 3210 DATA "A Rowing Ore"
 3509 REM >>> OBJECT POSITIONS
 3510 DATA 2,3,0,0,0,9,7,0,12,17,18,21,23,0,24,0,33,34,0,37,0
 3999 REM >>> DATA FEEDING
 4000 RESTORE 550:FOR D=1 TO L
 4010   READ LOC$(D):NEXT
 4012 A$="You are in a deep forest. Exits are not very clear.."
 4013 FOR D=14 TO 22:LOC$(D)=A$:NEXT
 4014 FOR D=39 TO 49:LOC$(D)=A$:NEXT
 4020 RESTORE 2010:FOR D=1 TO L
 4030   READ N(D):READ S(D):READ E(D):READ W(D)
 4040 NEXT:RESTORE 2510
 4050 FOR D=1 TO M:READ V$(D):NEXT
 4060 RESTORE 3010:FOR D=1 TO B
 4070   READ OBJ$(D):NEXT:RESTORE 3510
 4080 FOR D=1 TO B:READ J(D):NEXT
 4209 REM >>> INITIAL LOC. DESC.
 4210 MODE 7:GOSUB 6690
 4220 GOSUB 6750:REM INTRO
 4230 GOSUB 6600:REM INITIAL LOOK
 4449 REM >>> PARSER INPUT
 4450 T=T+1:PRINT:D=INT(RND(1)*100)
 4460 IF D<50 THEN PRINT"What now?" ELSE PRINT"What next?"
 4470 INPUT WD$:W1$="":W2$=""
 4475 WD$=FN_Lower(WD$)
 4480 D=LEN(WD$):R=1
 4490 IF MID$(WD$,R,1)>CHR$(32) THEN 4500 ELSE 4520
 4500 R=R+1
 4510 GOTO 4490
 4520 W1$=LEFT$(WD$,R-1):W1$=LEFT$(W1$,4)
 4530 W2$=RIGHT$(WD$,D-R):W2$=LEFT$(W2$,4)
 4540 IF W1$="LC" THEN HK=1:PRINT LC
 4600 REM >>> INPUT INTERPRETATION
 4605 REM word understood?
 4610 F1=0:F2=1
 4615 IF W1$=V$(F2) THEN F1=1
 4616 F2=F2+1:IF F2>M THEN 4620
 4617 GOTO 4615
 4620 IF F1=0 THEN PRINT"That was not understood.":GOTO 4450
 4624 IF W1$=V$(12) AND OC=MO THEN PRINT"You cannot carry any more!":GOTO 4450
 4625 HK=0
 4630 IF W1$=V$(9) AND W2$="TAPE" THEN HK=1:PROC_savegame
 4640 IF W1$=V$(10) AND W2$="TAPE" THEN HK=1:PROC_loadgame
 4643 IF W1$=V$(9) AND W2$="RAM" THEN HK=1:PRINT"OK":TC=OC:TLC=LC:TT=T:FOR Y=1 TO 21:TJ(Y)=J(Y):NEXT Y
 4644 IF W1$=V$(10) AND W2$="RAM" THEN HK=1:OC=TC:LC=TLC:T=TT:FOR Y=1 TO 21:J(Y)=TJ(Y):NEXT Y:GOSUB 6600
 4650 IF W1$=V$(5) THEN GOSUB 6100:HK=1
 4660 IF W1$=V$(7) THEN GOSUB 6150:HK=1
 4670 IF W1$=V$(8) THEN GOSUB 6300:HK=1
 4680 IF W1$=V$(6) THEN GOSUB 6690:GOSUB 6699:HK=1
 4690 IF W1$=V$(1) THEN GOSUB 6400:HK=1
 4700 IF W1$=V$(2) THEN GOSUB 6450:HK=1
 4710 IF W1$=V$(3) THEN GOSUB 6500:HK=1
 4720 IF W1$=V$(4) THEN GOSUB 6550:HK=1
 4730 IF W1$=V$(11) THEN GOSUB 6600:HK=1
 4740 IF W1$=V$(12) AND W2$=V$(31) AND J(1)=LC THEN HK=1:PRINT"OK":OC=OC+1:J(1)=252
 4750 IF W1$=V$(13) AND W2$=V$(31) AND J(1)=252 THEN HK=1:PRINT"OK":OC=OC-1:J(1)=LC
 4755 IF W1$=V$(13) AND W2$="ALL" THEN 4756 ELSE 4760
 4756 HK=1:FOR P=1 TO 21:IF J(P)=252 THEN J(P)=LC:OC=OC-1
 4757 NEXT:PRINT"OK"
 4760 IF W1$=V$(14) AND W2$=V$(31) AND J(1)=252 THEN HK=1:PRINT"It's a stone that fits nicely into the palm of your hand."
 4770 IF W1$=V$(21) AND W2$=V$(31) AND J(1)=252 AND J(2)=LC THEN HK=1:PRINT"It hits the guard and sends him to the ground!":OC=OC-1:J(1)=0:J(2)=0:J(4)=LC:J(3)=LC
 4780 IF W1$=V$(15) AND W2$=V$(28) AND J(3)=LC AND J(4)=LC THEN HK=1:PRINT"OK. A passage now leads EAST.":J(3)=0:J(5)=LC
 4790 IF W1$=V$(3) AND J(2)=LC OR W1$=V$(15) AND W2$=V$(28) AND J(2)=LC THEN PRINT"The guard spots you trying to escape andstrikes you across the head..":HK=1:GOTO 6125
 4800 IF W1$=V$(3) AND J(5)=LC THEN HK=1:LC=4:GOSUB 6600
 4810 IF W1$=V$(12) AND W2$=V$(29) AND J(6)=LC THEN HK=1:PRINT"OK":OC=OC+1:J(6)=252
 4820 IF W1$=V$(13) AND W2$=V$(29) AND J(6)=252 THEN HK=1:PRINT"OK":OC=OC-1:J(6)=LC
 4830 IF W1$=V$(14) AND W2$=V$(29) AND J(6)=252 THEN HK=1:PRINT"It's a bowl of prison food."
 4840 IF W1$=V$(16) AND W2$=V$(29) AND J(6)=252 AND J(7)=LC THEN HK=1:OC=OC-1:J(6)=0:J(7)=0:J(8)=LC:PRINT"The man thanks you and warns you of the great forest outside this building.     'Keep heading to the east' he tells."
 4850 IF W1$=V$(12) AND W2$=V$(32) AND J(9)=LC THEN HK=1:OC=OC+1:PRINT"OK":J(9)=252
 4860 IF W1$=V$(13) AND W2$=V$(32) AND J(9)=252 THEN HK=1:OC=OC-1:PRINT"OK":J(9)=LC
 4870 IF W1$=V$(14) AND W2$=V$(32) AND J(9)=252 THEN HK=1:PRINT"They are a lot smarter than your prison clothes."
 4880 IF W1$=V$(17) AND W2$=V$(32) AND J(9)=252 THEN HK=1:PRINT"OK":J(9)=251
 4890 IF W1$=V$(18) AND W2$=V$(32) AND J(9)=251 THEN HK=1:PRINT"OK":J(9)=252
 4900 IF W1$=V$(2) AND LC=11 AND J(9)=251 THEN LC=13:HK=1:GOSUB 6600
 4910 IF W1$=V$(2) AND LC=11 AND J(9)<>251 THEN HK=1:PRINT"The prison guard spotted you!! You are  re-captured and sentanced to death..":GOTO 6125
 4920 IF W1$=V$(12) AND W2$=V$(33) AND J(10)=LC THEN HK=1:PRINT"OK":J(10)=252:OC=OC+1
 4930 IF W1$=V$(13) AND W2$=V$(33) AND J(10)=252 THEN HK=1:PRINT"OK":J(10)=LC:OC=OC-1
 4940 IF W1$=V$(14) AND W2$=V$(33) AND J(10)=252 THEN HK=1:PRINT"Normal rope, several yards long."
 4950 IF W1$=V$(12) AND W2$=V$(34) AND J(11)=LC THEN HK=1:PRINT"OK":J(11)=252:OC=OC+1
 4960 IF W1$=V$(13) AND W2$=V$(34) AND J(11)=252 THEN HK=1:PRINT"OK":J(11)=LC:OC=OC-1
 4970 IF W1$=V$(14) AND W2$=V$(34) AND J(11)=252 THEN HK=1:PRINT"A fine crafted arrow. It would make a   useful weapon."
 4980 IF W1$=V$(12) AND W2$=V$(35) AND J(12)=LC THEN HK=1:PRINT"OK":J(12)=252:OC=OC+1
 4990 IF W1$=V$(13) AND W2$=V$(35) AND J(12)=252 THEN HK=1:PRINT"OK":J(12)=LC:OC=OC-1
 5000 IF W1$=V$(14) AND W2$=V$(35) AND J(12)=252 THEN HK=1:PRINT"The bow is well made, and can be used   as a weapon."
 5010 IF W1$=V$(19) AND W2$=V$(34) AND J(12)=252 AND J(11)=252 AND J(13)=LC THEN HK=1:PRINT"The guard is dead.":J(13)=0:J(14)=LC:J(11)=LC:OC=OC-1
 5020 IF W1$=V$(4) AND LC=23 AND J(14)=LC THEN LC=24:HK=1:GOSUB 6600
 5025 IF W1$=V$(12) AND W2$=V$(36) AND J(15)=LC THEN HK=1:OC=OC+1:J(15)=252:PRINT"OK"
 5030 IF W1$=V$(13) AND W2$=V$(36) AND J(15)=252 THEN HK=1:OC=OC-1:J(15)=LC:PRINT"OK"
 5035 IF W1$=V$(14) AND W2$=V$(36) AND J(15)=252 THEN HK=1:PRINT"A metal hook with a hole at the top."
 5040 IF W1$=V$(20) AND W2$=V$(36) AND J(15)=252 AND J(10)=252 THEN PRINT"OK":HK=1:OC=OC-1:J(10)=0:J(15)=0:J(16)=252
 5045 IF W1$=V$(21) AND W2$=V$(33) AND J(16)=252 AND LC=25 THEN HK=1:LC=26:OC=OC-1:J(16)=0:PRINT"It gets caught on a sentry drone,     whichlifts you right off the ground!    PRESS A KEY..":I$=GET$:GOSUB 6600
 5050 IF W1$=V$(22) AND LC=26 THEN HK=1:LC=27:GOSUB 6600
 5055 IF W1$=V$(12) AND W2$=V$(37) AND J(17)=LC THEN HK=1:OC=OC+1:J(17)=252:PRINT"OK"
 5060 IF W1$=V$(13) AND W2$=V$(37) AND J(17)=252 THEN HK=1:OC=OC-1:J(17)=LC:PRINT"OK"
 5070 IF W1$=V$(14) AND W2$=V$(37) AND J(17)=252 THEN HK=1:PRINT"A lethal weapon!"
 5075 IF W1$=V$(21) AND W2$=V$(37) AND J(17)=252 AND LC=34 THEN HK=1:OC=OC-1:J(17)=LC:PRINT"You throw the axe, which frightens away the madman.":J(18)=0
 5080 IF W1$=V$(3) AND LC=34 AND J(18)=0 THEN HK=1:LC=35:GOSUB 6600
 5090 IF W1$=V$(23) AND W2$=V$(38) AND J(20)=LC THEN HK=1:PRINT"You find something!":J(20)=0:J(21)=LC
 5100 IF W1$=V$(12) AND W2$=V$(40) AND J(21)=LC THEN HK=1:OC=OC+1:PRINT"OK":J(21)=252
 5105 IF W1$=V$(13) AND W2$=V$(40) AND J(21)=252 THEN HK=1:PRINT"OK":OC=OC-1:J(21)=LC
 5110 IF W1$=V$(14) AND W2$=V$(40) AND J(21)=252 THEN HK=1:PRINT"For rowing!"
 5115 IF W1$=V$(24) AND W2$=V$(39) AND LC=36 THEN HK=1:LC=38:GOSUB 6600
 5120 IF W1$=V$(25) AND W2$=V$(39) AND LC=38 THEN HK=1:LC=36:GOSUB 6600
 5125 IF W1$=V$(26) AND W2$=V$(39) AND LC=38 AND J(21)=252 THEN HK=1:PRINT"You row downstream and eventually stop at a small town where you contact for help. Congratulations, you have    escaped the island!":GOTO 6130
 5130 IF W1$=V$(14) AND W2$=V$(38) AND J(20)=LC THEN HK=1:PRINT"Something is underneath them."
 5135 IF W1$=V$(26) AND W2$=V$(39) AND LC=38 AND J(21)<>252 THEN HK=1:PRINT"Nothing to row with!"
 5140 IF W1$=V$(18) AND W2$="CLOT" THEN HK=1:PRINT"Sorry, essential items!"
 5145 IF W1$=V$(14) AND W2$="GUAR" AND J(4)=LC THEN HK=1:PRINT"He'll probably be sleeping until Christmas!"
 5150 IF W1$=V$(14) AND W2$="GUAR" AND J(14)=LC THEN HK=1:PRINT"A sorry sight. Still, it will be a   safer island without him."
 5155 IF W1$=V$(14) AND W2$="GATE" AND LC=11 THEN HK=1:PRINT"A large structure, guarded by a nasty  looking prison worker."
 5160 IF W1$=V$(14) AND W2$="REPT" AND LC=25 THEN HK=1:PRINT"There hooked feet glide high above you."
 5170 IF W1$=V$(14) AND W2$="DOOR" AND LC=3 THEN HK=1:PRINT"It's a heavy wooden door with gouge     marks from previous hapless prisoners."
 5175 IF W1$=V$(14) AND W2$="GUAR" AND LC=3 AND J(4)<>LC THEN HK=1:PRINT"He's an imposing looking character who  doesn't suffer fools gladly."
 5180 IF W1$=V$(27) AND LC=3 AND J(4)<>LC THEN HK=1:PRINT"The guard is not one for chit-chat."
 5185 IF W1$=V$(27) AND LC=3 AND J(4)=LC THEN HK=1:PRINT"Say what you like, he won't hear you."
 5190 IF W1$=V$(14) AND (W2$="CELL" OR W2$="ROOM") AND (LC>0 AND LC<4) THEN HK=1:PRINT"It's a large, empty cell with little of interest."
 5195 IF W1$=V$(14) AND W2$="TORC" AND LC=2 THEN HK=1:PRINT"It shines on the wall high above you."
 5200 IF W1$=V$(12) AND W2$="TORC" AND LC=2 THEN HK=1:PRINT"You can't, it's too high."
 5205 IF W1$=V$(14) AND W2$="KITC" AND LC=9 THEN HK=1:PRINT"Looking around the kitchen it could do with a good clean."
 5210 IF W1$=V$(14) AND W2$="FLOR" AND LC=9 THEN HK=1:PRINT"It's very dirty, just how rats like it!"
 5215 IF W1$=V$(14) AND W2$="RATS" AND LC=9 THEN HK=1:PRINT"Some say rats are cute, but these ones definitely are not."
 5220 IF W1$=V$(14) AND W2$="ROOM" AND LC=7 THEN HK=1:PRINT"It's small and gloomy, certainly not a nice place to be."
 5230 IF W1$=V$(14) AND W2$="MAN" AND LC=7 THEN HK=1:PRINT"He's an intelligent looking man dressed in old rags."
 5240 IF W1$=V$(14) AND W2$="BOAT" AND LC=36 THEN HK=1:PRINT"It's a small boat without an engine or oars, but looks strong."
 5250 IF W1$=V$(14) AND W2$="BOAT" AND LC=38 THEN HK=1:PRINT"It's a small sturdy boat to take you to safety."
 5892 IF HK=0 THEN PRINT"You cannot do that."
 5895 GOTO 4450
 6100 REM >>> SUB:QUIT
 6110 PRINT:INPUT"Are you sure you want to QUIT? Y/N";YN$
 6115 YN$=FN_Lower(YN$)
 6120 IF YN$="N" THEN PRINT"Be more careful then!":GOTO 4450
 6125 PRINT:PRINT"Your adventure ends here.."
 6130 PRINT:PRINT"Turns Taken: ";T:PRINT:INPUT"Play again Y/N ";YN$
 6133 YN$=FN_Lower(YN$)
 6135 IF YN$="Y" THEN GOTO 75 ELSE CLS:END
 6140 CLS:END
 6150 REM >>> SUB:INVENTORY
 6160 PRINT:PRINT"You are carrying:"
 6170 F1=0:FOR D=1 TO B:IF J(D)=252 THEN F1=1
 6175 NEXT
 6180 IF F1=0 THEN PRINT"Nothing at all.":GOTO 6220
 6190 FOR D=1 TO B:IF J(D)=252 THEN PRINT OBJ$(D)
 6195 NEXT
 6220 PRINT:PRINT"You are wearing:"
 6224 PRINT"your prison clothes"
 6230 FOR D=1 TO B:IF J(D)=251 THEN PRINT OBJ$(D)
 6235 NEXT
 6290 RETURN
 6300 REM >>> SUB:SCORE
 6310 PRINT
 6320 PRINT"Turns taken:";T
 6330 RETURN
 6400 REM >>> SUB:N
 6410 IF N(LC)=0 THEN PRINT"You cannot go that way.":GOTO 6440
 6420 LC=N(LC)
 6430 GOSUB 6600
 6435 W1$=""
 6440 RETURN
 6450 REM SUB:S
 6460 IF S(LC)=0 THEN PRINT"You cannot go that way.":GOTO 6490
 6470 LC=S(LC)
 6480 GOSUB 6600
 6485 W1$=""
 6490 RETURN
 6500 REM >>> SUB:E
 6510 IF E(LC)=0 THEN PRINT"You cannot go that way.":GOTO 6540
 6520 LC=E(LC)
 6530 GOSUB 6600
 6535 W1$=""
 6540 RETURN
 6550 REM >>> SUB:W
 6560 IF W(LC)=0 THEN PRINT"You cannot go that way.":GOTO 6590
 6570 LC=W(LC)
 6580 GOSUB 6600
 6585 W1$=""
 6590 RETURN
 6600 REM >>> SUB:LOOK
 6610 CLS:PRINT:PRINT LOC$(LC)
 6620 F1=0:FOR D=1 TO B:IF J(D)=LC THEN F1=1
 6625 NEXT
 6630 IF F1=0 THEN 6680
 6635 PRINT"You can also see:"
 6640 FOR D=1 TO B:IF J(D)=LC THEN PRINT OBJ$(D)
 6645 NEXT
 6680 RETURN
 6690 REM >> INFO
 6695 PRINT "Ultimate Nightmare                      by Tony Kingsmill 1992 (BBC/Electron)   Updated for RISC OS PI 2019"
 6696 PRINT:RETURN
 6699 REM >> HELP
 6700 PRINT "The parser in Ultimate Nightmare is     basic and only understands  two letter  commands. For example GET ROPE or THROW SPEAR."
 6710 PRINT "Command list:-"
 6720 PRINT "LOOK, EXAMINE, I (inventory), N, S, E,  W, SCORE, LOAD TAPE, SAVE TAPE,         LOAD RAM, SAVE RAM, HELP, QUIT, GET,    THROW, ENTER, EXIT,DROP, ROW, MOVE,     OPEN, CLOSE, GIVE, WEAR, REMOVE, FIRE,  JUMP, TIE, SAY"
 6730 RETURN
 6750 REM >> INTRO
 6760 PRINT "Welcome to Ultimate Nightmare! Set in   2092, crime has run out of control.     Prisons are overflowing with criminals  and people want more punishments. IslandX20 was born - an artificial island far out in the Atlantic."
 6770 PRINT "Prisoners started arriving everyday and a reputation soon began that escape was impossible."
 6775 PRINT "If anyone should escape freedom would begranted. If they didn't make it,        authorities saw it as one less prisoner to deal with."
 6776 PRINT:PRINT "Press any key to continue..."
 6778 K%=INKEY(500): IF K%<>-1 THEN GOTO 6780 ELSE GOTO 6778
 6780 CLS:GOSUB 6695:PRINT "In the confusion of modern day crime youwere accused and found guilty of drug   trafficking - a severe crime in the late21st century."
 6790 PRINT "Despite your innocent plea, you find    yourself transported to Island X20."
 6795 PRINT "Stuck in a place where escape is the    only prize, you begin to find a way to  escape the island. Good luck!"
 6797 PRINT:PRINT"For help in the game type HELP.":PRINT:PRINT "Press any key to start..."
 7100 K%=INKEY(500)
 7110 IF K%<>-1 THEN RETURN
 7120 GOTO 7100
 7140 REM >> LOAD GAME
 7150 DEF PROC_loadgame
 7160 PRINT:INPUT"Enter filename: ";FL$
 7170 ON ERROR LOCAL PRINT"Sorry cannot load that. Try checking thefilename.":ENDPROC
 7180 A=OPENIN FL$
 7190 INPUT #A,OC,LC,T
 7200 FOR D=1 TO B:INPUT #A,J(D):NEXT
 7210 CLOSE #A
 7215 PRINT "Game position loaded!"
 7220 ENDPROC
 7225 REM >> SAVE GAME
 7250 DEF PROC_savegame
 7260 PRINT:INPUT"Enter filename: ";FL$
 7265 ON ERROR LOCAL PRINT"Sorry cannot save. Try checking the     filename.":ENDPROC
 7280 A=OPENOUT FL$
 7290 PRINT #A,OC,LC,T
 7300 FOR D=1 TO B:PRINT #A,J(D):NEXT
 7310 CLOSE #A
 7320 ENDPROC
 7490 REM >> CONVERT TO UPPER CASE
 7500 DEF FN_Lower(Convert$)
 7510 LOCAL C$, Code%, I%
 7520 FOR I%=1 TO LEN(Convert$)
 7530   C$ = MID$(Convert$,I%,1)
 7540   IF C$ >= "a" AND C$ <= "z" THEN
 7550     Code%=ASC(C$)
 7560     REM Add value to offset for 'a'
 7570     MID$(Convert$,I%,1)=CHR$(Code%-32)
 7580   ENDIF
 7590 NEXT I%
 7600 =Convert$


