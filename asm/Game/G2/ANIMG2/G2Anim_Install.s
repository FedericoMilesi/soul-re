.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_Install
/* 832E4 80092AE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 832E8 80092AE8 E8ED8427 */  addiu      $a0, $gp, %gp_rel(_chanStatusBlockPool)
/* 832EC 80092AEC B4000524 */  addiu      $a1, $zero, 0xB4
/* 832F0 80092AF0 1000BFAF */  sw         $ra, 0x10($sp)
/* 832F4 80092AF4 B757020C */  jal        G2PoolMem_InitPool
/* 832F8 80092AF8 24000624 */   addiu     $a2, $zero, 0x24
/* 832FC 80092AFC 88F58427 */  addiu      $a0, $gp, %gp_rel(_interpStateBlockPool)
/* 83300 80092B00 60000524 */  addiu      $a1, $zero, 0x60
/* 83304 80092B04 B757020C */  jal        G2PoolMem_InitPool
/* 83308 80092B08 A4000624 */   addiu     $a2, $zero, 0xA4
/* 8330C 80092B0C 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 83310 80092B10 7A000524 */  addiu      $a1, $zero, 0x7A
/* 83314 80092B14 B757020C */  jal        G2PoolMem_InitPool
/* 83318 80092B18 24000624 */   addiu     $a2, $zero, 0x24
/* 8331C 80092B1C 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 83320 80092B20 E157020C */  jal        G2PoolMem_Allocate
/* 83324 80092B24 00000000 */   nop
/* 83328 80092B28 21204000 */  addu       $a0, $v0, $zero
/* 8332C 80092B2C FF000324 */  addiu      $v1, $zero, 0xFF
/* 83330 80092B30 000080A4 */  sh         $zero, 0x0($a0)
/* 83334 80092B34 030083A0 */  sb         $v1, 0x3($a0)
/* 83338 80092B38 020080A0 */  sb         $zero, 0x2($a0)
/* 8333C 80092B3C 1000BF8F */  lw         $ra, 0x10($sp)
/* 83340 80092B40 01000224 */  addiu      $v0, $zero, 0x1
/* 83344 80092B44 0800E003 */  jr         $ra
/* 83348 80092B48 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Anim_Install, . - G2Anim_Install
