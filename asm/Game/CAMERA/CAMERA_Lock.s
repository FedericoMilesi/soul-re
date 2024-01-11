.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Lock
/* 7560 80016D60 EC00828C */  lw         $v0, 0xEC($a0)
/* 7564 80016D64 00000000 */  nop
/* 7568 80016D68 25104500 */  or         $v0, $v0, $a1
/* 756C 80016D6C 0800E003 */  jr         $ra
/* 7570 80016D70 EC0082AC */   sw        $v0, 0xEC($a0)
.size CAMERA_Lock, . - CAMERA_Lock
