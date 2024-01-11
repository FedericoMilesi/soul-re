.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_BlockWarpGateEntrance
/* 4FCD4 8005F4D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4FCD8 8005F4D8 1000B0AF */  sw         $s0, 0x10($sp)
/* 4FCDC 8005F4DC 2180A000 */  addu       $s0, $a1, $zero
/* 4FCE0 8005F4E0 1400BFAF */  sw         $ra, 0x14($sp)
/* 4FCE4 8005F4E4 1D7D010C */  jal        STREAM_GetBspTree
/* 4FCE8 8005F4E8 07000524 */   addiu     $a1, $zero, 0x7
/* 4FCEC 8005F4EC 21184000 */  addu       $v1, $v0, $zero
/* 4FCF0 8005F4F0 10006010 */  beqz       $v1, .L8005F534
/* 4FCF4 8005F4F4 00000000 */   nop
/* 4FCF8 8005F4F8 08000012 */  beqz       $s0, .L8005F51C
/* 4FCFC 8005F4FC 00000000 */   nop
/* 4FD00 8005F500 12006294 */  lhu        $v0, 0x12($v1)
/* 4FD04 8005F504 00000000 */  nop
/* 4FD08 8005F508 02004234 */  ori        $v0, $v0, 0x2
/* 4FD0C 8005F50C 120062A4 */  sh         $v0, 0x12($v1)
/* 4FD10 8005F510 1DC780A3 */  sb         $zero, %gp_rel(WarpGateLoadInfo + 0x5)($gp)
/* 4FD14 8005F514 4D7D0108 */  j          .L8005F534
/* 4FD18 8005F518 00000000 */   nop
.L8005F51C:
/* 4FD1C 8005F51C 12006294 */  lhu        $v0, 0x12($v1)
/* 4FD20 8005F520 00000000 */  nop
/* 4FD24 8005F524 FDFF4230 */  andi       $v0, $v0, 0xFFFD
/* 4FD28 8005F528 120062A4 */  sh         $v0, 0x12($v1)
/* 4FD2C 8005F52C 01000224 */  addiu      $v0, $zero, 0x1
/* 4FD30 8005F530 1DC782A3 */  sb         $v0, %gp_rel(WarpGateLoadInfo + 0x5)($gp)
.L8005F534:
/* 4FD34 8005F534 1400BF8F */  lw         $ra, 0x14($sp)
/* 4FD38 8005F538 1000B08F */  lw         $s0, 0x10($sp)
/* 4FD3C 8005F53C 0800E003 */  jr         $ra
/* 4FD40 8005F540 1800BD27 */   addiu     $sp, $sp, 0x18
.size WARPGATE_BlockWarpGateEntrance, . - WARPGATE_BlockWarpGateEntrance
