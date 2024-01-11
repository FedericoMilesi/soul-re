.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_RelocateObjectTune
/* 2ED44 8003E544 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2ED48 8003E548 1000BFAF */  sw         $ra, 0x10($sp)
/* 2ED4C 8003E54C 04008684 */  lh         $a2, 0x4($a0)
/* 2ED50 8003E550 00000000 */  nop
/* 2ED54 8003E554 0E00C004 */  bltz       $a2, .L8003E590
/* 2ED58 8003E558 0D80033C */   lui       $v1, %hi(objectFunc)
/* 2ED5C 8003E55C 1CA36324 */  addiu      $v1, $v1, %lo(objectFunc)
/* 2ED60 8003E560 C0100600 */  sll        $v0, $a2, 3
/* 2ED64 8003E564 21104600 */  addu       $v0, $v0, $a2
/* 2ED68 8003E568 80100200 */  sll        $v0, $v0, 2
/* 2ED6C 8003E56C 21104300 */  addu       $v0, $v0, $v1
/* 2ED70 8003E570 1C00428C */  lw         $v0, 0x1C($v0)
/* 2ED74 8003E574 00000000 */  nop
/* 2ED78 8003E578 07004010 */  beqz       $v0, .L8003E598
/* 2ED7C 8003E57C 00000000 */   nop
/* 2ED80 8003E580 09F84000 */  jalr       $v0
/* 2ED84 8003E584 00000000 */   nop
/* 2ED88 8003E588 66F90008 */  j          .L8003E598
/* 2ED8C 8003E58C 00000000 */   nop
.L8003E590:
/* 2ED90 8003E590 0BFB000C */  jal        GenericRelocateTune
/* 2ED94 8003E594 00000000 */   nop
.L8003E598:
/* 2ED98 8003E598 1000BF8F */  lw         $ra, 0x10($sp)
/* 2ED9C 8003E59C 00000000 */  nop
/* 2EDA0 8003E5A0 0800E003 */  jr         $ra
/* 2EDA4 8003E5A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size OBTABLE_RelocateObjectTune, . - OBTABLE_RelocateObjectTune
