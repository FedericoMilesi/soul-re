.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_RemoveObjectEntry
/* 2EC08 8003E408 0D80023C */  lui        $v0, %hi(objectAccess)
/* 2EC0C 8003E40C 3CA2438C */  lw         $v1, %lo(objectAccess)($v0)
/* 2EC10 8003E410 00000000 */  nop
/* 2EC14 8003E414 0C006010 */  beqz       $v1, .L8003E448
/* 2EC18 8003E418 3CA24524 */   addiu     $a1, $v0, %lo(objectAccess)
/* 2EC1C 8003E41C 0400A324 */  addiu      $v1, $a1, 0x4
.L8003E420:
/* 2EC20 8003E420 0000628C */  lw         $v0, 0x0($v1)
/* 2EC24 8003E424 00000000 */  nop
/* 2EC28 8003E428 03004414 */  bne        $v0, $a0, .L8003E438
/* 2EC2C 8003E42C 0800A524 */   addiu     $a1, $a1, 0x8
/* 2EC30 8003E430 0800E003 */  jr         $ra
/* 2EC34 8003E434 000060AC */   sw        $zero, 0x0($v1)
.L8003E438:
/* 2EC38 8003E438 0000A28C */  lw         $v0, 0x0($a1)
/* 2EC3C 8003E43C 00000000 */  nop
/* 2EC40 8003E440 F7FF4014 */  bnez       $v0, .L8003E420
/* 2EC44 8003E444 08006324 */   addiu     $v1, $v1, 0x8
.L8003E448:
/* 2EC48 8003E448 0800E003 */  jr         $ra
/* 2EC4C 8003E44C 00000000 */   nop
.size OBTABLE_RemoveObjectEntry, . - OBTABLE_RemoveObjectEntry
