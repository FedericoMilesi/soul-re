.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONTABLE_SetupTablePointer
/* 7D844 8008D044 0D80063C */  lui        $a2, %hi(functionChoiceTable)
/* 7D848 8008D048 1C00828C */  lw         $v0, 0x1C($a0)
/* 7D84C 8008D04C D4C4C38C */  lw         $v1, %lo(functionChoiceTable)($a2)
/* 7D850 8008D050 1000458C */  lw         $a1, 0x10($v0)
/* 7D854 8008D054 0D006010 */  beqz       $v1, .L8008D08C
/* 7D858 8008D058 D4C4C324 */   addiu     $v1, $a2, %lo(functionChoiceTable)
/* 7D85C 8008D05C 0000628C */  lw         $v0, 0x0($v1)
.L8008D060:
/* 7D860 8008D060 00000000 */  nop
/* 7D864 8008D064 0400A214 */  bne        $a1, $v0, .L8008D078
/* 7D868 8008D068 00000000 */   nop
/* 7D86C 8008D06C 0400628C */  lw         $v0, 0x4($v1)
/* 7D870 8008D070 00000000 */  nop
/* 7D874 8008D074 400082AC */  sw         $v0, 0x40($a0)
.L8008D078:
/* 7D878 8008D078 08006324 */  addiu      $v1, $v1, 0x8
/* 7D87C 8008D07C 0000628C */  lw         $v0, 0x0($v1)
/* 7D880 8008D080 00000000 */  nop
/* 7D884 8008D084 F6FF4014 */  bnez       $v0, .L8008D060
/* 7D888 8008D088 00000000 */   nop
.L8008D08C:
/* 7D88C 8008D08C 0800E003 */  jr         $ra
/* 7D890 8008D090 00000000 */   nop
.size MONTABLE_SetupTablePointer, . - MONTABLE_SetupTablePointer
