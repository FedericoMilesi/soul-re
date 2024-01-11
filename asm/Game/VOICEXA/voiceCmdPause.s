.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel voiceCmdPause
/* A783C 800B703C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A7840 800B7040 1000BFAF */  sw         $ra, 0x10($sp)
/* A7844 800B7044 AA008290 */  lbu        $v0, 0xAA($a0)
/* A7848 800B7048 00000000 */  nop
/* A784C 800B704C FFFF4224 */  addiu      $v0, $v0, -0x1
/* A7850 800B7050 0200422C */  sltiu      $v0, $v0, 0x2
/* A7854 800B7054 04004010 */  beqz       $v0, .L800B7068
/* A7858 800B7058 09000524 */   addiu     $a1, $zero, 0x9
/* A785C 800B705C 21300000 */  addu       $a2, $zero, $zero
/* A7860 800B7060 EBDA020C */  jal        putCdCommand
/* A7864 800B7064 2138C000 */   addu      $a3, $a2, $zero
.L800B7068:
/* A7868 800B7068 1000BF8F */  lw         $ra, 0x10($sp)
/* A786C 800B706C 00000000 */  nop
/* A7870 800B7070 0800E003 */  jr         $ra
/* A7874 800B7074 1800BD27 */   addiu     $sp, $sp, 0x18
.size voiceCmdPause, . - voiceCmdPause
