.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_item_flags
/* A803C 800B783C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A8040 800B7840 1800B2AF */  sw         $s2, 0x18($sp)
/* A8044 800B7844 21908000 */  addu       $s2, $a0, $zero
/* A8048 800B7848 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A804C 800B784C 1400B1AF */  sw         $s1, 0x14($sp)
/* A8050 800B7850 1000B0AF */  sw         $s0, 0x10($sp)
/* A8054 800B7854 0400428E */  lw         $v0, 0x4($s2)
/* A8058 800B7858 00000000 */  nop
/* A805C 800B785C 00890200 */  sll        $s1, $v0, 4
/* A8060 800B7860 01004224 */  addiu      $v0, $v0, 0x1
/* A8064 800B7864 C0003126 */  addiu      $s1, $s1, 0xC0
/* A8068 800B7868 21885102 */  addu       $s1, $s2, $s1
/* A806C 800B786C 040042AE */  sw         $v0, 0x4($s2)
/* A8070 800B7870 040025AE */  sw         $a1, 0x4($s1)
/* A8074 800B7874 080026AE */  sw         $a2, 0x8($s1)
/* A8078 800B7878 3000A58F */  lw         $a1, 0x30($sp)
/* A807C 800B787C 0800428E */  lw         $v0, 0x8($s2)
/* A8080 800B7880 3400A627 */  addiu      $a2, $sp, 0x34
/* A8084 800B7884 0C0027AE */  sw         $a3, 0xC($s1)
/* A8088 800B7888 80014224 */  addiu      $v0, $v0, 0x180
/* A808C 800B788C 21104202 */  addu       $v0, $s2, $v0
/* A8090 800B7890 000022AE */  sw         $v0, 0x0($s1)
/* A8094 800B7894 26D1010C */  jal        vsprintf
/* A8098 800B7898 21204000 */   addu      $a0, $v0, $zero
/* A809C 800B789C 0800508E */  lw         $s0, 0x8($s2)
/* A80A0 800B78A0 0000248E */  lw         $a0, 0x0($s1)
/* A80A4 800B78A4 ACF4020C */  jal        func_800BD2B0
/* A80A8 800B78A8 01001026 */   addiu     $s0, $s0, 0x1
/* A80AC 800B78AC 21800202 */  addu       $s0, $s0, $v0
/* A80B0 800B78B0 080050AE */  sw         $s0, 0x8($s2)
/* A80B4 800B78B4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A80B8 800B78B8 1800B28F */  lw         $s2, 0x18($sp)
/* A80BC 800B78BC 1400B18F */  lw         $s1, 0x14($sp)
/* A80C0 800B78C0 1000B08F */  lw         $s0, 0x10($sp)
/* A80C4 800B78C4 0800E003 */  jr         $ra
/* A80C8 800B78C8 2000BD27 */   addiu     $sp, $sp, 0x20
.size menu_item_flags, . - menu_item_flags
