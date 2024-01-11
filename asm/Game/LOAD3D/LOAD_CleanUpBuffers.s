.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CleanUpBuffers
/* 28A50 80038250 14BC848F */  lw         $a0, %gp_rel(loadStatus + 0x80)($gp)
/* 28A54 80038254 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28A58 80038258 04008010 */  beqz       $a0, .L8003826C
/* 28A5C 8003825C 1000BFAF */   sw        $ra, 0x10($sp)
/* 28A60 80038260 2641010C */  jal        MEMPACK_Free
/* 28A64 80038264 00000000 */   nop
/* 28A68 80038268 14BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x80)($gp)
.L8003826C:
/* 28A6C 8003826C 18BC848F */  lw         $a0, %gp_rel(loadStatus + 0x84)($gp)
/* 28A70 80038270 00000000 */  nop
/* 28A74 80038274 04008010 */  beqz       $a0, .L80038288
/* 28A78 80038278 00000000 */   nop
/* 28A7C 8003827C 2641010C */  jal        MEMPACK_Free
/* 28A80 80038280 00000000 */   nop
/* 28A84 80038284 18BC80AF */  sw         $zero, %gp_rel(loadStatus + 0x84)($gp)
.L80038288:
/* 28A88 80038288 1000BF8F */  lw         $ra, 0x10($sp)
/* 28A8C 8003828C 00000000 */  nop
/* 28A90 80038290 0800E003 */  jr         $ra
/* 28A94 80038294 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_CleanUpBuffers, . - LOAD_CleanUpBuffers
