.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ThrownEntry
/* 79394 80088B94 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 79398 80088B98 1000B0AF */  sw         $s0, 0x10($sp)
/* 7939C 80088B9C 21808000 */  addu       $s0, $a0, $zero
/* 793A0 80088BA0 1800BFAF */  sw         $ra, 0x18($sp)
/* 793A4 80088BA4 1400B1AF */  sw         $s1, 0x14($sp)
/* 793A8 80088BA8 6C01118E */  lw         $s1, 0x16C($s0)
/* 793AC 80088BAC 800100AE */  sw         $zero, 0x180($s0)
/* 793B0 80088BB0 F8FF0224 */  addiu      $v0, $zero, -0x8
/* 793B4 80088BB4 10000524 */  addiu      $a1, $zero, 0x10
/* 793B8 80088BB8 02000624 */  addiu      $a2, $zero, 0x2
/* 793BC 80088BBC 840100AE */  sw         $zero, 0x184($s0)
/* 793C0 80088BC0 B6FF010C */  jal        MON_PlayAnim
/* 793C4 80088BC4 880102AE */   sw        $v0, 0x188($s0)
/* 793C8 80088BC8 1000023C */  lui        $v0, (0x100000 >> 16)
/* 793CC 80088BCC 080122AE */  sw         $v0, 0x108($s1)
/* 793D0 80088BD0 1C00028E */  lw         $v0, 0x1C($s0)
/* 793D4 80088BD4 00000000 */  nop
/* 793D8 80088BD8 0000428C */  lw         $v0, 0x0($v0)
/* 793DC 80088BDC 00000000 */  nop
/* 793E0 80088BE0 00024230 */  andi       $v0, $v0, 0x200
/* 793E4 80088BE4 05004010 */  beqz       $v0, .L80088BFC
/* 793E8 80088BE8 00000000 */   nop
/* 793EC 80088BEC 1800028E */  lw         $v0, 0x18($s0)
/* 793F0 80088BF0 00000000 */  nop
/* 793F4 80088BF4 40004234 */  ori        $v0, $v0, 0x40
/* 793F8 80088BF8 180002AE */  sw         $v0, 0x18($s0)
.L80088BFC:
/* 793FC 80088BFC 5800028E */  lw         $v0, 0x58($s0)
/* 79400 80088C00 00000000 */  nop
/* 79404 80088C04 20004234 */  ori        $v0, $v0, 0x20
/* 79408 80088C08 580002AE */  sw         $v0, 0x58($s0)
/* 7940C 80088C0C 0000228E */  lw         $v0, 0x0($s1)
/* 79410 80088C10 FDFF0324 */  addiu      $v1, $zero, -0x3
/* 79414 80088C14 24104300 */  and        $v0, $v0, $v1
/* 79418 80088C18 000022AE */  sw         $v0, 0x0($s1)
/* 7941C 80088C1C 1800BF8F */  lw         $ra, 0x18($sp)
/* 79420 80088C20 1400B18F */  lw         $s1, 0x14($sp)
/* 79424 80088C24 1000B08F */  lw         $s0, 0x10($sp)
/* 79428 80088C28 0800E003 */  jr         $ra
/* 7942C 80088C2C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_ThrownEntry, . - MON_ThrownEntry
