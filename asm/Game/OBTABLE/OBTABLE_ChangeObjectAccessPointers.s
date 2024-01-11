.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_ChangeObjectAccessPointers
/* 2ECFC 8003E4FC 0D80023C */  lui        $v0, %hi(objectAccess)
/* 2ED00 8003E500 3CA2438C */  lw         $v1, %lo(objectAccess)($v0)
/* 2ED04 8003E504 00000000 */  nop
/* 2ED08 8003E508 0C006010 */  beqz       $v1, .L8003E53C
/* 2ED0C 8003E50C 3CA24624 */   addiu     $a2, $v0, %lo(objectAccess)
/* 2ED10 8003E510 0400C324 */  addiu      $v1, $a2, 0x4
.L8003E514:
/* 2ED14 8003E514 0000628C */  lw         $v0, 0x0($v1)
/* 2ED18 8003E518 00000000 */  nop
/* 2ED1C 8003E51C 03004414 */  bne        $v0, $a0, .L8003E52C
/* 2ED20 8003E520 0800C624 */   addiu     $a2, $a2, 0x8
/* 2ED24 8003E524 0800E003 */  jr         $ra
/* 2ED28 8003E528 000065AC */   sw        $a1, 0x0($v1)
.L8003E52C:
/* 2ED2C 8003E52C 0000C28C */  lw         $v0, 0x0($a2)
/* 2ED30 8003E530 00000000 */  nop
/* 2ED34 8003E534 F7FF4014 */  bnez       $v0, .L8003E514
/* 2ED38 8003E538 08006324 */   addiu     $v1, $v1, 0x8
.L8003E53C:
/* 2ED3C 8003E53C 0800E003 */  jr         $ra
/* 2ED40 8003E540 00000000 */   nop
.size OBTABLE_ChangeObjectAccessPointers, . - OBTABLE_ChangeObjectAccessPointers
