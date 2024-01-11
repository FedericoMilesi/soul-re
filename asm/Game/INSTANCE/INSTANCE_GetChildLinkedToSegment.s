.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_GetChildLinkedToSegment
/* 2605C 8003585C 4C01838C */  lw         $v1, 0x14C($a0)
/* 26060 80035860 00000000 */  nop
/* 26064 80035864 09006010 */  beqz       $v1, .L8003588C
/* 26068 80035868 00000000 */   nop
.L8003586C:
/* 2606C 8003586C 5401628C */  lw         $v0, 0x154($v1)
/* 26070 80035870 00000000 */  nop
/* 26074 80035874 05004510 */  beq        $v0, $a1, .L8003588C
/* 26078 80035878 00000000 */   nop
/* 2607C 8003587C 5001638C */  lw         $v1, 0x150($v1)
/* 26080 80035880 00000000 */  nop
/* 26084 80035884 F9FF6014 */  bnez       $v1, .L8003586C
/* 26088 80035888 00000000 */   nop
.L8003588C:
/* 2608C 8003588C 0800E003 */  jr         $ra
/* 26090 80035890 21106000 */   addu      $v0, $v1, $zero
.size INSTANCE_GetChildLinkedToSegment, . - INSTANCE_GetChildLinkedToSegment
