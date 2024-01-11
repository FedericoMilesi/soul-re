.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_item
/* A80CC 800B78CC 0C00A7AF */  sw         $a3, 0xC($sp)
/* A80D0 800B78D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A80D4 800B78D4 1800B2AF */  sw         $s2, 0x18($sp)
/* A80D8 800B78D8 21908000 */  addu       $s2, $a0, $zero
/* A80DC 800B78DC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A80E0 800B78E0 1400B1AF */  sw         $s1, 0x14($sp)
/* A80E4 800B78E4 1000B0AF */  sw         $s0, 0x10($sp)
/* A80E8 800B78E8 0400428E */  lw         $v0, 0x4($s2)
/* A80EC 800B78EC 00000000 */  nop
/* A80F0 800B78F0 00190200 */  sll        $v1, $v0, 4
/* A80F4 800B78F4 01004224 */  addiu      $v0, $v0, 0x1
/* A80F8 800B78F8 C0006324 */  addiu      $v1, $v1, 0xC0
/* A80FC 800B78FC 21884302 */  addu       $s1, $s2, $v1
/* A8100 800B7900 040042AE */  sw         $v0, 0x4($s2)
/* A8104 800B7904 040025AE */  sw         $a1, 0x4($s1)
/* A8108 800B7908 080026AE */  sw         $a2, 0x8($s1)
/* A810C 800B790C 0800428E */  lw         $v0, 0x8($s2)
/* A8110 800B7910 2128E000 */  addu       $a1, $a3, $zero
/* A8114 800B7914 2C00A7AF */  sw         $a3, 0x2C($sp)
/* A8118 800B7918 0C0020AE */  sw         $zero, 0xC($s1)
/* A811C 800B791C 80014224 */  addiu      $v0, $v0, 0x180
/* A8120 800B7920 21104202 */  addu       $v0, $s2, $v0
/* A8124 800B7924 0B00A010 */  beqz       $a1, .L800B7954
/* A8128 800B7928 000022AE */   sw        $v0, 0x0($s1)
/* A812C 800B792C 21204000 */  addu       $a0, $v0, $zero
/* A8130 800B7930 26D1010C */  jal        vsprintf
/* A8134 800B7934 3000A627 */   addiu     $a2, $sp, 0x30
/* A8138 800B7938 0800508E */  lw         $s0, 0x8($s2)
/* A813C 800B793C 0000248E */  lw         $a0, 0x0($s1)
/* A8140 800B7940 ACF4020C */  jal        strlen
/* A8144 800B7944 01001026 */   addiu     $s0, $s0, 0x1
/* A8148 800B7948 21800202 */  addu       $s0, $s0, $v0
/* A814C 800B794C 56DE0208 */  j          .L800B7958
/* A8150 800B7950 080050AE */   sw        $s0, 0x8($s2)
.L800B7954:
/* A8154 800B7954 000020AE */  sw         $zero, 0x0($s1)
.L800B7958:
/* A8158 800B7958 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A815C 800B795C 1800B28F */  lw         $s2, 0x18($sp)
/* A8160 800B7960 1400B18F */  lw         $s1, 0x14($sp)
/* A8164 800B7964 1000B08F */  lw         $s0, 0x10($sp)
/* A8168 800B7968 0800E003 */  jr         $ra
/* A816C 800B796C 2000BD27 */   addiu     $sp, $sp, 0x20
.size menu_item, . - menu_item
