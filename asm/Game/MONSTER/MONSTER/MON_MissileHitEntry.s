.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_MissileHitEntry
/* 788C0 800880C0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 788C4 800880C4 1800B0AF */  sw         $s0, 0x18($sp)
/* 788C8 800880C8 21808000 */  addu       $s0, $a0, $zero
/* 788CC 800880CC 19000524 */  addiu      $a1, $zero, 0x19
/* 788D0 800880D0 2000BFAF */  sw         $ra, 0x20($sp)
/* 788D4 800880D4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 788D8 800880D8 6C01118E */  lw         $s1, 0x16C($s0)
/* 788DC 800880DC 01000624 */  addiu      $a2, $zero, 0x1
/* 788E0 800880E0 800100AE */  sw         $zero, 0x180($s0)
/* 788E4 800880E4 840100AE */  sw         $zero, 0x184($s0)
/* 788E8 800880E8 740100AE */  sw         $zero, 0x174($s0)
/* 788EC 800880EC B6FF010C */  jal        MON_PlayAnim
/* 788F0 800880F0 780100AE */   sw        $zero, 0x178($s0)
/* 788F4 800880F4 21200002 */  addu       $a0, $s0, $zero
/* 788F8 800880F8 0000228E */  lw         $v0, 0x0($s1)
/* 788FC 800880FC 2000033C */  lui        $v1, (0x200000 >> 16)
/* 78900 80088100 25104300 */  or         $v0, $v0, $v1
/* 78904 80088104 EFFF0324 */  addiu      $v1, $zero, -0x11
/* 78908 80088108 24104300 */  and        $v0, $v0, $v1
/* 7890C 8008810C 7BFE010C */  jal        MON_TurnOffAllSpheres
/* 78910 80088110 000022AE */   sw        $v0, 0x0($s1)
/* 78914 80088114 21200002 */  addu       $a0, $s0, $zero
/* 78918 80088118 8209020C */  jal        MON_DropAllObjects
/* 7891C 8008811C 580120A2 */   sb        $zero, 0x158($s1)
/* 78920 80088120 21200000 */  addu       $a0, $zero, $zero
/* 78924 80088124 21288000 */  addu       $a1, $a0, $zero
/* 78928 80088128 D000228E */  lw         $v0, 0xD0($s1)
/* 7892C 8008812C 21308000 */  addu       $a2, $a0, $zero
/* 78930 80088130 3C00428C */  lw         $v0, 0x3C($v0)
/* 78934 80088134 21380002 */  addu       $a3, $s0, $zero
/* 78938 80088138 D40022AE */  sw         $v0, 0xD4($s1)
/* 7893C 8008813C 03000224 */  addiu      $v0, $zero, 0x3
/* 78940 80088140 21C4010C */  jal        SetObjectData
/* 78944 80088144 1000A2AF */   sw        $v0, 0x10($sp)
/* 78948 80088148 8000053C */  lui        $a1, (0x800002 >> 16)
/* 7894C 8008814C 0200A534 */  ori        $a1, $a1, (0x800002 & 0xFFFF)
/* 78950 80088150 D000248E */  lw         $a0, 0xD0($s1)
/* 78954 80088154 A1D1000C */  jal        INSTANCE_Post
/* 78958 80088158 21304000 */   addu      $a2, $v0, $zero
/* 7895C 8008815C 5C000426 */  addiu      $a0, $s0, 0x5C
/* 78960 80088160 27000524 */  addiu      $a1, $zero, 0x27
/* 78964 80088164 9CFF0624 */  addiu      $a2, $zero, -0x64
/* 78968 80088168 64000724 */  addiu      $a3, $zero, 0x64
/* 7896C 8008816C 803E0224 */  addiu      $v0, $zero, 0x3E80
/* 78970 80088170 1300010C */  jal        SOUND_Play3dSound
/* 78974 80088174 1000A2AF */   sw        $v0, 0x10($sp)
/* 78978 80088178 2000BF8F */  lw         $ra, 0x20($sp)
/* 7897C 8008817C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 78980 80088180 1800B08F */  lw         $s0, 0x18($sp)
/* 78984 80088184 0800E003 */  jr         $ra
/* 78988 80088188 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_MissileHitEntry, . - MON_MissileHitEntry
