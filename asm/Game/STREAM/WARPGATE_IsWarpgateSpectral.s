.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsWarpgateSpectral
/* 4BC9C 8005B49C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BCA0 8005B4A0 0D80053C */  lui        $a1, %hi(D_800D1954)
/* 4BCA4 8005B4A4 FCA0828F */  lw         $v0, %gp_rel(CurrentWarpNumber)($gp)
/* 4BCA8 8005B4A8 5419A524 */  addiu      $a1, $a1, %lo(D_800D1954)
/* 4BCAC 8005B4AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 4BCB0 8005B4B0 80200200 */  sll        $a0, $v0, 2
/* 4BCB4 8005B4B4 21208200 */  addu       $a0, $a0, $v0
/* 4BCB8 8005B4B8 80200400 */  sll        $a0, $a0, 2
/* 4BCBC 8005B4BC 00A18227 */  addiu      $v0, $gp, %gp_rel(WarpRoomArray)
/* 4BCC0 8005B4C0 1CD2010C */  jal        strcmpi
/* 4BCC4 8005B4C4 21208200 */   addu      $a0, $a0, $v0
/* 4BCC8 8005B4C8 1000BF8F */  lw         $ra, 0x10($sp)
/* 4BCCC 8005B4CC 0100422C */  sltiu      $v0, $v0, 0x1
/* 4BCD0 8005B4D0 0800E003 */  jr         $ra
/* 4BCD4 8005B4D4 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_IsWarpgateSpectral, . - WARPGATE_IsWarpgateSpectral
