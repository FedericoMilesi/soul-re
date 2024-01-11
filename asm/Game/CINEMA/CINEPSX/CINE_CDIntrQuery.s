.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_CDIntrQuery
/* A7C34 800B7434 0E80033C */  lui        $v1, %hi(StCdIntrFlag)
/* A7C38 800B7438 04BB628C */  lw         $v0, %lo(StCdIntrFlag)($v1)
/* A7C3C 800B743C 00000000 */  nop
/* A7C40 800B7440 04004010 */  beqz       $v0, .L800B7454
/* A7C44 800B7444 21100000 */   addu      $v0, $zero, $zero
/* A7C48 800B7448 04BB60AC */  sw         $zero, %lo(StCdIntrFlag)($v1)
/* A7C4C 800B744C 0800E003 */  jr         $ra
/* A7C50 800B7450 01000224 */   addiu     $v0, $zero, 0x1
.L800B7454:
/* A7C54 800B7454 0800E003 */  jr         $ra
/* A7C58 800B7458 00000000 */   nop
.size CINE_CDIntrQuery, . - CINE_CDIntrQuery
