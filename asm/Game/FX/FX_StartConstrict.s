.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartConstrict
/* 38408 80047C08 689A828F */  lw         $v0, %gp_rel(FX_ConstrictRibbon)($gp)
/* 3840C 80047C0C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 38410 80047C10 1D004014 */  bnez       $v0, .L80047C88
/* 38414 80047C14 2800BFAF */   sw        $ra, 0x28($sp)
/* 38418 80047C18 0B00A010 */  beqz       $a1, .L80047C48
/* 3841C 80047C1C E800033C */   lui       $v1, (0xE84040 >> 16)
/* 38420 80047C20 0000A294 */  lhu        $v0, 0x0($a1)
/* 38424 80047C24 00000000 */  nop
/* 38428 80047C28 B0C382A7 */  sh         $v0, %gp_rel(FX_ConstrictPosition)($gp)
/* 3842C 80047C2C 0200A294 */  lhu        $v0, 0x2($a1)
/* 38430 80047C30 00000000 */  nop
/* 38434 80047C34 B2C382A7 */  sh         $v0, %gp_rel(FX_ConstrictPosition + 0x2)($gp)
/* 38438 80047C38 60008294 */  lhu        $v0, 0x60($a0)
/* 3843C 80047C3C B8C385AF */  sw         $a1, %gp_rel(FX_ConstrictPositionPtr)($gp)
/* 38440 80047C40 00014224 */  addiu      $v0, $v0, 0x100
/* 38444 80047C44 B4C382A7 */  sh         $v0, %gp_rel(FX_ConstrictPosition + 0x4)($gp)
.L80047C48:
/* 38448 80047C48 40406334 */  ori        $v1, $v1, (0xE84040 & 0xFFFF)
/* 3844C 80047C4C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 38450 80047C50 1000A2AF */  sw         $v0, 0x10($sp)
/* 38454 80047C54 28000224 */  addiu      $v0, $zero, 0x28
/* 38458 80047C58 002C0600 */  sll        $a1, $a2, 16
/* 3845C 80047C5C 00340700 */  sll        $a2, $a3, 16
/* 38460 80047C60 032C0500 */  sra        $a1, $a1, 16
/* 38464 80047C64 03340600 */  sra        $a2, $a2, 16
/* 38468 80047C68 02000724 */  addiu      $a3, $zero, 0x2
/* 3846C 80047C6C 1400A2AF */  sw         $v0, 0x14($sp)
/* 38470 80047C70 1800A0AF */  sw         $zero, 0x18($sp)
/* 38474 80047C74 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 38478 80047C78 681D010C */  jal        FX_StartRibbon
/* 3847C 80047C7C 2000A3AF */   sw        $v1, 0x20($sp)
/* 38480 80047C80 689A82AF */  sw         $v0, %gp_rel(FX_ConstrictRibbon)($gp)
/* 38484 80047C84 6C9A80A7 */  sh         $zero, %gp_rel(FX_ConstrictStage)($gp)
.L80047C88:
/* 38488 80047C88 2800BF8F */  lw         $ra, 0x28($sp)
/* 3848C 80047C8C 00000000 */  nop
/* 38490 80047C90 0800E003 */  jr         $ra
/* 38494 80047C94 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_StartConstrict, . - FX_StartConstrict
