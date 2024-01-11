.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANSRCH_FindPathInGraph
/* 8A800 8009A000 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8A804 8009A004 1800B2AF */  sw         $s2, 0x18($sp)
/* 8A808 8009A008 21908000 */  addu       $s2, $a0, $zero
/* 8A80C 8009A00C 1000B0AF */  sw         $s0, 0x10($sp)
/* 8A810 8009A010 2180A000 */  addu       $s0, $a1, $zero
/* 8A814 8009A014 1400B1AF */  sw         $s1, 0x14($sp)
/* 8A818 8009A018 2188C000 */  addu       $s1, $a2, $zero
/* 8A81C 8009A01C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8A820 8009A020 23203202 */  subu       $a0, $s1, $s2
/* 8A824 8009A024 C0100400 */  sll        $v0, $a0, 3
/* 8A828 8009A028 21104400 */  addu       $v0, $v0, $a0
/* 8A82C 8009A02C 80190200 */  sll        $v1, $v0, 6
/* 8A830 8009A030 21104300 */  addu       $v0, $v0, $v1
/* 8A834 8009A034 C0100200 */  sll        $v0, $v0, 3
/* 8A838 8009A038 21104400 */  addu       $v0, $v0, $a0
/* 8A83C 8009A03C C01B0200 */  sll        $v1, $v0, 15
/* 8A840 8009A040 21104300 */  addu       $v0, $v0, $v1
/* 8A844 8009A044 C0100200 */  sll        $v0, $v0, 3
/* 8A848 8009A048 21104400 */  addu       $v0, $v0, $a0
/* 8A84C 8009A04C 23100200 */  negu       $v0, $v0
/* 8A850 8009A050 83100200 */  sra        $v0, $v0, 2
/* 8A854 8009A054 01000324 */  addiu      $v1, $zero, 0x1
/* 8A858 8009A058 04184300 */  sllv       $v1, $v1, $v0
/* 8A85C 8009A05C 2000BFAF */  sw         $ra, 0x20($sp)
/* 8A860 8009A060 0C00228E */  lw         $v0, 0xC($s1)
/* 8A864 8009A064 27180300 */  nor        $v1, $zero, $v1
/* 8A868 8009A068 24104300 */  and        $v0, $v0, $v1
/* 8A86C 8009A06C 23004010 */  beqz       $v0, .L8009A0FC
/* 8A870 8009A070 2198E000 */   addu      $s3, $a3, $zero
/* 8A874 8009A074 ED67020C */  jal        PLANSRCH_InitNodesForSearch
/* 8A878 8009A078 21204002 */   addu      $a0, $s2, $zero
/* 8A87C 8009A07C 21200002 */  addu       $a0, $s0, $zero
/* 8A880 8009A080 21282002 */  addu       $a1, $s1, $zero
/* 8A884 8009A084 21304002 */  addu       $a2, $s2, $zero
/* 8A888 8009A088 23389200 */  subu       $a3, $a0, $s2
/* 8A88C 8009A08C C0100700 */  sll        $v0, $a3, 3
/* 8A890 8009A090 21104700 */  addu       $v0, $v0, $a3
/* 8A894 8009A094 80190200 */  sll        $v1, $v0, 6
/* 8A898 8009A098 21104300 */  addu       $v0, $v0, $v1
/* 8A89C 8009A09C C0100200 */  sll        $v0, $v0, 3
/* 8A8A0 8009A0A0 21104700 */  addu       $v0, $v0, $a3
/* 8A8A4 8009A0A4 C01B0200 */  sll        $v1, $v0, 15
/* 8A8A8 8009A0A8 21104300 */  addu       $v0, $v0, $v1
/* 8A8AC 8009A0AC C0100200 */  sll        $v0, $v0, 3
/* 8A8B0 8009A0B0 21104700 */  addu       $v0, $v0, $a3
/* 8A8B4 8009A0B4 23100200 */  negu       $v0, $v0
/* 8A8B8 8009A0B8 06008394 */  lhu        $v1, 0x6($a0)
/* 8A8BC 8009A0BC 83800200 */  sra        $s0, $v0, 2
/* 8A8C0 8009A0C0 120090A4 */  sh         $s0, 0x12($a0)
/* 8A8C4 8009A0C4 100080A4 */  sh         $zero, 0x10($a0)
/* 8A8C8 8009A0C8 01006334 */  ori        $v1, $v1, 0x1
/* 8A8CC 8009A0CC CA65020C */  jal        PLANPOOL_AreTwoNodesConnected
/* 8A8D0 8009A0D0 060083A4 */   sh        $v1, 0x6($a0)
/* 8A8D4 8009A0D4 04004010 */  beqz       $v0, .L8009A0E8
/* 8A8D8 8009A0D8 21204002 */   addu      $a0, $s2, $zero
/* 8A8DC 8009A0DC 120030A6 */  sh         $s0, 0x12($s1)
/* 8A8E0 8009A0E0 47680208 */  j          .L8009A11C
/* 8A8E4 8009A0E4 21102002 */   addu      $v0, $s1, $zero
.L8009A0E8:
/* 8A8E8 8009A0E8 21282002 */  addu       $a1, $s1, $zero
/* 8A8EC 8009A0EC 5E67020C */  jal        PLANSRCH_FindNodeToExpand
/* 8A8F0 8009A0F0 21306002 */   addu      $a2, $s3, $zero
/* 8A8F4 8009A0F4 03004014 */  bnez       $v0, .L8009A104
/* 8A8F8 8009A0F8 00000000 */   nop
.L8009A0FC:
/* 8A8FC 8009A0FC 47680208 */  j          .L8009A11C
/* 8A900 8009A100 21100000 */   addu      $v0, $zero, $zero
.L8009A104:
/* 8A904 8009A104 05005110 */  beq        $v0, $s1, .L8009A11C
/* 8A908 8009A108 21204002 */   addu      $a0, $s2, $zero
/* 8A90C 8009A10C A467020C */  jal        PLANSRCH_ExpandNode
/* 8A910 8009A110 21284000 */   addu      $a1, $v0, $zero
/* 8A914 8009A114 3A680208 */  j          .L8009A0E8
/* 8A918 8009A118 21204002 */   addu      $a0, $s2, $zero
.L8009A11C:
/* 8A91C 8009A11C 2000BF8F */  lw         $ra, 0x20($sp)
/* 8A920 8009A120 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8A924 8009A124 1800B28F */  lw         $s2, 0x18($sp)
/* 8A928 8009A128 1400B18F */  lw         $s1, 0x14($sp)
/* 8A92C 8009A12C 1000B08F */  lw         $s0, 0x10($sp)
/* 8A930 8009A130 0800E003 */  jr         $ra
/* 8A934 8009A134 2800BD27 */   addiu     $sp, $sp, 0x28
.size PLANSRCH_FindPathInGraph, . - PLANSRCH_FindPathInGraph
