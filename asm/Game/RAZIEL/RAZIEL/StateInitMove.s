.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateInitMove
/* 9B164 800AA964 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9B168 800AA968 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9B16C 800AA96C 2000B2AF */  sw         $s2, 0x20($sp)
/* 9B170 800AA970 21908000 */  addu       $s2, $a0, $zero
/* 9B174 800AA974 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 9B178 800AA978 2800B4AF */  sw         $s4, 0x28($sp)
/* 9B17C 800AA97C 2400B3AF */  sw         $s3, 0x24($sp)
/* 9B180 800AA980 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9B184 800AA984 1800B0AF */  sw         $s0, 0x18($sp)
/* 9B188 800AA988 0000438C */  lw         $v1, 0x0($v0)
/* 9B18C 800AA98C A0A4828F */  lw         $v0, %gp_rel(RazielCommands + 0x1C)($gp)
/* 9B190 800AA990 00000000 */  nop
/* 9B194 800AA994 24106200 */  and        $v0, $v1, $v0
/* 9B198 800AA998 2D004010 */  beqz       $v0, .L800AAA50
/* 9B19C 800AA99C 2180A000 */   addu      $s0, $a1, $zero
/* 9B1A0 800AA9A0 02000224 */  addiu      $v0, $zero, 0x2
/* 9B1A4 800AA9A4 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B1A8 800AA9A8 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B1AC 800AA9AC 8000033C */  lui        $v1, (0x800000 >> 16)
/* 9B1B0 800AA9B0 24104300 */  and        $v0, $v0, $v1
/* 9B1B4 800AA9B4 04004010 */  beqz       $v0, .L800AA9C8
/* 9B1B8 800AA9B8 00000000 */   nop
/* 9B1BC 800AA9BC C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9B1C0 800AA9C0 74AA0208 */  j          .L800AA9D0
/* 9B1C4 800AA9C4 0200033C */   lui       $v1, (0x22119 >> 16)
.L800AA9C8:
/* 9B1C8 800AA9C8 C8FD80AF */  sw         $zero, %gp_rel(ControlFlag)($gp)
/* 9B1CC 800AA9CC 0200033C */  lui        $v1, (0x22119 >> 16)
.L800AA9D0:
/* 9B1D0 800AA9D0 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B1D4 800AA9D4 19216334 */  ori        $v1, $v1, (0x22119 & 0xFFFF)
/* 9B1D8 800AA9D8 25104300 */  or         $v0, $v0, $v1
/* 9B1DC 800AA9DC C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B1E0 800AA9E0 C0101000 */  sll        $v0, $s0, 3
/* 9B1E4 800AA9E4 21105000 */  addu       $v0, $v0, $s0
/* 9B1E8 800AA9E8 C0100200 */  sll        $v0, $v0, 3
/* 9B1EC 800AA9EC 23105000 */  subu       $v0, $v0, $s0
/* 9B1F0 800AA9F0 80100200 */  sll        $v0, $v0, 2
/* 9B1F4 800AA9F4 21984202 */  addu       $s3, $s2, $v0
/* 9B1F8 800AA9F8 2001628E */  lw         $v0, 0x120($s3)
/* 9B1FC 800AA9FC 34001424 */  addiu      $s4, $zero, 0x34
/* 9B200 800AAA00 61005410 */  beq        $v0, $s4, .L800AAB88
/* 9B204 800AAA04 00000000 */   nop
/* 9B208 800AAA08 0000448E */  lw         $a0, 0x0($s2)
/* 9B20C 800AAA0C 139B020C */  jal        razResetMotion
/* 9B210 800AAA10 FFFF1124 */   addiu     $s1, $zero, -0x1
/* 9B214 800AAA14 21280002 */  addu       $a1, $s0, $zero
/* 9B218 800AAA18 21308002 */  addu       $a2, $s4, $zero
/* 9B21C 800AAA1C 1000B1AF */  sw         $s1, 0x10($sp)
/* 9B220 800AAA20 0000448E */  lw         $a0, 0x0($s2)
/* 9B224 800AAA24 5E9C020C */  jal        razSwitchVAnimGroup
/* 9B228 800AAA28 21382002 */   addu      $a3, $s1, $zero
/* 9B22C 800AAA2C 06004010 */  beqz       $v0, .L800AAA48
/* 9B230 800AAA30 21280002 */   addu      $a1, $s0, $zero
/* 9B234 800AAA34 01000624 */  addiu      $a2, $zero, 0x1
/* 9B238 800AAA38 1000B1AF */  sw         $s1, 0x10($sp)
/* 9B23C 800AAA3C 0000448E */  lw         $a0, 0x0($s2)
/* 9B240 800AAA40 A39C020C */  jal        razSwitchVAnimSingle
/* 9B244 800AAA44 21382002 */   addu      $a3, $s1, $zero
.L800AAA48:
/* 9B248 800AAA48 E2AA0208 */  j          .L800AAB88
/* 9B24C 800AAA4C 200174AE */   sw        $s4, 0x120($s3)
.L800AAA50:
/* 9B250 800AAA50 9CA4828F */  lw         $v0, %gp_rel(RazielCommands + 0x18)($gp)
/* 9B254 800AAA54 00000000 */  nop
/* 9B258 800AAA58 24106200 */  and        $v0, $v1, $v0
/* 9B25C 800AAA5C 2F004010 */  beqz       $v0, .L800AAB1C
/* 9B260 800AAA60 0001023C */   lui       $v0, (0x1000000 >> 16)
/* 9B264 800AAA64 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B268 800AAA68 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B26C 800AAA6C 8000033C */  lui        $v1, (0x800000 >> 16)
/* 9B270 800AAA70 24104300 */  and        $v0, $v0, $v1
/* 9B274 800AAA74 04004010 */  beqz       $v0, .L800AAA88
/* 9B278 800AAA78 00000000 */   nop
/* 9B27C 800AAA7C C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9B280 800AAA80 A3AA0208 */  j          .L800AAA8C
/* 9B284 800AAA84 00000000 */   nop
.L800AAA88:
/* 9B288 800AAA88 C8FD80AF */  sw         $zero, %gp_rel(ControlFlag)($gp)
.L800AAA8C:
/* 9B28C 800AAA8C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B290 800AAA90 00000000 */  nop
/* 9B294 800AAA94 19214234 */  ori        $v0, $v0, 0x2119
/* 9B298 800AAA98 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9B29C 800AAA9C C0101000 */  sll        $v0, $s0, 3
/* 9B2A0 800AAAA0 21105000 */  addu       $v0, $v0, $s0
/* 9B2A4 800AAAA4 C0100200 */  sll        $v0, $v0, 3
/* 9B2A8 800AAAA8 23105000 */  subu       $v0, $v0, $s0
/* 9B2AC 800AAAAC 80100200 */  sll        $v0, $v0, 2
/* 9B2B0 800AAAB0 21884202 */  addu       $s1, $s2, $v0
/* 9B2B4 800AAAB4 2001228E */  lw         $v0, 0x120($s1)
/* 9B2B8 800AAAB8 38001324 */  addiu      $s3, $zero, 0x38
/* 9B2BC 800AAABC 32005310 */  beq        $v0, $s3, .L800AAB88
/* 9B2C0 800AAAC0 00000000 */   nop
/* 9B2C4 800AAAC4 0000448E */  lw         $a0, 0x0($s2)
/* 9B2C8 800AAAC8 139B020C */  jal        razResetMotion
/* 9B2CC 800AAACC 00000000 */   nop
/* 9B2D0 800AAAD0 21280002 */  addu       $a1, $s0, $zero
/* 9B2D4 800AAAD4 21306002 */  addu       $a2, $s3, $zero
/* 9B2D8 800AAAD8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9B2DC 800AAADC 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B2E0 800AAAE0 0000448E */  lw         $a0, 0x0($s2)
/* 9B2E4 800AAAE4 5E9C020C */  jal        razSwitchVAnimGroup
/* 9B2E8 800AAAE8 21384000 */   addu      $a3, $v0, $zero
/* 9B2EC 800AAAEC 09004010 */  beqz       $v0, .L800AAB14
/* 9B2F0 800AAAF0 21204002 */   addu      $a0, $s2, $zero
/* 9B2F4 800AAAF4 21280002 */  addu       $a1, $s0, $zero
/* 9B2F8 800AAAF8 4A000624 */  addiu      $a2, $zero, 0x4A
/* 9B2FC 800AAAFC 21380000 */  addu       $a3, $zero, $zero
/* 9B300 800AAB00 03000224 */  addiu      $v0, $zero, 0x3
/* 9B304 800AAB04 1000A2AF */  sw         $v0, 0x10($sp)
/* 9B308 800AAB08 02000224 */  addiu      $v0, $zero, 0x2
/* 9B30C 800AAB0C 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9B310 800AAB10 1400A2AF */   sw        $v0, 0x14($sp)
.L800AAB14:
/* 9B314 800AAB14 E2AA0208 */  j          .L800AAB88
/* 9B318 800AAB18 200133AE */   sw        $s3, 0x120($s1)
.L800AAB1C:
/* 9B31C 800AAB1C 2000033C */  lui        $v1, (0x200800 >> 16)
/* 9B320 800AAB20 00086334 */  ori        $v1, $v1, (0x200800 & 0xFFFF)
/* 9B324 800AAB24 0200043C */  lui        $a0, (0x28119 >> 16)
/* 9B328 800AAB28 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B32C 800AAB2C 19818434 */  ori        $a0, $a0, (0x28119 & 0xFFFF)
/* 9B330 800AAB30 24104300 */  and        $v0, $v0, $v1
/* 9B334 800AAB34 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* 9B338 800AAB38 04004234 */  ori        $v0, $v0, 0x4
/* 9B33C 800AAB3C 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9B340 800AAB40 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* 9B344 800AAB44 25186400 */  or         $v1, $v1, $a0
/* 9B348 800AAB48 20004230 */  andi       $v0, $v0, 0x20
/* 9B34C 800AAB4C C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 9B350 800AAB50 03004010 */  beqz       $v0, .L800AAB60
/* 9B354 800AAB54 2000023C */   lui       $v0, (0x200000 >> 16)
/* 9B358 800AAB58 25106200 */  or         $v0, $v1, $v0
/* 9B35C 800AAB5C C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
.L800AAB60:
/* 9B360 800AAB60 21204002 */  addu       $a0, $s2, $zero
/* 9B364 800AAB64 21280002 */  addu       $a1, $s0, $zero
/* 9B368 800AAB68 C0380500 */  sll        $a3, $a1, 3
/* 9B36C 800AAB6C 2138E500 */  addu       $a3, $a3, $a1
/* 9B370 800AAB70 C0380700 */  sll        $a3, $a3, 3
/* 9B374 800AAB74 2338E500 */  subu       $a3, $a3, $a1
/* 9B378 800AAB78 80380700 */  sll        $a3, $a3, 2
/* 9B37C 800AAB7C 2138E400 */  addu       $a3, $a3, $a0
/* 9B380 800AAB80 1399020C */  jal        razSelectMotionAnim
/* 9B384 800AAB84 2001E724 */   addiu     $a3, $a3, 0x120
.L800AAB88:
/* 9B388 800AAB88 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9B38C 800AAB8C 2800B48F */  lw         $s4, 0x28($sp)
/* 9B390 800AAB90 2400B38F */  lw         $s3, 0x24($sp)
/* 9B394 800AAB94 2000B28F */  lw         $s2, 0x20($sp)
/* 9B398 800AAB98 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9B39C 800AAB9C 1800B08F */  lw         $s0, 0x18($sp)
/* 9B3A0 800AABA0 0800E003 */  jr         $ra
/* 9B3A4 800AABA4 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateInitMove, . - StateInitMove
