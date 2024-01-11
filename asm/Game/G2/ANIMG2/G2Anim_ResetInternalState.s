.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_ResetInternalState
/* 8334C 80092B4C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 83350 80092B50 E8ED8427 */  addiu      $a0, $gp, %gp_rel(_chanStatusBlockPool)
/* 83354 80092B54 1000BFAF */  sw         $ra, 0x10($sp)
/* 83358 80092B58 D257020C */  jal        G2PoolMem_ResetPool
/* 8335C 80092B5C 00000000 */   nop
/* 83360 80092B60 88F58427 */  addiu      $a0, $gp, %gp_rel(_interpStateBlockPool)
/* 83364 80092B64 D257020C */  jal        G2PoolMem_ResetPool
/* 83368 80092B68 00000000 */   nop
/* 8336C 80092B6C 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 83370 80092B70 D257020C */  jal        G2PoolMem_ResetPool
/* 83374 80092B74 00000000 */   nop
/* 83378 80092B78 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 8337C 80092B7C E157020C */  jal        G2PoolMem_Allocate
/* 83380 80092B80 00000000 */   nop
/* 83384 80092B84 FF000324 */  addiu      $v1, $zero, 0xFF
/* 83388 80092B88 000040A4 */  sh         $zero, 0x0($v0)
/* 8338C 80092B8C 030043A0 */  sb         $v1, 0x3($v0)
/* 83390 80092B90 020040A0 */  sb         $zero, 0x2($v0)
/* 83394 80092B94 1000BF8F */  lw         $ra, 0x10($sp)
/* 83398 80092B98 00000000 */  nop
/* 8339C 80092B9C 0800E003 */  jr         $ra
/* 833A0 80092BA0 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_ResetInternalState, . - G2Anim_ResetInternalState
