.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverOff
/* 9658C 800A5D8C 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 96590 800A5D90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96594 800A5D94 1400BFAF */  sw         $ra, 0x14($sp)
/* 96598 800A5D98 19004010 */  beqz       $v0, .L800A5E00
/* 9659C 800A5D9C 1000B0AF */   sw        $s0, 0x10($sp)
/* 965A0 800A5DA0 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 965A4 800A5DA4 00100224 */  addiu      $v0, $zero, 0x1000
/* 965A8 800A5DA8 16006214 */  bne        $v1, $v0, .L800A5E04
/* 965AC 800A5DAC 21100000 */   addu      $v0, $zero, $zero
/* 965B0 800A5DB0 2F97020C */  jal        razGetHeldWeapon
/* 965B4 800A5DB4 00000000 */   nop
/* 965B8 800A5DB8 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 965BC 800A5DBC 28000524 */  addiu      $a1, $zero, 0x28
/* 965C0 800A5DC0 92D1000C */  jal        INSTANCE_Query
/* 965C4 800A5DC4 21804000 */   addu      $s0, $v0, $zero
/* 965C8 800A5DC8 01004230 */  andi       $v0, $v0, 0x1
/* 965CC 800A5DCC 05004010 */  beqz       $v0, .L800A5DE4
/* 965D0 800A5DD0 8000053C */   lui       $a1, (0x800101 >> 16)
/* 965D4 800A5DD4 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 965D8 800A5DD8 0101A534 */  ori        $a1, $a1, (0x800101 & 0xFFFF)
/* 965DC 800A5DDC A1D1000C */  jal        INSTANCE_Post
/* 965E0 800A5DE0 21300000 */   addu      $a2, $zero, $zero
.L800A5DE4:
/* 965E4 800A5DE4 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 965E8 800A5DE8 00000000 */  nop
/* 965EC 800A5DEC 05000216 */  bne        $s0, $v0, .L800A5E04
/* 965F0 800A5DF0 01000224 */   addiu     $v0, $zero, 0x1
/* 965F4 800A5DF4 1CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x3EC)($gp)
/* 965F8 800A5DF8 81970208 */  j          .L800A5E04
/* 965FC 800A5DFC 00000000 */   nop
.L800A5E00:
/* 96600 800A5E00 21100000 */  addu       $v0, $zero, $zero
.L800A5E04:
/* 96604 800A5E04 1400BF8F */  lw         $ra, 0x14($sp)
/* 96608 800A5E08 1000B08F */  lw         $s0, 0x10($sp)
/* 9660C 800A5E0C 0800E003 */  jr         $ra
/* 96610 800A5E10 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverOff, . - razReaverOff
