.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE4FC
/* AECFC 800BE4FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AED00 800BE500 1000BFAF */  sw         $ra, 0x10($sp)
/* AED04 800BE504 F714030C */  jal        func_800C53DC
/* AED08 800BE508 00000000 */   nop
/* AED0C 800BE50C 1000BF8F */  lw         $ra, 0x10($sp)
/* AED10 800BE510 0100422C */  sltiu      $v0, $v0, 0x1
/* AED14 800BE514 0800E003 */  jr         $ra
/* AED18 800BE518 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BE4FC, . - func_800BE4FC
