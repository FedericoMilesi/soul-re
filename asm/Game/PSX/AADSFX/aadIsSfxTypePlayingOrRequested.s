.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadIsSfxTypePlayingOrRequested
/* 47964 80057164 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47968 80057168 1000B0AF */  sw         $s0, 0x10($sp)
/* 4796C 8005716C 1400BFAF */  sw         $ra, 0x14($sp)
/* 47970 80057170 A5FC020C */  jal        func_800BF294
/* 47974 80057174 21808000 */   addu      $s0, $a0, $zero
/* 47978 80057178 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4797C 8005717C 00000000 */  nop
/* 47980 80057180 D6014694 */  lhu        $a2, 0x1D6($v0)
/* 47984 80057184 D5014590 */  lbu        $a1, 0x1D5($v0)
/* 47988 80057188 1C00C010 */  beqz       $a2, .L800571FC
/* 4798C 8005718C 20000724 */   addiu     $a3, $zero, 0x20
/* 47990 80057190 40100500 */  sll        $v0, $a1, 1
/* 47994 80057194 21104500 */  addu       $v0, $v0, $a1
/* 47998 80057198 80100200 */  sll        $v0, $v0, 2
/* 4799C 8005719C 54004424 */  addiu      $a0, $v0, 0x54
.L800571A0:
/* 479A0 800571A0 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 479A4 800571A4 00000000 */  nop
/* 479A8 800571A8 21184400 */  addu       $v1, $v0, $a0
/* 479AC 800571AC 00006290 */  lbu        $v0, 0x0($v1)
/* 479B0 800571B0 00000000 */  nop
/* 479B4 800571B4 09004014 */  bnez       $v0, .L800571DC
/* 479B8 800571B8 00000000 */   nop
/* 479BC 800571BC 04006294 */  lhu        $v0, 0x4($v1)
/* 479C0 800571C0 00000000 */  nop
/* 479C4 800571C4 06005014 */  bne        $v0, $s0, .L800571E0
/* 479C8 800571C8 0100A524 */   addiu     $a1, $a1, 0x1
/* 479CC 800571CC 11FC020C */  jal        func_800BF044
/* 479D0 800571D0 00000000 */   nop
/* 479D4 800571D4 835C0108 */  j          .L8005720C
/* 479D8 800571D8 01000224 */   addiu     $v0, $zero, 0x1
.L800571DC:
/* 479DC 800571DC 0100A524 */  addiu      $a1, $a1, 0x1
.L800571E0:
/* 479E0 800571E0 0300A714 */  bne        $a1, $a3, .L800571F0
/* 479E4 800571E4 0C008424 */   addiu     $a0, $a0, 0xC
/* 479E8 800571E8 54000424 */  addiu      $a0, $zero, 0x54
/* 479EC 800571EC 21280000 */  addu       $a1, $zero, $zero
.L800571F0:
/* 479F0 800571F0 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 479F4 800571F4 EAFFC014 */  bnez       $a2, .L800571A0
/* 479F8 800571F8 00000000 */   nop
.L800571FC:
/* 479FC 800571FC 11FC020C */  jal        func_800BF044
/* 47A00 80057200 00000000 */   nop
/* 47A04 80057204 3C5C010C */  jal        aadIsSfxTypePlaying
/* 47A08 80057208 21200002 */   addu      $a0, $s0, $zero
.L8005720C:
/* 47A0C 8005720C 1400BF8F */  lw         $ra, 0x14($sp)
/* 47A10 80057210 1000B08F */  lw         $s0, 0x10($sp)
/* 47A14 80057214 0800E003 */  jr         $ra
/* 47A18 80057218 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadIsSfxTypePlayingOrRequested, . - aadIsSfxTypePlayingOrRequested
