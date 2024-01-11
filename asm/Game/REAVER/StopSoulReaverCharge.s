.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StopSoulReaverCharge
/* 6ADDC 8007A5DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6ADE0 8007A5E0 21108000 */  addu       $v0, $a0, $zero
/* 6ADE4 8007A5E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6ADE8 8007A5E8 2180A000 */  addu       $s0, $a1, $zero
/* 6ADEC 8007A5EC 21200000 */  addu       $a0, $zero, $zero
/* 6ADF0 8007A5F0 21288000 */  addu       $a1, $a0, $zero
/* 6ADF4 8007A5F4 1400BFAF */  sw         $ra, 0x14($sp)
/* 6ADF8 8007A5F8 080040AC */  sw         $zero, 0x8($v0)
/* 6ADFC 8007A5FC F9C5000C */  jal        GAMEPAD_Shock1
/* 6AE00 8007A600 0C0040AC */   sw        $zero, 0xC($v0)
/* 6AE04 8007A604 9635010C */  jal        FX_EndInstanceEffects
/* 6AE08 8007A608 21200002 */   addu      $a0, $s0, $zero
/* 6AE0C 8007A60C 1400BF8F */  lw         $ra, 0x14($sp)
/* 6AE10 8007A610 1000B08F */  lw         $s0, 0x10($sp)
/* 6AE14 8007A614 0800E003 */  jr         $ra
/* 6AE18 8007A618 1800BD27 */   addiu     $sp, $sp, 0x18
.size StopSoulReaverCharge, . - StopSoulReaverCharge
