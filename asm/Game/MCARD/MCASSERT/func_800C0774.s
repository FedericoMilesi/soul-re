.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0774
/* B0F74 800C0774 21300000 */  addu       $a2, $zero, $zero
/* B0F78 800C0778 0000898C */  lw         $t1, 0x0($a0)
/* B0F7C 800C077C 00000000 */  nop
/* B0F80 800C0780 01002A2D */  sltiu      $t2, $t1, 0x1
/* B0F84 800C0784 06004015 */  bnez       $t2, .L800C07A0
/* B0F88 800C0788 21400000 */   addu      $t0, $zero, $zero
/* B0F8C 800C078C 01002231 */  andi       $v0, $t1, 0x1
/* B0F90 800C0790 2D004010 */  beqz       $v0, .L800C0848
/* B0F94 800C0794 04002231 */   andi      $v0, $t1, 0x4
/* B0F98 800C0798 1A004010 */  beqz       $v0, .L800C0804
/* B0F9C 800C079C 00000000 */   nop
.L800C07A0:
/* B0FA0 800C07A0 08008384 */  lh         $v1, 0x8($a0)
/* B0FA4 800C07A4 00000000 */  nop
/* B0FA8 800C07A8 0800622C */  sltiu      $v0, $v1, 0x8
/* B0FAC 800C07AC 15004010 */  beqz       $v0, .L800C0804
/* B0FB0 800C07B0 80100300 */   sll       $v0, $v1, 2
/* B0FB4 800C07B4 0180013C */  lui        $at, %hi(jtbl_800129C4)
/* B0FB8 800C07B8 21082200 */  addu       $at, $at, $v0
/* B0FBC 800C07BC C429228C */  lw         $v0, %lo(jtbl_800129C4)($at)
/* B0FC0 800C07C0 00000000 */  nop
/* B0FC4 800C07C4 08004000 */  jr         $v0
/* B0FC8 800C07C8 00000000 */   nop
jlabel .L800C07CC
/* B0FCC 800C07CC 03020308 */  j          .L800C080C
/* B0FD0 800C07D0 00800534 */   ori       $a1, $zero, 0x8000
jlabel .L800C07D4
/* B0FD4 800C07D4 03020308 */  j          .L800C080C
/* B0FD8 800C07D8 00900534 */   ori       $a1, $zero, 0x9000
jlabel .L800C07DC
/* B0FDC 800C07DC 03020308 */  j          .L800C080C
/* B0FE0 800C07E0 00A00534 */   ori       $a1, $zero, 0xA000
jlabel .L800C07E4
/* B0FE4 800C07E4 03020308 */  j          .L800C080C
/* B0FE8 800C07E8 00B00534 */   ori       $a1, $zero, 0xB000
jlabel .L800C07EC
/* B0FEC 800C07EC 03020308 */  j          .L800C080C
/* B0FF0 800C07F0 00C00534 */   ori       $a1, $zero, 0xC000
jlabel .L800C07F4
/* B0FF4 800C07F4 03020308 */  j          .L800C080C
/* B0FF8 800C07F8 00D00534 */   ori       $a1, $zero, 0xD000
jlabel .L800C07FC
/* B0FFC 800C07FC 03020308 */  j          .L800C080C
/* B1000 800C0800 00E00534 */   ori       $a1, $zero, 0xE000
jlabel .L800C0804
/* B1004 800C0804 04008694 */  lhu        $a2, 0x4($a0)
/* B1008 800C0808 21280000 */  addu       $a1, $zero, $zero
.L800C080C:
/* B100C 800C080C 0A00A010 */  beqz       $a1, .L800C0838
/* B1010 800C0810 FF7FC230 */   andi      $v0, $a2, 0x7FFF
/* B1014 800C0814 04008784 */  lh         $a3, 0x4($a0)
/* B1018 800C0818 04008394 */  lhu        $v1, 0x4($a0)
/* B101C 800C081C 8000E228 */  slti       $v0, $a3, 0x80
/* B1020 800C0820 04004010 */  beqz       $v0, .L800C0834
/* B1024 800C0824 7F000624 */   addiu     $a2, $zero, 0x7F
/* B1028 800C0828 0200E004 */  bltz       $a3, .L800C0834
/* B102C 800C082C 21300000 */   addu      $a2, $zero, $zero
/* B1030 800C0830 21306000 */  addu       $a2, $v1, $zero
.L800C0834:
/* B1034 800C0834 FF7FC230 */  andi       $v0, $a2, 0x7FFF
.L800C0838:
/* B1038 800C0838 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B103C 800C083C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1040 800C0840 25104500 */  or         $v0, $v0, $a1
/* B1044 800C0844 800162A4 */  sh         $v0, 0x180($v1)
.L800C0848:
/* B1048 800C0848 05004015 */  bnez       $t2, .L800C0860
/* B104C 800C084C 02002231 */   andi      $v0, $t1, 0x2
/* B1050 800C0850 2D004010 */  beqz       $v0, .L800C0908
/* B1054 800C0854 08002231 */   andi      $v0, $t1, 0x8
/* B1058 800C0858 1A004010 */  beqz       $v0, .L800C08C4
/* B105C 800C085C 00000000 */   nop
.L800C0860:
/* B1060 800C0860 0A008384 */  lh         $v1, 0xA($a0)
/* B1064 800C0864 00000000 */  nop
/* B1068 800C0868 0800622C */  sltiu      $v0, $v1, 0x8
/* B106C 800C086C 15004010 */  beqz       $v0, .L800C08C4
/* B1070 800C0870 80100300 */   sll       $v0, $v1, 2
/* B1074 800C0874 0180013C */  lui        $at, %hi(jtbl_800129E4)
/* B1078 800C0878 21082200 */  addu       $at, $at, $v0
/* B107C 800C087C E429228C */  lw         $v0, %lo(jtbl_800129E4)($at)
/* B1080 800C0880 00000000 */  nop
/* B1084 800C0884 08004000 */  jr         $v0
/* B1088 800C0888 00000000 */   nop
jlabel .L800C088C
/* B108C 800C088C 33020308 */  j          .L800C08CC
/* B1090 800C0890 00800534 */   ori       $a1, $zero, 0x8000
jlabel .L800C0894
/* B1094 800C0894 33020308 */  j          .L800C08CC
/* B1098 800C0898 00900534 */   ori       $a1, $zero, 0x9000
jlabel .L800C089C
/* B109C 800C089C 33020308 */  j          .L800C08CC
/* B10A0 800C08A0 00A00534 */   ori       $a1, $zero, 0xA000
jlabel .L800C08A4
/* B10A4 800C08A4 33020308 */  j          .L800C08CC
/* B10A8 800C08A8 00B00534 */   ori       $a1, $zero, 0xB000
jlabel .L800C08AC
/* B10AC 800C08AC 33020308 */  j          .L800C08CC
/* B10B0 800C08B0 00C00534 */   ori       $a1, $zero, 0xC000
jlabel .L800C08B4
/* B10B4 800C08B4 33020308 */  j          .L800C08CC
/* B10B8 800C08B8 00D00534 */   ori       $a1, $zero, 0xD000
jlabel .L800C08BC
/* B10BC 800C08BC 33020308 */  j          .L800C08CC
/* B10C0 800C08C0 00E00534 */   ori       $a1, $zero, 0xE000
jlabel .L800C08C4
/* B10C4 800C08C4 06008894 */  lhu        $t0, 0x6($a0)
/* B10C8 800C08C8 21280000 */  addu       $a1, $zero, $zero
.L800C08CC:
/* B10CC 800C08CC 0A00A010 */  beqz       $a1, .L800C08F8
/* B10D0 800C08D0 FF7F0231 */   andi      $v0, $t0, 0x7FFF
/* B10D4 800C08D4 06008684 */  lh         $a2, 0x6($a0)
/* B10D8 800C08D8 06008394 */  lhu        $v1, 0x6($a0)
/* B10DC 800C08DC 8000C228 */  slti       $v0, $a2, 0x80
/* B10E0 800C08E0 04004010 */  beqz       $v0, .L800C08F4
/* B10E4 800C08E4 7F000824 */   addiu     $t0, $zero, 0x7F
/* B10E8 800C08E8 0200C004 */  bltz       $a2, .L800C08F4
/* B10EC 800C08EC 21400000 */   addu      $t0, $zero, $zero
/* B10F0 800C08F0 21406000 */  addu       $t0, $v1, $zero
.L800C08F4:
/* B10F4 800C08F4 FF7F0231 */  andi       $v0, $t0, 0x7FFF
.L800C08F8:
/* B10F8 800C08F8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B10FC 800C08FC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1100 800C0900 25104500 */  or         $v0, $v0, $a1
/* B1104 800C0904 820162A4 */  sh         $v0, 0x182($v1)
.L800C0908:
/* B1108 800C0908 03004015 */  bnez       $t2, .L800C0918
/* B110C 800C090C 40002231 */   andi      $v0, $t1, 0x40
/* B1110 800C0910 06004010 */  beqz       $v0, .L800C092C
/* B1114 800C0914 00000000 */   nop
.L800C0918:
/* B1118 800C0918 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B111C 800C091C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1120 800C0920 10008294 */  lhu        $v0, 0x10($a0)
/* B1124 800C0924 00000000 */  nop
/* B1128 800C0928 B00162A4 */  sh         $v0, 0x1B0($v1)
.L800C092C:
/* B112C 800C092C 03004015 */  bnez       $t2, .L800C093C
/* B1130 800C0930 80002231 */   andi      $v0, $t1, 0x80
/* B1134 800C0934 06004010 */  beqz       $v0, .L800C0950
/* B1138 800C0938 00000000 */   nop
.L800C093C:
/* B113C 800C093C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1140 800C0940 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1144 800C0944 12008294 */  lhu        $v0, 0x12($a0)
/* B1148 800C0948 00000000 */  nop
/* B114C 800C094C B20162A4 */  sh         $v0, 0x1B2($v1)
.L800C0950:
/* B1150 800C0950 03004015 */  bnez       $t2, .L800C0960
/* B1154 800C0954 00042231 */   andi      $v0, $t1, 0x400
/* B1158 800C0958 06004010 */  beqz       $v0, .L800C0974
/* B115C 800C095C 00000000 */   nop
.L800C0960:
/* B1160 800C0960 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1164 800C0964 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1168 800C0968 1C008294 */  lhu        $v0, 0x1C($a0)
/* B116C 800C096C 00000000 */  nop
/* B1170 800C0970 B40162A4 */  sh         $v0, 0x1B4($v1)
.L800C0974:
/* B1174 800C0974 03004015 */  bnez       $t2, .L800C0984
/* B1178 800C0978 00082231 */   andi      $v0, $t1, 0x800
/* B117C 800C097C 06004010 */  beqz       $v0, .L800C0998
/* B1180 800C0980 00000000 */   nop
.L800C0984:
/* B1184 800C0984 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1188 800C0988 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B118C 800C098C 1E008294 */  lhu        $v0, 0x1E($a0)
/* B1190 800C0990 00000000 */  nop
/* B1194 800C0994 B60162A4 */  sh         $v0, 0x1B6($v1)
.L800C0998:
/* B1198 800C0998 03004015 */  bnez       $t2, .L800C09A8
/* B119C 800C099C 00012231 */   andi      $v0, $t1, 0x100
/* B11A0 800C09A0 12004010 */  beqz       $v0, .L800C09EC
/* B11A4 800C09A4 00000000 */   nop
.L800C09A8:
/* B11A8 800C09A8 1400828C */  lw         $v0, 0x14($a0)
/* B11AC 800C09AC 00000000 */  nop
/* B11B0 800C09B0 07004014 */  bnez       $v0, .L800C09D0
/* B11B4 800C09B4 00000000 */   nop
/* B11B8 800C09B8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B11BC 800C09BC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B11C0 800C09C0 00000000 */  nop
/* B11C4 800C09C4 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B11C8 800C09C8 7A020308 */  j          .L800C09E8
/* B11CC 800C09CC FBFF4230 */   andi      $v0, $v0, 0xFFFB
.L800C09D0:
/* B11D0 800C09D0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B11D4 800C09D4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B11D8 800C09D8 00000000 */  nop
/* B11DC 800C09DC AA016294 */  lhu        $v0, 0x1AA($v1)
/* B11E0 800C09E0 00000000 */  nop
/* B11E4 800C09E4 04004234 */  ori        $v0, $v0, 0x4
.L800C09E8:
/* B11E8 800C09E8 AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C09EC:
/* B11EC 800C09EC 03004015 */  bnez       $t2, .L800C09FC
/* B11F0 800C09F0 00022231 */   andi      $v0, $t1, 0x200
/* B11F4 800C09F4 12004010 */  beqz       $v0, .L800C0A40
/* B11F8 800C09F8 00000000 */   nop
.L800C09FC:
/* B11FC 800C09FC 1800828C */  lw         $v0, 0x18($a0)
/* B1200 800C0A00 00000000 */  nop
/* B1204 800C0A04 07004014 */  bnez       $v0, .L800C0A24
/* B1208 800C0A08 00000000 */   nop
/* B120C 800C0A0C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1210 800C0A10 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1214 800C0A14 00000000 */  nop
/* B1218 800C0A18 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B121C 800C0A1C 8F020308 */  j          .L800C0A3C
/* B1220 800C0A20 FEFF4230 */   andi      $v0, $v0, 0xFFFE
.L800C0A24:
/* B1224 800C0A24 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1228 800C0A28 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B122C 800C0A2C 00000000 */  nop
/* B1230 800C0A30 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B1234 800C0A34 00000000 */  nop
/* B1238 800C0A38 01004234 */  ori        $v0, $v0, 0x1
.L800C0A3C:
/* B123C 800C0A3C AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C0A40:
/* B1240 800C0A40 03004015 */  bnez       $t2, .L800C0A50
/* B1244 800C0A44 00102231 */   andi      $v0, $t1, 0x1000
/* B1248 800C0A48 12004010 */  beqz       $v0, .L800C0A94
/* B124C 800C0A4C 00000000 */   nop
.L800C0A50:
/* B1250 800C0A50 2000828C */  lw         $v0, 0x20($a0)
/* B1254 800C0A54 00000000 */  nop
/* B1258 800C0A58 07004014 */  bnez       $v0, .L800C0A78
/* B125C 800C0A5C 00000000 */   nop
/* B1260 800C0A60 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B1264 800C0A64 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1268 800C0A68 00000000 */  nop
/* B126C 800C0A6C AA016294 */  lhu        $v0, 0x1AA($v1)
/* B1270 800C0A70 A4020308 */  j          .L800C0A90
/* B1274 800C0A74 F7FF4230 */   andi      $v0, $v0, 0xFFF7
.L800C0A78:
/* B1278 800C0A78 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B127C 800C0A7C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B1280 800C0A80 00000000 */  nop
/* B1284 800C0A84 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B1288 800C0A88 00000000 */  nop
/* B128C 800C0A8C 08004234 */  ori        $v0, $v0, 0x8
.L800C0A90:
/* B1290 800C0A90 AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C0A94:
/* B1294 800C0A94 03004015 */  bnez       $t2, .L800C0AA4
/* B1298 800C0A98 00202231 */   andi      $v0, $t1, 0x2000
/* B129C 800C0A9C 12004010 */  beqz       $v0, .L800C0AE8
/* B12A0 800C0AA0 00000000 */   nop
.L800C0AA4:
/* B12A4 800C0AA4 2400828C */  lw         $v0, 0x24($a0)
/* B12A8 800C0AA8 00000000 */  nop
/* B12AC 800C0AAC 07004014 */  bnez       $v0, .L800C0ACC
/* B12B0 800C0AB0 00000000 */   nop
/* B12B4 800C0AB4 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B12B8 800C0AB8 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B12BC 800C0ABC 00000000 */  nop
/* B12C0 800C0AC0 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B12C4 800C0AC4 B9020308 */  j          .L800C0AE4
/* B12C8 800C0AC8 FDFF4230 */   andi      $v0, $v0, 0xFFFD
.L800C0ACC:
/* B12CC 800C0ACC 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B12D0 800C0AD0 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B12D4 800C0AD4 00000000 */  nop
/* B12D8 800C0AD8 AA016294 */  lhu        $v0, 0x1AA($v1)
/* B12DC 800C0ADC 00000000 */  nop
/* B12E0 800C0AE0 02004234 */  ori        $v0, $v0, 0x2
.L800C0AE4:
/* B12E4 800C0AE4 AA0162A4 */  sh         $v0, 0x1AA($v1)
.L800C0AE8:
/* B12E8 800C0AE8 0800E003 */  jr         $ra
/* B12EC 800C0AEC 00000000 */   nop
/* B12F0 800C0AF0 00000000 */  nop
.size func_800C0774, . - func_800C0774
