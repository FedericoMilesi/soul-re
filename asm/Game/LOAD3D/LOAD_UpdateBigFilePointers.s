.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_UpdateBigFilePointers
/* 28C98 80038498 F8BB828F */  lw         $v0, %gp_rel(loadStatus + 0x64)($gp)
/* 28C9C 8003849C 00000000 */  nop
/* 28CA0 800384A0 02004414 */  bne        $v0, $a0, .L800384AC
/* 28CA4 800384A4 00000000 */   nop
/* 28CA8 800384A8 F8BB85AF */  sw         $a1, %gp_rel(loadStatus + 0x64)($gp)
.L800384AC:
/* 28CAC 800384AC FCBB828F */  lw         $v0, %gp_rel(loadStatus + 0x68)($gp)
/* 28CB0 800384B0 00000000 */  nop
/* 28CB4 800384B4 02004414 */  bne        $v0, $a0, .L800384C0
/* 28CB8 800384B8 00000000 */   nop
/* 28CBC 800384BC FCBB85AF */  sw         $a1, %gp_rel(loadStatus + 0x68)($gp)
.L800384C0:
/* 28CC0 800384C0 0800E003 */  jr         $ra
/* 28CC4 800384C4 00000000 */   nop
.size LOAD_UpdateBigFilePointers, . - LOAD_UpdateBigFilePointers
