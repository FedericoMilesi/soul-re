.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MISSILE_Collide
/* 6E244 8007DA44 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6E248 8007DA48 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E24C 8007DA4C 1400BFAF */  sw         $ra, 0x14($sp)
/* 6E250 8007DA50 89B5010C */  jal        CollidePhysicalObject
/* 6E254 8007DA54 21808000 */   addu      $s0, $a0, $zero
/* 6E258 8007DA58 4801028E */  lw         $v0, 0x148($s0)
/* 6E25C 8007DA5C 00000000 */  nop
/* 6E260 8007DA60 03004014 */  bnez       $v0, .L8007DA70
/* 6E264 8007DA64 00000000 */   nop
/* 6E268 8007DA68 85D1000C */  jal        INSTANCE_KillInstance
/* 6E26C 8007DA6C 21200002 */   addu      $a0, $s0, $zero
.L8007DA70:
/* 6E270 8007DA70 1400BF8F */  lw         $ra, 0x14($sp)
/* 6E274 8007DA74 1000B08F */  lw         $s0, 0x10($sp)
/* 6E278 8007DA78 0800E003 */  jr         $ra
/* 6E27C 8007DA7C 1800BD27 */   addiu     $sp, $sp, 0x18
.size MISSILE_Collide, . - MISSILE_Collide
