.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel FX_SoulReaverBlade
/* 3B03C 8004A83C 68FFBD27 */  addiu      $sp, $sp, -0x98
/* 3B040 8004A840 9400BFAF */  sw         $ra, 0x94($sp)
/* 3B044 8004A844 9000BEAF */  sw         $fp, 0x90($sp)
/* 3B048 8004A848 8C00B7AF */  sw         $s7, 0x8C($sp)
/* 3B04C 8004A84C 8800B6AF */  sw         $s6, 0x88($sp)
/* 3B050 8004A850 8400B5AF */  sw         $s5, 0x84($sp)
/* 3B054 8004A854 8000B4AF */  sw         $s4, 0x80($sp)
/* 3B058 8004A858 7C00B3AF */  sw         $s3, 0x7C($sp)
/* 3B05C 8004A85C 7800B2AF */  sw         $s2, 0x78($sp)
/* 3B060 8004A860 7400B1AF */  sw         $s1, 0x74($sp)
/* 3B064 8004A864 7000B0AF */  sw         $s0, 0x70($sp)
/* 3B068 8004A868 9C00A5AF */  sw         $a1, 0x9C($sp)
/* 3B06C 8004A86C 6C01918C */  lw         $s1, 0x16C($a0)
/* 3B070 8004A870 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3B074 8004A874 02002286 */  lh         $v0, 0x2($s1)
/* 3B078 8004A878 0400758C */  lw         $s5, 0x4($v1)
/* 3B07C 8004A87C DF004010 */  beqz       $v0, .L8004ABFC
/* 3B080 8004A880 4006A226 */   addiu     $v0, $s5, 0x640
/* 3B084 8004A884 0800638C */  lw         $v1, 0x8($v1)
/* 3B088 8004A888 00000000 */  nop
/* 3B08C 8004A88C 2B104300 */  sltu       $v0, $v0, $v1
/* 3B090 8004A890 DA004010 */  beqz       $v0, .L8004ABFC
/* 3B094 8004A894 0D80023C */   lui       $v0, %hi(objectAccess + 0x54)
/* 3B098 8004A898 10003E8E */  lw         $fp, 0x10($s1)
/* 3B09C 8004A89C 90A2528C */  lw         $s2, %lo(objectAccess + 0x54)($v0)
/* 3B0A0 8004A8A0 06003496 */  lhu        $s4, 0x6($s1)
/* 3B0A4 8004A8A4 D5004012 */  beqz       $s2, .L8004ABFC
/* 3B0A8 8004A8A8 00000000 */   nop
/* 3B0AC 8004A8AC 1400838C */  lw         $v1, 0x14($a0)
/* 3B0B0 8004A8B0 00000000 */  nop
/* 3B0B4 8004A8B4 00026230 */  andi       $v0, $v1, 0x200
/* 3B0B8 8004A8B8 D0004010 */  beqz       $v0, .L8004ABFC
/* 3B0BC 8004A8BC 00086230 */   andi      $v0, $v1, 0x800
/* 3B0C0 8004A8C0 CE004014 */  bnez       $v0, .L8004ABFC
/* 3B0C4 8004A8C4 00000000 */   nop
/* 3B0C8 8004A8C8 4000828C */  lw         $v0, 0x40($a0)
/* 3B0CC 8004A8CC 00000000 */  nop
/* 3B0D0 8004A8D0 CA004010 */  beqz       $v0, .L8004ABFC
/* 3B0D4 8004A8D4 00000000 */   nop
/* 3B0D8 8004A8D8 4400828C */  lw         $v0, 0x44($a0)
/* 3B0DC 8004A8DC 00000000 */  nop
/* 3B0E0 8004A8E0 C6004010 */  beqz       $v0, .L8004ABFC
/* 3B0E4 8004A8E4 1800B027 */   addiu     $s0, $sp, 0x18
/* 3B0E8 8004A8E8 21300002 */  addu       $a2, $s0, $zero
/* 3B0EC 8004A8EC 1400A0A7 */  sh         $zero, 0x14($sp)
/* 3B0F0 8004A8F0 4000858C */  lw         $a1, 0x40($a0)
/* 3B0F4 8004A8F4 F0AC848F */  lw         $a0, %gp_rel(theCamera + 0x60)($gp)
/* 3B0F8 8004A8F8 59FD020C */  jal        func_800BF564
/* 3B0FC 8004A8FC 2000A524 */   addiu     $a1, $a1, 0x20
/* 3B100 8004A900 52F2020C */  jal        func_800BC948
/* 3B104 8004A904 21200002 */   addu      $a0, $s0, $zero
/* 3B108 8004A908 4AF2020C */  jal        func_800BC928
/* 3B10C 8004A90C 21200002 */   addu      $a0, $s0, $zero
/* 3B110 8004A910 02002386 */  lh         $v1, 0x2($s1)
/* 3B114 8004A914 1C002286 */  lh         $v0, 0x1C($s1)
/* 3B118 8004A918 00000000 */  nop
/* 3B11C 8004A91C 18006200 */  mult       $v1, $v0
/* 3B120 8004A920 12180000 */  mflo       $v1
/* 3B124 8004A924 02006104 */  bgez       $v1, .L8004A930
/* 3B128 8004A928 21204002 */   addu      $a0, $s2, $zero
/* 3B12C 8004A92C FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004A930:
/* 3B130 8004A930 21280000 */  addu       $a1, $zero, $zero
/* 3B134 8004A934 2130A000 */  addu       $a2, $a1, $zero
/* 3B138 8004A938 9D19010C */  jal        FX_GetTextureObject
/* 3B13C 8004A93C 03BB0300 */   sra       $s7, $v1, 12
/* 3B140 8004A940 21380000 */  addu       $a3, $zero, $zero
/* 3B144 8004A944 00E0C748 */  ctc2       $a3, $28 # handwritten instruction
/* 3B148 8004A948 002E033C */  lui        $v1, (0x2E000000 >> 16)
/* 3B14C 8004A94C 25F0C303 */  or         $fp, $fp, $v1
/* 3B150 8004A950 08004394 */  lhu        $v1, 0x8($v0)
/* 3B154 8004A954 01001324 */  addiu      $s3, $zero, 0x1
/* 3B158 8004A958 4C00A3A7 */  sh         $v1, 0x4C($sp)
/* 3B15C 8004A95C 04004394 */  lhu        $v1, 0x4($v0)
/* 3B160 8004A960 FF00163C */  lui        $s6, (0xFFFFFF >> 16)
/* 3B164 8004A964 5400A3A7 */  sh         $v1, 0x54($sp)
/* 3B168 8004A968 00004394 */  lhu        $v1, 0x0($v0)
/* 3B16C 8004A96C FFFFD636 */  ori        $s6, $s6, (0xFFFFFF & 0xFFFF)
/* 3B170 8004A970 5C00A3A7 */  sh         $v1, 0x5C($sp)
/* 3B174 8004A974 5400A393 */  lbu        $v1, 0x54($sp)
/* 3B178 8004A978 5D00A493 */  lbu        $a0, 0x5D($sp)
/* 3B17C 8004A97C 2200B126 */  addiu      $s1, $s5, 0x22
/* 3B180 8004A980 6400A3A3 */  sb         $v1, 0x64($sp)
/* 3B184 8004A984 001C1400 */  sll        $v1, $s4, 16
/* 3B188 8004A988 6500A4A3 */  sb         $a0, 0x65($sp)
/* 3B18C 8004A98C 06004494 */  lhu        $a0, 0x6($v0)
/* 3B190 8004A990 031C0300 */  sra        $v1, $v1, 16
/* 3B194 8004A994 5600A4A7 */  sh         $a0, 0x56($sp)
/* 3B198 8004A998 02004294 */  lhu        $v0, 0x2($v0)
/* 3B19C 8004A99C 00017424 */  addiu      $s4, $v1, 0x100
/* 3B1A0 8004A9A0 4E00A2A7 */  sh         $v0, 0x4E($sp)
.L8004A9A4:
/* 3B1A4 8004A9A4 6666043C */  lui        $a0, (0x66666667 >> 16)
/* 3B1A8 8004A9A8 67668434 */  ori        $a0, $a0, (0x66666667 & 0xFFFF)
/* 3B1AC 8004A9AC 28000224 */  addiu      $v0, $zero, 0x28
/* 3B1B0 8004A9B0 23105300 */  subu       $v0, $v0, $s3
/* 3B1B4 8004A9B4 001B0200 */  sll        $v1, $v0, 12
/* 3B1B8 8004A9B8 18006400 */  mult       $v1, $a0
/* 3B1BC 8004A9BC 40900200 */  sll        $s2, $v0, 1
/* 3B1C0 8004A9C0 C31F0300 */  sra        $v1, $v1, 31
/* 3B1C4 8004A9C4 10380000 */  mfhi       $a3
/* 3B1C8 8004A9C8 03110700 */  sra        $v0, $a3, 4
/* 3B1CC 8004A9CC 23804300 */  subu       $s0, $v0, $v1
/* 3B1D0 8004A9D0 00100224 */  addiu      $v0, $zero, 0x1000
/* 3B1D4 8004A9D4 0600E212 */  beq        $s7, $v0, .L8004A9F0
/* 3B1D8 8004A9D8 18005702 */   mult      $s2, $s7
/* 3B1DC 8004A9DC 12100000 */  mflo       $v0
/* 3B1E0 8004A9E0 03004104 */  bgez       $v0, .L8004A9F0
/* 3B1E4 8004A9E4 03930200 */   sra       $s2, $v0, 12
/* 3B1E8 8004A9E8 FF0F4224 */  addiu      $v0, $v0, 0xFFF
/* 3B1EC 8004A9EC 03930200 */  sra        $s2, $v0, 12
.L8004A9F0:
/* 3B1F0 8004A9F0 0800622A */  slti       $v0, $s3, 0x8
/* 3B1F4 8004A9F4 07004010 */  beqz       $v0, .L8004AA14
/* 3B1F8 8004A9F8 40121000 */   sll       $v0, $s0, 9
/* 3B1FC 8004A9FC 18005300 */  mult       $v0, $s3
/* 3B200 8004AA00 12100000 */  mflo       $v0
/* 3B204 8004AA04 03004104 */  bgez       $v0, .L8004AA14
/* 3B208 8004AA08 03830200 */   sra       $s0, $v0, 12
/* 3B20C 8004AA0C FF0F4224 */  addiu      $v0, $v0, 0xFFF
/* 3B210 8004AA10 03830200 */  sra        $s0, $v0, 12
.L8004AA14:
/* 3B214 8004AA14 DCE4010C */  jal        func_80079370
/* 3B218 8004AA18 21208002 */   addu      $a0, $s4, $zero
/* 3B21C 8004AA1C 02004104 */  bgez       $v0, .L8004AA28
/* 3B220 8004AA20 00000000 */   nop
/* 3B224 8004AA24 7F004224 */  addiu      $v0, $v0, 0x7F
.L8004AA28:
/* 3B228 8004AA28 C3110200 */  sra        $v0, $v0, 7
/* 3B22C 8004AA2C 18005000 */  mult       $v0, $s0
/* 3B230 8004AA30 12100000 */  mflo       $v0
/* 3B234 8004AA34 02004104 */  bgez       $v0, .L8004AA40
/* 3B238 8004AA38 00000000 */   nop
/* 3B23C 8004AA3C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004AA40:
/* 3B240 8004AA40 03130200 */  sra        $v0, $v0, 12
/* 3B244 8004AA44 1000A2A7 */  sh         $v0, 0x10($sp)
/* 3B248 8004AA48 D0E4010C */  jal        func_80079340
/* 3B24C 8004AA4C 21208002 */   addu      $a0, $s4, $zero
/* 3B250 8004AA50 02004104 */  bgez       $v0, .L8004AA5C
/* 3B254 8004AA54 00000000 */   nop
/* 3B258 8004AA58 7F004224 */  addiu      $v0, $v0, 0x7F
.L8004AA5C:
/* 3B25C 8004AA5C C3110200 */  sra        $v0, $v0, 7
/* 3B260 8004AA60 18005000 */  mult       $v0, $s0
/* 3B264 8004AA64 12100000 */  mflo       $v0
/* 3B268 8004AA68 02004104 */  bgez       $v0, .L8004AA74
/* 3B26C 8004AA6C 00000000 */   nop
/* 3B270 8004AA70 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004AA74:
/* 3B274 8004AA74 03130200 */  sra        $v0, $v0, 12
/* 3B278 8004AA78 1200A2A7 */  sh         $v0, 0x12($sp)
/* 3B27C 8004AA7C 1000A227 */  addiu      $v0, $sp, 0x10
/* 3B280 8004AA80 000040C8 */  lwc2       $0, 0x0($v0)
/* 3B284 8004AA84 040041C8 */  lwc2       $1, 0x4($v0)
/* 3B288 8004AA88 00D8D248 */  ctc2       $s2, $27 # handwritten instruction
/* 3B28C 8004AA8C 00000000 */  nop
/* 3B290 8004AA90 00000000 */  nop
/* 3B294 8004AA94 0100184A */  RTPS
/* 3B298 8004AA98 4C00A28F */  lw         $v0, 0x4C($sp)
/* 3B29C 8004AA9C 00000000 */  nop
/* 3B2A0 8004AAA0 EAFF22AE */  sw         $v0, -0x16($s1)
/* 3B2A4 8004AAA4 5400A28F */  lw         $v0, 0x54($sp)
/* 3B2A8 8004AAA8 00000000 */  nop
/* 3B2AC 8004AAAC F2FF22AE */  sw         $v0, -0xE($s1)
/* 3B2B0 8004AAB0 5C00A28F */  lw         $v0, 0x5C($sp)
/* 3B2B4 8004AAB4 00000000 */  nop
/* 3B2B8 8004AAB8 FAFF22AE */  sw         $v0, -0x6($s1)
/* 3B2BC 8004AABC 6400A28F */  lw         $v0, 0x64($sp)
/* 3B2C0 8004AAC0 E2FF3EAE */  sw         $fp, -0x1E($s1)
/* 3B2C4 8004AAC4 020022AE */  sw         $v0, 0x2($s1)
/* 3B2C8 8004AAC8 3800A227 */  addiu      $v0, $sp, 0x38
/* 3B2CC 8004AACC 00004EE8 */  swc2       $14, 0x0($v0)
/* 3B2D0 8004AAD0 6800A227 */  addiu      $v0, $sp, 0x68
/* 3B2D4 8004AAD4 000058E8 */  swc2       $24, 0x0($v0)
/* 3B2D8 8004AAD8 6C00A227 */  addiu      $v0, $sp, 0x6C
/* 3B2DC 8004AADC 000053E8 */  swc2       $19, 0x0($v0)
/* 3B2E0 8004AAE0 6666023C */  lui        $v0, (0x66666667 >> 16)
/* 3B2E4 8004AAE4 6800A68F */  lw         $a2, 0x68($sp)
/* 3B2E8 8004AAE8 67664234 */  ori        $v0, $v0, (0x66666667 & 0xFFFF)
/* 3B2EC 8004AAEC 1800C200 */  mult       $a2, $v0
/* 3B2F0 8004AAF0 3800A397 */  lhu        $v1, 0x38($sp)
/* 3B2F4 8004AAF4 C3170600 */  sra        $v0, $a2, 31
/* 3B2F8 8004AAF8 10380000 */  mfhi       $a3
/* 3B2FC 8004AAFC C3210700 */  sra        $a0, $a3, 7
/* 3B300 8004AB00 23208200 */  subu       $a0, $a0, $v0
/* 3B304 8004AB04 40220400 */  sll        $a0, $a0, 9
/* 3B308 8004AB08 FFFF0734 */  ori        $a3, $zero, 0xFFFF
/* 3B30C 8004AB0C 21208700 */  addu       $a0, $a0, $a3
/* 3B310 8004AB10 032C0400 */  sra        $a1, $a0, 16
/* 3B314 8004AB14 C2270400 */  srl        $a0, $a0, 31
/* 3B318 8004AB18 6800A5AF */  sw         $a1, 0x68($sp)
/* 3B31C 8004AB1C 2128A400 */  addu       $a1, $a1, $a0
/* 3B320 8004AB20 43280500 */  sra        $a1, $a1, 1
/* 3B324 8004AB24 2130C700 */  addu       $a2, $a2, $a3
/* 3B328 8004AB28 03240600 */  sra        $a0, $a2, 16
/* 3B32C 8004AB2C 6800A297 */  lhu        $v0, 0x68($sp)
/* 3B330 8004AB30 C2370600 */  srl        $a2, $a2, 31
/* 3B334 8004AB34 21186200 */  addu       $v1, $v1, $v0
/* 3B338 8004AB38 EEFF23A6 */  sh         $v1, -0x12($s1)
/* 3B33C 8004AB3C FEFF23A6 */  sh         $v1, -0x2($s1)
/* 3B340 8004AB40 3800A297 */  lhu        $v0, 0x38($sp)
/* 3B344 8004AB44 21308600 */  addu       $a2, $a0, $a2
/* 3B348 8004AB48 23104500 */  subu       $v0, $v0, $a1
/* 3B34C 8004AB4C F6FF22A6 */  sh         $v0, -0xA($s1)
/* 3B350 8004AB50 E6FF22A6 */  sh         $v0, -0x1A($s1)
/* 3B354 8004AB54 3A00A297 */  lhu        $v0, 0x3A($sp)
/* 3B358 8004AB58 43300600 */  sra        $a2, $a2, 1
/* 3B35C 8004AB5C 23104600 */  subu       $v0, $v0, $a2
/* 3B360 8004AB60 F0FF22A6 */  sh         $v0, -0x10($s1)
/* 3B364 8004AB64 E8FF22A6 */  sh         $v0, -0x18($s1)
/* 3B368 8004AB68 6C00A38F */  lw         $v1, 0x6C($sp)
/* 3B36C 8004AB6C 3A00A297 */  lhu        $v0, 0x3A($sp)
/* 3B370 8004AB70 83180300 */  sra        $v1, $v1, 2
/* 3B374 8004AB74 21104400 */  addu       $v0, $v0, $a0
/* 3B378 8004AB78 6C00A3AF */  sw         $v1, 0x6C($sp)
/* 3B37C 8004AB7C F8FF22A6 */  sh         $v0, -0x8($s1)
/* 3B380 8004AB80 000022A6 */  sh         $v0, 0x0($s1)
/* 3B384 8004AB84 FFFF6224 */  addiu      $v0, $v1, -0x1
/* 3B388 8004AB88 FF0B422C */  sltiu      $v0, $v0, 0xBFF
/* 3B38C 8004AB8C 0C004010 */  beqz       $v0, .L8004ABC0
/* 3B390 8004AB90 80200300 */   sll       $a0, $v1, 2
/* 3B394 8004AB94 9C00A78F */  lw         $a3, 0x9C($sp)
/* 3B398 8004AB98 28003126 */  addiu      $s1, $s1, 0x28
/* 3B39C 8004AB9C 21208700 */  addu       $a0, $a0, $a3
/* 3B3A0 8004ABA0 0000838C */  lw         $v1, 0x0($a0)
/* 3B3A4 8004ABA4 0009023C */  lui        $v0, (0x9000000 >> 16)
/* 3B3A8 8004ABA8 24187600 */  and        $v1, $v1, $s6
/* 3B3AC 8004ABAC 25186200 */  or         $v1, $v1, $v0
/* 3B3B0 8004ABB0 2410B602 */  and        $v0, $s5, $s6
/* 3B3B4 8004ABB4 0000A3AE */  sw         $v1, 0x0($s5)
/* 3B3B8 8004ABB8 2800B526 */  addiu      $s5, $s5, 0x28
/* 3B3BC 8004ABBC 000082AC */  sw         $v0, 0x0($a0)
.L8004ABC0:
/* 3B3C0 8004ABC0 21184002 */  addu       $v1, $s2, $zero
/* 3B3C4 8004ABC4 02006104 */  bgez       $v1, .L8004ABD0
/* 3B3C8 8004ABC8 00000000 */   nop
/* 3B3CC 8004ABCC 03006324 */  addiu      $v1, $v1, 0x3
.L8004ABD0:
/* 3B3D0 8004ABD0 01007326 */  addiu      $s3, $s3, 0x1
/* 3B3D4 8004ABD4 1400A297 */  lhu        $v0, 0x14($sp)
/* 3B3D8 8004ABD8 83180300 */  sra        $v1, $v1, 2
/* 3B3DC 8004ABDC 23104300 */  subu       $v0, $v0, $v1
/* 3B3E0 8004ABE0 1400A2A7 */  sh         $v0, 0x14($sp)
/* 3B3E4 8004ABE4 2800622A */  slti       $v0, $s3, 0x28
/* 3B3E8 8004ABE8 6EFF4014 */  bnez       $v0, .L8004A9A4
/* 3B3EC 8004ABEC 00019426 */   addiu     $s4, $s4, 0x100
/* 3B3F0 8004ABF0 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 3B3F4 8004ABF4 00000000 */  nop
/* 3B3F8 8004ABF8 040055AC */  sw         $s5, 0x4($v0)
.L8004ABFC:
/* 3B3FC 8004ABFC 9400BF8F */  lw         $ra, 0x94($sp)
/* 3B400 8004AC00 9000BE8F */  lw         $fp, 0x90($sp)
/* 3B404 8004AC04 8C00B78F */  lw         $s7, 0x8C($sp)
/* 3B408 8004AC08 8800B68F */  lw         $s6, 0x88($sp)
/* 3B40C 8004AC0C 8400B58F */  lw         $s5, 0x84($sp)
/* 3B410 8004AC10 8000B48F */  lw         $s4, 0x80($sp)
/* 3B414 8004AC14 7C00B38F */  lw         $s3, 0x7C($sp)
/* 3B418 8004AC18 7800B28F */  lw         $s2, 0x78($sp)
/* 3B41C 8004AC1C 7400B18F */  lw         $s1, 0x74($sp)
/* 3B420 8004AC20 7000B08F */  lw         $s0, 0x70($sp)
/* 3B424 8004AC24 0800E003 */  jr         $ra
/* 3B428 8004AC28 9800BD27 */   addiu     $sp, $sp, 0x98
.size FX_SoulReaverBlade, . - FX_SoulReaverBlade
