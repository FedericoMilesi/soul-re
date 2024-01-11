.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel rsin
/* 69B40 80079340 FF078230 */  andi       $v0, $a0, 0x7FF
/* 69B44 80079344 40100200 */  sll        $v0, $v0, 1
/* 69B48 80079348 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 69B4C 8007934C F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69B50 80079350 20186200 */  add        $v1, $v1, $v0 # handwritten instruction
/* 69B54 80079354 00006284 */  lh         $v0, 0x0($v1)
/* 69B58 80079358 00088430 */  andi       $a0, $a0, 0x800
/* 69B5C 8007935C 02008010 */  beqz       $a0, .L80079368
/* 69B60 80079360 00000000 */   nop
/* 69B64 80079364 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
.L80079368:
/* 69B68 80079368 0800E003 */  jr         $ra
/* 69B6C 8007936C 00000000 */   nop
.size rsin, . - rsin
