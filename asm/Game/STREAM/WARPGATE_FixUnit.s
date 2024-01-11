.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_FixUnit
/* 4BE5C 8005B65C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4BE60 8005B660 1000B0AF */  sw         $s0, 0x10($sp)
/* 4BE64 8005B664 1400BFAF */  sw         $ra, 0x14($sp)
/* 4BE68 8005B668 816D010C */  jal        WARPGATE_IsUnitWarpRoom
/* 4BE6C 8005B66C 21808000 */   addu      $s0, $a0, $zero
/* 4BE70 8005B670 03004010 */  beqz       $v0, .L8005B680
/* 4BE74 8005B674 00000000 */   nop
/* 4BE78 8005B678 4F6D010C */  jal        WARPGATE_IsItActive
/* 4BE7C 8005B67C 21200002 */   addu      $a0, $s0, $zero
.L8005B680:
/* 4BE80 8005B680 1400BF8F */  lw         $ra, 0x14($sp)
/* 4BE84 8005B684 1000B08F */  lw         $s0, 0x10($sp)
/* 4BE88 8005B688 0800E003 */  jr         $ra
/* 4BE8C 8005B68C 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_FixUnit, . - WARPGATE_FixUnit
