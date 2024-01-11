.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BCB88
/* AD388 800BCB88 1000A38F */  lw         $v1, 0x10($sp)
/* AD38C 800BCB8C 21108000 */  addu       $v0, $a0, $zero
/* AD390 800BCB90 000045A4 */  sh         $a1, 0x0($v0)
/* AD394 800BCB94 020046A4 */  sh         $a2, 0x2($v0)
/* AD398 800BCB98 040047A4 */  sh         $a3, 0x4($v0)
/* AD39C 800BCB9C 080040A4 */  sh         $zero, 0x8($v0)
/* AD3A0 800BCBA0 0A0040A4 */  sh         $zero, 0xA($v0)
/* AD3A4 800BCBA4 0C0040A4 */  sh         $zero, 0xC($v0)
/* AD3A8 800BCBA8 0E0040A4 */  sh         $zero, 0xE($v0)
/* AD3AC 800BCBAC 110040A0 */  sb         $zero, 0x11($v0)
/* AD3B0 800BCBB0 100040A0 */  sb         $zero, 0x10($v0)
/* AD3B4 800BCBB4 130040A0 */  sb         $zero, 0x13($v0)
/* AD3B8 800BCBB8 120040A0 */  sb         $zero, 0x12($v0)
/* AD3BC 800BCBBC 0800E003 */  jr         $ra
/* AD3C0 800BCBC0 060043A4 */   sh        $v1, 0x6($v0)
/* AD3C4 800BCBC4 00000000 */  nop
.size func_800BCB88, . - func_800BCB88
