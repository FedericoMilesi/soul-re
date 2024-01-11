.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C2020
/* B2820 800C2020 0600A010 */  beqz       $a1, .L800C203C
/* B2824 800C2024 FFFFA224 */   addiu     $v0, $a1, -0x1
/* B2828 800C2028 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800C202C:
/* B282C 800C202C 000080AC */  sw         $zero, 0x0($a0)
/* B2830 800C2030 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B2834 800C2034 FDFF4314 */  bne        $v0, $v1, .L800C202C
/* B2838 800C2038 04008424 */   addiu     $a0, $a0, 0x4
.L800C203C:
/* B283C 800C203C 0800E003 */  jr         $ra
/* B2840 800C2040 00000000 */   nop
/* B2844 800C2044 00000000 */  nop
/* B2848 800C2048 00000000 */  nop
/* B284C 800C204C 00000000 */  nop
.size func_800C2020, . - func_800C2020
