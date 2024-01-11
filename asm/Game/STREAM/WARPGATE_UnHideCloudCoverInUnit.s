.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_UnHideCloudCoverInUnit
/* 4FDFC 8005F5FC 0D80023C */  lui        $v0, %hi(objectAccess + 0xBC)
/* 4FE00 8005F600 F8A2478C */  lw         $a3, %lo(objectAccess + 0xBC)($v0)
/* 4FE04 8005F604 00000000 */  nop
/* 4FE08 8005F608 1800E010 */  beqz       $a3, .L8005F66C
/* 4FE0C 8005F60C 21300000 */   addu      $a2, $zero, $zero
/* 4FE10 8005F610 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4FE14 8005F614 00000000 */  nop
/* 4FE18 8005F618 0400438C */  lw         $v1, 0x4($v0)
/* 4FE1C 8005F61C 00000000 */  nop
/* 4FE20 8005F620 12006010 */  beqz       $v1, .L8005F66C
/* 4FE24 8005F624 FFF70824 */   addiu     $t0, $zero, -0x801
.L8005F628:
/* 4FE28 8005F628 1C00628C */  lw         $v0, 0x1C($v1)
/* 4FE2C 8005F62C 0800658C */  lw         $a1, 0x8($v1)
/* 4FE30 8005F630 0B004714 */  bne        $v0, $a3, .L8005F660
/* 4FE34 8005F634 00000000 */   nop
/* 4FE38 8005F638 3800628C */  lw         $v0, 0x38($v1)
/* 4FE3C 8005F63C 00000000 */  nop
/* 4FE40 8005F640 07004414 */  bne        $v0, $a0, .L8005F660
/* 4FE44 8005F644 00000000 */   nop
/* 4FE48 8005F648 21306000 */  addu       $a2, $v1, $zero
/* 4FE4C 8005F64C 1400628C */  lw         $v0, 0x14($v1)
/* 4FE50 8005F650 00000000 */  nop
/* 4FE54 8005F654 24104800 */  and        $v0, $v0, $t0
/* 4FE58 8005F658 9B7D0108 */  j          .L8005F66C
/* 4FE5C 8005F65C 1400C2AC */   sw        $v0, 0x14($a2)
.L8005F660:
/* 4FE60 8005F660 2118A000 */  addu       $v1, $a1, $zero
/* 4FE64 8005F664 F0FF6014 */  bnez       $v1, .L8005F628
/* 4FE68 8005F668 00000000 */   nop
.L8005F66C:
/* 4FE6C 8005F66C 0800E003 */  jr         $ra
/* 4FE70 8005F670 2110C000 */   addu      $v0, $a2, $zero
.size WARPGATE_UnHideCloudCoverInUnit, . - WARPGATE_UnHideCloudCoverInUnit
