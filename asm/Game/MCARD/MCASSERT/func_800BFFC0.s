.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BFFC0
/* B07C0 800BFFC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B07C4 800BFFC4 1000BFAF */  sw         $ra, 0x10($sp)
/* B07C8 800BFFC8 CC000624 */  addiu      $a2, $zero, 0xCC
/* B07CC 800BFFCC 041B030C */  jal        func_800C6C10
/* B07D0 800BFFD0 CD000724 */   addiu     $a3, $zero, 0xCD
/* B07D4 800BFFD4 1000BF8F */  lw         $ra, 0x10($sp)
/* B07D8 800BFFD8 1800BD27 */  addiu      $sp, $sp, 0x18
/* B07DC 800BFFDC 0800E003 */  jr         $ra
/* B07E0 800BFFE0 00000000 */   nop
/* B07E4 800BFFE4 00000000 */  nop
/* B07E8 800BFFE8 00000000 */  nop
/* B07EC 800BFFEC 00000000 */  nop
.size func_800BFFC0, . - func_800BFFC0
