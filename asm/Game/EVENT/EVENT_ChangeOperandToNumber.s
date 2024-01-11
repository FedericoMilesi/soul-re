.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ChangeOperandToNumber
/* 52A54 80062254 07000224 */  addiu      $v0, $zero, 0x7
/* 52A58 80062258 000082AC */  sw         $v0, 0x0($a0)
/* 52A5C 8006225C 040085AC */  sw         $a1, 0x4($a0)
/* 52A60 80062260 080080AC */  sw         $zero, 0x8($a0)
/* 52A64 80062264 0800E003 */  jr         $ra
/* 52A68 80062268 0C0086A4 */   sh        $a2, 0xC($a0)
.size EVENT_ChangeOperandToNumber, . - EVENT_ChangeOperandToNumber
