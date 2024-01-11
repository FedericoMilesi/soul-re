.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GlyphPost
/* 6B530 8007AD30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B534 8007AD34 1000023C */  lui        $v0, (0x100007 >> 16)
/* 6B538 8007AD38 07004234 */  ori        $v0, $v0, (0x100007 & 0xFFFF)
/* 6B53C 8007AD3C 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B540 8007AD40 6C01848C */  lw         $a0, 0x16C($a0)
/* 6B544 8007AD44 0300A210 */  beq        $a1, $v0, .L8007AD54
/* 6B548 8007AD48 00000000 */   nop
/* 6B54C 8007AD4C 4EC3010C */  jal        EnMessageQueueData
/* 6B550 8007AD50 04008424 */   addiu     $a0, $a0, 0x4
.L8007AD54:
/* 6B554 8007AD54 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B558 8007AD58 00000000 */  nop
/* 6B55C 8007AD5C 0800E003 */  jr         $ra
/* 6B560 8007AD60 1800BD27 */   addiu     $sp, $sp, 0x18
.size GlyphPost, . - GlyphPost
