.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_print
/* A8D34 800B8534 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A8D38 800B8538 1400B1AF */  sw         $s1, 0x14($sp)
/* A8D3C 800B853C 2188C000 */  addu       $s1, $a2, $zero
/* A8D40 800B8540 1000B0AF */  sw         $s0, 0x10($sp)
/* A8D44 800B8544 2180E000 */  addu       $s0, $a3, $zero
/* A8D48 800B8548 00240400 */  sll        $a0, $a0, 16
/* A8D4C 800B854C 03240400 */  sra        $a0, $a0, 16
/* A8D50 800B8550 002C0500 */  sll        $a1, $a1, 16
/* A8D54 800B8554 1800BFAF */  sw         $ra, 0x18($sp)
/* A8D58 800B8558 3CB6000C */  jal        FONT_SetCursor
/* A8D5C 800B855C 032C0500 */   sra       $a1, $a1, 16
/* A8D60 800B8560 03000012 */  beqz       $s0, .L800B8570
/* A8D64 800B8564 00000000 */   nop
/* A8D68 800B8568 BEB6000C */  jal        FONT_SetColorIndex
/* A8D6C 800B856C 21200002 */   addu      $a0, $s0, $zero
.L800B8570:
/* A8D70 800B8570 E7B5000C */  jal        FONT_Print2
/* A8D74 800B8574 21202002 */   addu      $a0, $s1, $zero
/* A8D78 800B8578 03000012 */  beqz       $s0, .L800B8588
/* A8D7C 800B857C 00000000 */   nop
/* A8D80 800B8580 BEB6000C */  jal        FONT_SetColorIndex
/* A8D84 800B8584 21200000 */   addu      $a0, $zero, $zero
.L800B8588:
/* A8D88 800B8588 1800BF8F */  lw         $ra, 0x18($sp)
/* A8D8C 800B858C 1400B18F */  lw         $s1, 0x14($sp)
/* A8D90 800B8590 1000B08F */  lw         $s0, 0x10($sp)
/* A8D94 800B8594 0800E003 */  jr         $ra
/* A8D98 800B8598 2000BD27 */   addiu     $sp, $sp, 0x20
.size menu_print, . - menu_print
