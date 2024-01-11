.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FlipPhysOb
/* 5AD50 8006A550 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5AD54 8006A554 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5AD58 8006A558 21888000 */  addu       $s1, $a0, $zero
/* 5AD5C 8006A55C 2800BFAF */  sw         $ra, 0x28($sp)
/* 5AD60 8006A560 2400B3AF */  sw         $s3, 0x24($sp)
/* 5AD64 8006A564 2000B2AF */  sw         $s2, 0x20($sp)
/* 5AD68 8006A568 1800B0AF */  sw         $s0, 0x18($sp)
/* 5AD6C 8006A56C 2400228E */  lw         $v0, 0x24($s1)
/* 5AD70 8006A570 21900000 */  addu       $s2, $zero, $zero
/* 5AD74 8006A574 1000A5A7 */  sh         $a1, 0x10($sp)
/* 5AD78 8006A578 1200A6A7 */  sh         $a2, 0x12($sp)
/* 5AD7C 8006A57C 06004294 */  lhu        $v0, 0x6($v0)
/* 5AD80 8006A580 00000000 */  nop
/* 5AD84 8006A584 02004230 */  andi       $v0, $v0, 0x2
/* 5AD88 8006A588 3A004010 */  beqz       $v0, .L8006A674
/* 5AD8C 8006A58C 2198E000 */   addu      $s3, $a3, $zero
/* 5AD90 8006A590 71A3010C */  jal        PHYSOBS_IsAPushBlockAttached
/* 5AD94 8006A594 00000000 */   nop
/* 5AD98 8006A598 37004014 */  bnez       $v0, .L8006A678
/* 5AD9C 8006A59C 21104002 */   addu      $v0, $s2, $zero
/* 5ADA0 8006A5A0 6C01308E */  lw         $s0, 0x16C($s1)
/* 5ADA4 8006A5A4 00000000 */  nop
/* 5ADA8 8006A5A8 0000028E */  lw         $v0, 0x0($s0)
/* 5ADAC 8006A5AC 00000000 */  nop
/* 5ADB0 8006A5B0 00204230 */  andi       $v0, $v0, 0x2000
/* 5ADB4 8006A5B4 30004014 */  bnez       $v0, .L8006A678
/* 5ADB8 8006A5B8 21104002 */   addu      $v0, $s2, $zero
/* 5ADBC 8006A5BC F6A3010C */  jal        AnyBlocksInMotion
/* 5ADC0 8006A5C0 00000000 */   nop
/* 5ADC4 8006A5C4 2C004014 */  bnez       $v0, .L8006A678
/* 5ADC8 8006A5C8 21104002 */   addu      $v0, $s2, $zero
/* 5ADCC 8006A5CC 1000A427 */  addiu      $a0, $sp, 0x10
/* 5ADD0 8006A5D0 E9C2010C */  jal        PHYSOB_NormalToAxis
/* 5ADD4 8006A5D4 1200A527 */   addiu     $a1, $sp, 0x12
/* 5ADD8 8006A5D8 01000224 */  addiu      $v0, $zero, 0x1
/* 5ADDC 8006A5DC 280002A6 */  sh         $v0, 0x28($s0)
/* 5ADE0 8006A5E0 0000028E */  lw         $v0, 0x0($s0)
/* 5ADE4 8006A5E4 21202002 */  addu       $a0, $s1, $zero
/* 5ADE8 8006A5E8 080013AE */  sw         $s3, 0x8($s0)
/* 5ADEC 8006A5EC 1000A397 */  lhu        $v1, 0x10($sp)
/* 5ADF0 8006A5F0 1200A597 */  lhu        $a1, 0x12($sp)
/* 5ADF4 8006A5F4 08004234 */  ori        $v0, $v0, 0x8
/* 5ADF8 8006A5F8 000002AE */  sw         $v0, 0x0($s0)
/* 5ADFC 8006A5FC 040003A6 */  sh         $v1, 0x4($s0)
/* 5AE00 8006A600 060005A6 */  sh         $a1, 0x6($s0)
/* 5AE04 8006A604 7C0120AE */  sw         $zero, 0x17C($s1)
/* 5AE08 8006A608 780120AE */  sw         $zero, 0x178($s1)
/* 5AE0C 8006A60C 740120AE */  sw         $zero, 0x174($s1)
/* 5AE10 8006A610 880120AE */  sw         $zero, 0x188($s1)
/* 5AE14 8006A614 840120AE */  sw         $zero, 0x184($s1)
/* 5AE18 8006A618 A9A7010C */  jal        ResetOrientation
/* 5AE1C 8006A61C 800120AE */   sw        $zero, 0x180($s1)
/* 5AE20 8006A620 22BD010C */  jal        PHYSOBS_CheckForValidMove
/* 5AE24 8006A624 21202002 */   addu      $a0, $s1, $zero
/* 5AE28 8006A628 21904000 */  addu       $s2, $v0, $zero
/* 5AE2C 8006A62C 01004232 */  andi       $v0, $s2, 0x1
/* 5AE30 8006A630 11004010 */  beqz       $v0, .L8006A678
/* 5AE34 8006A634 21104002 */   addu      $v0, $s2, $zero
/* 5AE38 8006A638 5C002296 */  lhu        $v0, 0x5C($s1)
/* 5AE3C 8006A63C 00000000 */  nop
/* 5AE40 8006A640 0E0002A6 */  sh         $v0, 0xE($s0)
/* 5AE44 8006A644 5E002296 */  lhu        $v0, 0x5E($s1)
/* 5AE48 8006A648 00000000 */  nop
/* 5AE4C 8006A64C 100002A6 */  sh         $v0, 0x10($s0)
/* 5AE50 8006A650 0000028E */  lw         $v0, 0x0($s0)
/* 5AE54 8006A654 60002396 */  lhu        $v1, 0x60($s1)
/* 5AE58 8006A658 00104234 */  ori        $v0, $v0, 0x1000
/* 5AE5C 8006A65C 000002AE */  sw         $v0, 0x0($s0)
/* 5AE60 8006A660 120003A6 */  sh         $v1, 0x12($s0)
/* 5AE64 8006A664 1800228E */  lw         $v0, 0x18($s1)
/* 5AE68 8006A668 00000000 */  nop
/* 5AE6C 8006A66C 08004234 */  ori        $v0, $v0, 0x8
/* 5AE70 8006A670 180022AE */  sw         $v0, 0x18($s1)
.L8006A674:
/* 5AE74 8006A674 21104002 */  addu       $v0, $s2, $zero
.L8006A678:
/* 5AE78 8006A678 2800BF8F */  lw         $ra, 0x28($sp)
/* 5AE7C 8006A67C 2400B38F */  lw         $s3, 0x24($sp)
/* 5AE80 8006A680 2000B28F */  lw         $s2, 0x20($sp)
/* 5AE84 8006A684 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5AE88 8006A688 1800B08F */  lw         $s0, 0x18($sp)
/* 5AE8C 8006A68C 0800E003 */  jr         $ra
/* 5AE90 8006A690 3000BD27 */   addiu     $sp, $sp, 0x30
.size FlipPhysOb, . - FlipPhysOb
