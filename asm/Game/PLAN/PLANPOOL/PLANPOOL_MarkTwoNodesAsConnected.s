.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_MarkTwoNodesAsConnected
/* 89F98 80099798 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 89F9C 8009979C 1400B1AF */  sw         $s1, 0x14($sp)
/* 89FA0 800997A0 21888000 */  addu       $s1, $a0, $zero
/* 89FA4 800997A4 23202602 */  subu       $a0, $s1, $a2
/* 89FA8 800997A8 C0100400 */  sll        $v0, $a0, 3
/* 89FAC 800997AC 21104400 */  addu       $v0, $v0, $a0
/* 89FB0 800997B0 80190200 */  sll        $v1, $v0, 6
/* 89FB4 800997B4 21104300 */  addu       $v0, $v0, $v1
/* 89FB8 800997B8 C0100200 */  sll        $v0, $v0, 3
/* 89FBC 800997BC 21104400 */  addu       $v0, $v0, $a0
/* 89FC0 800997C0 C01B0200 */  sll        $v1, $v0, 15
/* 89FC4 800997C4 21104300 */  addu       $v0, $v0, $v1
/* 89FC8 800997C8 C0100200 */  sll        $v0, $v0, 3
/* 89FCC 800997CC 21104400 */  addu       $v0, $v0, $a0
/* 89FD0 800997D0 23100200 */  negu       $v0, $v0
/* 89FD4 800997D4 1800B2AF */  sw         $s2, 0x18($sp)
/* 89FD8 800997D8 83900200 */  sra        $s2, $v0, 2
/* 89FDC 800997DC 2330A600 */  subu       $a2, $a1, $a2
/* 89FE0 800997E0 C0100600 */  sll        $v0, $a2, 3
/* 89FE4 800997E4 21104600 */  addu       $v0, $v0, $a2
/* 89FE8 800997E8 80190200 */  sll        $v1, $v0, 6
/* 89FEC 800997EC 21104300 */  addu       $v0, $v0, $v1
/* 89FF0 800997F0 C0100200 */  sll        $v0, $v0, 3
/* 89FF4 800997F4 21104600 */  addu       $v0, $v0, $a2
/* 89FF8 800997F8 C01B0200 */  sll        $v1, $v0, 15
/* 89FFC 800997FC 21104300 */  addu       $v0, $v0, $v1
/* 8A000 80099800 C0100200 */  sll        $v0, $v0, 3
/* 8A004 80099804 21104600 */  addu       $v0, $v0, $a2
/* 8A008 80099808 23100200 */  negu       $v0, $v0
/* 8A00C 8009980C 1000B0AF */  sw         $s0, 0x10($sp)
/* 8A010 80099810 83800200 */  sra        $s0, $v0, 2
/* 8A014 80099814 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8A018 80099818 CAE7000C */  jal        MATH3D_DistanceBetweenPositions
/* 8A01C 8009981C 21202002 */   addu      $a0, $s1, $zero
/* 8A020 80099820 21284000 */  addu       $a1, $v0, $zero
/* 8A024 80099824 0200A104 */  bgez       $a1, .L80099830
/* 8A028 80099828 0100023C */   lui       $v0, (0x10000 >> 16)
/* 8A02C 8009982C 21280000 */  addu       $a1, $zero, $zero
.L80099830:
/* 8A030 80099830 2A104500 */  slt        $v0, $v0, $a1
/* 8A034 80099834 02004010 */  beqz       $v0, .L80099840
/* 8A038 80099838 00000000 */   nop
/* 8A03C 8009983C 0100053C */  lui        $a1, (0x10000 >> 16)
.L80099840:
/* 8A040 80099840 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 8A044 80099844 40181000 */  sll        $v1, $s0, 1
/* 8A048 80099848 1000448C */  lw         $a0, 0x10($v0)
/* 8A04C 8009984C 80111200 */  sll        $v0, $s2, 6
/* 8A050 80099850 21104400 */  addu       $v0, $v0, $a0
/* 8A054 80099854 21186200 */  addu       $v1, $v1, $v0
/* 8A058 80099858 01000424 */  addiu      $a0, $zero, 0x1
/* 8A05C 8009985C 04200402 */  sllv       $a0, $a0, $s0
/* 8A060 80099860 000065A4 */  sh         $a1, 0x0($v1)
/* 8A064 80099864 0800228E */  lw         $v0, 0x8($s1)
/* 8A068 80099868 0C00238E */  lw         $v1, 0xC($s1)
/* 8A06C 8009986C 25104400 */  or         $v0, $v0, $a0
/* 8A070 80099870 25186400 */  or         $v1, $v1, $a0
/* 8A074 80099874 080022AE */  sw         $v0, 0x8($s1)
/* 8A078 80099878 0C0023AE */  sw         $v1, 0xC($s1)
/* 8A07C 8009987C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 8A080 80099880 1800B28F */  lw         $s2, 0x18($sp)
/* 8A084 80099884 1400B18F */  lw         $s1, 0x14($sp)
/* 8A088 80099888 1000B08F */  lw         $s0, 0x10($sp)
/* 8A08C 8009988C 0800E003 */  jr         $ra
/* 8A090 80099890 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLANPOOL_MarkTwoNodesAsConnected, . - PLANPOOL_MarkTwoNodesAsConnected
