.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PupateQueueHandler
/* 7638C 80085B8C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 76390 80085B90 1000B0AF */  sw         $s0, 0x10($sp)
/* 76394 80085B94 21808000 */  addu       $s0, $a0, $zero
/* 76398 80085B98 1800BFAF */  sw         $ra, 0x18($sp)
/* 7639C 80085B9C 1400B1AF */  sw         $s1, 0x14($sp)
/* 763A0 80085BA0 6C01118E */  lw         $s1, 0x16C($s0)
.L80085BA4:
/* 763A4 80085BA4 27C3010C */  jal        DeMessageQueue
/* 763A8 80085BA8 08002426 */   addiu     $a0, $s1, 0x8
/* 763AC 80085BAC 05004010 */  beqz       $v0, .L80085BC4
/* 763B0 80085BB0 21200002 */   addu      $a0, $s0, $zero
/* 763B4 80085BB4 8312020C */  jal        MON_PupateMessageHandler
/* 763B8 80085BB8 21284000 */   addu      $a1, $v0, $zero
/* 763BC 80085BBC E9160208 */  j          .L80085BA4
/* 763C0 80085BC0 00000000 */   nop
.L80085BC4:
/* 763C4 80085BC4 1800BF8F */  lw         $ra, 0x18($sp)
/* 763C8 80085BC8 1400B18F */  lw         $s1, 0x14($sp)
/* 763CC 80085BCC 1000B08F */  lw         $s0, 0x10($sp)
/* 763D0 80085BD0 0800E003 */  jr         $ra
/* 763D4 80085BD4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_PupateQueueHandler, . - MON_PupateQueueHandler
