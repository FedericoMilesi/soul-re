.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ModifyObjectToStackWithAttribute
/* 547DC 80063FDC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 547E0 80063FE0 1000BFAF */  sw         $ra, 0x10($sp)
/* 547E4 80063FE4 0000828C */  lw         $v0, 0x0($a0)
/* 547E8 80063FE8 00000000 */  nop
/* 547EC 80063FEC 03004010 */  beqz       $v0, .L80063FFC
/* 547F0 80063FF0 00000000 */   nop
/* 547F4 80063FF4 709D010C */  jal        EVENT_TransformObjectOnStack
/* 547F8 80063FF8 00000000 */   nop
.L80063FFC:
/* 547FC 80063FFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 54800 80064000 00000000 */  nop
/* 54804 80064004 0800E003 */  jr         $ra
/* 54808 80064008 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_ModifyObjectToStackWithAttribute, . - EVENT_ModifyObjectToStackWithAttribute
