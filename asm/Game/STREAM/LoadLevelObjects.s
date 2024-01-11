.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadLevelObjects
/* 499BC 800591BC C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 499C0 800591C0 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 499C4 800591C4 21888000 */  addu       $s1, $a0, $zero
/* 499C8 800591C8 3800BFAF */  sw         $ra, 0x38($sp)
/* 499CC 800591CC 3400B3AF */  sw         $s3, 0x34($sp)
/* 499D0 800591D0 3000B2AF */  sw         $s2, 0x30($sp)
/* 499D4 800591D4 E47F010C */  jal        STREAM_NextLoadAsNormal
/* 499D8 800591D8 2800B0AF */   sw        $s0, 0x28($sp)
/* 499DC 800591DC 0800248E */  lw         $a0, 0x8($s1)
/* 499E0 800591E0 00000000 */  nop
/* 499E4 800591E4 8C00828C */  lw         $v0, 0x8C($a0)
/* 499E8 800591E8 00000000 */  nop
/* 499EC 800591EC 00004390 */  lbu        $v1, 0x0($v0)
/* 499F0 800591F0 FF000224 */  addiu      $v0, $zero, 0xFF
/* 499F4 800591F4 12006210 */  beq        $v1, $v0, .L80059240
/* 499F8 800591F8 21800000 */   addu      $s0, $zero, $zero
/* 499FC 800591FC 21904000 */  addu       $s2, $v0, $zero
.L80059200:
/* 49A00 80059200 8C00858C */  lw         $a1, 0x8C($a0)
/* 49A04 80059204 1000A427 */  addiu      $a0, $sp, 0x10
/* 49A08 80059208 1CF4020C */  jal        func_800BD070
/* 49A0C 8005920C 2128B000 */   addu      $a1, $a1, $s0
/* 49A10 80059210 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 49A14 80059214 F563010C */  jal        InsertGlobalObject
/* 49A18 80059218 1000A427 */   addiu     $a0, $sp, 0x10
/* 49A1C 8005921C 0800248E */  lw         $a0, 0x8($s1)
/* 49A20 80059220 00000000 */  nop
/* 49A24 80059224 8C00828C */  lw         $v0, 0x8C($a0)
/* 49A28 80059228 10001026 */  addiu      $s0, $s0, 0x10
/* 49A2C 8005922C 21105000 */  addu       $v0, $v0, $s0
/* 49A30 80059230 00004290 */  lbu        $v0, 0x0($v0)
/* 49A34 80059234 00000000 */  nop
/* 49A38 80059238 F1FF5214 */  bne        $v0, $s2, .L80059200
/* 49A3C 8005923C 00000000 */   nop
.L80059240:
/* 49A40 80059240 0800318E */  lw         $s1, 0x8($s1)
/* 49A44 80059244 00000000 */  nop
/* 49A48 80059248 7800228E */  lw         $v0, 0x78($s1)
/* 49A4C 8005924C 00000000 */  nop
/* 49A50 80059250 1C004018 */  blez       $v0, .L800592C4
/* 49A54 80059254 21900000 */   addu      $s2, $zero, $zero
/* 49A58 80059258 FFFF1324 */  addiu      $s3, $zero, -0x1
/* 49A5C 8005925C 21804002 */  addu       $s0, $s2, $zero
.L80059260:
/* 49A60 80059260 7C00248E */  lw         $a0, 0x7C($s1)
/* 49A64 80059264 CD62010C */  jal        FindObjectName
/* 49A68 80059268 21209000 */   addu      $a0, $a0, $s0
/* 49A6C 8005926C 09005310 */  beq        $v0, $s3, .L80059294
/* 49A70 80059270 FFBF0424 */   addiu     $a0, $zero, -0x4001
/* 49A74 80059274 7C00228E */  lw         $v0, 0x7C($s1)
/* 49A78 80059278 00000000 */  nop
/* 49A7C 8005927C 21100202 */  addu       $v0, $s0, $v0
/* 49A80 80059280 2C00438C */  lw         $v1, 0x2C($v0)
/* 49A84 80059284 00000000 */  nop
/* 49A88 80059288 24186400 */  and        $v1, $v1, $a0
/* 49A8C 8005928C AC640108 */  j          .L800592B0
/* 49A90 80059290 2C0043AC */   sw        $v1, 0x2C($v0)
.L80059294:
/* 49A94 80059294 7C00238E */  lw         $v1, 0x7C($s1)
/* 49A98 80059298 00000000 */  nop
/* 49A9C 8005929C 21180302 */  addu       $v1, $s0, $v1
/* 49AA0 800592A0 2C00628C */  lw         $v0, 0x2C($v1)
/* 49AA4 800592A4 00000000 */  nop
/* 49AA8 800592A8 00404234 */  ori        $v0, $v0, 0x4000
/* 49AAC 800592AC 2C0062AC */  sw         $v0, 0x2C($v1)
.L800592B0:
/* 49AB0 800592B0 7800228E */  lw         $v0, 0x78($s1)
/* 49AB4 800592B4 01005226 */  addiu      $s2, $s2, 0x1
/* 49AB8 800592B8 2A104202 */  slt        $v0, $s2, $v0
/* 49ABC 800592BC E8FF4014 */  bnez       $v0, .L80059260
/* 49AC0 800592C0 4C001026 */   addiu     $s0, $s0, 0x4C
.L800592C4:
/* 49AC4 800592C4 3800BF8F */  lw         $ra, 0x38($sp)
/* 49AC8 800592C8 3400B38F */  lw         $s3, 0x34($sp)
/* 49ACC 800592CC 3000B28F */  lw         $s2, 0x30($sp)
/* 49AD0 800592D0 2C00B18F */  lw         $s1, 0x2C($sp)
/* 49AD4 800592D4 2800B08F */  lw         $s0, 0x28($sp)
/* 49AD8 800592D8 0800E003 */  jr         $ra
/* 49ADC 800592DC 4000BD27 */   addiu     $sp, $sp, 0x40
.size LoadLevelObjects, . - LoadLevelObjects
