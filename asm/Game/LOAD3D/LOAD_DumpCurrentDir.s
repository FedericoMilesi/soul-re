.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_DumpCurrentDir
/* 28B1C 8003831C F8BB848F */  lw         $a0, %gp_rel(loadStatus + 0x64)($gp)
/* 28B20 80038320 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28B24 80038324 05008010 */  beqz       $a0, .L8003833C
/* 28B28 80038328 1000BFAF */   sw        $ra, 0x10($sp)
/* 28B2C 8003832C 2641010C */  jal        MEMPACK_Free
/* 28B30 80038330 00000000 */   nop
/* 28B34 80038334 F8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x64)($gp)
/* 28B38 80038338 00BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x6C)($gp)
.L8003833C:
/* 28B3C 8003833C FCBB848F */  lw         $a0, %gp_rel(loadStatus + 0x68)($gp)
/* 28B40 80038340 00000000 */  nop
/* 28B44 80038344 05008010 */  beqz       $a0, .L8003835C
/* 28B48 80038348 00000000 */   nop
/* 28B4C 8003834C 2641010C */  jal        MEMPACK_Free
/* 28B50 80038350 00000000 */   nop
/* 28B54 80038354 FCBB80AF */  sw         $zero, %gp_rel(loadStatus + 0x68)($gp)
/* 28B58 80038358 04BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x70)($gp)
.L8003835C:
/* 28B5C 8003835C 1000BF8F */  lw         $ra, 0x10($sp)
/* 28B60 80038360 00000000 */  nop
/* 28B64 80038364 0800E003 */  jr         $ra
/* 28B68 80038368 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_DumpCurrentDir, . - LOAD_DumpCurrentDir
