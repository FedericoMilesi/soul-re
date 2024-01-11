.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_SetUnityMatrix
/* 2A930 8003A130 00100224 */  addiu      $v0, $zero, 0x1000
/* 2A934 8003A134 000082AC */  sw         $v0, 0x0($a0)
/* 2A938 8003A138 040080AC */  sw         $zero, 0x4($a0)
/* 2A93C 8003A13C 080082AC */  sw         $v0, 0x8($a0)
/* 2A940 8003A140 0C0080AC */  sw         $zero, 0xC($a0)
/* 2A944 8003A144 0800E003 */  jr         $ra
/* 2A948 8003A148 100082A4 */   sh        $v0, 0x10($a0)
.size MATH3D_SetUnityMatrix, . - MATH3D_SetUnityMatrix
