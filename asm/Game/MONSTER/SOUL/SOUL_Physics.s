.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Physics
/* 7E12C 8008D92C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7E130 8008D930 1000BFAF */  sw         $ra, 0x10($sp)
/* 7E134 8008D934 6C01838C */  lw         $v1, 0x16C($a0)
/* 7E138 8008D938 2130A000 */  addu       $a2, $a1, $zero
/* 7E13C 8008D93C 2A016294 */  lhu        $v0, 0x12A($v1)
/* 7E140 8008D940 00000000 */  nop
/* 7E144 8008D944 1F004230 */  andi       $v0, $v0, 0x1F
/* 7E148 8008D948 10004228 */  slti       $v0, $v0, 0x10
/* 7E14C 8008D94C 02004010 */  beqz       $v0, .L8008D958
/* 7E150 8008D950 FCFF0524 */   addiu     $a1, $zero, -0x4
/* 7E154 8008D954 04000524 */  addiu      $a1, $zero, 0x4
.L8008D958:
/* 7E158 8008D958 8801828C */  lw         $v0, 0x188($a0)
/* 7E15C 8008D95C 00000000 */  nop
/* 7E160 8008D960 21104500 */  addu       $v0, $v0, $a1
/* 7E164 8008D964 880182AC */  sw         $v0, 0x188($a0)
/* 7E168 8008D968 2A016294 */  lhu        $v0, 0x12A($v1)
/* 7E16C 8008D96C 5C008524 */  addiu      $a1, $a0, 0x5C
/* 7E170 8008D970 01004224 */  addiu      $v0, $v0, 0x1
/* 7E174 8008D974 4FDE010C */  jal        PhysicsMove
/* 7E178 8008D978 2A0162A4 */   sh        $v0, 0x12A($v1)
/* 7E17C 8008D97C 1000BF8F */  lw         $ra, 0x10($sp)
/* 7E180 8008D980 00000000 */  nop
/* 7E184 8008D984 0800E003 */  jr         $ra
/* 7E188 8008D988 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_Physics, . - SOUL_Physics
