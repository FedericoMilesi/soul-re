.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_DebugManaFillUp
/* 95730 800A4F30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95734 800A4F34 1000BFAF */  sw         $ra, 0x10($sp)
/* 95738 800A4F38 6F93020C */  jal        SetMana
/* 9573C 800A4F3C 01000424 */   addiu     $a0, $zero, 0x1
/* 95740 800A4F40 1000BF8F */  lw         $ra, 0x10($sp)
/* 95744 800A4F44 00000000 */  nop
/* 95748 800A4F48 0800E003 */  jr         $ra
/* 9574C 800A4F4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size RAZIEL_DebugManaFillUp, . - RAZIEL_DebugManaFillUp
