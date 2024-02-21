.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel InitHealthSystem
/* 94CA0 800A44A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 94CA4 800A44A4 D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 94CA8 800A44A8 01000224 */  addiu      $v0, $zero, 0x1
/* 94CAC 800A44AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 94CB0 800A44B0 30FA80AF */  sw         $zero, %gp_rel(Raziel + 0x400)($gp)
/* 94CB4 800A44B4 28FA82A7 */  sh         $v0, %gp_rel(Raziel + 0x3F8)($gp)
/* 94CB8 800A44B8 2AFA80A7 */  sh         $zero, %gp_rel(Raziel + 0x3FA)($gp)
/* 94CBC 800A44BC 40FA80A7 */  sh         $zero, %gp_rel(Raziel + 0x410)($gp)
/* 94CC0 800A44C0 0A006014 */  bnez       $v1, .L800A44EC
/* 94CC4 800A44C4 01000224 */   addiu     $v0, $zero, 0x1
/* 94CC8 800A44C8 0100033C */  lui        $v1, (0x186A0 >> 16)
/* 94CCC 800A44CC A0866334 */  ori        $v1, $v1, (0x186A0 & 0xFFFF)
/* 94CD0 800A44D0 02000224 */  addiu      $v0, $zero, 0x2
/* 94CD4 800A44D4 68FA82AF */  sw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 94CD8 800A44D8 2CFA83AF */  sw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* 94CDC 800A44DC E395020C */  jal        razMaterialShift
/* 94CE0 800A44E0 00000000 */   nop
/* 94CE4 800A44E4 42910208 */  j          .L800A4508
/* 94CE8 800A44E8 0D80043C */   lui       $a0, %hi(D_800D1D1C)
.L800A44EC:
/* 94CEC 800A44EC 68FA82AF */  sw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* 94CF0 800A44F0 0492020C */  jal        GetMaxHealth
/* 94CF4 800A44F4 00000000 */   nop
/* 94CF8 800A44F8 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94CFC 800A44FC 9F95020C */  jal        razSpectralShift
/* 94D00 800A4500 00000000 */   nop
/* 94D04 800A4504 0D80043C */  lui        $a0, %hi(D_800D1D1C)
.L800A4508:
/* 94D08 800A4508 1C1D8424 */  addiu      $a0, $a0, %lo(D_800D1D1C)
/* 94D0C 800A450C AA9F020C */  jal        razInBaseArea
/* 94D10 800A4510 05000524 */   addiu     $a1, $zero, 0x5
/* 94D14 800A4514 04004010 */  beqz       $v0, .L800A4528
/* 94D18 800A4518 64000224 */   addiu     $v0, $zero, 0x64
/* 94D1C 800A451C 2CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x3FC)($gp)
/* 94D20 800A4520 4C910208 */  j          .L800A4530
/* 94D24 800A4524 00000000 */   nop
.L800A4528:
/* 94D28 800A4528 C89E020C */  jal        razSetPlayerEventHistory
/* 94D2C 800A452C 00100424 */   addiu     $a0, $zero, 0x1000
.L800A4530:
/* 94D30 800A4530 1000BF8F */  lw         $ra, 0x10($sp)
/* 94D34 800A4534 00000000 */  nop
/* 94D38 800A4538 0800E003 */  jr         $ra
/* 94D3C 800A453C 1800BD27 */   addiu     $sp, $sp, 0x18
.size InitHealthSystem, . - InitHealthSystem
