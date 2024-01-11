.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SendHitObject
/* 6E7F0 8007DFF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E7F4 8007DFF4 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E7F8 8007DFF8 21888000 */  addu       $s1, $a0, $zero
/* 6E7FC 8007DFFC 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E800 8007E000 2180A000 */  addu       $s0, $a1, $zero
/* 6E804 8007E004 1800B2AF */  sw         $s2, 0x18($sp)
/* 6E808 8007E008 2190C000 */  addu       $s2, $a2, $zero
/* 6E80C 8007E00C 0001063C */  lui        $a2, (0x1000008 >> 16)
/* 6E810 8007E010 0800C634 */  ori        $a2, $a2, (0x1000008 & 0xFFFF)
/* 6E814 8007E014 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6E818 8007E018 6C01258E */  lw         $a1, 0x16C($s1)
/* 6E81C 8007E01C 10000724 */  addiu      $a3, $zero, 0x10
/* 6E820 8007E020 0800A48C */  lw         $a0, 0x8($a1)
/* 6E824 8007E024 00000000 */  nop
/* 6E828 8007E028 C0100400 */  sll        $v0, $a0, 3
.L8007E02C:
/* 6E82C 8007E02C 2118A200 */  addu       $v1, $a1, $v0
/* 6E830 8007E030 1000628C */  lw         $v0, 0x10($v1)
/* 6E834 8007E034 00000000 */  nop
/* 6E838 8007E038 07004614 */  bne        $v0, $a2, .L8007E058
/* 6E83C 8007E03C 00000000 */   nop
/* 6E840 8007E040 1400628C */  lw         $v0, 0x14($v1)
/* 6E844 8007E044 00000000 */  nop
/* 6E848 8007E048 0000428C */  lw         $v0, 0x0($v0)
/* 6E84C 8007E04C 00000000 */  nop
/* 6E850 8007E050 09005010 */  beq        $v0, $s0, .L8007E078
/* 6E854 8007E054 00000000 */   nop
.L8007E058:
/* 6E858 8007E058 01008424 */  addiu      $a0, $a0, 0x1
/* 6E85C 8007E05C 02008714 */  bne        $a0, $a3, .L8007E068
/* 6E860 8007E060 00000000 */   nop
/* 6E864 8007E064 21200000 */  addu       $a0, $zero, $zero
.L8007E068:
/* 6E868 8007E068 0C00A28C */  lw         $v0, 0xC($a1)
/* 6E86C 8007E06C 00000000 */  nop
/* 6E870 8007E070 EEFF8214 */  bne        $a0, $v0, .L8007E02C
/* 6E874 8007E074 C0100400 */   sll       $v0, $a0, 3
.L8007E078:
/* 6E878 8007E078 0C00A28C */  lw         $v0, 0xC($a1)
/* 6E87C 8007E07C 00000000 */  nop
/* 6E880 8007E080 0A008214 */  bne        $a0, $v0, .L8007E0AC
/* 6E884 8007E084 00000000 */   nop
/* 6E888 8007E088 6DC3010C */  jal        CIRC_Alloc
/* 6E88C 8007E08C 08000424 */   addiu     $a0, $zero, 0x8
/* 6E890 8007E090 21202002 */  addu       $a0, $s1, $zero
/* 6E894 8007E094 0001053C */  lui        $a1, (0x1000008 >> 16)
/* 6E898 8007E098 0800A534 */  ori        $a1, $a1, (0x1000008 & 0xFFFF)
/* 6E89C 8007E09C 21304000 */  addu       $a2, $v0, $zero
/* 6E8A0 8007E0A0 000050AC */  sw         $s0, 0x0($v0)
/* 6E8A4 8007E0A4 A1D1000C */  jal        INSTANCE_Post
/* 6E8A8 8007E0A8 040052AC */   sw        $s2, 0x4($v0)
.L8007E0AC:
/* 6E8AC 8007E0AC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6E8B0 8007E0B0 1800B28F */  lw         $s2, 0x18($sp)
/* 6E8B4 8007E0B4 1400B18F */  lw         $s1, 0x14($sp)
/* 6E8B8 8007E0B8 1000B08F */  lw         $s0, 0x10($sp)
/* 6E8BC 8007E0BC 0800E003 */  jr         $ra
/* 6E8C0 8007E0C0 2000BD27 */   addiu     $sp, $sp, 0x20
.size SendHitObject, . - SendHitObject
