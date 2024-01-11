.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel OBTABLE_ClearObjectReferences
/* 2EBD4 8003E3D4 0D80023C */  lui        $v0, %hi(objectAccess)
/* 2EBD8 8003E3D8 3CA2438C */  lw         $v1, %lo(objectAccess)($v0)
/* 2EBDC 8003E3DC 00000000 */  nop
/* 2EBE0 8003E3E0 07006010 */  beqz       $v1, .L8003E400
/* 2EBE4 8003E3E4 3CA24424 */   addiu     $a0, $v0, %lo(objectAccess)
.L8003E3E8:
/* 2EBE8 8003E3E8 040080AC */  sw         $zero, 0x4($a0)
/* 2EBEC 8003E3EC 08008424 */  addiu      $a0, $a0, 0x8
/* 2EBF0 8003E3F0 0000828C */  lw         $v0, 0x0($a0)
/* 2EBF4 8003E3F4 00000000 */  nop
/* 2EBF8 8003E3F8 FBFF4014 */  bnez       $v0, .L8003E3E8
/* 2EBFC 8003E3FC 00000000 */   nop
.L8003E400:
/* 2EC00 8003E400 0800E003 */  jr         $ra
/* 2EC04 8003E404 00000000 */   nop
.size OBTABLE_ClearObjectReferences, . - OBTABLE_ClearObjectReferences
