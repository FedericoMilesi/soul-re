.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA0D0
/* AA8D0 800BA0D0 0600A010 */  beqz       $a1, .L800BA0EC
/* AA8D4 800BA0D4 FFFFA224 */   addiu     $v0, $a1, -0x1
/* AA8D8 800BA0D8 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800BA0DC:
/* AA8DC 800BA0DC 000080AC */  sw         $zero, 0x0($a0)
/* AA8E0 800BA0E0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AA8E4 800BA0E4 FDFF4314 */  bne        $v0, $v1, .L800BA0DC
/* AA8E8 800BA0E8 04008424 */   addiu     $a0, $a0, 0x4
.L800BA0EC:
/* AA8EC 800BA0EC 0800E003 */  jr         $ra
/* AA8F0 800BA0F0 00000000 */   nop
.size func_800BA0D0, . - func_800BA0D0
