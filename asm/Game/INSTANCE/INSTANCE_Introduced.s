.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Introduced
/* 23378 80032B78 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 2337C 80032B7C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 23380 80032B80 1000B0AF */  sw         $s0, 0x10($sp)
/* 23384 80032B84 21808000 */  addu       $s0, $a0, $zero
/* 23388 80032B88 1800BFAF */  sw         $ra, 0x18($sp)
/* 2338C 80032B8C 1400B1AF */  sw         $s1, 0x14($sp)
/* 23390 80032B90 0400438C */  lw         $v1, 0x4($v0)
/* 23394 80032B94 00000000 */  nop
/* 23398 80032B98 08006010 */  beqz       $v1, .L80032BBC
/* 2339C 80032B9C 21880000 */   addu      $s1, $zero, $zero
/* 233A0 80032BA0 1400048E */  lw         $a0, 0x14($s0)
.L80032BA4:
/* 233A4 80032BA4 3C00628C */  lw         $v0, 0x3C($v1)
/* 233A8 80032BA8 0800638C */  lw         $v1, 0x8($v1)
/* 233AC 80032BAC 0D008210 */  beq        $a0, $v0, .L80032BE4
/* 233B0 80032BB0 00000000 */   nop
/* 233B4 80032BB4 FBFF6014 */  bnez       $v1, .L80032BA4
/* 233B8 80032BB8 00000000 */   nop
.L80032BBC:
/* 233BC 80032BBC 17002016 */  bnez       $s1, .L80032C1C
/* 233C0 80032BC0 21102002 */   addu      $v0, $s1, $zero
/* 233C4 80032BC4 21200002 */  addu       $a0, $s0, $zero
/* 233C8 80032BC8 002C0500 */  sll        $a1, $a1, 16
/* 233CC 80032BCC 09D7020C */  jal        SAVE_HasSavedIntro
/* 233D0 80032BD0 032C0500 */   sra       $a1, $a1, 16
/* 233D4 80032BD4 08004010 */  beqz       $v0, .L80032BF8
/* 233D8 80032BD8 00000000 */   nop
/* 233DC 80032BDC 02CB0008 */  j          .L80032C08
/* 233E0 80032BE0 00000000 */   nop
.L80032BE4:
/* 233E4 80032BE4 2C00028E */  lw         $v0, 0x2C($s0)
/* 233E8 80032BE8 01001124 */  addiu      $s1, $zero, 0x1
/* 233EC 80032BEC 08004234 */  ori        $v0, $v0, 0x8
/* 233F0 80032BF0 EFCA0008 */  j          .L80032BBC
/* 233F4 80032BF4 2C0002AE */   sw        $v0, 0x2C($s0)
.L80032BF8:
/* 233F8 80032BF8 5ED9020C */  jal        SAVE_IsIntroDeadDead
/* 233FC 80032BFC 21200002 */   addu      $a0, $s0, $zero
/* 23400 80032C00 06004010 */  beqz       $v0, .L80032C1C
/* 23404 80032C04 21102002 */   addu      $v0, $s1, $zero
.L80032C08:
/* 23408 80032C08 2C00028E */  lw         $v0, 0x2C($s0)
/* 2340C 80032C0C 01001124 */  addiu      $s1, $zero, 0x1
/* 23410 80032C10 08004234 */  ori        $v0, $v0, 0x8
/* 23414 80032C14 2C0002AE */  sw         $v0, 0x2C($s0)
/* 23418 80032C18 21102002 */  addu       $v0, $s1, $zero
.L80032C1C:
/* 2341C 80032C1C 1800BF8F */  lw         $ra, 0x18($sp)
/* 23420 80032C20 1400B18F */  lw         $s1, 0x14($sp)
/* 23424 80032C24 1000B08F */  lw         $s0, 0x10($sp)
/* 23428 80032C28 0800E003 */  jr         $ra
/* 2342C 80032C2C 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_Introduced, . - INSTANCE_Introduced
