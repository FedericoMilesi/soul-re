.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Unlock
/* 7574 80016D74 EC00828C */  lw         $v0, 0xEC($a0)
/* 7578 80016D78 27280500 */  nor        $a1, $zero, $a1
/* 757C 80016D7C 24104500 */  and        $v0, $v0, $a1
/* 7580 80016D80 0800E003 */  jr         $ra
/* 7584 80016D84 EC0082AC */   sw        $v0, 0xEC($a0)
.size CAMERA_Unlock, . - CAMERA_Unlock
