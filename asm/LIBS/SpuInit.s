.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuInit
/* B08C0 800C00C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B08C4 800C00C4 1000BFAF */  sw         $ra, 0x10($sp)
/* B08C8 800C00C8 B117030C */  jal        _SpuInit
/* B08CC 800C00CC 21200000 */   addu      $a0, $zero, $zero
/* B08D0 800C00D0 1000BF8F */  lw         $ra, 0x10($sp)
/* B08D4 800C00D4 1800BD27 */  addiu      $sp, $sp, 0x18
/* B08D8 800C00D8 0800E003 */  jr         $ra
/* B08DC 800C00DC 00000000 */   nop
.size SpuInit, . - SpuInit
