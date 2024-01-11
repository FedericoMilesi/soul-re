.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformSoundObjectAttribute
/* 533F0 80062BF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 533F4 80062BF4 1000BFAF */  sw         $ra, 0x10($sp)
/* 533F8 80062BF8 7E000224 */  addiu      $v0, $zero, 0x7E
/* 533FC 80062BFC 1100C210 */  beq        $a2, $v0, .L80062C44
/* 53400 80062C00 21180000 */   addu      $v1, $zero, $zero
/* 53404 80062C04 7F00C228 */  slti       $v0, $a2, 0x7F
/* 53408 80062C08 07004010 */  beqz       $v0, .L80062C28
/* 5340C 80062C0C 0F00C228 */   slti      $v0, $a2, 0xF
/* 53410 80062C10 39004010 */  beqz       $v0, .L80062CF8
/* 53414 80062C14 0D00C228 */   slti      $v0, $a2, 0xD
/* 53418 80062C18 37004014 */  bnez       $v0, .L80062CF8
/* 5341C 80062C1C 00000000 */   nop
/* 53420 80062C20 308B0108 */  j          .L80062CC0
/* 53424 80062C24 0200A6A4 */   sh        $a2, 0x2($a1)
.L80062C28:
/* 53428 80062C28 7F000224 */  addiu      $v0, $zero, 0x7F
/* 5342C 80062C2C 2600C210 */  beq        $a2, $v0, .L80062CC8
/* 53430 80062C30 80000224 */   addiu     $v0, $zero, 0x80
/* 53434 80062C34 2400C210 */  beq        $a2, $v0, .L80062CC8
/* 53438 80062C38 00000000 */   nop
/* 5343C 80062C3C 3E8B0108 */  j          .L80062CF8
/* 53440 80062C40 00000000 */   nop
.L80062C44:
/* 53444 80062C44 0500E010 */  beqz       $a3, .L80062C5C
/* 53448 80062C48 01000224 */   addiu     $v0, $zero, 0x1
/* 5344C 80062C4C 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53450 80062C50 0200E284 */  lh         $v0, 0x2($a3)
/* 53454 80062C54 00000000 */  nop
/* 53458 80062C58 0400A2AC */  sw         $v0, 0x4($a1)
.L80062C5C:
/* 5345C 80062C5C 1000A28C */  lw         $v0, 0x10($a1)
/* 53460 80062C60 0400A58C */  lw         $a1, 0x4($a1)
/* 53464 80062C64 0000448C */  lw         $a0, 0x0($v0)
/* 53468 80062C68 91FE000C */  jal        SOUND_IsInstanceSoundLoaded
/* 5346C 80062C6C 00000000 */   nop
/* 53470 80062C70 21184000 */  addu       $v1, $v0, $zero
/* 53474 80062C74 0B006014 */  bnez       $v1, .L80062CA4
/* 53478 80062C78 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 5347C 80062C7C 10CF828F */  lw         $v0, %gp_rel(WaitingToLoadSFX)($gp)
/* 53480 80062C80 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 53484 80062C84 00000000 */  nop
/* 53488 80062C88 23104300 */  subu       $v0, $v0, $v1
/* 5348C 80062C8C 10CF82AF */  sw         $v0, %gp_rel(WaitingToLoadSFX)($gp)
/* 53490 80062C90 06004018 */  blez       $v0, .L80062CAC
/* 53494 80062C94 01000224 */   addiu     $v0, $zero, 0x1
/* 53498 80062C98 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
/* 5349C 80062C9C 3E8B0108 */  j          .L80062CF8
/* 534A0 80062CA0 01000324 */   addiu     $v1, $zero, 0x1
.L80062CA4:
/* 534A4 80062CA4 14006210 */  beq        $v1, $v0, .L80062CF8
/* 534A8 80062CA8 01000324 */   addiu     $v1, $zero, 0x1
.L80062CAC:
/* 534AC 80062CAC 0900023C */  lui        $v0, (0x96000 >> 16)
/* 534B0 80062CB0 00604234 */  ori        $v0, $v0, (0x96000 & 0xFFFF)
/* 534B4 80062CB4 10CF82AF */  sw         $v0, %gp_rel(WaitingToLoadSFX)($gp)
/* 534B8 80062CB8 3E8B0108 */  j          .L80062CF8
/* 534BC 80062CBC 01000324 */   addiu     $v1, $zero, 0x1
.L80062CC0:
/* 534C0 80062CC0 3E8B0108 */  j          .L80062CF8
/* 534C4 80062CC4 01000324 */   addiu     $v1, $zero, 0x1
.L80062CC8:
/* 534C8 80062CC8 0A00E010 */  beqz       $a3, .L80062CF4
/* 534CC 80062CCC 0200A6A4 */   sh        $a2, 0x2($a1)
/* 534D0 80062CD0 0200E724 */  addiu      $a3, $a3, 0x2
/* 534D4 80062CD4 02000224 */  addiu      $v0, $zero, 0x2
/* 534D8 80062CD8 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 534DC 80062CDC 0000E284 */  lh         $v0, 0x0($a3)
/* 534E0 80062CE0 00000000 */  nop
/* 534E4 80062CE4 0800A2AC */  sw         $v0, 0x8($a1)
/* 534E8 80062CE8 0200E284 */  lh         $v0, 0x2($a3)
/* 534EC 80062CEC 00000000 */  nop
/* 534F0 80062CF0 0C00A2AC */  sw         $v0, 0xC($a1)
.L80062CF4:
/* 534F4 80062CF4 01000324 */  addiu      $v1, $zero, 0x1
.L80062CF8:
/* 534F8 80062CF8 1000BF8F */  lw         $ra, 0x10($sp)
/* 534FC 80062CFC 21106000 */  addu       $v0, $v1, $zero
/* 53500 80062D00 0800E003 */  jr         $ra
/* 53504 80062D04 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformSoundObjectAttribute, . - EVENT_TransformSoundObjectAttribute
