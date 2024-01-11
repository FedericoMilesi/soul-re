.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PopMatrix
/* AFFD8 800BF7D8 0D800E3C */  lui        $t6, %hi(CD_read_dma_mode + 0x38)
/* AFFDC 800BF7DC 78E4CE8D */  lw         $t6, %lo(CD_read_dma_mode + 0x38)($t6)
/* AFFE0 800BF7E0 00000000 */  nop
/* AFFE4 800BF7E4 0B00C01D */  bgtz       $t6, .L800BF814
/* AFFE8 800BF7E8 00000000 */   nop
/* AFFEC 800BF7EC 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x2C)
/* AFFF0 800BF7F0 6CE43FAC */  sw         $ra, %lo(CD_read_dma_mode + 0x2C)($at)
/* AFFF4 800BF7F4 0D80043C */  lui        $a0, %hi(CD_read_dma_mode + 0x2ED)
/* AFFF8 800BF7F8 06D1010C */  jal        printf
/* AFFFC 800BF7FC 2DE78424 */   addiu     $a0, $a0, %lo(CD_read_dma_mode + 0x2ED)
/* B0000 800BF800 0D801F3C */  lui        $ra, %hi(CD_read_dma_mode + 0x2C)
/* B0004 800BF804 6CE4FF8F */  lw         $ra, %lo(CD_read_dma_mode + 0x2C)($ra)
/* B0008 800BF808 00000000 */  nop
/* B000C 800BF80C 0800E003 */  jr         $ra
/* B0010 800BF810 00000000 */   nop
.L800BF814:
/* B0014 800BF814 E0FFCE21 */  addi       $t6, $t6, -0x20 # handwritten instruction
/* B0018 800BF818 0D80013C */  lui        $at, %hi(CD_read_dma_mode + 0x38)
/* B001C 800BF81C 78E42EAC */  sw         $t6, %lo(CD_read_dma_mode + 0x38)($at)
/* B0020 800BF820 0D800F3C */  lui        $t7, %hi(CD_read_dma_mode + 0x3C)
/* B0024 800BF824 7CE4EF25 */  addiu      $t7, $t7, %lo(CD_read_dma_mode + 0x3C)
/* B0028 800BF828 2178EE01 */  addu       $t7, $t7, $t6
/* B002C 800BF82C 0000E88D */  lw         $t0, 0x0($t7)
/* B0030 800BF830 0400E98D */  lw         $t1, 0x4($t7)
/* B0034 800BF834 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* B0038 800BF838 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* B003C 800BF83C 0800E88D */  lw         $t0, 0x8($t7)
/* B0040 800BF840 0C00E98D */  lw         $t1, 0xC($t7)
/* B0044 800BF844 0010C848 */  ctc2       $t0, $2 # handwritten instruction
/* B0048 800BF848 0018C948 */  ctc2       $t1, $3 # handwritten instruction
/* B004C 800BF84C 1000E88D */  lw         $t0, 0x10($t7)
/* B0050 800BF850 00000000 */  nop
/* B0054 800BF854 0020C848 */  ctc2       $t0, $4 # handwritten instruction
/* B0058 800BF858 00000000 */  nop
/* B005C 800BF85C 1400E88D */  lw         $t0, 0x14($t7)
/* B0060 800BF860 1800E98D */  lw         $t1, 0x18($t7)
/* B0064 800BF864 1C00EA8D */  lw         $t2, 0x1C($t7)
/* B0068 800BF868 0028C848 */  ctc2       $t0, $5 # handwritten instruction
/* B006C 800BF86C 0030C948 */  ctc2       $t1, $6 # handwritten instruction
/* B0070 800BF870 0038CA48 */  ctc2       $t2, $7 # handwritten instruction
/* B0074 800BF874 0800E003 */  jr         $ra
/* B0078 800BF878 00000000 */   nop
/* B007C 800BF87C 00000000 */  nop
/* B0080 800BF880 00000000 */  nop
.size PopMatrix, . - PopMatrix
