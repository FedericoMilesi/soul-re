.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80079370
/* 69B70 80079370 FF078230 */  andi       $v0, $a0, 0x7FF
/* 69B74 80079374 40100200 */  sll        $v0, $v0, 1
/* 69B78 80079378 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 69B7C 8007937C F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69B80 80079380 20186200 */  add        $v1, $v1, $v0 # handwritten instruction
/* 69B84 80079384 00086284 */  lh         $v0, 0x800($v1)
/* 69B88 80079388 00088430 */  andi       $a0, $a0, 0x800
/* 69B8C 8007938C 02008010 */  beqz       $a0, .L80079398
/* 69B90 80079390 00000000 */   nop
/* 69B94 80079394 22100200 */  sub        $v0, $zero, $v0 # handwritten instruction
.L80079398:
/* 69B98 80079398 0800E003 */  jr         $ra
/* 69B9C 8007939C 00000000 */   nop
.size func_80079370, . - func_80079370
