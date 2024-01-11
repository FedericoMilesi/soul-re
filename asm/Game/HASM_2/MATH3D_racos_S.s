.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel MATH3D_racos_S
/* 69BA0 800793A0 00020224 */  addiu      $v0, $zero, 0x200
/* 69BA4 800793A4 00010A24 */  addiu      $t2, $zero, 0x100
/* 69BA8 800793A8 0C80033C */  lui        $v1, (0x800CABF4 >> 16)
/* 69BAC 800793AC F4AB6334 */  ori        $v1, $v1, (0x800CABF4 & 0xFFFF)
/* 69BB0 800793B0 02008104 */  bgez       $a0, .L800793BC
/* 69BB4 800793B4 21588000 */   addu      $t3, $a0, $zero
/* 69BB8 800793B8 22580400 */  sub        $t3, $zero, $a0 # handwritten instruction
.L800793BC:
/* 69BBC 800793BC 40400200 */  sll        $t0, $v0, 1
/* 69BC0 800793C0 20400301 */  add        $t0, $t0, $v1 # handwritten instruction
/* 69BC4 800793C4 00080985 */  lh         $t1, 0x800($t0)
/* 69BC8 800793C8 21604001 */  addu       $t4, $t2, $zero
/* 69BCC 800793CC 22682B01 */  sub        $t5, $t1, $t3 # handwritten instruction
/* 69BD0 800793D0 0600A011 */  beqz       $t5, .L800793EC
/* 69BD4 800793D4 00000000 */   nop
/* 69BD8 800793D8 0200A105 */  bgez       $t5, .L800793E4
/* 69BDC 800793DC 43500A00 */   sra       $t2, $t2, 1
/* 69BE0 800793E0 22600C00 */  sub        $t4, $zero, $t4 # handwritten instruction
.L800793E4:
/* 69BE4 800793E4 F5FF4015 */  bnez       $t2, .L800793BC
/* 69BE8 800793E8 20104C00 */   add       $v0, $v0, $t4 # handwritten instruction
.L800793EC:
/* 69BEC 800793EC 02008104 */  bgez       $a0, .L800793F8
/* 69BF0 800793F0 00080324 */   addiu     $v1, $zero, 0x800
/* 69BF4 800793F4 22106200 */  sub        $v0, $v1, $v0 # handwritten instruction
.L800793F8:
/* 69BF8 800793F8 0800E003 */  jr         $ra
/* 69BFC 800793FC 00000000 */   nop
.size MATH3D_racos_S, . - MATH3D_racos_S
