.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CdDataReady
/* 27B44 80037344 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 27B48 80037348 C0BB828F */  lw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27B4C 8003734C 03000624 */  addiu      $a2, $zero, 0x3
/* 27B50 80037350 2000BFAF */  sw         $ra, 0x20($sp)
/* 27B54 80037354 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 27B58 80037358 05004614 */  bne        $v0, $a2, .L80037370
/* 27B5C 8003735C 1800B0AF */   sw        $s0, 0x18($sp)
/* 27B60 80037360 04000224 */  addiu      $v0, $zero, 0x4
/* 27B64 80037364 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27B68 80037368 14DD0008 */  j          .L80037450
/* 27B6C 8003736C 00000000 */   nop
.L80037370:
/* 27B70 80037370 C0BB838F */  lw         $v1, %gp_rel(loadStatus + 0x2C)($gp)
/* 27B74 80037374 04000224 */  addiu      $v0, $zero, 0x4
/* 27B78 80037378 35006214 */  bne        $v1, $v0, .L80037450
/* 27B7C 8003737C 00000000 */   nop
/* 27B80 80037380 C0BB8227 */  addiu      $v0, $gp, %gp_rel(loadStatus + 0x2C)
/* 27B84 80037384 D4FF5024 */  addiu      $s0, $v0, -0x2C
/* 27B88 80037388 C4BB858F */  lw         $a1, %gp_rel(loadStatus + 0x30)($gp)
/* 27B8C 8003738C 0800028E */  lw         $v0, 0x8($s0)
/* 27B90 80037390 1400038E */  lw         $v1, 0x14($s0)
/* 27B94 80037394 21204500 */  addu       $a0, $v0, $a1
/* 27B98 80037398 0E006614 */  bne        $v1, $a2, .L800373D4
/* 27B9C 8003739C 080004AE */   sw        $a0, 0x8($s0)
/* 27BA0 800373A0 1000028E */  lw         $v0, 0x10($s0)
/* 27BA4 800373A4 0400038E */  lw         $v1, 0x4($s0)
/* 27BA8 800373A8 21104500 */  addu       $v0, $v0, $a1
/* 27BAC 800373AC 05008314 */  bne        $a0, $v1, .L800373C4
/* 27BB0 800373B0 100002AE */   sw        $v0, 0x10($s0)
/* 27BB4 800373B4 05000224 */  addiu      $v0, $zero, 0x5
/* 27BB8 800373B8 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27BBC 800373BC 14DD0008 */  j          .L80037450
/* 27BC0 800373C0 00000000 */   nop
.L800373C4:
/* 27BC4 800373C4 02000224 */  addiu      $v0, $zero, 0x2
/* 27BC8 800373C8 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27BCC 800373CC 14DD0008 */  j          .L80037450
/* 27BD0 800373D0 00000000 */   nop
.L800373D4:
/* 27BD4 800373D4 1400038E */  lw         $v1, 0x14($s0)
/* 27BD8 800373D8 06000224 */  addiu      $v0, $zero, 0x6
/* 27BDC 800373DC 1C006214 */  bne        $v1, $v0, .L80037450
/* 27BE0 800373E0 00000000 */   nop
/* 27BE4 800373E4 0400028E */  lw         $v0, 0x4($s0)
/* 27BE8 800373E8 00000000 */  nop
/* 27BEC 800373EC 02008214 */  bne        $a0, $v0, .L800373F8
/* 27BF0 800373F0 02001124 */   addiu     $s1, $zero, 0x2
/* 27BF4 800373F4 05001124 */  addiu      $s1, $zero, 0x5
.L800373F8:
/* 27BF8 800373F8 2000028E */  lw         $v0, 0x20($s0)
/* 27BFC 800373FC 00000000 */  nop
/* 27C00 80037400 09004010 */  beqz       $v0, .L80037428
/* 27C04 80037404 00000000 */   nop
/* 27C08 80037408 2800028E */  lw         $v0, 0x28($s0)
/* 27C0C 8003740C 0500263A */  xori       $a2, $s1, 0x5
/* 27C10 80037410 1000A2AF */  sw         $v0, 0x10($sp)
/* 27C14 80037414 2000028E */  lw         $v0, 0x20($s0)
/* 27C18 80037418 1000048E */  lw         $a0, 0x10($s0)
/* 27C1C 8003741C 2400078E */  lw         $a3, 0x24($s0)
/* 27C20 80037420 09F84000 */  jalr       $v0
/* 27C24 80037424 0100C62C */   sltiu     $a2, $a2, 0x1
.L80037428:
/* 27C28 80037428 1000028E */  lw         $v0, 0x10($s0)
/* 27C2C 8003742C 14BC838F */  lw         $v1, %gp_rel(loadStatus + 0x80)($gp)
/* 27C30 80037430 00000000 */  nop
/* 27C34 80037434 04004314 */  bne        $v0, $v1, .L80037448
/* 27C38 80037438 00000000 */   nop
/* 27C3C 8003743C 18BC828F */  lw         $v0, %gp_rel(loadStatus + 0x84)($gp)
/* 27C40 80037440 13DD0008 */  j          .L8003744C
/* 27C44 80037444 100002AE */   sw        $v0, 0x10($s0)
.L80037448:
/* 27C48 80037448 100003AE */  sw         $v1, 0x10($s0)
.L8003744C:
/* 27C4C 8003744C C0BB91AF */  sw         $s1, %gp_rel(loadStatus + 0x2C)($gp)
.L80037450:
/* 27C50 80037450 2000BF8F */  lw         $ra, 0x20($sp)
/* 27C54 80037454 1C00B18F */  lw         $s1, 0x1C($sp)
/* 27C58 80037458 1800B08F */  lw         $s0, 0x18($sp)
/* 27C5C 8003745C 0800E003 */  jr         $ra
/* 27C60 80037460 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_CdDataReady, . - LOAD_CdDataReady
