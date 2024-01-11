.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateSwitchStateCharacterData
/* 633D0 80072BD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 633D4 80072BD4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 633D8 80072BD8 21988000 */  addu       $s3, $a0, $zero
/* 633DC 80072BDC 2400B5AF */  sw         $s5, 0x24($sp)
/* 633E0 80072BE0 21A8A000 */  addu       $s5, $a1, $zero
/* 633E4 80072BE4 2800B6AF */  sw         $s6, 0x28($sp)
/* 633E8 80072BE8 21B0C000 */  addu       $s6, $a2, $zero
/* 633EC 80072BEC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 633F0 80072BF0 2000B4AF */  sw         $s4, 0x20($sp)
/* 633F4 80072BF4 1800B2AF */  sw         $s2, 0x18($sp)
/* 633F8 80072BF8 1400B1AF */  sw         $s1, 0x14($sp)
/* 633FC 80072BFC 1000B0AF */  sw         $s0, 0x10($sp)
/* 63400 80072C00 0400628E */  lw         $v0, 0x4($s3)
/* 63404 80072C04 00000000 */  nop
/* 63408 80072C08 24004018 */  blez       $v0, .L80072C9C
/* 6340C 80072C0C 21880000 */   addu      $s1, $zero, $zero
/* 63410 80072C10 21906002 */  addu       $s2, $s3, $zero
/* 63414 80072C14 08001424 */  addiu      $s4, $zero, 0x8
.L80072C18:
/* 63418 80072C18 21807402 */  addu       $s0, $s3, $s4
/* 6341C 80072C1C 04001026 */  addiu      $s0, $s0, 0x4
/* 63420 80072C20 36C3010C */  jal        PurgeMessageQueue
/* 63424 80072C24 21200002 */   addu      $a0, $s0, $zero
/* 63428 80072C28 21200002 */  addu       $a0, $s0, $zero
/* 6342C 80072C2C 1000053C */  lui        $a1, (0x100004 >> 16)
/* 63430 80072C30 0400A534 */  ori        $a1, $a1, (0x100004 & 0xFFFF)
/* 63434 80072C34 4EC3010C */  jal        EnMessageQueueData
/* 63438 80072C38 21300000 */   addu      $a2, $zero, $zero
/* 6343C 80072C3C 21206002 */  addu       $a0, $s3, $zero
/* 63440 80072C40 21282002 */  addu       $a1, $s1, $zero
/* 63444 80072C44 21300000 */  addu       $a2, $zero, $zero
/* 63448 80072C48 0800428E */  lw         $v0, 0x8($s2)
/* 6344C 80072C4C 00000000 */  nop
/* 63450 80072C50 09F84000 */  jalr       $v0
/* 63454 80072C54 1C019426 */   addiu     $s4, $s4, 0x11C
/* 63458 80072C58 36C3010C */  jal        PurgeMessageQueue
/* 6345C 80072C5C 21200002 */   addu      $a0, $s0, $zero
/* 63460 80072C60 21200002 */  addu       $a0, $s0, $zero
/* 63464 80072C64 1000053C */  lui        $a1, (0x100001 >> 16)
/* 63468 80072C68 0100A534 */  ori        $a1, $a1, (0x100001 & 0xFFFF)
/* 6346C 80072C6C 4EC3010C */  jal        EnMessageQueueData
/* 63470 80072C70 2130C002 */   addu      $a2, $s6, $zero
/* 63474 80072C74 21206002 */  addu       $a0, $s3, $zero
/* 63478 80072C78 21282002 */  addu       $a1, $s1, $zero
/* 6347C 80072C7C 21300000 */  addu       $a2, $zero, $zero
/* 63480 80072C80 09F8A002 */  jalr       $s5
/* 63484 80072C84 080055AE */   sw        $s5, 0x8($s2)
/* 63488 80072C88 0400628E */  lw         $v0, 0x4($s3)
/* 6348C 80072C8C 01003126 */  addiu      $s1, $s1, 0x1
/* 63490 80072C90 2A102202 */  slt        $v0, $s1, $v0
/* 63494 80072C94 E0FF4014 */  bnez       $v0, .L80072C18
/* 63498 80072C98 1C015226 */   addiu     $s2, $s2, 0x11C
.L80072C9C:
/* 6349C 80072C9C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 634A0 80072CA0 2800B68F */  lw         $s6, 0x28($sp)
/* 634A4 80072CA4 2400B58F */  lw         $s5, 0x24($sp)
/* 634A8 80072CA8 2000B48F */  lw         $s4, 0x20($sp)
/* 634AC 80072CAC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 634B0 80072CB0 1800B28F */  lw         $s2, 0x18($sp)
/* 634B4 80072CB4 1400B18F */  lw         $s1, 0x14($sp)
/* 634B8 80072CB8 1000B08F */  lw         $s0, 0x10($sp)
/* 634BC 80072CBC 0800E003 */  jr         $ra
/* 634C0 80072CC0 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateSwitchStateCharacterData, . - StateSwitchStateCharacterData
