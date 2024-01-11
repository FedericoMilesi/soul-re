.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razSetWallCrawlNodes
/* 977D0 800A6FD0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 977D4 800A6FD4 2000B0AF */  sw         $s0, 0x20($sp)
/* 977D8 800A6FD8 2180A000 */  addu       $s0, $a1, $zero
/* 977DC 800A6FDC 2800BFAF */  sw         $ra, 0x28($sp)
/* 977E0 800A6FE0 2400B1AF */  sw         $s1, 0x24($sp)
/* 977E4 800A6FE4 2800028E */  lw         $v0, 0x28($s0)
/* 977E8 800A6FE8 00000000 */  nop
/* 977EC 800A6FEC 08004230 */  andi       $v0, $v0, 0x8
/* 977F0 800A6FF0 1D004010 */  beqz       $v0, .L800A7068
/* 977F4 800A6FF4 21888000 */   addu      $s1, $a0, $zero
/* 977F8 800A6FF8 18000486 */  lh         $a0, 0x18($s0)
/* 977FC 800A6FFC 1A000586 */  lh         $a1, 0x1A($s0)
/* 97800 800A7000 1C000686 */  lh         $a2, 0x1C($s0)
/* 97804 800A7004 E7E9000C */  jal        MATH3D_SquareLength
/* 97808 800A7008 00000000 */   nop
/* 9780C 800A700C 65004228 */  slti       $v0, $v0, 0x65
/* 97810 800A7010 0B004014 */  bnez       $v0, .L800A7040
/* 97814 800A7014 C8012426 */   addiu     $a0, $s1, 0x1C8
/* 97818 800A7018 5C002296 */  lhu        $v0, 0x5C($s1)
/* 9781C 800A701C 18000396 */  lhu        $v1, 0x18($s0)
/* 97820 800A7020 00000000 */  nop
/* 97824 800A7024 23104300 */  subu       $v0, $v0, $v1
/* 97828 800A7028 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 9782C 800A702C 5E002296 */  lhu        $v0, 0x5E($s1)
/* 97830 800A7030 1A000396 */  lhu        $v1, 0x1A($s0)
/* 97834 800A7034 00000000 */  nop
/* 97838 800A7038 23104300 */  subu       $v0, $v0, $v1
/* 9783C 800A703C 5E0022A6 */  sh         $v0, 0x5E($s1)
.L800A7040:
/* 97840 800A7040 1E000296 */  lhu        $v0, 0x1E($s0)
/* 97844 800A7044 21280000 */  addu       $a1, $zero, $zero
/* 97848 800A7048 1800A2A7 */  sh         $v0, 0x18($sp)
/* 9784C 800A704C 20000296 */  lhu        $v0, 0x20($s0)
/* 97850 800A7050 08000624 */  addiu      $a2, $zero, 0x8
/* 97854 800A7054 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 97858 800A7058 22000296 */  lhu        $v0, 0x22($s0)
/* 9785C 800A705C 1800A727 */  addiu      $a3, $sp, 0x18
/* 97860 800A7060 7D42020C */  jal        G2Anim_SetController_Vector
/* 97864 800A7064 1C00A2A7 */   sh        $v0, 0x1C($sp)
.L800A7068:
/* 97868 800A7068 2800038E */  lw         $v1, 0x28($s0)
/* 9786C 800A706C 0A000224 */  addiu      $v0, $zero, 0xA
/* 97870 800A7070 0D006214 */  bne        $v1, $v0, .L800A70A8
/* 97874 800A7074 21202002 */   addu      $a0, $s1, $zero
/* 97878 800A7078 0E000524 */  addiu      $a1, $zero, 0xE
/* 9787C 800A707C 2130A000 */  addu       $a2, $a1, $zero
/* 97880 800A7080 26000296 */  lhu        $v0, 0x26($s0)
/* 97884 800A7084 1800A727 */  addiu      $a3, $sp, 0x18
/* 97888 800A7088 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 9788C 800A708C 1C00A0A7 */  sh         $zero, 0x1C($sp)
/* 97890 800A7090 23100200 */  negu       $v0, $v0
/* 97894 800A7094 1800A2A7 */  sh         $v0, 0x18($sp)
/* 97898 800A7098 03000224 */  addiu      $v0, $zero, 0x3
/* 9789C 800A709C 1000A2AF */  sw         $v0, 0x10($sp)
/* 978A0 800A70A0 67CA010C */  jal        G2EmulationSetInterpController_Vector
/* 978A4 800A70A4 1400A0AF */   sw        $zero, 0x14($sp)
.L800A70A8:
/* 978A8 800A70A8 2800BF8F */  lw         $ra, 0x28($sp)
/* 978AC 800A70AC 2400B18F */  lw         $s1, 0x24($sp)
/* 978B0 800A70B0 2000B08F */  lw         $s0, 0x20($sp)
/* 978B4 800A70B4 0800E003 */  jr         $ra
/* 978B8 800A70B8 3000BD27 */   addiu     $sp, $sp, 0x30
.size razSetWallCrawlNodes, . - razSetWallCrawlNodes
