.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_CheckGenerator
/* 6FD6C 8007F56C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FD70 8007F570 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 6FD74 8007F574 1000BFAF */  sw         $ra, 0x10($sp)
/* 6FD78 8007F578 10004324 */  addiu      $v1, $v0, 0x10
/* 6FD7C 8007F57C 0E004280 */  lb         $v0, 0xE($v0)
/* 6FD80 8007F580 3C00848C */  lw         $a0, 0x3C($a0)
/* 6FD84 8007F584 10004018 */  blez       $v0, .L8007F5C8
/* 6FD88 8007F588 21280000 */   addu      $a1, $zero, $zero
.L8007F58C:
/* 6FD8C 8007F58C 04006284 */  lh         $v0, 0x4($v1)
/* 6FD90 8007F590 00000000 */  nop
/* 6FD94 8007F594 05004414 */  bne        $v0, $a0, .L8007F5AC
/* 6FD98 8007F598 0100A524 */   addiu     $a1, $a1, 0x1
/* 6FD9C 8007F59C D0FC010C */  jal        MONAPI_DeleteRegen
/* 6FDA0 8007F5A0 21206000 */   addu      $a0, $v1, $zero
/* 6FDA4 8007F5A4 72FD0108 */  j          .L8007F5C8
/* 6FDA8 8007F5A8 00000000 */   nop
.L8007F5AC:
/* 6FDAC 8007F5AC 40A8828F */  lw         $v0, %gp_rel(GlobalSave)($gp)
/* 6FDB0 8007F5B0 00000000 */  nop
/* 6FDB4 8007F5B4 0E004280 */  lb         $v0, 0xE($v0)
/* 6FDB8 8007F5B8 00000000 */  nop
/* 6FDBC 8007F5BC 2A10A200 */  slt        $v0, $a1, $v0
/* 6FDC0 8007F5C0 F2FF4014 */  bnez       $v0, .L8007F58C
/* 6FDC4 8007F5C4 08006324 */   addiu     $v1, $v1, 0x8
.L8007F5C8:
/* 6FDC8 8007F5C8 1000BF8F */  lw         $ra, 0x10($sp)
/* 6FDCC 8007F5CC 00000000 */  nop
/* 6FDD0 8007F5D0 0800E003 */  jr         $ra
/* 6FDD4 8007F5D4 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONAPI_CheckGenerator, . - MONAPI_CheckGenerator
