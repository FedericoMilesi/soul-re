.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_AngleFromPosToPos
/* 2AA1C 8003A21C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2AA20 8003A220 1000BFAF */  sw         $ra, 0x10($sp)
/* 2AA24 8003A224 02008684 */  lh         $a2, 0x2($a0)
/* 2AA28 8003A228 0200A284 */  lh         $v0, 0x2($a1)
/* 2AA2C 8003A22C 00008384 */  lh         $v1, 0x0($a0)
/* 2AA30 8003A230 0000A584 */  lh         $a1, 0x0($a1)
/* 2AA34 8003A234 2320C200 */  subu       $a0, $a2, $v0
/* 2AA38 8003A238 26F3020C */  jal        ratan2
/* 2AA3C 8003A23C 23286500 */   subu      $a1, $v1, $a1
/* 2AA40 8003A240 000C4224 */  addiu      $v0, $v0, 0xC00
/* 2AA44 8003A244 1000BF8F */  lw         $ra, 0x10($sp)
/* 2AA48 8003A248 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 2AA4C 8003A24C 0800E003 */  jr         $ra
/* 2AA50 8003A250 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH3D_AngleFromPosToPos, . - MATH3D_AngleFromPosToPos
