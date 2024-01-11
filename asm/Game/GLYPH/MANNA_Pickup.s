.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MANNA_Pickup
/* 6CB5C 8007C35C 0100023C */  lui        $v0, (0x1E000 >> 16)
/* 6CB60 8007C360 00E04234 */  ori        $v0, $v0, (0x1E000 & 0xFFFF)
/* 6CB64 8007C364 F0EC82AF */  sw         $v0, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6CB68 8007C368 18000224 */  addiu      $v0, $zero, 0x18
/* 6CB6C 8007C36C D8EC82A7 */  sh         $v0, %gp_rel(MANNA_Position)($gp)
/* 6CB70 8007C370 0800E003 */  jr         $ra
/* 6CB74 8007C374 00000000 */   nop
.size MANNA_Pickup, . - MANNA_Pickup
