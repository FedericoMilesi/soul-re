.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BF734
/* AFF34 800BF734 0D800E3C */  lui        $t6, %hi(CD_read_dma_mode + 0x38)
/* AFF38 800BF738 78E4CE8D */  lw         $t6, %lo(CD_read_dma_mode + 0x38)($t6)
/* AFF3C 800BF73C 00000000 */  nop
/* AFF40 800BF740 8002C129 */  slti       $at, $t6, 0x280
/* AFF44 800BF744 0B002014 */  bnez       $at, .L800BF774
/* AFF48 800BF748 00000000 */   nop
/* AFF4C 800BF74C 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x2C)
/* AFF50 800BF750 6CE43FAC */  sw         $ra, %lo(CD_read_dma_mode + 0x2C)($at)
/* AFF54 800BF754 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x2BC)
/* AFF58 800BF758 06D1010C */  jal        printf
/* AFF5C 800BF75C FCE68424 */   addiu     $a0, $a0, %lo(CD_read_dma_mode + 0x2BC)
/* AFF60 800BF760 0D801F3C */  lui        $ra, %hi(CD_read_dma_mode + 0x2C)
/* AFF64 800BF764 6CE4FF8F */  lw         $ra, %lo(CD_read_dma_mode + 0x2C)($ra)
/* AFF68 800BF768 00000000 */  nop
/* AFF6C 800BF76C 0800E003 */  jr         $ra
/* AFF70 800BF770 00000000 */   nop
.L800BF774:
/* AFF74 800BF774 0D800F3C */  lui        $t7, %hi(CD_read_dma_mode + 0x3C)
/* AFF78 800BF778 7CE4EF25 */  addiu      $t7, $t7, %lo(CD_read_dma_mode + 0x3C)
/* AFF7C 800BF77C 2178EE01 */  addu       $t7, $t7, $t6
/* AFF80 800BF780 00004848 */  cfc2       $t0, $0 # handwritten instruction
/* AFF84 800BF784 00084948 */  cfc2       $t1, $1 # handwritten instruction
/* AFF88 800BF788 0000E8AD */  sw         $t0, 0x0($t7)
/* AFF8C 800BF78C 0400E9AD */  sw         $t1, 0x4($t7)
/* AFF90 800BF790 00104848 */  cfc2       $t0, $2 # handwritten instruction
/* AFF94 800BF794 00184948 */  cfc2       $t1, $3 # handwritten instruction
/* AFF98 800BF798 0800E8AD */  sw         $t0, 0x8($t7)
/* AFF9C 800BF79C 0C00E9AD */  sw         $t1, 0xC($t7)
/* AFFA0 800BF7A0 00204848 */  cfc2       $t0, $4 # handwritten instruction
/* AFFA4 800BF7A4 00000000 */  nop
/* AFFA8 800BF7A8 1000E8AD */  sw         $t0, 0x10($t7)
/* AFFAC 800BF7AC 00284848 */  cfc2       $t0, $5 # handwritten instruction
/* AFFB0 800BF7B0 00304948 */  cfc2       $t1, $6 # handwritten instruction
/* AFFB4 800BF7B4 00384A48 */  cfc2       $t2, $7 # handwritten instruction
/* AFFB8 800BF7B8 1400E8AD */  sw         $t0, 0x14($t7)
/* AFFBC 800BF7BC 1800E9AD */  sw         $t1, 0x18($t7)
/* AFFC0 800BF7C0 1C00EAAD */  sw         $t2, 0x1C($t7)
/* AFFC4 800BF7C4 2000CE21 */  addi       $t6, $t6, 0x20 # handwritten instruction
/* AFFC8 800BF7C8 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x38)
/* AFFCC 800BF7CC 78E42EAC */  sw         $t6, %lo(CD_read_dma_mode + 0x38)($at)
/* AFFD0 800BF7D0 0800E003 */  jr         $ra
/* AFFD4 800BF7D4 00000000 */   nop
.size func_800BF734, . - func_800BF734
