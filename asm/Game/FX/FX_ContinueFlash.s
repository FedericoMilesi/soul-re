.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueFlash
/* 3CAD8 8004C2D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3CADC 8004C2DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 3CAE0 8004C2E0 1C00828C */  lw         $v0, 0x1C($a0)
/* 3CAE4 8004C2E4 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 3CAE8 8004C2E8 00000000 */  nop
/* 3CAEC 8004C2EC 21104300 */  addu       $v0, $v0, $v1
/* 3CAF0 8004C2F0 02004104 */  bgez       $v0, .L8004C2FC
/* 3CAF4 8004C2F4 1C0082AC */   sw        $v0, 0x1C($a0)
/* 3CAF8 8004C2F8 0F004224 */  addiu      $v0, $v0, 0xF
.L8004C2FC:
/* 3CAFC 8004C2FC 1800838C */  lw         $v1, 0x18($a0)
/* 3CB00 8004C300 03110200 */  sra        $v0, $v0, 4
/* 3CB04 8004C304 2A104300 */  slt        $v0, $v0, $v1
/* 3CB08 8004C308 03004014 */  bnez       $v0, .L8004C318
/* 3CB0C 8004C30C 00000000 */   nop
/* 3CB10 8004C310 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3CB14 8004C314 00000000 */   nop
.L8004C318:
/* 3CB18 8004C318 1000BF8F */  lw         $ra, 0x10($sp)
/* 3CB1C 8004C31C 00000000 */  nop
/* 3CB20 8004C320 0800E003 */  jr         $ra
/* 3CB24 8004C324 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_ContinueFlash, . - FX_ContinueFlash
