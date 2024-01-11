.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetSlotPan
/* 46A34 80056234 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46A38 80056238 1000BFAF */  sw         $ra, 0x10($sp)
/* 46A3C 8005623C 06008390 */  lbu        $v1, 0x6($a0)
/* 46A40 80056240 3805A28C */  lw         $v0, 0x538($a1)
/* 46A44 80056244 00000000 */  nop
/* 46A48 80056248 530543A0 */  sb         $v1, 0x553($v0)
/* 46A4C 8005624C 3805A48C */  lw         $a0, 0x538($a1)
/* 46A50 80056250 E955010C */  jal        aadUpdateSlotVolPan
/* 46A54 80056254 00000000 */   nop
/* 46A58 80056258 1000BF8F */  lw         $ra, 0x10($sp)
/* 46A5C 8005625C 00000000 */  nop
/* 46A60 80056260 0800E003 */  jr         $ra
/* 46A64 80056264 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdSetSlotPan, . - metaCmdSetSlotPan
