.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ResolveSFXMarker
/* 5263C 80061E3C 0800888C */  lw         $t0, 0x8($a0)
/* 52640 80061E40 00000000 */  nop
/* 52644 80061E44 E800038D */  lw         $v1, 0xE8($t0)
/* 52648 80061E48 00000000 */  nop
/* 5264C 80061E4C 11006010 */  beqz       $v1, .L80061E94
/* 52650 80061E50 21300000 */   addu      $a2, $zero, $zero
/* 52654 80061E54 2A10C300 */  slt        $v0, $a2, $v1
/* 52658 80061E58 0E004010 */  beqz       $v0, .L80061E94
/* 5265C 80061E5C 2120C000 */   addu      $a0, $a2, $zero
/* 52660 80061E60 21386000 */  addu       $a3, $v1, $zero
/* 52664 80061E64 0800A58C */  lw         $a1, 0x8($a1)
/* 52668 80061E68 EC00038D */  lw         $v1, 0xEC($t0)
.L80061E6C:
/* 5266C 80061E6C 00000000 */  nop
/* 52670 80061E70 0400628C */  lw         $v0, 0x4($v1)
/* 52674 80061E74 00000000 */  nop
/* 52678 80061E78 0300A214 */  bne        $a1, $v0, .L80061E88
/* 5267C 80061E7C 01008424 */   addiu     $a0, $a0, 0x1
/* 52680 80061E80 A5870108 */  j          .L80061E94
/* 52684 80061E84 21306000 */   addu      $a2, $v1, $zero
.L80061E88:
/* 52688 80061E88 2A108700 */  slt        $v0, $a0, $a3
/* 5268C 80061E8C F7FF4014 */  bnez       $v0, .L80061E6C
/* 52690 80061E90 24006324 */   addiu     $v1, $v1, 0x24
.L80061E94:
/* 52694 80061E94 0800E003 */  jr         $ra
/* 52698 80061E98 2110C000 */   addu      $v0, $a2, $zero
.size EVENT_ResolveSFXMarker, . - EVENT_ResolveSFXMarker
