.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD220
/* ADA20 800BD220 2110A000 */  addu       $v0, $a1, $zero
/* ADA24 800BD224 0000898C */  lw         $t1, 0x0($a0)
/* ADA28 800BD228 04008A8C */  lw         $t2, 0x4($a0)
/* ADA2C 800BD22C 0400A9AC */  sw         $t1, 0x4($a1)
/* ADA30 800BD230 0000AAAC */  sw         $t2, 0x0($a1)
/* ADA34 800BD234 0000A9A4 */  sh         $t1, 0x0($a1)
/* ADA38 800BD238 08008B8C */  lw         $t3, 0x8($a0)
/* ADA3C 800BD23C 0C00898C */  lw         $t1, 0xC($a0)
/* ADA40 800BD240 0C00ABAC */  sw         $t3, 0xC($a1)
/* ADA44 800BD244 0800A9AC */  sw         $t1, 0x8($a1)
/* ADA48 800BD248 0C00AAA4 */  sh         $t2, 0xC($a1)
/* ADA4C 800BD24C 0800ABA4 */  sh         $t3, 0x8($a1)
/* ADA50 800BD250 10008A84 */  lh         $t2, 0x10($a0)
/* ADA54 800BD254 0400A9A4 */  sh         $t1, 0x4($a1)
/* ADA58 800BD258 0800E003 */  jr         $ra
/* ADA5C 800BD25C 1000AAA4 */   sh        $t2, 0x10($a1)
.size func_800BD220, . - func_800BD220
