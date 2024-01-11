.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsCheckLOS
/* 67674 80076E74 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 67678 80076E78 0800A224 */  addiu      $v0, $a1, 0x8
/* 6767C 80076E7C 2400A5AF */  sw         $a1, 0x24($sp)
/* 67680 80076E80 1000A527 */  addiu      $a1, $sp, 0x10
/* 67684 80076E84 4000BFAF */  sw         $ra, 0x40($sp)
/* 67688 80076E88 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 6768C 80076E8C 2800A2AF */   sw        $v0, 0x28($sp)
/* 67690 80076E90 1000A287 */  lh         $v0, 0x10($sp)
/* 67694 80076E94 4000BF8F */  lw         $ra, 0x40($sp)
/* 67698 80076E98 0100422C */  sltiu      $v0, $v0, 0x1
/* 6769C 80076E9C 0800E003 */  jr         $ra
/* 676A0 80076EA0 4800BD27 */   addiu     $sp, $sp, 0x48
.size PhysicsCheckLOS, . - PhysicsCheckLOS
