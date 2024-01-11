.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_DeleteRandomNode
/* 88110 80097910 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 88114 80097914 1000B0AF */  sw         $s0, 0x10($sp)
/* 88118 80097918 21808000 */  addu       $s0, $a0, $zero
/* 8811C 8009791C 1400BFAF */  sw         $ra, 0x14($sp)
/* 88120 80097920 A264020C */  jal        PLANPOOL_GetFirstNodeOfSource
/* 88124 80097924 21280000 */   addu      $a1, $zero, $zero
/* 88128 80097928 21204000 */  addu       $a0, $v0, $zero
/* 8812C 8009792C EB66020C */  jal        PLANPOOL_DeleteNodeFromPool
/* 88130 80097930 21280002 */   addu      $a1, $s0, $zero
/* 88134 80097934 1400BF8F */  lw         $ra, 0x14($sp)
/* 88138 80097938 1000B08F */  lw         $s0, 0x10($sp)
/* 8813C 8009793C 0800E003 */  jr         $ra
/* 88140 80097940 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLAN_DeleteRandomNode, . - PLAN_DeleteRandomNode
