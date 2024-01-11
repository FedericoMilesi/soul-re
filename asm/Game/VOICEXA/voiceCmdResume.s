.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel voiceCmdResume
/* A7878 800B7078 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A787C 800B707C 1000BFAF */  sw         $ra, 0x10($sp)
/* A7880 800B7080 AA008390 */  lbu        $v1, 0xAA($a0)
/* A7884 800B7084 03000224 */  addiu      $v0, $zero, 0x3
/* A7888 800B7088 04006214 */  bne        $v1, $v0, .L800B709C
/* A788C 800B708C 1B000524 */   addiu     $a1, $zero, 0x1B
/* A7890 800B7090 04000624 */  addiu      $a2, $zero, 0x4
/* A7894 800B7094 EBDA020C */  jal        putCdCommand
/* A7898 800B7098 21388000 */   addu      $a3, $a0, $zero
.L800B709C:
/* A789C 800B709C 1000BF8F */  lw         $ra, 0x10($sp)
/* A78A0 800B70A0 00000000 */  nop
/* A78A4 800B70A4 0800E003 */  jr         $ra
/* A78A8 800B70A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size voiceCmdResume, . - voiceCmdResume
