.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_DetectInit
/* 22320 80031B20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 22324 80031B24 1000B0AF */  sw         $s0, 0x10($sp)
/* 22328 80031B28 2A929087 */  lh         $s0, %gp_rel(dualshock_onflag)($gp)
/* 2232C 80031B2C 1400BFAF */  sw         $ra, 0x14($sp)
/* 22330 80031B30 08C6000C */  jal        GAMEPAD_Detect
/* 22334 80031B34 00000000 */   nop
/* 22338 80031B38 2C92828F */  lw         $v0, %gp_rel(dualShock)($gp)
/* 2233C 80031B3C 00000000 */  nop
/* 22340 80031B40 05004010 */  beqz       $v0, .L80031B58
/* 22344 80031B44 00000000 */   nop
/* 22348 80031B48 03000012 */  beqz       $s0, .L80031B58
/* 2234C 80031B4C 00000000 */   nop
/* 22350 80031B50 96C5000C */  jal        GAMEPAD_EnableDualShock
/* 22354 80031B54 00000000 */   nop
.L80031B58:
/* 22358 80031B58 1400BF8F */  lw         $ra, 0x14($sp)
/* 2235C 80031B5C 1000B08F */  lw         $s0, 0x10($sp)
/* 22360 80031B60 0800E003 */  jr         $ra
/* 22364 80031B64 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_DetectInit, . - GAMEPAD_DetectInit
