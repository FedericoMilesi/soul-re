.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphQuery
/* 6B510 8007AD10 01000224 */  addiu      $v0, $zero, 0x1
/* 6B514 8007AD14 0300A210 */  beq        $a1, $v0, .L8007AD24
/* 6B518 8007AD18 18000324 */   addiu     $v1, $zero, 0x18
/* 6B51C 8007AD1C 0200A310 */  beq        $a1, $v1, .L8007AD28
/* 6B520 8007AD20 21100000 */   addu      $v0, $zero, $zero
.L8007AD24:
/* 6B524 8007AD24 21100000 */  addu       $v0, $zero, $zero
.L8007AD28:
/* 6B528 8007AD28 0800E003 */  jr         $ra
/* 6B52C 8007AD2C 00000000 */   nop
.size GlyphQuery, . - GlyphQuery
