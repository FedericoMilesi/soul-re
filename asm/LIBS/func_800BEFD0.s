.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BEFD0
/* AF7D0 800BEFD0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AF7D4 800BEFD4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* AF7D8 800BEFD8 21888000 */  addu       $s1, $a0, $zero
/* AF7DC 800BEFDC 2120A000 */  addu       $a0, $a1, $zero
/* AF7E0 800BEFE0 1000A527 */  addiu      $a1, $sp, 0x10
/* AF7E4 800BEFE4 1800B0AF */  sw         $s0, 0x18($sp)
/* AF7E8 800BEFE8 2000BFAF */  sw         $ra, 0x20($sp)
/* AF7EC 800BEFEC 15FC020C */  jal        CdIntToPos
/* AF7F0 800BEFF0 2180C000 */   addu      $s0, $a2, $zero
/* AF7F4 800BEFF4 02000424 */  addiu      $a0, $zero, 0x2
/* AF7F8 800BEFF8 1000A527 */  addiu      $a1, $sp, 0x10
/* AF7FC 800BEFFC 50F8020C */  jal        CdControl
/* AF800 800BF000 21300000 */   addu      $a2, $zero, $zero
/* AF804 800BF004 21202002 */  addu       $a0, $s1, $zero
/* AF808 800BF008 21280002 */  addu       $a1, $s0, $zero
/* AF80C 800BF00C 0917030C */  jal        CdRead
/* AF810 800BF010 80000624 */   addiu     $a2, $zero, 0x80
/* AF814 800BF014 21200000 */  addu       $a0, $zero, $zero
/* AF818 800BF018 7017030C */  jal        CdReadSync
/* AF81C 800BF01C 21280000 */   addu      $a1, $zero, $zero
/* AF820 800BF020 0100422C */  sltiu      $v0, $v0, 0x1
/* AF824 800BF024 2000BF8F */  lw         $ra, 0x20($sp)
/* AF828 800BF028 1C00B18F */  lw         $s1, 0x1C($sp)
/* AF82C 800BF02C 1800B08F */  lw         $s0, 0x18($sp)
/* AF830 800BF030 0800E003 */  jr         $ra
/* AF834 800BF034 2800BD27 */   addiu     $sp, $sp, 0x28
/* AF838 800BF038 00000000 */  nop
/* AF83C 800BF03C 00000000 */  nop
/* AF840 800BF040 00000000 */  nop
.size func_800BEFD0, . - func_800BEFD0
