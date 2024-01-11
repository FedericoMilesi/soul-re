.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_FreeMainMenuStuff
/* 29A4C 8003924C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29A50 80039250 1000BFAF */  sw         $ra, 0x10($sp)
/* 29A54 80039254 C9E4020C */  jal        menuface_terminate
/* 29A58 80039258 00000000 */   nop
/* 29A5C 8003925C C9CB010C */  jal        VRAM_DisableTerrainArea
/* 29A60 80039260 00000000 */   nop
/* 29A64 80039264 BC95848F */  lw         $a0, %gp_rel(mainMenuScreen)($gp)
/* 29A68 80039268 00000000 */  nop
/* 29A6C 8003926C 04008010 */  beqz       $a0, .L80039280
/* 29A70 80039270 00000000 */   nop
/* 29A74 80039274 2641010C */  jal        MEMPACK_Free
/* 29A78 80039278 00000000 */   nop
/* 29A7C 8003927C BC9580AF */  sw         $zero, %gp_rel(mainMenuScreen)($gp)
.L80039280:
/* 29A80 80039280 38BC848F */  lw         $a0, %gp_rel(mainMenuSfx)($gp)
/* 29A84 80039284 EC4A010C */  jal        aadFreeDynamicSfx
/* 29A88 80039288 00000000 */   nop
.L8003928C:
/* 29A8C 8003928C AF4B010C */  jal        aadGetNumLoadsQueued
/* 29A90 80039290 00000000 */   nop
/* 29A94 80039294 05004010 */  beqz       $v0, .L800392AC
/* 29A98 80039298 00000000 */   nop
/* 29A9C 8003929C BA4B010C */  jal        aadProcessLoadQueue
/* 29AA0 800392A0 00000000 */   nop
/* 29AA4 800392A4 A3E40008 */  j          .L8003928C
/* 29AA8 800392A8 00000000 */   nop
.L800392AC:
/* 29AAC 800392AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 29AB0 800392B0 00000000 */  nop
/* 29AB4 800392B4 0800E003 */  jr         $ra
/* 29AB8 800392B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_FreeMainMenuStuff, . - MAIN_FreeMainMenuStuff
