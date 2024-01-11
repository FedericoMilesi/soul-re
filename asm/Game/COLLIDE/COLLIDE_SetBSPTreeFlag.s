.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_SetBSPTreeFlag
/* 15628 80024E28 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1562C 80024E2C 1000B0AF */  sw         $s0, 0x10($sp)
/* 15630 80024E30 1400BFAF */  sw         $ra, 0x14($sp)
/* 15634 80024E34 8093000C */  jal        COLLIDE_GetBSPTreeFlag
/* 15638 80024E38 2180A000 */   addu      $s0, $a1, $zero
/* 1563C 80024E3C 00004394 */  lhu        $v1, 0x0($v0)
/* 15640 80024E40 00000000 */  nop
/* 15644 80024E44 25187000 */  or         $v1, $v1, $s0
/* 15648 80024E48 000043A4 */  sh         $v1, 0x0($v0)
/* 1564C 80024E4C 1400BF8F */  lw         $ra, 0x14($sp)
/* 15650 80024E50 1000B08F */  lw         $s0, 0x10($sp)
/* 15654 80024E54 0800E003 */  jr         $ra
/* 15658 80024E58 1800BD27 */   addiu     $sp, $sp, 0x18
.size COLLIDE_SetBSPTreeFlag, . - COLLIDE_SetBSPTreeFlag
