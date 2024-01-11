.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_EmbraceEntry
/* 7C3D8 8008BBD8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7C3DC 8008BBDC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7C3E0 8008BBE0 21808000 */  addu       $s0, $a0, $zero
/* 7C3E4 8008BBE4 1E000524 */  addiu      $a1, $zero, 0x1E
/* 7C3E8 8008BBE8 1800BFAF */  sw         $ra, 0x18($sp)
/* 7C3EC 8008BBEC 1400B1AF */  sw         $s1, 0x14($sp)
/* 7C3F0 8008BBF0 6C01118E */  lw         $s1, 0x16C($s0)
/* 7C3F4 8008BBF4 B6FF010C */  jal        MON_PlayAnim
/* 7C3F8 8008BBF8 02000624 */   addiu     $a2, $zero, 0x2
/* 7C3FC 8008BBFC 9006020C */  jal        MON_GetTime
/* 7C400 8008BC00 21200002 */   addu      $a0, $s0, $zero
/* 7C404 8008BC04 6801238E */  lw         $v1, 0x168($s1)
/* 7C408 8008BC08 00000000 */  nop
/* 7C40C 8008BC0C 0800638C */  lw         $v1, 0x8($v1)
/* 7C410 8008BC10 00000000 */  nop
/* 7C414 8008BC14 1A006384 */  lh         $v1, 0x1A($v1)
/* 7C418 8008BC18 00000000 */  nop
/* 7C41C 8008BC1C 21104300 */  addu       $v0, $v0, $v1
/* 7C420 8008BC20 140122AE */  sw         $v0, 0x114($s1)
/* 7C424 8008BC24 1800BF8F */  lw         $ra, 0x18($sp)
/* 7C428 8008BC28 1400B18F */  lw         $s1, 0x14($sp)
/* 7C42C 8008BC2C 1000B08F */  lw         $s0, 0x10($sp)
/* 7C430 8008BC30 0800E003 */  jr         $ra
/* 7C434 8008BC34 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_EmbraceEntry, . - MON_EmbraceEntry
