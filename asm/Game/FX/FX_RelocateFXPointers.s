.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_RelocateFXPointers
/* 3544C 80044C4C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 35450 80044C50 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 35454 80044C54 21988000 */  addu       $s3, $a0, $zero
/* 35458 80044C58 1400B1AF */  sw         $s1, 0x14($sp)
/* 3545C 80044C5C 2388B300 */  subu       $s1, $a1, $s3
/* 35460 80044C60 21286002 */  addu       $a1, $s3, $zero
/* 35464 80044C64 1800B2AF */  sw         $s2, 0x18($sp)
/* 35468 80044C68 2190C000 */  addu       $s2, $a2, $zero
/* 3546C 80044C6C 1000B0AF */  sw         $s0, 0x10($sp)
/* 35470 80044C70 44BA908F */  lw         $s0, %gp_rel(gFXT)($gp)
/* 35474 80044C74 2000BFAF */  sw         $ra, 0x20($sp)
/* 35478 80044C78 946D048E */  lw         $a0, 0x6D94($s0)
/* 3547C 80044C7C FB12010C */  jal        FX_UpdateTexturePointers
/* 35480 80044C80 21382002 */   addu      $a3, $s1, $zero
/* 35484 80044C84 21286002 */  addu       $a1, $s3, $zero
/* 35488 80044C88 21304002 */  addu       $a2, $s2, $zero
/* 3548C 80044C8C 9C6D048E */  lw         $a0, 0x6D9C($s0)
/* 35490 80044C90 FB12010C */  jal        FX_UpdateTexturePointers
/* 35494 80044C94 21382002 */   addu      $a3, $s1, $zero
/* 35498 80044C98 649A848F */  lw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3549C 80044C9C 00000000 */  nop
/* 354A0 80044CA0 17008010 */  beqz       $a0, .L80044D00
/* 354A4 80044CA4 00000000 */   nop
/* 354A8 80044CA8 01000524 */  addiu      $a1, $zero, 0x1
/* 354AC 80044CAC 21307202 */  addu       $a2, $s3, $s2
.L80044CB0:
/* 354B0 80044CB0 0C008290 */  lbu        $v0, 0xC($a0)
/* 354B4 80044CB4 00000000 */  nop
/* 354B8 80044CB8 0D004514 */  bne        $v0, $a1, .L80044CF0
/* 354BC 80044CBC 00000000 */   nop
/* 354C0 80044CC0 1000838C */  lw         $v1, 0x10($a0)
/* 354C4 80044CC4 00000000 */  nop
/* 354C8 80044CC8 09006010 */  beqz       $v1, .L80044CF0
/* 354CC 80044CCC 2B107300 */   sltu      $v0, $v1, $s3
/* 354D0 80044CD0 07004014 */  bnez       $v0, .L80044CF0
/* 354D4 80044CD4 2B10C300 */   sltu      $v0, $a2, $v1
/* 354D8 80044CD8 05004014 */  bnez       $v0, .L80044CF0
/* 354DC 80044CDC 00000000 */   nop
/* 354E0 80044CE0 02006010 */  beqz       $v1, .L80044CEC
/* 354E4 80044CE4 21100000 */   addu      $v0, $zero, $zero
/* 354E8 80044CE8 21107100 */  addu       $v0, $v1, $s1
.L80044CEC:
/* 354EC 80044CEC 100082AC */  sw         $v0, 0x10($a0)
.L80044CF0:
/* 354F0 80044CF0 0000848C */  lw         $a0, 0x0($a0)
/* 354F4 80044CF4 00000000 */  nop
/* 354F8 80044CF8 EDFF8014 */  bnez       $a0, .L80044CB0
/* 354FC 80044CFC 00000000 */   nop
.L80044D00:
/* 35500 80044D00 2000BF8F */  lw         $ra, 0x20($sp)
/* 35504 80044D04 1C00B38F */  lw         $s3, 0x1C($sp)
/* 35508 80044D08 1800B28F */  lw         $s2, 0x18($sp)
/* 3550C 80044D0C 1400B18F */  lw         $s1, 0x14($sp)
/* 35510 80044D10 1000B08F */  lw         $s0, 0x10($sp)
/* 35514 80044D14 0800E003 */  jr         $ra
/* 35518 80044D18 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_RelocateFXPointers, . - FX_RelocateFXPointers
