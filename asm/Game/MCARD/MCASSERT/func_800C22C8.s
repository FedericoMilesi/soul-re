.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C22C8
/* B2AC8 800C22C8 0600A010 */  beqz       $a1, .L800C22E4
/* B2ACC 800C22CC FFFFA224 */   addiu     $v0, $a1, -0x1
/* B2AD0 800C22D0 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800C22D4:
/* B2AD4 800C22D4 000080AC */  sw         $zero, 0x0($a0)
/* B2AD8 800C22D8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B2ADC 800C22DC FDFF4314 */  bne        $v0, $v1, .L800C22D4
/* B2AE0 800C22E0 04008424 */   addiu     $a0, $a0, 0x4
.L800C22E4:
/* B2AE4 800C22E4 0800E003 */  jr         $ra
/* B2AE8 800C22E8 00000000 */   nop
/* B2AEC 800C22EC 00000000 */  nop
.size func_800C22C8, . - func_800C22C8
