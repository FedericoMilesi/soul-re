.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_ForceActive
/* 22B08 80032308 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 22B0C 8003230C 1000BFAF */  sw         $ra, 0x10($sp)
/* 22B10 80032310 1800828C */  lw         $v0, 0x18($a0)
/* 22B14 80032314 00000000 */  nop
/* 22B18 80032318 01004230 */  andi       $v0, $v0, 0x1
/* 22B1C 8003231C 03004010 */  beqz       $v0, .L8003232C
/* 22B20 80032320 00000000 */   nop
/* 22B24 80032324 9CC8000C */  jal        INSTANCE_Reactivate
/* 22B28 80032328 00000000 */   nop
.L8003232C:
/* 22B2C 8003232C 1000BF8F */  lw         $ra, 0x10($sp)
/* 22B30 80032330 00000000 */  nop
/* 22B34 80032334 0800E003 */  jr         $ra
/* 22B38 80032338 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_ForceActive, . - INSTANCE_ForceActive
