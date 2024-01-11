.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetZRotation
/* 6A4C 8001624C B40085A4 */  sh         $a1, 0xB4($a0)
/* 6A50 80016250 400185A4 */  sh         $a1, 0x140($a0)
/* 6A54 80016254 A40185A4 */  sh         $a1, 0x1A4($a0)
/* 6A58 80016258 B60185A4 */  sh         $a1, 0x1B6($a0)
/* 6A5C 8001625C 900180A4 */  sh         $zero, 0x190($a0)
/* 6A60 80016260 880180A4 */  sh         $zero, 0x188($a0)
/* 6A64 80016264 900180A4 */  sh         $zero, 0x190($a0)
/* 6A68 80016268 0800E003 */  jr         $ra
/* 6A6C 8001626C 880180A4 */   sh        $zero, 0x188($a0)
.size CAMERA_SetZRotation, . - CAMERA_SetZRotation
