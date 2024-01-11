.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_IdleQueueHandler
/* 763D8 80085BD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 763DC 80085BDC 1000B0AF */  sw         $s0, 0x10($sp)
/* 763E0 80085BE0 21808000 */  addu       $s0, $a0, $zero
/* 763E4 80085BE4 1800BFAF */  sw         $ra, 0x18($sp)
/* 763E8 80085BE8 1400B1AF */  sw         $s1, 0x14($sp)
/* 763EC 80085BEC 6C01118E */  lw         $s1, 0x16C($s0)
.L80085BF0:
/* 763F0 80085BF0 27C3010C */  jal        DeMessageQueue
/* 763F4 80085BF4 08002426 */   addiu     $a0, $s1, 0x8
/* 763F8 80085BF8 05004010 */  beqz       $v0, .L80085C10
/* 763FC 80085BFC 21200002 */   addu      $a0, $s0, $zero
/* 76400 80085C00 1413020C */  jal        MON_IdleMessageHandler
/* 76404 80085C04 21284000 */   addu      $a1, $v0, $zero
/* 76408 80085C08 FC160208 */  j          .L80085BF0
/* 7640C 80085C0C 00000000 */   nop
.L80085C10:
/* 76410 80085C10 1800BF8F */  lw         $ra, 0x18($sp)
/* 76414 80085C14 1400B18F */  lw         $s1, 0x14($sp)
/* 76418 80085C18 1000B08F */  lw         $s0, 0x10($sp)
/* 7641C 80085C1C 0800E003 */  jr         $ra
/* 76420 80085C20 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_IdleQueueHandler, . - MON_IdleQueueHandler
