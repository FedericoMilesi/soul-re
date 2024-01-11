.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_FogLoad
/* 37FC 80012FFC F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 3800 80013000 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3804 80013004 1000BFAF */  sw         $ra, 0x10($sp)
/* 3808 80013008 FC62010C */  jal        FindStreamUnitFromLevel
/* 380C 8001300C 00000000 */   nop
/* 3810 80013010 38004384 */  lh         $v1, 0x38($v0)
/* 3814 80013014 3A004484 */  lh         $a0, 0x3A($v0)
/* 3818 80013018 1000BF8F */  lw         $ra, 0x10($sp)
/* 381C 8001301C 408083AF */  sw         $v1, %gp_rel(debugFogFar)($gp)
/* 3820 80013020 3CAB83A7 */  sh         $v1, %gp_rel(debugOrgFogFar)($gp)
/* 3824 80013024 448084AF */  sw         $a0, %gp_rel(debugFogNear)($gp)
/* 3828 80013028 2CAB84A7 */  sh         $a0, %gp_rel(debugOrgFogNear)($gp)
/* 382C 8001302C 32004390 */  lbu        $v1, 0x32($v0)
/* 3830 80013030 00000000 */  nop
/* 3834 80013034 548083AF */  sw         $v1, %gp_rel(debugFogBlu)($gp)
/* 3838 80013038 38AB83A3 */  sb         $v1, %gp_rel(debugOrgFogBlu)($gp)
/* 383C 8001303C 31004390 */  lbu        $v1, 0x31($v0)
/* 3840 80013040 00000000 */  nop
/* 3844 80013044 508083AF */  sw         $v1, %gp_rel(debugFogGrn)($gp)
/* 3848 80013048 34AB83A3 */  sb         $v1, %gp_rel(debugOrgFogGrn)($gp)
/* 384C 8001304C 30004290 */  lbu        $v0, 0x30($v0)
/* 3850 80013050 00000000 */  nop
/* 3854 80013054 4C8082AF */  sw         $v0, %gp_rel(debugFogRed)($gp)
/* 3858 80013058 30AB82A3 */  sb         $v0, %gp_rel(debugOrgFogRed)($gp)
/* 385C 8001305C 0800E003 */  jr         $ra
/* 3860 80013060 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_FogLoad, . - DEBUG_FogLoad
