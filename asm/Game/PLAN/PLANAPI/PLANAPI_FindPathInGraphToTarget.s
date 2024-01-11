.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_FindPathInGraphToTarget
/* 88938 80098138 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8893C 8009813C 1000B0AF */  sw         $s0, 0x10($sp)
/* 88940 80098140 D8BF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x210)($gp)
/* 88944 80098144 1400B1AF */  sw         $s1, 0x14($sp)
/* 88948 80098148 2188A000 */  addu       $s1, $a1, $zero
/* 8894C 8009814C 1800B2AF */  sw         $s2, 0x18($sp)
/* 88950 80098150 2190C000 */  addu       $s2, $a2, $zero
/* 88954 80098154 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 88958 80098158 F864020C */  jal        PLANPOOL_GetNodeByPosition
/* 8895C 8009815C 21280002 */   addu      $a1, $s0, $zero
/* 88960 80098160 21200002 */  addu       $a0, $s0, $zero
/* 88964 80098164 03000524 */  addiu      $a1, $zero, 0x3
/* 88968 80098168 A264020C */  jal        PLANPOOL_GetFirstNodeOfSource
/* 8896C 8009816C 21804000 */   addu      $s0, $v0, $zero
/* 88970 80098170 21200002 */  addu       $a0, $s0, $zero
/* 88974 80098174 21284000 */  addu       $a1, $v0, $zero
/* 88978 80098178 21302002 */  addu       $a2, $s1, $zero
/* 8897C 8009817C 605F020C */  jal        PLANAPI_FindPathBetweenNodes
/* 88980 80098180 21384002 */   addu      $a3, $s2, $zero
/* 88984 80098184 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 88988 80098188 1800B28F */  lw         $s2, 0x18($sp)
/* 8898C 8009818C 1400B18F */  lw         $s1, 0x14($sp)
/* 88990 80098190 1000B08F */  lw         $s0, 0x10($sp)
/* 88994 80098194 0800E003 */  jr         $ra
/* 88998 80098198 2000BD27 */   addiu     $sp, $sp, 0x20
.size PLANAPI_FindPathInGraphToTarget, . - PLANAPI_FindPathInGraphToTarget
