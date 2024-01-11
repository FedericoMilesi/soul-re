.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Surprised
/* 79BAC 800893AC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 79BB0 800893B0 1400B1AF */  sw         $s1, 0x14($sp)
/* 79BB4 800893B4 21888000 */  addu       $s1, $a0, $zero
/* 79BB8 800893B8 1800BFAF */  sw         $ra, 0x18($sp)
/* 79BBC 800893BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 79BC0 800893C0 1800228E */  lw         $v0, 0x18($s1)
/* 79BC4 800893C4 6C01308E */  lw         $s0, 0x16C($s1)
/* 79BC8 800893C8 10004230 */  andi       $v0, $v0, 0x10
/* 79BCC 800893CC 03004010 */  beqz       $v0, .L800893DC
/* 79BD0 800893D0 00000000 */   nop
/* 79BD4 800893D4 9D03020C */  jal        MON_PlayCombatIdle
/* 79BD8 800893D8 02000524 */   addiu     $a1, $zero, 0x2
.L800893DC:
/* 79BDC 800893DC 9006020C */  jal        MON_GetTime
/* 79BE0 800893E0 21202002 */   addu      $a0, $s1, $zero
/* 79BE4 800893E4 1401038E */  lw         $v1, 0x114($s0)
/* 79BE8 800893E8 00000000 */  nop
/* 79BEC 800893EC 2B186200 */  sltu       $v1, $v1, $v0
/* 79BF0 800893F0 0A006010 */  beqz       $v1, .L8008941C
/* 79BF4 800893F4 08000224 */   addiu     $v0, $zero, 0x8
/* 79BF8 800893F8 5A010392 */  lbu        $v1, 0x15A($s0)
/* 79BFC 800893FC 00000000 */  nop
/* 79C00 80089400 03006214 */  bne        $v1, $v0, .L80089410
/* 79C04 80089404 21202002 */   addu      $a0, $s1, $zero
/* 79C08 80089408 05250208 */  j          .L80089414
/* 79C0C 8008940C 14000524 */   addiu     $a1, $zero, 0x14
.L80089410:
/* 79C10 80089410 0D000524 */  addiu      $a1, $zero, 0xD
.L80089414:
/* 79C14 80089414 91FE010C */  jal        MON_SwitchState
/* 79C18 80089418 00000000 */   nop
.L8008941C:
/* 79C1C 8008941C C400028E */  lw         $v0, 0xC4($s0)
/* 79C20 80089420 00000000 */  nop
/* 79C24 80089424 0B004010 */  beqz       $v0, .L80089454
/* 79C28 80089428 21202002 */   addu      $a0, $s1, $zero
/* 79C2C 8008942C 0400428C */  lw         $v0, 0x4($v0)
/* 79C30 80089430 00000000 */  nop
/* 79C34 80089434 5C004224 */  addiu      $v0, $v0, 0x5C
/* 79C38 80089438 200102AE */  sw         $v0, 0x120($s0)
/* 79C3C 8008943C C400028E */  lw         $v0, 0xC4($s0)
/* 79C40 80089440 6801038E */  lw         $v1, 0x168($s0)
/* 79C44 80089444 0400458C */  lw         $a1, 0x4($v0)
/* 79C48 80089448 1C006684 */  lh         $a2, 0x1C($v1)
/* 79C4C 8008944C 6604020C */  jal        MON_TurnToPosition
/* 79C50 80089450 5C00A524 */   addiu     $a1, $a1, 0x5C
.L80089454:
/* 79C54 80089454 0917020C */  jal        MON_DefaultQueueHandler
/* 79C58 80089458 21202002 */   addu      $a0, $s1, $zero
/* 79C5C 8008945C 1800BF8F */  lw         $ra, 0x18($sp)
/* 79C60 80089460 1400B18F */  lw         $s1, 0x14($sp)
/* 79C64 80089464 1000B08F */  lw         $s0, 0x10($sp)
/* 79C68 80089468 0800E003 */  jr         $ra
/* 79C6C 8008946C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Surprised, . - MON_Surprised
