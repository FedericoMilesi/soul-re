.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C34F8
/* B3CF8 800C34F8 09008010 */  beqz       $a0, .L800C3520
/* B3CFC 800C34FC 21100000 */   addu      $v0, $zero, $zero
/* B3D00 800C3500 0300A01C */  bgtz       $a1, .L800C3510
/* B3D04 800C3504 21108000 */   addu      $v0, $a0, $zero
/* B3D08 800C3508 480D0308 */  j          .L800C3520
/* B3D0C 800C350C 21100000 */   addu      $v0, $zero, $zero
.L800C3510:
/* B3D10 800C3510 000080A0 */  sb         $zero, 0x0($a0)
/* B3D14 800C3514 FFFFA524 */  addiu      $a1, $a1, -0x1
/* B3D18 800C3518 FDFFA01C */  bgtz       $a1, .L800C3510
/* B3D1C 800C351C 01008424 */   addiu     $a0, $a0, 0x1
.L800C3520:
/* B3D20 800C3520 0800E003 */  jr         $ra
/* B3D24 800C3524 00000000 */   nop
.size func_800C34F8, . - func_800C34F8
