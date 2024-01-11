.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdLockVoice
/* 48690 80057E90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 48694 80057E94 1400BFAF */  sw         $ra, 0x14($sp)
/* 48698 80057E98 1000B0AF */  sw         $s0, 0x10($sp)
/* 4869C 80057E9C 0400908C */  lw         $s0, 0x4($a0)
/* 486A0 80057EA0 ED5F010C */  jal        aadAllocateVoice
/* 486A4 80057EA4 FF000424 */   addiu     $a0, $zero, 0xFF
/* 486A8 80057EA8 21184000 */  addu       $v1, $v0, $zero
/* 486AC 80057EAC 05006010 */  beqz       $v1, .L80057EC4
/* 486B0 80057EB0 21200000 */   addu      $a0, $zero, $zero
/* 486B4 80057EB4 12006294 */  lhu        $v0, 0x12($v1)
/* 486B8 80057EB8 0000648C */  lw         $a0, 0x0($v1)
/* 486BC 80057EBC 01004234 */  ori        $v0, $v0, 0x1
/* 486C0 80057EC0 120062A4 */  sh         $v0, 0x12($v1)
.L80057EC4:
/* 486C4 80057EC4 09F80002 */  jalr       $s0
/* 486C8 80057EC8 00000000 */   nop
/* 486CC 80057ECC 1400BF8F */  lw         $ra, 0x14($sp)
/* 486D0 80057ED0 1000B08F */  lw         $s0, 0x10($sp)
/* 486D4 80057ED4 0800E003 */  jr         $ra
/* 486D8 80057ED8 1800BD27 */   addiu     $sp, $sp, 0x18
.size sfxCmdLockVoice, . - sfxCmdLockVoice
