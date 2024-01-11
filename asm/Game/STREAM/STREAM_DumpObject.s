.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_DumpObject
/* 49BB0 800593B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 49BB4 800593B4 5400B1AF */  sw         $s1, 0x54($sp)
/* 49BB8 800593B8 21888000 */  addu       $s1, $a0, $zero
/* 49BBC 800593BC 01000324 */  addiu      $v1, $zero, 0x1
/* 49BC0 800593C0 5800BFAF */  sw         $ra, 0x58($sp)
/* 49BC4 800593C4 5000B0AF */  sw         $s0, 0x50($sp)
/* 49BC8 800593C8 14002286 */  lh         $v0, 0x14($s1)
/* 49BCC 800593CC 1000308E */  lw         $s0, 0x10($s1)
/* 49BD0 800593D0 0C004314 */  bne        $v0, $v1, .L80059404
/* 49BD4 800593D4 1000A427 */   addiu     $a0, $sp, 0x10
/* 49BD8 800593D8 0D80053C */  lui        $a1, %hi(WarpRoomArray + 0x278)
/* 49BDC 800593DC 1019A524 */  addiu      $a1, $a1, %lo(WarpRoomArray + 0x278)
/* 49BE0 800593E0 21302002 */  addu       $a2, $s1, $zero
/* 49BE4 800593E4 1AD1010C */  jal        sprintf
/* 49BE8 800593E8 2138C000 */   addu      $a3, $a2, $zero
/* 49BEC 800593EC 1000A427 */  addiu      $a0, $sp, 0x10
/* 49BF0 800593F0 0680053C */  lui        $a1, %hi(STREAM_StreamLoadObjectAbort)
/* 49BF4 800593F4 8B82010C */  jal        LOAD_AbortFileLoad
/* 49BF8 800593F8 2093A524 */   addiu     $a1, $a1, %lo(STREAM_StreamLoadObjectAbort)
/* 49BFC 800593FC 21650108 */  j          .L80059484
/* 49C00 80059400 00000000 */   nop
.L80059404:
/* 49C04 80059404 1E000012 */  beqz       $s0, .L80059480
/* 49C08 80059408 0002033C */   lui       $v1, (0x2000000 >> 16)
/* 49C0C 8005940C 0000028E */  lw         $v0, 0x0($s0)
/* 49C10 80059410 00000000 */  nop
/* 49C14 80059414 24104300 */  and        $v0, $v0, $v1
/* 49C18 80059418 17004014 */  bnez       $v0, .L80059478
/* 49C1C 8005941C 00000000 */   nop
/* 49C20 80059420 1800248E */  lw         $a0, 0x18($s1)
/* 49C24 80059424 00000000 */  nop
/* 49C28 80059428 03008010 */  beqz       $a0, .L80059438
/* 49C2C 8005942C 00000000 */   nop
/* 49C30 80059430 8FCE010C */  jal        VRAM_ClearVramBlock
/* 49C34 80059434 00000000 */   nop
.L80059438:
/* 49C38 80059438 2C00028E */  lw         $v0, 0x2C($s0)
/* 49C3C 8005943C 8000033C */  lui        $v1, (0x800000 >> 16)
/* 49C40 80059440 24104300 */  and        $v0, $v0, $v1
/* 49C44 80059444 07004010 */  beqz       $v0, .L80059464
/* 49C48 80059448 00000000 */   nop
/* 49C4C 8005944C 06000486 */  lh         $a0, 0x6($s0)
/* 49C50 80059450 00000000 */  nop
/* 49C54 80059454 03008010 */  beqz       $a0, .L80059464
/* 49C58 80059458 00000000 */   nop
/* 49C5C 8005945C EC4A010C */  jal        aadFreeDynamicSfx
/* 49C60 80059460 00000000 */   nop
.L80059464:
/* 49C64 80059464 02F9000C */  jal        OBTABLE_RemoveObjectEntry
/* 49C68 80059468 21200002 */   addu      $a0, $s0, $zero
/* 49C6C 8005946C 2641010C */  jal        MEMPACK_Free
/* 49C70 80059470 21200002 */   addu      $a0, $s0, $zero
/* 49C74 80059474 140020A6 */  sh         $zero, 0x14($s1)
.L80059478:
/* 49C78 80059478 02000016 */  bnez       $s0, .L80059484
/* 49C7C 8005947C 00000000 */   nop
.L80059480:
/* 49C80 80059480 140020A6 */  sh         $zero, 0x14($s1)
.L80059484:
/* 49C84 80059484 5800BF8F */  lw         $ra, 0x58($sp)
/* 49C88 80059488 5400B18F */  lw         $s1, 0x54($sp)
/* 49C8C 8005948C 5000B08F */  lw         $s0, 0x50($sp)
/* 49C90 80059490 0800E003 */  jr         $ra
/* 49C94 80059494 6000BD27 */   addiu     $sp, $sp, 0x60
.size STREAM_DumpObject, . - STREAM_DumpObject
