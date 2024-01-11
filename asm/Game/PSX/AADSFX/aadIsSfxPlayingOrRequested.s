.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadIsSfxPlayingOrRequested
/* 47838 80057038 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4783C 8005703C 1000B0AF */  sw         $s0, 0x10($sp)
/* 47840 80057040 1400BFAF */  sw         $ra, 0x14($sp)
/* 47844 80057044 A5FC020C */  jal        func_800BF294
/* 47848 80057048 21808000 */   addu      $s0, $a0, $zero
/* 4784C 8005704C D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47850 80057050 00000000 */  nop
/* 47854 80057054 D6014694 */  lhu        $a2, 0x1D6($v0)
/* 47858 80057058 D5014590 */  lbu        $a1, 0x1D5($v0)
/* 4785C 8005705C 1C00C010 */  beqz       $a2, .L800570D0
/* 47860 80057060 20000724 */   addiu     $a3, $zero, 0x20
/* 47864 80057064 40100500 */  sll        $v0, $a1, 1
/* 47868 80057068 21104500 */  addu       $v0, $v0, $a1
/* 4786C 8005706C 80100200 */  sll        $v0, $v0, 2
/* 47870 80057070 54004424 */  addiu      $a0, $v0, 0x54
.L80057074:
/* 47874 80057074 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 47878 80057078 00000000 */  nop
/* 4787C 8005707C 21184400 */  addu       $v1, $v0, $a0
/* 47880 80057080 00006290 */  lbu        $v0, 0x0($v1)
/* 47884 80057084 00000000 */  nop
/* 47888 80057088 09004014 */  bnez       $v0, .L800570B0
/* 4788C 8005708C 00000000 */   nop
/* 47890 80057090 0400628C */  lw         $v0, 0x4($v1)
/* 47894 80057094 00000000 */  nop
/* 47898 80057098 06005014 */  bne        $v0, $s0, .L800570B4
/* 4789C 8005709C 0100A524 */   addiu     $a1, $a1, 0x1
/* 478A0 800570A0 11FC020C */  jal        func_800BF044
/* 478A4 800570A4 00000000 */   nop
/* 478A8 800570A8 385C0108 */  j          .L800570E0
/* 478AC 800570AC 01000224 */   addiu     $v0, $zero, 0x1
.L800570B0:
/* 478B0 800570B0 0100A524 */  addiu      $a1, $a1, 0x1
.L800570B4:
/* 478B4 800570B4 0300A714 */  bne        $a1, $a3, .L800570C4
/* 478B8 800570B8 0C008424 */   addiu     $a0, $a0, 0xC
/* 478BC 800570BC 54000424 */  addiu      $a0, $zero, 0x54
/* 478C0 800570C0 21280000 */  addu       $a1, $zero, $zero
.L800570C4:
/* 478C4 800570C4 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 478C8 800570C8 EAFFC014 */  bnez       $a2, .L80057074
/* 478CC 800570CC 00000000 */   nop
.L800570D0:
/* 478D0 800570D0 11FC020C */  jal        func_800BF044
/* 478D4 800570D4 00000000 */   nop
/* 478D8 800570D8 F25B010C */  jal        aadIsSfxPlaying
/* 478DC 800570DC 21200002 */   addu      $a0, $s0, $zero
.L800570E0:
/* 478E0 800570E0 1400BF8F */  lw         $ra, 0x14($sp)
/* 478E4 800570E4 1000B08F */  lw         $s0, 0x10($sp)
/* 478E8 800570E8 0800E003 */  jr         $ra
/* 478EC 800570EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadIsSfxPlayingOrRequested, . - aadIsSfxPlayingOrRequested
