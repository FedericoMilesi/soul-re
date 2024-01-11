.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsObjectOnWarpSide
/* 4BCD8 8005B4D8 28C7828F */  lw         $v0, %gp_rel(WarpGateLoadInfo + 0x10)($gp)
/* 4BCDC 8005B4DC 00000000 */  nop
/* 4BCE0 8005B4E0 13004010 */  beqz       $v0, .L8005B530
/* 4BCE4 8005B4E4 00000000 */   nop
/* 4BCE8 8005B4E8 5E004284 */  lh         $v0, 0x5E($v0)
/* 4BCEC 8005B4EC 92AC8387 */  lh         $v1, %gp_rel(theCamera + 0x2)($gp)
/* 4BCF0 8005B4F0 00000000 */  nop
/* 4BCF4 8005B4F4 23184300 */  subu       $v1, $v0, $v1
/* 4BCF8 8005B4F8 27180300 */  nor        $v1, $zero, $v1
/* 4BCFC 8005B4FC C22F0300 */  srl        $a1, $v1, 31
/* 4BD00 8005B500 5E008384 */  lh         $v1, 0x5E($a0)
/* 4BD04 8005B504 00000000 */  nop
/* 4BD08 8005B508 23104300 */  subu       $v0, $v0, $v1
/* 4BD0C 8005B50C 06004104 */  bgez       $v0, .L8005B528
/* 4BD10 8005B510 2120A000 */   addu      $a0, $a1, $zero
/* 4BD14 8005B514 01000224 */  addiu      $v0, $zero, 0x1
/* 4BD18 8005B518 0500A214 */  bne        $a1, $v0, .L8005B530
/* 4BD1C 8005B51C 00000000 */   nop
.L8005B520:
/* 4BD20 8005B520 0800E003 */  jr         $ra
/* 4BD24 8005B524 00000000 */   nop
.L8005B528:
/* 4BD28 8005B528 FDFF8010 */  beqz       $a0, .L8005B520
/* 4BD2C 8005B52C 01000224 */   addiu     $v0, $zero, 0x1
.L8005B530:
/* 4BD30 8005B530 21100000 */  addu       $v0, $zero, $zero
/* 4BD34 8005B534 0800E003 */  jr         $ra
/* 4BD38 8005B538 00000000 */   nop
.size WARPGATE_IsObjectOnWarpSide, . - WARPGATE_IsObjectOnWarpSide
