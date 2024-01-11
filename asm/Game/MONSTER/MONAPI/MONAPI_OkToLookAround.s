.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_OkToLookAround
/* 6FB2C 8007F32C 9801828C */  lw         $v0, 0x198($a0)
/* 6FB30 8007F330 00000000 */  nop
/* 6FB34 8007F334 02004238 */  xori       $v0, $v0, 0x2
/* 6FB38 8007F338 0800E003 */  jr         $ra
/* 6FB3C 8007F33C 0100422C */   sltiu     $v0, $v0, 0x1
.size MONAPI_OkToLookAround, . - MONAPI_OkToLookAround
