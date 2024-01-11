.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_end
/* A9F98 800B9798 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9F9C 800B979C 1000B0AF */  sw         $s0, 0x10($sp)
/* A9FA0 800B97A0 21808000 */  addu       $s0, $a0, $zero
/* A9FA4 800B97A4 1400BFAF */  sw         $ra, 0x14($sp)
/* A9FA8 800B97A8 0400028E */  lw         $v0, 0x4($s0)
/* A9FAC 800B97AC 0800048E */  lw         $a0, 0x8($s0)
/* A9FB0 800B97B0 1000428C */  lw         $v0, 0x10($v0)
/* A9FB4 800B97B4 00000000 */  nop
/* A9FB8 800B97B8 09F84000 */  jalr       $v0
/* A9FBC 800B97BC 00000000 */   nop
/* A9FC0 800B97C0 9FE5020C */  jal        unload
/* A9FC4 800B97C4 21200002 */   addu      $a0, $s0, $zero
/* A9FC8 800B97C8 0C0000A6 */  sh         $zero, 0xC($s0)
/* A9FCC 800B97CC 1400BF8F */  lw         $ra, 0x14($sp)
/* A9FD0 800B97D0 1000B08F */  lw         $s0, 0x10($sp)
/* A9FD4 800B97D4 0800E003 */  jr         $ra
/* A9FD8 800B97D8 1800BD27 */   addiu     $sp, $sp, 0x18
.size memcard_end, . - memcard_end
