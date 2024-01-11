.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_ChangeOperandVector3d
/* 52A6C 8006226C 09000224 */  addiu      $v0, $zero, 0x9
/* 52A70 80062270 000082AC */  sw         $v0, 0x0($a0)
/* 52A74 80062274 040085A4 */  sh         $a1, 0x4($a0)
/* 52A78 80062278 060086A4 */  sh         $a2, 0x6($a0)
/* 52A7C 8006227C 080087A4 */  sh         $a3, 0x8($a0)
/* 52A80 80062280 1000A38F */  lw         $v1, 0x10($sp)
/* 52A84 80062284 A0000224 */  addiu      $v0, $zero, 0xA0
/* 52A88 80062288 0C0082A4 */  sh         $v0, 0xC($a0)
/* 52A8C 8006228C 0E0082A4 */  sh         $v0, 0xE($a0)
/* 52A90 80062290 100082A4 */  sh         $v0, 0x10($a0)
/* 52A94 80062294 0800E003 */  jr         $ra
/* 52A98 80062298 140083AC */   sw        $v1, 0x14($a0)
.size EVENT_ChangeOperandVector3d, . - EVENT_ChangeOperandVector3d
