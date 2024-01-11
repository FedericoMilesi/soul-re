.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menudefs_toggle_dualshock
/* A9254 800B8A54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9258 800B8A58 FDFFC624 */  addiu      $a2, $a2, -0x3
/* A925C 800B8A5C 0200C62C */  sltiu      $a2, $a2, 0x2
/* A9260 800B8A60 1000C010 */  beqz       $a2, .L800B8AA4
/* A9264 800B8A64 1000BFAF */   sw        $ra, 0x10($sp)
/* A9268 800B8A68 83C5000C */  jal        GAMEPAD_DualShockEnabled
/* A926C 800B8A6C 00000000 */   nop
/* A9270 800B8A70 05004010 */  beqz       $v0, .L800B8A88
/* A9274 800B8A74 00000000 */   nop
/* A9278 800B8A78 86C5000C */  jal        GAMEPAD_DisableDualShock
/* A927C 800B8A7C 00000000 */   nop
/* A9280 800B8A80 AAE20208 */  j          .L800B8AA8
/* A9284 800B8A84 01000224 */   addiu     $v0, $zero, 0x1
.L800B8A88:
/* A9288 800B8A88 96C5000C */  jal        GAMEPAD_EnableDualShock
/* A928C 800B8A8C 00000000 */   nop
/* A9290 800B8A90 80000424 */  addiu      $a0, $zero, 0x80
/* A9294 800B8A94 F9C5000C */  jal        GAMEPAD_Shock1
/* A9298 800B8A98 00800534 */   ori       $a1, $zero, 0x8000
/* A929C 800B8A9C AAE20208 */  j          .L800B8AA8
/* A92A0 800B8AA0 01000224 */   addiu     $v0, $zero, 0x1
.L800B8AA4:
/* A92A4 800B8AA4 21100000 */  addu       $v0, $zero, $zero
.L800B8AA8:
/* A92A8 800B8AA8 1000BF8F */  lw         $ra, 0x10($sp)
/* A92AC 800B8AAC 00000000 */  nop
/* A92B0 800B8AB0 0800E003 */  jr         $ra
/* A92B4 800B8AB4 1800BD27 */   addiu     $sp, $sp, 0x18
.size menudefs_toggle_dualshock, . - menudefs_toggle_dualshock
