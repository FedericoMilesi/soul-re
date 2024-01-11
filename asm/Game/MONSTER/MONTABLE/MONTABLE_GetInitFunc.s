.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_GetInitFunc
/* 7D938 8008D138 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D93C 8008D13C 00000000 */  nop
/* 7D940 8008D140 4000428C */  lw         $v0, 0x40($v0)
/* 7D944 8008D144 00000000 */  nop
/* 7D948 8008D148 05004010 */  beqz       $v0, .L8008D160
/* 7D94C 8008D14C 00000000 */   nop
/* 7D950 8008D150 0000428C */  lw         $v0, 0x0($v0)
/* 7D954 8008D154 00000000 */  nop
/* 7D958 8008D158 02004014 */  bnez       $v0, .L8008D164
/* 7D95C 8008D15C 00000000 */   nop
.L8008D160:
/* 7D960 8008D160 B0A5828F */  lw         $v0, %gp_rel(DefaultFunctionTable)($gp)
.L8008D164:
/* 7D964 8008D164 0800E003 */  jr         $ra
/* 7D968 8008D168 00000000 */   nop
.size MONTABLE_GetInitFunc, . - MONTABLE_GetInitFunc
