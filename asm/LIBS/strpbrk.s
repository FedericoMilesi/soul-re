.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strpbrk
/* B0084 800BF884 00008280 */  lb         $v0, 0x0($a0)
/* B0088 800BF888 00000000 */  nop
/* B008C 800BF88C 14004010 */  beqz       $v0, .L800BF8E0
/* B0090 800BF890 21408000 */   addu      $t0, $a0, $zero
.L800BF894:
/* B0094 800BF894 2130A000 */  addu       $a2, $a1, $zero
/* B0098 800BF898 0000A280 */  lb         $v0, 0x0($a1)
/* B009C 800BF89C 0000C390 */  lbu        $v1, 0x0($a2)
/* B00A0 800BF8A0 0A004010 */  beqz       $v0, .L800BF8CC
/* B00A4 800BF8A4 00160300 */   sll       $v0, $v1, 24
/* B00A8 800BF8A8 00008780 */  lb         $a3, 0x0($a0)
.L800BF8AC:
/* B00AC 800BF8AC 03160200 */  sra        $v0, $v0, 24
/* B00B0 800BF8B0 0E004710 */  beq        $v0, $a3, .L800BF8EC
/* B00B4 800BF8B4 21108000 */   addu      $v0, $a0, $zero
/* B00B8 800BF8B8 0100C624 */  addiu      $a2, $a2, 0x1
/* B00BC 800BF8BC 0000C280 */  lb         $v0, 0x0($a2)
/* B00C0 800BF8C0 0000C390 */  lbu        $v1, 0x0($a2)
/* B00C4 800BF8C4 F9FF4014 */  bnez       $v0, .L800BF8AC
/* B00C8 800BF8C8 00160300 */   sll       $v0, $v1, 24
.L800BF8CC:
/* B00CC 800BF8CC 01008424 */  addiu      $a0, $a0, 0x1
/* B00D0 800BF8D0 00008280 */  lb         $v0, 0x0($a0)
/* B00D4 800BF8D4 00000000 */  nop
/* B00D8 800BF8D8 EEFF4014 */  bnez       $v0, .L800BF894
/* B00DC 800BF8DC 00000000 */   nop
.L800BF8E0:
/* B00E0 800BF8E0 02000415 */  bne        $t0, $a0, .L800BF8EC
/* B00E4 800BF8E4 00000000 */   nop
/* B00E8 800BF8E8 21100000 */  addu       $v0, $zero, $zero
.L800BF8EC:
/* B00EC 800BF8EC 0800E003 */  jr         $ra
/* B00F0 800BF8F0 00000000 */   nop
.size strpbrk, . - strpbrk
