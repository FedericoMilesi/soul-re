.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverInit
/* 6A7F0 80079FF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A7F4 80079FF4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6A7F8 80079FF8 21808000 */  addu       $s0, $a0, $zero
/* 6A7FC 80079FFC 1400BFAF */  sw         $ra, 0x14($sp)
/* 6A800 8007A000 1400028E */  lw         $v0, 0x14($s0)
/* 6A804 8007A004 0200033C */  lui        $v1, (0x20000 >> 16)
/* 6A808 8007A008 24104300 */  and        $v0, $v0, $v1
/* 6A80C 8007A00C 06004010 */  beqz       $v0, .L8007A028
/* 6A810 8007A010 24000424 */   addiu     $a0, $zero, 0x24
/* 6A814 8007A014 6C01048E */  lw         $a0, 0x16C($s0)
/* 6A818 8007A018 2641010C */  jal        MEMPACK_Free
/* 6A81C 8007A01C 00000000 */   nop
/* 6A820 8007A020 1EE80108 */  j          .L8007A078
/* 6A824 8007A024 00000000 */   nop
.L8007A028:
/* 6A828 8007A028 8140010C */  jal        MEMPACK_Malloc
/* 6A82C 8007A02C 1E000524 */   addiu     $a1, $zero, 0x1E
/* 6A830 8007A030 21200002 */  addu       $a0, $s0, $zero
/* 6A834 8007A034 21280000 */  addu       $a1, $zero, $zero
/* 6A838 8007A038 21184000 */  addu       $v1, $v0, $zero
/* 6A83C 8007A03C 02000224 */  addiu      $v0, $zero, 0x2
/* 6A840 8007A040 6C0183AC */  sw         $v1, 0x16C($a0)
/* 6A844 8007A044 040062A4 */  sh         $v0, 0x4($v1)
/* 6A848 8007A048 01000224 */  addiu      $v0, $zero, 0x1
/* 6A84C 8007A04C D4EC80A7 */  sh         $zero, %gp_rel(FireReaverFlag)($gp)
/* 6A850 8007A050 010062A0 */  sb         $v0, 0x1($v1)
/* 6A854 8007A054 00100224 */  addiu      $v0, $zero, 0x1000
/* 6A858 8007A058 080060AC */  sw         $zero, 0x8($v1)
/* 6A85C 8007A05C 0C0060AC */  sw         $zero, 0xC($v1)
/* 6A860 8007A060 000060A0 */  sb         $zero, 0x0($v1)
/* 6A864 8007A064 020062A4 */  sh         $v0, 0x2($v1)
/* 6A868 8007A068 060060A4 */  sh         $zero, 0x6($v1)
/* 6A86C 8007A06C 1C0062A4 */  sh         $v0, 0x1C($v1)
/* 6A870 8007A070 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 6A874 8007A074 1E0062A4 */   sh        $v0, 0x1E($v1)
.L8007A078:
/* 6A878 8007A078 0B2B010C */  jal        FX_ReaverBladeInit
/* 6A87C 8007A07C 00000000 */   nop
/* 6A880 8007A080 1400BF8F */  lw         $ra, 0x14($sp)
/* 6A884 8007A084 1000B08F */  lw         $s0, 0x10($sp)
/* 6A888 8007A088 0800E003 */  jr         $ra
/* 6A88C 8007A08C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SoulReaverInit, . - SoulReaverInit
