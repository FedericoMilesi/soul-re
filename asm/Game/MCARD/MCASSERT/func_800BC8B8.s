.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC8B8
/* AD0B8 800BC8B8 09008010 */  beqz       $a0, .L800BC8E0
/* AD0BC 800BC8BC 21100000 */   addu      $v0, $zero, $zero
/* AD0C0 800BC8C0 0300C01C */  bgtz       $a2, .L800BC8D0
/* AD0C4 800BC8C4 21108000 */   addu      $v0, $a0, $zero
/* AD0C8 800BC8C8 38F20208 */  j          .L800BC8E0
/* AD0CC 800BC8CC 21100000 */   addu      $v0, $zero, $zero
.L800BC8D0:
/* AD0D0 800BC8D0 000085A0 */  sb         $a1, 0x0($a0)
/* AD0D4 800BC8D4 FFFFC624 */  addiu      $a2, $a2, -0x1
/* AD0D8 800BC8D8 FDFFC01C */  bgtz       $a2, .L800BC8D0
/* AD0DC 800BC8DC 01008424 */   addiu     $a0, $a0, 0x1
.L800BC8E0:
/* AD0E0 800BC8E0 0800E003 */  jr         $ra
/* AD0E4 800BC8E4 00000000 */   nop
.size func_800BC8B8, . - func_800BC8B8
