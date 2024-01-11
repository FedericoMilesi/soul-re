.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpLoadingObjects
/* 49B50 80059350 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 49B54 80059354 1000B0AF */  sw         $s0, 0x10($sp)
/* 49B58 80059358 0CBE908F */  lw         $s0, %gp_rel(gameTrackerX + 0x44)($gp)
/* 49B5C 8005935C 1400B1AF */  sw         $s1, 0x14($sp)
/* 49B60 80059360 21880000 */  addu       $s1, $zero, $zero
/* 49B64 80059364 1800B2AF */  sw         $s2, 0x18($sp)
/* 49B68 80059368 01001224 */  addiu      $s2, $zero, 0x1
/* 49B6C 8005936C 1C00BFAF */  sw         $ra, 0x1C($sp)
.L80059370:
/* 49B70 80059370 14000286 */  lh         $v0, 0x14($s0)
/* 49B74 80059374 00000000 */  nop
/* 49B78 80059378 03005214 */  bne        $v0, $s2, .L80059388
/* 49B7C 8005937C 00000000 */   nop
/* 49B80 80059380 EC64010C */  jal        STREAM_DumpObject
/* 49B84 80059384 21200002 */   addu      $a0, $s0, $zero
.L80059388:
/* 49B88 80059388 01003126 */  addiu      $s1, $s1, 0x1
/* 49B8C 8005938C 3000222A */  slti       $v0, $s1, 0x30
/* 49B90 80059390 F7FF4014 */  bnez       $v0, .L80059370
/* 49B94 80059394 24001026 */   addiu     $s0, $s0, 0x24
/* 49B98 80059398 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 49B9C 8005939C 1800B28F */  lw         $s2, 0x18($sp)
/* 49BA0 800593A0 1400B18F */  lw         $s1, 0x14($sp)
/* 49BA4 800593A4 1000B08F */  lw         $s0, 0x10($sp)
/* 49BA8 800593A8 0800E003 */  jr         $ra
/* 49BAC 800593AC 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_DumpLoadingObjects, . - STREAM_DumpLoadingObjects
