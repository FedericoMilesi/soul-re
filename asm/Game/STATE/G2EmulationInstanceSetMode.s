.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSetMode
/* 62DC4 800725C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 62DC8 800725C8 1400B1AF */  sw         $s1, 0x14($sp)
/* 62DCC 800725CC 2188C000 */  addu       $s1, $a2, $zero
/* 62DD0 800725D0 FF00A530 */  andi       $a1, $a1, 0xFF
/* 62DD4 800725D4 40100500 */  sll        $v0, $a1, 1
/* 62DD8 800725D8 21104500 */  addu       $v0, $v0, $a1
/* 62DDC 800725DC 00110200 */  sll        $v0, $v0, 4
/* 62DE0 800725E0 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62DE4 800725E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 62DE8 800725E8 21808200 */  addu       $s0, $a0, $v0
/* 62DEC 800725EC 05002016 */  bnez       $s1, .L80072604
/* 62DF0 800725F0 1800BFAF */   sw        $ra, 0x18($sp)
/* 62DF4 800725F4 7B40020C */  jal        G2AnimSection_SetPaused
/* 62DF8 800725F8 21200002 */   addu      $a0, $s0, $zero
/* 62DFC 800725FC 8CC90108 */  j          .L80072630
/* 62E00 80072600 00000000 */   nop
.L80072604:
/* 62E04 80072604 8040020C */  jal        G2AnimSection_SetUnpaused
/* 62E08 80072608 21200002 */   addu      $a0, $s0, $zero
/* 62E0C 8007260C 01000224 */  addiu      $v0, $zero, 0x1
/* 62E10 80072610 05002216 */  bne        $s1, $v0, .L80072628
/* 62E14 80072614 00000000 */   nop
/* 62E18 80072618 7140020C */  jal        G2AnimSection_SetNoLooping
/* 62E1C 8007261C 21200002 */   addu      $a0, $s0, $zero
/* 62E20 80072620 8CC90108 */  j          .L80072630
/* 62E24 80072624 00000000 */   nop
.L80072628:
/* 62E28 80072628 5540020C */  jal        G2AnimSection_SetLooping
/* 62E2C 8007262C 21200002 */   addu      $a0, $s0, $zero
.L80072630:
/* 62E30 80072630 1800BF8F */  lw         $ra, 0x18($sp)
/* 62E34 80072634 1400B18F */  lw         $s1, 0x14($sp)
/* 62E38 80072638 1000B08F */  lw         $s0, 0x10($sp)
/* 62E3C 8007263C 0800E003 */  jr         $ra
/* 62E40 80072640 2000BD27 */   addiu     $sp, $sp, 0x20
.size G2EmulationInstanceSetMode, . - G2EmulationInstanceSetMode
