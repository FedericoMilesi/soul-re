.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_DoInstanceDeadDead
/* A6D9C 800B659C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6DA0 800B65A0 1000B0AF */  sw         $s0, 0x10($sp)
/* A6DA4 800B65A4 1400BFAF */  sw         $ra, 0x14($sp)
/* A6DA8 800B65A8 B8D8020C */  jal        SAVE_DeleteInstance
/* A6DAC 800B65AC 21808000 */   addu      $s0, $a0, $zero
/* A6DB0 800B65B0 3C00048E */  lw         $a0, 0x3C($s0)
/* A6DB4 800B65B4 ECD8020C */  jal        SAVE_SetDeadDeadBit
/* A6DB8 800B65B8 01000524 */   addiu     $a1, $zero, 0x1
/* A6DBC 800B65BC 1400BF8F */  lw         $ra, 0x14($sp)
/* A6DC0 800B65C0 1000B08F */  lw         $s0, 0x10($sp)
/* A6DC4 800B65C4 0800E003 */  jr         $ra
/* A6DC8 800B65C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_DoInstanceDeadDead, . - SAVE_DoInstanceDeadDead
