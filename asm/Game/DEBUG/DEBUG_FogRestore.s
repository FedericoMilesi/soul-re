.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_FogRestore
/* 3864 80013064 3CAB8287 */  lh         $v0, %gp_rel(debugOrgFogFar)($gp)
/* 3868 80013068 2CAB8387 */  lh         $v1, %gp_rel(debugOrgFogNear)($gp)
/* 386C 8001306C 30AB8493 */  lbu        $a0, %gp_rel(debugOrgFogRed)($gp)
/* 3870 80013070 34AB8593 */  lbu        $a1, %gp_rel(debugOrgFogGrn)($gp)
/* 3874 80013074 38AB8693 */  lbu        $a2, %gp_rel(debugOrgFogBlu)($gp)
/* 3878 80013078 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 387C 8001307C 1000BFAF */  sw         $ra, 0x10($sp)
/* 3880 80013080 4C8084AF */  sw         $a0, %gp_rel(debugFogRed)($gp)
/* 3884 80013084 408082AF */  sw         $v0, %gp_rel(debugFogFar)($gp)
/* 3888 80013088 448083AF */  sw         $v1, %gp_rel(debugFogNear)($gp)
/* 388C 8001308C 508085AF */  sw         $a1, %gp_rel(debugFogGrn)($gp)
/* 3890 80013090 548086AF */  sw         $a2, %gp_rel(debugFogBlu)($gp)
/* 3894 80013094 C14B000C */  jal        DEBUG_UpdateFog
/* 3898 80013098 21200000 */   addu      $a0, $zero, $zero
/* 389C 8001309C 1000BF8F */  lw         $ra, 0x10($sp)
/* 38A0 800130A0 00000000 */  nop
/* 38A4 800130A4 0800E003 */  jr         $ra
/* 38A8 800130A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_FogRestore, . - DEBUG_FogRestore
