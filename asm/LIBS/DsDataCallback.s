.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DsDataCallback
/* B812C 800C792C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B8130 800C7930 1000BFAF */  sw         $ra, 0x10($sp)
/* B8134 800C7934 21288000 */  addu       $a1, $a0, $zero
/* B8138 800C7938 B7E6020C */  jal        DMACallback
/* B813C 800C793C 03000424 */   addiu     $a0, $zero, 0x3
/* B8140 800C7940 1000BF8F */  lw         $ra, 0x10($sp)
/* B8144 800C7944 1800BD27 */  addiu      $sp, $sp, 0x18
/* B8148 800C7948 0800E003 */  jr         $ra
/* B814C 800C794C 00000000 */   nop
.size DsDataCallback, . - DsDataCallback
