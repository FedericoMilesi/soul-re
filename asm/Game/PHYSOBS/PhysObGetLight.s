.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysObGetLight
/* 5E69C 8006DE9C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5E6A0 8006DEA0 1000B0AF */  sw         $s0, 0x10($sp)
/* 5E6A4 8006DEA4 1400BFAF */  sw         $ra, 0x14($sp)
/* 5E6A8 8006DEA8 7EB7010C */  jal        PhysObGetWeapon
/* 5E6AC 8006DEAC 21800000 */   addu      $s0, $zero, $zero
/* 5E6B0 8006DEB0 02004010 */  beqz       $v0, .L8006DEBC
/* 5E6B4 8006DEB4 00000000 */   nop
/* 5E6B8 8006DEB8 1000508C */  lw         $s0, 0x10($v0)
.L8006DEBC:
/* 5E6BC 8006DEBC 00000000 */  nop
/* 5E6C0 8006DEC0 21100002 */  addu       $v0, $s0, $zero
/* 5E6C4 8006DEC4 1400BF8F */  lw         $ra, 0x14($sp)
/* 5E6C8 8006DEC8 1000B08F */  lw         $s0, 0x10($sp)
/* 5E6CC 8006DECC 0800E003 */  jr         $ra
/* 5E6D0 8006DED0 1800BD27 */   addiu     $sp, $sp, 0x18
.size PhysObGetLight, . - PhysObGetLight
