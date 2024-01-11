.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_DefaultQueueHandler
/* 76424 80085C24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 76428 80085C28 1000B0AF */  sw         $s0, 0x10($sp)
/* 7642C 80085C2C 21808000 */  addu       $s0, $a0, $zero
/* 76430 80085C30 1800BFAF */  sw         $ra, 0x18($sp)
/* 76434 80085C34 1400B1AF */  sw         $s1, 0x14($sp)
/* 76438 80085C38 6C01118E */  lw         $s1, 0x16C($s0)
.L80085C3C:
/* 7643C 80085C3C 27C3010C */  jal        DeMessageQueue
/* 76440 80085C40 08002426 */   addiu     $a0, $s1, 0x8
/* 76444 80085C44 05004010 */  beqz       $v0, .L80085C5C
/* 76448 80085C48 21200002 */   addu      $a0, $s0, $zero
/* 7644C 80085C4C 6513020C */  jal        MON_DefaultMessageHandler
/* 76450 80085C50 21284000 */   addu      $a1, $v0, $zero
/* 76454 80085C54 0F170208 */  j          .L80085C3C
/* 76458 80085C58 00000000 */   nop
.L80085C5C:
/* 7645C 80085C5C 1800BF8F */  lw         $ra, 0x18($sp)
/* 76460 80085C60 1400B18F */  lw         $s1, 0x14($sp)
/* 76464 80085C64 1000B08F */  lw         $s0, 0x10($sp)
/* 76468 80085C68 0800E003 */  jr         $ra
/* 7646C 80085C6C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_DefaultQueueHandler, . - MON_DefaultQueueHandler
