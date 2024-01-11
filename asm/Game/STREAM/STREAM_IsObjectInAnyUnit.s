.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsObjectInAnyUnit
/* 49C98 80059498 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 49C9C 8005949C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 49CA0 800594A0 21988000 */  addu       $s3, $a0, $zero
/* 49CA4 800594A4 1400B1AF */  sw         $s1, 0x14($sp)
/* 49CA8 800594A8 21880000 */  addu       $s1, $zero, $zero
/* 49CAC 800594AC 2000BFAF */  sw         $ra, 0x20($sp)
/* 49CB0 800594B0 1800B2AF */  sw         $s2, 0x18($sp)
/* 49CB4 800594B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 49CB8 800594B8 80191100 */  sll        $v1, $s1, 6
.L800594BC:
/* 49CBC 800594BC 3CC78227 */  addiu      $v0, $gp, %gp_rel(StreamTracker)
/* 49CC0 800594C0 21206200 */  addu       $a0, $v1, $v0
/* 49CC4 800594C4 04008384 */  lh         $v1, 0x4($a0)
/* 49CC8 800594C8 02000224 */  addiu      $v0, $zero, 0x2
/* 49CCC 800594CC 16006214 */  bne        $v1, $v0, .L80059528
/* 49CD0 800594D0 00000000 */   nop
/* 49CD4 800594D4 0800838C */  lw         $v1, 0x8($a0)
/* 49CD8 800594D8 00000000 */  nop
/* 49CDC 800594DC 12006010 */  beqz       $v1, .L80059528
/* 49CE0 800594E0 FF000224 */   addiu     $v0, $zero, 0xFF
/* 49CE4 800594E4 8C00708C */  lw         $s0, 0x8C($v1)
/* 49CE8 800594E8 00000000 */  nop
/* 49CEC 800594EC 00000392 */  lbu        $v1, 0x0($s0)
/* 49CF0 800594F0 00000000 */  nop
/* 49CF4 800594F4 0C006210 */  beq        $v1, $v0, .L80059528
/* 49CF8 800594F8 21206002 */   addu      $a0, $s3, $zero
/* 49CFC 800594FC 21904000 */  addu       $s2, $v0, $zero
.L80059500:
/* 49D00 80059500 1CD2010C */  jal        strcmpi
/* 49D04 80059504 21280002 */   addu      $a1, $s0, $zero
/* 49D08 80059508 03004014 */  bnez       $v0, .L80059518
/* 49D0C 8005950C 10001026 */   addiu     $s0, $s0, 0x10
/* 49D10 80059510 4F650108 */  j          .L8005953C
/* 49D14 80059514 01000224 */   addiu     $v0, $zero, 0x1
.L80059518:
/* 49D18 80059518 00000292 */  lbu        $v0, 0x0($s0)
/* 49D1C 8005951C 00000000 */  nop
/* 49D20 80059520 F7FF5214 */  bne        $v0, $s2, .L80059500
/* 49D24 80059524 21206002 */   addu      $a0, $s3, $zero
.L80059528:
/* 49D28 80059528 01003126 */  addiu      $s1, $s1, 0x1
/* 49D2C 8005952C 1000222A */  slti       $v0, $s1, 0x10
/* 49D30 80059530 E2FF4014 */  bnez       $v0, .L800594BC
/* 49D34 80059534 80191100 */   sll       $v1, $s1, 6
/* 49D38 80059538 21100000 */  addu       $v0, $zero, $zero
.L8005953C:
/* 49D3C 8005953C 2000BF8F */  lw         $ra, 0x20($sp)
/* 49D40 80059540 1C00B38F */  lw         $s3, 0x1C($sp)
/* 49D44 80059544 1800B28F */  lw         $s2, 0x18($sp)
/* 49D48 80059548 1400B18F */  lw         $s1, 0x14($sp)
/* 49D4C 8005954C 1000B08F */  lw         $s0, 0x10($sp)
/* 49D50 80059550 0800E003 */  jr         $ra
/* 49D54 80059554 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_IsObjectInAnyUnit, . - STREAM_IsObjectInAnyUnit
