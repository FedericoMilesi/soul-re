.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetFrameNumber
/* 31C58 80041458 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31C5C 8004145C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 31C60 80041460 03008010 */  beqz       $a0, .L80041470
/* 31C64 80041464 1800B0AF */   sw        $s0, 0x18($sp)
/* 31C68 80041468 0300A014 */  bnez       $a1, .L80041478
/* 31C6C 8004146C 21800000 */   addu      $s0, $zero, $zero
.L80041470:
/* 31C70 80041470 36050108 */  j          .L800414D8
/* 31C74 80041474 FFFF1034 */   ori       $s0, $zero, 0xFFFF
.L80041478:
/* 31C78 80041478 0000868C */  lw         $a2, 0x0($a0)
/* 31C7C 8004147C 0000A78C */  lw         $a3, 0x0($a1)
/* 31C80 80041480 0400A88C */  lw         $t0, 0x4($a1)
/* 31C84 80041484 1000A7AF */  sw         $a3, 0x10($sp)
/* 31C88 80041488 1400A8AF */  sw         $t0, 0x14($sp)
/* 31C8C 8004148C 0000A584 */  lh         $a1, 0x0($a1)
/* 31C90 80041490 00000000 */  nop
/* 31C94 80041494 0800A010 */  beqz       $a1, .L800414B8
/* 31C98 80041498 21180000 */   addu      $v1, $zero, $zero
.L8004149C:
/* 31C9C 8004149C 01006324 */  addiu      $v1, $v1, 0x1
/* 31CA0 800414A0 0000C294 */  lhu        $v0, 0x0($a2)
/* 31CA4 800414A4 00000000 */  nop
/* 31CA8 800414A8 21800202 */  addu       $s0, $s0, $v0
/* 31CAC 800414AC 2B106500 */  sltu       $v0, $v1, $a1
/* 31CB0 800414B0 FAFF4014 */  bnez       $v0, .L8004149C
/* 31CB4 800414B4 2000C624 */   addiu     $a2, $a2, 0x20
.L800414B8:
/* 31CB8 800414B8 1000A527 */  addiu      $a1, $sp, 0x10
/* 31CBC 800414BC 21300000 */  addu       $a2, $zero, $zero
/* 31CC0 800414C0 E504010C */  jal        SplineSetDefDenom
/* 31CC4 800414C4 1000A3A7 */   sh        $v1, 0x10($sp)
/* 31CC8 800414C8 1400A28F */  lw         $v0, 0x14($sp)
/* 31CCC 800414CC 00000000 */  nop
/* 31CD0 800414D0 03130200 */  sra        $v0, $v0, 12
/* 31CD4 800414D4 21800202 */  addu       $s0, $s0, $v0
.L800414D8:
/* 31CD8 800414D8 FFFF0232 */  andi       $v0, $s0, 0xFFFF
/* 31CDC 800414DC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 31CE0 800414E0 1800B08F */  lw         $s0, 0x18($sp)
/* 31CE4 800414E4 0800E003 */  jr         $ra
/* 31CE8 800414E8 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetFrameNumber, . - SplineGetFrameNumber
