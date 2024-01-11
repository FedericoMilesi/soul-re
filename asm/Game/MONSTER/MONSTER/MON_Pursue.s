.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Pursue
/* 7AFD8 8008A7D8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7AFDC 8008A7DC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7AFE0 8008A7E0 21988000 */  addu       $s3, $a0, $zero
/* 7AFE4 8008A7E4 2800B6AF */  sw         $s6, 0x28($sp)
/* 7AFE8 8008A7E8 21B00000 */  addu       $s6, $zero, $zero
/* 7AFEC 8008A7EC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 7AFF0 8008A7F0 2400B5AF */  sw         $s5, 0x24($sp)
/* 7AFF4 8008A7F4 2000B4AF */  sw         $s4, 0x20($sp)
/* 7AFF8 8008A7F8 1800B2AF */  sw         $s2, 0x18($sp)
/* 7AFFC 8008A7FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 7B000 8008A800 1000B0AF */  sw         $s0, 0x10($sp)
/* 7B004 8008A804 6C01718E */  lw         $s1, 0x16C($s3)
/* 7B008 8008A808 21A0C002 */  addu       $s4, $s6, $zero
/* 7B00C 8008A80C 0000228E */  lw         $v0, 0x0($s1)
/* 7B010 8008A810 2190C002 */  addu       $s2, $s6, $zero
/* 7B014 8008A814 04004230 */  andi       $v0, $v0, 0x4
/* 7B018 8008A818 05004010 */  beqz       $v0, .L8008A830
/* 7B01C 8008A81C 200120AE */   sw        $zero, 0x120($s1)
/* 7B020 8008A820 6112020C */  jal        MON_GroundMoveQueueHandler
/* 7B024 8008A824 00000000 */   nop
/* 7B028 8008A828 FA2A0208 */  j          .L8008ABE8
/* 7B02C 8008A82C 00000000 */   nop
.L8008A830:
/* 7B030 8008A830 530D020C */  jal        MON_ValidPosition
/* 7B034 8008A834 21206002 */   addu      $a0, $s3, $zero
/* 7B038 8008A838 22004010 */  beqz       $v0, .L8008A8C4
/* 7B03C 8008A83C 07000224 */   addiu     $v0, $zero, 0x7
/* 7B040 8008A840 5A012392 */  lbu        $v1, 0x15A($s1)
/* 7B044 8008A844 00000000 */  nop
/* 7B048 8008A848 28006214 */  bne        $v1, $v0, .L8008A8EC
/* 7B04C 8008A84C 01000224 */   addiu     $v0, $zero, 0x1
/* 7B050 8008A850 2000668E */  lw         $a2, 0x20($s3)
/* 7B054 8008A854 00000000 */  nop
/* 7B058 8008A858 2400C010 */  beqz       $a2, .L8008A8EC
/* 7B05C 8008A85C 00000000 */   nop
/* 7B060 8008A860 5C006286 */  lh         $v0, 0x5C($s3)
/* 7B064 8008A864 2000C484 */  lh         $a0, 0x20($a2)
/* 7B068 8008A868 5E006386 */  lh         $v1, 0x5E($s3)
/* 7B06C 8008A86C 2200C584 */  lh         $a1, 0x22($a2)
/* 7B070 8008A870 2400C684 */  lh         $a2, 0x24($a2)
/* 7B074 8008A874 23204400 */  subu       $a0, $v0, $a0
/* 7B078 8008A878 60006286 */  lh         $v0, 0x60($s3)
/* 7B07C 8008A87C 23286500 */  subu       $a1, $v1, $a1
/* 7B080 8008A880 B7E6000C */  jal        MATH3D_LengthXYZ
/* 7B084 8008A884 23304600 */   subu      $a2, $v0, $a2
/* 7B088 8008A888 3C012386 */  lh         $v1, 0x13C($s1)
/* 7B08C 8008A88C 00000000 */  nop
/* 7B090 8008A890 2A186200 */  slt        $v1, $v1, $v0
/* 7B094 8008A894 14006010 */  beqz       $v1, .L8008A8E8
/* 7B098 8008A898 00000000 */   nop
/* 7B09C 8008A89C 2000628E */  lw         $v0, 0x20($s3)
/* 7B0A0 8008A8A0 01001224 */  addiu      $s2, $zero, 0x1
/* 7B0A4 8008A8A4 23004788 */  lwl        $a3, 0x23($v0)
/* 7B0A8 8008A8A8 20004798 */  lwr        $a3, 0x20($v0)
/* 7B0AC 8008A8AC 24004884 */  lh         $t0, 0x24($v0)
/* 7B0B0 8008A8B0 270127AA */  swl        $a3, 0x127($s1)
/* 7B0B4 8008A8B4 240127BA */  swr        $a3, 0x124($s1)
/* 7B0B8 8008A8B8 280128A6 */  sh         $t0, 0x128($s1)
/* 7B0BC 8008A8BC 392A0208 */  j          .L8008A8E4
/* 7B0C0 8008A8C0 24012226 */   addiu     $v0, $s1, 0x124
.L8008A8C4:
/* 7B0C4 8008A8C4 01001224 */  addiu      $s2, $zero, 0x1
/* 7B0C8 8008A8C8 24012226 */  addiu      $v0, $s1, 0x124
/* 7B0CC 8008A8CC 2F01278A */  lwl        $a3, 0x12F($s1)
/* 7B0D0 8008A8D0 2C01279A */  lwr        $a3, 0x12C($s1)
/* 7B0D4 8008A8D4 30012886 */  lh         $t0, 0x130($s1)
/* 7B0D8 8008A8D8 270127AA */  swl        $a3, 0x127($s1)
/* 7B0DC 8008A8DC 240127BA */  swr        $a3, 0x124($s1)
/* 7B0E0 8008A8E0 280128A6 */  sh         $t0, 0x128($s1)
.L8008A8E4:
/* 7B0E4 8008A8E4 200122AE */  sw         $v0, 0x120($s1)
.L8008A8E8:
/* 7B0E8 8008A8E8 01000224 */  addiu      $v0, $zero, 0x1
.L8008A8EC:
/* 7B0EC 8008A8EC 6B004212 */  beq        $s2, $v0, .L8008AA9C
/* 7B0F0 8008A8F0 00000000 */   nop
/* 7B0F4 8008A8F4 C400248E */  lw         $a0, 0xC4($s1)
/* 7B0F8 8008A8F8 00000000 */  nop
/* 7B0FC 8008A8FC 06008014 */  bnez       $a0, .L8008A918
/* 7B100 8008A900 0010033C */   lui       $v1, (0x10000000 >> 16)
/* 7B104 8008A904 21206002 */  addu       $a0, $s3, $zero
/* 7B108 8008A908 91FE010C */  jal        MON_SwitchState
/* 7B10C 8008A90C 02000524 */   addiu     $a1, $zero, 0x2
/* 7B110 8008A910 A72A0208 */  j          .L8008AA9C
/* 7B114 8008A914 21900000 */   addu      $s2, $zero, $zero
.L8008A918:
/* 7B118 8008A918 0000228E */  lw         $v0, 0x0($s1)
/* 7B11C 8008A91C 00000000 */  nop
/* 7B120 8008A920 24104300 */  and        $v0, $v0, $v1
/* 7B124 8008A924 0B004010 */  beqz       $v0, .L8008A954
/* 7B128 8008A928 0002023C */   lui       $v0, (0x2000000 >> 16)
/* 7B12C 8008A92C 16008294 */  lhu        $v0, 0x16($a0)
/* 7B130 8008A930 00000000 */  nop
/* 7B134 8008A934 00104230 */  andi       $v0, $v0, 0x1000
/* 7B138 8008A938 05004010 */  beqz       $v0, .L8008A950
/* 7B13C 8008A93C 21206002 */   addu      $a0, $s3, $zero
/* 7B140 8008A940 91FE010C */  jal        MON_SwitchState
/* 7B144 8008A944 1B000524 */   addiu     $a1, $zero, 0x1B
/* 7B148 8008A948 A72A0208 */  j          .L8008AA9C
/* 7B14C 8008A94C 21900000 */   addu      $s2, $zero, $zero
.L8008A950:
/* 7B150 8008A950 0002023C */  lui        $v0, (0x2000000 >> 16)
.L8008A954:
/* 7B154 8008A954 0000238E */  lw         $v1, 0x0($s1)
/* 7B158 8008A958 6801248E */  lw         $a0, 0x168($s1)
/* 7B15C 8008A95C 24186200 */  and        $v1, $v1, $v0
/* 7B160 8008A960 0800868C */  lw         $a2, 0x8($a0)
/* 7B164 8008A964 0D006010 */  beqz       $v1, .L8008A99C
/* 7B168 8008A968 02001224 */   addiu     $s2, $zero, 0x2
/* 7B16C 8008A96C CC00258E */  lw         $a1, 0xCC($s1)
/* 7B170 8008A970 00000000 */  nop
/* 7B174 8008A974 0900A010 */  beqz       $a1, .L8008A99C
/* 7B178 8008A978 00000000 */   nop
/* 7B17C 8008A97C 1600A294 */  lhu        $v0, 0x16($a1)
/* 7B180 8008A980 00000000 */  nop
/* 7B184 8008A984 00024230 */  andi       $v0, $v0, 0x200
/* 7B188 8008A988 04004014 */  bnez       $v0, .L8008A99C
/* 7B18C 8008A98C 21A0A000 */   addu      $s4, $a1, $zero
/* 7B190 8008A990 0E00D684 */  lh         $s6, 0xE($a2)
/* 7B194 8008A994 6A2A0208 */  j          .L8008A9A8
/* 7B198 8008A998 03001224 */   addiu     $s2, $zero, 0x3
.L8008A99C:
/* 7B19C 8008A99C 0A00C284 */  lh         $v0, 0xA($a2)
/* 7B1A0 8008A9A0 C400348E */  lw         $s4, 0xC4($s1)
/* 7B1A4 8008A9A4 38FF5624 */  addiu      $s6, $v0, -0xC8
.L8008A9A8:
/* 7B1A8 8008A9A8 05008016 */  bnez       $s4, .L8008A9C0
/* 7B1AC 8008A9AC 21206002 */   addu      $a0, $s3, $zero
/* 7B1B0 8008A9B0 91FE010C */  jal        MON_SwitchState
/* 7B1B4 8008A9B4 02000524 */   addiu     $a1, $zero, 0x2
/* 7B1B8 8008A9B8 A72A0208 */  j          .L8008AA9C
/* 7B1BC 8008A9BC 00000000 */   nop
.L8008A9C0:
/* 7B1C0 8008A9C0 A10C020C */  jal        MON_ShouldIFireAtTarget
/* 7B1C4 8008A9C4 21288002 */   addu      $a1, $s4, $zero
/* 7B1C8 8008A9C8 05004010 */  beqz       $v0, .L8008A9E0
/* 7B1CC 8008A9CC 21206002 */   addu      $a0, $s3, $zero
/* 7B1D0 8008A9D0 91FE010C */  jal        MON_SwitchState
/* 7B1D4 8008A9D4 1C000524 */   addiu     $a1, $zero, 0x1C
/* 7B1D8 8008A9D8 A72A0208 */  j          .L8008AA9C
/* 7B1DC 8008A9DC 21900000 */   addu      $s2, $zero, $zero
.L8008A9E0:
/* 7B1E0 8008A9E0 0400828E */  lw         $v0, 0x4($s4)
/* 7B1E4 8008A9E4 00000000 */  nop
/* 7B1E8 8008A9E8 5F004788 */  lwl        $a3, 0x5F($v0)
/* 7B1EC 8008A9EC 5C004798 */  lwr        $a3, 0x5C($v0)
/* 7B1F0 8008A9F0 60004884 */  lh         $t0, 0x60($v0)
/* 7B1F4 8008A9F4 270127AA */  swl        $a3, 0x127($s1)
/* 7B1F8 8008A9F8 240127BA */  swr        $a3, 0x124($s1)
/* 7B1FC 8008A9FC 280128A6 */  sh         $t0, 0x128($s1)
/* 7B200 8008AA00 24012226 */  addiu      $v0, $s1, 0x124
/* 7B204 8008AA04 200122AE */  sw         $v0, 0x120($s1)
/* 7B208 8008AA08 0400828E */  lw         $v0, 0x4($s4)
/* 7B20C 8008AA0C 00000000 */  nop
/* 7B210 8008AA10 3800458C */  lw         $a1, 0x38($v0)
/* 7B214 8008AA14 400D020C */  jal        MON_ValidUnit
/* 7B218 8008AA18 21206002 */   addu      $a0, $s3, $zero
/* 7B21C 8008AA1C 18004010 */  beqz       $v0, .L8008AA80
/* 7B220 8008AA20 07000224 */   addiu     $v0, $zero, 0x7
/* 7B224 8008AA24 5A012392 */  lbu        $v1, 0x15A($s1)
/* 7B228 8008AA28 00000000 */  nop
/* 7B22C 8008AA2C 1B006214 */  bne        $v1, $v0, .L8008AA9C
/* 7B230 8008AA30 00000000 */   nop
/* 7B234 8008AA34 2000668E */  lw         $a2, 0x20($s3)
/* 7B238 8008AA38 00000000 */  nop
/* 7B23C 8008AA3C 1700C010 */  beqz       $a2, .L8008AA9C
/* 7B240 8008AA40 00000000 */   nop
/* 7B244 8008AA44 24012286 */  lh         $v0, 0x124($s1)
/* 7B248 8008AA48 2000C484 */  lh         $a0, 0x20($a2)
/* 7B24C 8008AA4C 26012386 */  lh         $v1, 0x126($s1)
/* 7B250 8008AA50 2200C584 */  lh         $a1, 0x22($a2)
/* 7B254 8008AA54 2400C684 */  lh         $a2, 0x24($a2)
/* 7B258 8008AA58 23204400 */  subu       $a0, $v0, $a0
/* 7B25C 8008AA5C 28012286 */  lh         $v0, 0x128($s1)
/* 7B260 8008AA60 23286500 */  subu       $a1, $v1, $a1
/* 7B264 8008AA64 B7E6000C */  jal        MATH3D_LengthXYZ
/* 7B268 8008AA68 23304600 */   subu      $a2, $v0, $a2
/* 7B26C 8008AA6C 3C012386 */  lh         $v1, 0x13C($s1)
/* 7B270 8008AA70 00000000 */  nop
/* 7B274 8008AA74 2A186200 */  slt        $v1, $v1, $v0
/* 7B278 8008AA78 08006010 */  beqz       $v1, .L8008AA9C
/* 7B27C 8008AA7C 00000000 */   nop
.L8008AA80:
/* 7B280 8008AA80 21206002 */  addu       $a0, $s3, $zero
/* 7B284 8008AA84 91FE010C */  jal        MON_SwitchState
/* 7B288 8008AA88 02000524 */   addiu     $a1, $zero, 0x2
/* 7B28C 8008AA8C 21206002 */  addu       $a0, $s3, $zero
/* 7B290 8008AA90 9D03020C */  jal        MON_PlayCombatIdle
/* 7B294 8008AA94 02000524 */   addiu     $a1, $zero, 0x2
/* 7B298 8008AA98 21900000 */  addu       $s2, $zero, $zero
.L8008AA9C:
/* 7B29C 8008AA9C 05004016 */  bnez       $s2, .L8008AAB4
/* 7B2A0 8008AAA0 21206002 */   addu      $a0, $s3, $zero
/* 7B2A4 8008AAA4 0917020C */  jal        MON_DefaultQueueHandler
/* 7B2A8 8008AAA8 21206002 */   addu      $a0, $s3, $zero
/* 7B2AC 8008AAAC FA2A0208 */  j          .L8008ABE8
/* 7B2B0 8008AAB0 00000000 */   nop
.L8008AAB4:
/* 7B2B4 8008AAB4 5C006526 */  addiu      $a1, $s3, 0x5C
/* 7B2B8 8008AAB8 5A06020C */  jal        MON_CheckPointSuitability
/* 7B2BC 8008AABC 24012626 */   addiu     $a2, $s1, 0x124
/* 7B2C0 8008AAC0 41004010 */  beqz       $v0, .L8008ABC8
/* 7B2C4 8008AAC4 FFFF1524 */   addiu     $s5, $zero, -0x1
/* 7B2C8 8008AAC8 21206002 */  addu       $a0, $s3, $zero
/* 7B2CC 8008AACC 6801228E */  lw         $v0, 0x168($s1)
/* 7B2D0 8008AAD0 00000000 */  nop
/* 7B2D4 8008AAD4 0000458C */  lw         $a1, 0x0($v0)
/* 7B2D8 8008AAD8 14009086 */  lh         $s0, 0x14($s4)
/* 7B2DC 8008AADC F4FE010C */  jal        MON_GetAnim
/* 7B2E0 8008AAE0 02000624 */   addiu     $a2, $zero, 0x2
/* 7B2E4 8008AAE4 02004294 */  lhu        $v0, 0x2($v0)
/* 7B2E8 8008AAE8 00000000 */  nop
/* 7B2EC 8008AAEC 2110C202 */  addu       $v0, $s6, $v0
/* 7B2F0 8008AAF0 2A800202 */  slt        $s0, $s0, $v0
/* 7B2F4 8008AAF4 02000012 */  beqz       $s0, .L8008AB00
/* 7B2F8 8008AAF8 03000524 */   addiu     $a1, $zero, 0x3
/* 7B2FC 8008AAFC 02000524 */  addiu      $a1, $zero, 0x2
.L8008AB00:
/* 7B300 8008AB00 0200C106 */  bgez       $s6, .L8008AB0C
/* 7B304 8008AB04 21206002 */   addu      $a0, $s3, $zero
/* 7B308 8008AB08 21B00000 */  addu       $s6, $zero, $zero
.L8008AB0C:
/* 7B30C 8008AB0C DA08020C */  jal        MON_DefaultPlanMovement
/* 7B310 8008AB10 2130C002 */   addu      $a2, $s6, $zero
/* 7B314 8008AB14 21184000 */  addu       $v1, $v0, $zero
/* 7B318 8008AB18 0700622C */  sltiu      $v0, $v1, 0x7
/* 7B31C 8008AB1C 23004010 */  beqz       $v0, .L8008ABAC
/* 7B320 8008AB20 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7B324 8008AB24 0180023C */  lui        $v0, %hi(jtbl_80012068)
/* 7B328 8008AB28 68204224 */  addiu      $v0, $v0, %lo(jtbl_80012068)
/* 7B32C 8008AB2C 80180300 */  sll        $v1, $v1, 2
/* 7B330 8008AB30 21186200 */  addu       $v1, $v1, $v0
/* 7B334 8008AB34 0000628C */  lw         $v0, 0x0($v1)
/* 7B338 8008AB38 00000000 */  nop
/* 7B33C 8008AB3C 08004000 */  jr         $v0
/* 7B340 8008AB40 00000000 */   nop
jlabel .L8008AB44
/* 7B344 8008AB44 02000224 */  addiu      $v0, $zero, 0x2
/* 7B348 8008AB48 0C004212 */  beq        $s2, $v0, .L8008AB7C
/* 7B34C 8008AB4C 0300422A */   slti      $v0, $s2, 0x3
/* 7B350 8008AB50 05004010 */  beqz       $v0, .L8008AB68
/* 7B354 8008AB54 01000224 */   addiu     $v0, $zero, 0x1
/* 7B358 8008AB58 12004212 */  beq        $s2, $v0, .L8008ABA4
/* 7B35C 8008AB5C FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7B360 8008AB60 EB2A0208 */  j          .L8008ABAC
/* 7B364 8008AB64 00000000 */   nop
.L8008AB68:
/* 7B368 8008AB68 03000224 */  addiu      $v0, $zero, 0x3
/* 7B36C 8008AB6C 0F004216 */  bne        $s2, $v0, .L8008ABAC
/* 7B370 8008AB70 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7B374 8008AB74 E52A0208 */  j          .L8008AB94
/* 7B378 8008AB78 00000000 */   nop
.L8008AB7C:
/* 7B37C 8008AB7C EA2A0208 */  j          .L8008ABA8
/* 7B380 8008AB80 0D001524 */   addiu     $s5, $zero, 0xD
jlabel .L8008AB84
/* 7B384 8008AB84 01000224 */  addiu      $v0, $zero, 0x1
/* 7B388 8008AB88 02004216 */  bne        $s2, $v0, .L8008AB94
/* 7B38C 8008AB8C 00000000 */   nop
/* 7B390 8008AB90 740120A6 */  sh         $zero, 0x174($s1)
.L8008AB94:
/* 7B394 8008AB94 C908020C */  jal        MON_GetPlanSlot
/* 7B398 8008AB98 21202002 */   addu      $a0, $s1, $zero
/* 7B39C 8008AB9C EB2A0208 */  j          .L8008ABAC
/* 7B3A0 8008ABA0 FFFF0224 */   addiu     $v0, $zero, -0x1
jlabel .L8008ABA4
/* 7B3A4 8008ABA4 02001524 */  addiu      $s5, $zero, 0x2
jlabel .L8008ABA8
/* 7B3A8 8008ABA8 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8008ABAC:
/* 7B3AC 8008ABAC 0E00A212 */  beq        $s5, $v0, .L8008ABE8
/* 7B3B0 8008ABB0 00000000 */   nop
/* 7B3B4 8008ABB4 21206002 */  addu       $a0, $s3, $zero
/* 7B3B8 8008ABB8 91FE010C */  jal        MON_SwitchState
/* 7B3BC 8008ABBC 2128A002 */   addu      $a1, $s5, $zero
/* 7B3C0 8008ABC0 FA2A0208 */  j          .L8008ABE8
/* 7B3C4 8008ABC4 00000000 */   nop
.L8008ABC8:
/* 7B3C8 8008ABC8 C908020C */  jal        MON_GetPlanSlot
/* 7B3CC 8008ABCC 21202002 */   addu      $a0, $s1, $zero
/* 7B3D0 8008ABD0 0917020C */  jal        MON_DefaultQueueHandler
/* 7B3D4 8008ABD4 21206002 */   addu      $a0, $s3, $zero
/* 7B3D8 8008ABD8 01000224 */  addiu      $v0, $zero, 0x1
/* 7B3DC 8008ABDC 02004216 */  bne        $s2, $v0, .L8008ABE8
/* 7B3E0 8008ABE0 00000000 */   nop
/* 7B3E4 8008ABE4 740120A6 */  sh         $zero, 0x174($s1)
.L8008ABE8:
/* 7B3E8 8008ABE8 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 7B3EC 8008ABEC 2800B68F */  lw         $s6, 0x28($sp)
/* 7B3F0 8008ABF0 2400B58F */  lw         $s5, 0x24($sp)
/* 7B3F4 8008ABF4 2000B48F */  lw         $s4, 0x20($sp)
/* 7B3F8 8008ABF8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7B3FC 8008ABFC 1800B28F */  lw         $s2, 0x18($sp)
/* 7B400 8008AC00 1400B18F */  lw         $s1, 0x14($sp)
/* 7B404 8008AC04 1000B08F */  lw         $s0, 0x10($sp)
/* 7B408 8008AC08 0800E003 */  jr         $ra
/* 7B40C 8008AC0C 3000BD27 */   addiu     $sp, $sp, 0x30
.size MON_Pursue, . - MON_Pursue
