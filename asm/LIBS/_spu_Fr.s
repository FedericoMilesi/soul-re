.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_Fr
/* B7024 800C6824 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B7028 800C6828 1400B1AF */  sw         $s1, 0x14($sp)
/* B702C 800C682C 21888000 */  addu       $s1, $a0, $zero
/* B7030 800C6830 1000B0AF */  sw         $s0, 0x10($sp)
/* B7034 800C6834 2180A000 */  addu       $s0, $a1, $zero
/* B7038 800C6838 0D80023C */  lui        $v0, %hi(_spu_tsa)
/* B703C 800C683C 74ED4294 */  lhu        $v0, %lo(_spu_tsa)($v0)
/* B7040 800C6840 0D80053C */  lui        $a1, %hi(_spu_mem_mode_plus)
/* B7044 800C6844 84EDA58C */  lw         $a1, %lo(_spu_mem_mode_plus)($a1)
/* B7048 800C6848 02000424 */  addiu      $a0, $zero, 0x2
/* B704C 800C684C 1800BFAF */  sw         $ra, 0x18($sp)
/* B7050 800C6850 4819030C */  jal        _spu_t
/* B7054 800C6854 0428A200 */   sllv      $a1, $v0, $a1
/* B7058 800C6858 4819030C */  jal        _spu_t
/* B705C 800C685C 21200000 */   addu      $a0, $zero, $zero
/* B7060 800C6860 03000424 */  addiu      $a0, $zero, 0x3
/* B7064 800C6864 21282002 */  addu       $a1, $s1, $zero
/* B7068 800C6868 4819030C */  jal        _spu_t
/* B706C 800C686C 21300002 */   addu      $a2, $s0, $zero
/* B7070 800C6870 21100002 */  addu       $v0, $s0, $zero
/* B7074 800C6874 1800BF8F */  lw         $ra, 0x18($sp)
/* B7078 800C6878 1400B18F */  lw         $s1, 0x14($sp)
/* B707C 800C687C 1000B08F */  lw         $s0, 0x10($sp)
/* B7080 800C6880 0800E003 */  jr         $ra
/* B7084 800C6884 2000BD27 */   addiu     $sp, $sp, 0x20
.size _spu_Fr, . - _spu_Fr
