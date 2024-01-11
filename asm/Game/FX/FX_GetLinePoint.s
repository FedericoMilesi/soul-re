.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetLinePoint
/* 3DFF0 8004D7F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 3DFF4 8004D7F4 2400B1AF */  sw         $s1, 0x24($sp)
/* 3DFF8 8004D7F8 2188A000 */  addu       $s1, $a1, $zero
/* 3DFFC 8004D7FC 2128C000 */  addu       $a1, $a2, $zero
/* 3E000 8004D800 1000A627 */  addiu      $a2, $sp, 0x10
/* 3E004 8004D804 2000B0AF */  sw         $s0, 0x20($sp)
/* 3E008 8004D808 2180E000 */  addu       $s0, $a3, $zero
/* 3E00C 8004D80C 2800B2AF */  sw         $s2, 0x28($sp)
/* 3E010 8004D810 4800B28F */  lw         $s2, 0x48($sp)
/* 3E014 8004D814 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 3E018 8004D818 C735010C */  jal        FX_GetSpiralPoint
/* 3E01C 8004D81C 1400A727 */   addiu     $a3, $sp, 0x14
/* 3E020 8004D820 21202002 */  addu       $a0, $s1, $zero
/* 3E024 8004D824 21280002 */  addu       $a1, $s0, $zero
/* 3E028 8004D828 1800A627 */  addiu      $a2, $sp, 0x18
/* 3E02C 8004D82C C735010C */  jal        FX_GetSpiralPoint
/* 3E030 8004D830 1C00A727 */   addiu     $a3, $sp, 0x1C
/* 3E034 8004D834 1800A28F */  lw         $v0, 0x18($sp)
/* 3E038 8004D838 1000A38F */  lw         $v1, 0x10($sp)
/* 3E03C 8004D83C 00000000 */  nop
/* 3E040 8004D840 23104300 */  subu       $v0, $v0, $v1
/* 3E044 8004D844 18005200 */  mult       $v0, $s2
/* 3E048 8004D848 12100000 */  mflo       $v0
/* 3E04C 8004D84C 02004104 */  bgez       $v0, .L8004D858
/* 3E050 8004D850 00000000 */   nop
/* 3E054 8004D854 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004D858:
/* 3E058 8004D858 03130200 */  sra        $v0, $v0, 12
/* 3E05C 8004D85C 21106200 */  addu       $v0, $v1, $v0
/* 3E060 8004D860 4000A38F */  lw         $v1, 0x40($sp)
/* 3E064 8004D864 00000000 */  nop
/* 3E068 8004D868 000062AC */  sw         $v0, 0x0($v1)
/* 3E06C 8004D86C 1C00A28F */  lw         $v0, 0x1C($sp)
/* 3E070 8004D870 1400A38F */  lw         $v1, 0x14($sp)
/* 3E074 8004D874 00000000 */  nop
/* 3E078 8004D878 23104300 */  subu       $v0, $v0, $v1
/* 3E07C 8004D87C 18005200 */  mult       $v0, $s2
/* 3E080 8004D880 12100000 */  mflo       $v0
/* 3E084 8004D884 02004104 */  bgez       $v0, .L8004D890
/* 3E088 8004D888 00000000 */   nop
/* 3E08C 8004D88C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004D890:
/* 3E090 8004D890 03130200 */  sra        $v0, $v0, 12
/* 3E094 8004D894 21106200 */  addu       $v0, $v1, $v0
/* 3E098 8004D898 4400A38F */  lw         $v1, 0x44($sp)
/* 3E09C 8004D89C 00000000 */  nop
/* 3E0A0 8004D8A0 000062AC */  sw         $v0, 0x0($v1)
/* 3E0A4 8004D8A4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 3E0A8 8004D8A8 2800B28F */  lw         $s2, 0x28($sp)
/* 3E0AC 8004D8AC 2400B18F */  lw         $s1, 0x24($sp)
/* 3E0B0 8004D8B0 2000B08F */  lw         $s0, 0x20($sp)
/* 3E0B4 8004D8B4 0800E003 */  jr         $ra
/* 3E0B8 8004D8B8 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_GetLinePoint, . - FX_GetLinePoint
