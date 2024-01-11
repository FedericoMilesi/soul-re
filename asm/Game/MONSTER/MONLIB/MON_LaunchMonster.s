.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_LaunchMonster
/* 750F0 800848F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 750F4 800848F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 750F8 800848F8 21808000 */  addu       $s0, $a0, $zero
/* 750FC 800848FC 1400B1AF */  sw         $s1, 0x14($sp)
/* 75100 80084900 2188A000 */  addu       $s1, $a1, $zero
/* 75104 80084904 1800B2AF */  sw         $s2, 0x18($sp)
/* 75108 80084908 2190C000 */  addu       $s2, $a2, $zero
/* 7510C 8008490C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 75110 80084910 2198E000 */  addu       $s3, $a3, $zero
/* 75114 80084914 01000524 */  addiu      $a1, $zero, 0x1
/* 75118 80084918 00082226 */  addiu      $v0, $s1, 0x800
/* 7511C 8008491C 2000BFAF */  sw         $ra, 0x20($sp)
/* 75120 80084920 780002A6 */  sh         $v0, 0x78($s0)
/* 75124 80084924 F8FF0224 */  addiu      $v0, $zero, -0x8
/* 75128 80084928 740000A6 */  sh         $zero, 0x74($s0)
/* 7512C 8008492C 760000A6 */  sh         $zero, 0x76($s0)
/* 75130 80084930 800100AE */  sw         $zero, 0x180($s0)
/* 75134 80084934 840100AE */  sw         $zero, 0x184($s0)
/* 75138 80084938 5E0F020C */  jal        MON_SetVelocityTowardsImpalingObject
/* 7513C 8008493C 880102AE */   sw        $v0, 0x188($s0)
/* 75140 80084940 07004014 */  bnez       $v0, .L80084960
/* 75144 80084944 21200002 */   addu      $a0, $s0, $zero
/* 75148 80084948 002C1100 */  sll        $a1, $s1, 16
/* 7514C 8008494C 032C0500 */  sra        $a1, $a1, 16
/* 75150 80084950 B6DE010C */  jal        PhysicsSetVelFromZRot
/* 75154 80084954 21304002 */   addu      $a2, $s2, $zero
/* 75158 80084958 7C0113AE */  sw         $s3, 0x17C($s0)
/* 7515C 8008495C 21200002 */  addu       $a0, $s0, $zero
.L80084960:
/* 75160 80084960 91FE010C */  jal        MON_SwitchState
/* 75164 80084964 0B000524 */   addiu     $a1, $zero, 0xB
/* 75168 80084968 2000BF8F */  lw         $ra, 0x20($sp)
/* 7516C 8008496C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 75170 80084970 1800B28F */  lw         $s2, 0x18($sp)
/* 75174 80084974 1400B18F */  lw         $s1, 0x14($sp)
/* 75178 80084978 1000B08F */  lw         $s0, 0x10($sp)
/* 7517C 8008497C 0800E003 */  jr         $ra
/* 75180 80084980 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_LaunchMonster, . - MON_LaunchMonster
