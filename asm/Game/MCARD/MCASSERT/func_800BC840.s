.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC840
/* AD040 800BC840 0600C010 */  beqz       $a2, .L800BC85C
/* AD044 800BC844 FFFFC224 */   addiu     $v0, $a2, -0x1
/* AD048 800BC848 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800BC84C:
/* AD04C 800BC84C 000085A0 */  sb         $a1, 0x0($a0)
/* AD050 800BC850 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AD054 800BC854 FDFF4314 */  bne        $v0, $v1, .L800BC84C
/* AD058 800BC858 01008424 */   addiu     $a0, $a0, 0x1
.L800BC85C:
/* AD05C 800BC85C 0800E003 */  jr         $ra
/* AD060 800BC860 00000000 */   nop
/* AD064 800BC864 00000000 */  nop
.size func_800BC840, . - func_800BC840
