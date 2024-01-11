.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_MoveForward
/* 71948 80081148 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7194C 8008114C 1000B0AF */  sw         $s0, 0x10($sp)
/* 71950 80081150 21808000 */  addu       $s0, $a0, $zero
/* 71954 80081154 1400BFAF */  sw         $ra, 0x14($sp)
/* 71958 80081158 6C01028E */  lw         $v0, 0x16C($s0)
/* 7195C 8008115C 00000000 */  nop
/* 71960 80081160 2A014684 */  lh         $a2, 0x12A($v0)
/* 71964 80081164 D2DE010C */  jal        PhysicsSetVelFromRot
/* 71968 80081168 74000526 */   addiu     $a1, $s0, 0x74
/* 7196C 8008116C 21200002 */  addu       $a0, $s0, $zero
/* 71970 80081170 800180AC */  sw         $zero, 0x180($a0)
/* 71974 80081174 840180AC */  sw         $zero, 0x184($a0)
/* 71978 80081178 880180AC */  sw         $zero, 0x188($a0)
/* 7197C 8008117C 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 71980 80081180 4FDE010C */  jal        PhysicsMove
/* 71984 80081184 5C008524 */   addiu     $a1, $a0, 0x5C
/* 71988 80081188 1400BF8F */  lw         $ra, 0x14($sp)
/* 7198C 8008118C 1000B08F */  lw         $s0, 0x10($sp)
/* 71990 80081190 0800E003 */  jr         $ra
/* 71994 80081194 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_MoveForward, . - MON_MoveForward
