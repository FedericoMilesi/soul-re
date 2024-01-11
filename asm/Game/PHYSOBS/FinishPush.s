.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FinishPush
/* 5ABC0 8006A3C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5ABC4 8006A3C4 1000BFAF */  sw         $ra, 0x10($sp)
/* 5ABC8 8006A3C8 A9A7010C */  jal        ResetOrientation
/* 5ABCC 8006A3CC 00000000 */   nop
/* 5ABD0 8006A3D0 1000BF8F */  lw         $ra, 0x10($sp)
/* 5ABD4 8006A3D4 00000000 */  nop
/* 5ABD8 8006A3D8 0800E003 */  jr         $ra
/* 5ABDC 8006A3DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size FinishPush, . - FinishPush
