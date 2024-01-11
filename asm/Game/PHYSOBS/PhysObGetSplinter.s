.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysObGetSplinter
/* 5E6D4 8006DED4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5E6D8 8006DED8 1000B0AF */  sw         $s0, 0x10($sp)
/* 5E6DC 8006DEDC 1400BFAF */  sw         $ra, 0x14($sp)
/* 5E6E0 8006DEE0 7EB7010C */  jal        PhysObGetWeapon
/* 5E6E4 8006DEE4 21800000 */   addu      $s0, $zero, $zero
/* 5E6E8 8006DEE8 02004010 */  beqz       $v0, .L8006DEF4
/* 5E6EC 8006DEEC 00000000 */   nop
/* 5E6F0 8006DEF0 14005024 */  addiu      $s0, $v0, 0x14
.L8006DEF4:
/* 5E6F4 8006DEF4 21100002 */  addu       $v0, $s0, $zero
/* 5E6F8 8006DEF8 1400BF8F */  lw         $ra, 0x14($sp)
/* 5E6FC 8006DEFC 1000B08F */  lw         $s0, 0x10($sp)
/* 5E700 8006DF00 0800E003 */  jr         $ra
/* 5E704 8006DF04 1800BD27 */   addiu     $sp, $sp, 0x18
.size PhysObGetSplinter, . - PhysObGetSplinter
