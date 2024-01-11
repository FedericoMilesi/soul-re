.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razGetHeldWeapon
/* 964BC 800A5CBC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 964C0 800A5CC0 1400BFAF */  sw         $ra, 0x14($sp)
/* 964C4 800A5CC4 2197020C */  jal        razGetHeldItem
/* 964C8 800A5CC8 1000B0AF */   sw        $s0, 0x10($sp)
/* 964CC 800A5CCC 21804000 */  addu       $s0, $v0, $zero
/* 964D0 800A5CD0 08000016 */  bnez       $s0, .L800A5CF4
/* 964D4 800A5CD4 21200002 */   addu      $a0, $s0, $zero
/* 964D8 800A5CD8 1CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* 964DC 800A5CDC 00000000 */  nop
/* 964E0 800A5CE0 0A004010 */  beqz       $v0, .L800A5D0C
/* 964E4 800A5CE4 21100000 */   addu      $v0, $zero, $zero
/* 964E8 800A5CE8 60FA828F */  lw         $v0, %gp_rel(Raziel + 0x430)($gp)
/* 964EC 800A5CEC 43970208 */  j          .L800A5D0C
/* 964F0 800A5CF0 00000000 */   nop
.L800A5CF4:
/* 964F4 800A5CF4 92D1000C */  jal        INSTANCE_Query
/* 964F8 800A5CF8 01000524 */   addiu     $a1, $zero, 0x1
/* 964FC 800A5CFC 20004330 */  andi       $v1, $v0, 0x20
/* 96500 800A5D00 02006014 */  bnez       $v1, .L800A5D0C
/* 96504 800A5D04 21100002 */   addu      $v0, $s0, $zero
/* 96508 800A5D08 21100000 */  addu       $v0, $zero, $zero
.L800A5D0C:
/* 9650C 800A5D0C 1400BF8F */  lw         $ra, 0x14($sp)
/* 96510 800A5D10 1000B08F */  lw         $s0, 0x10($sp)
/* 96514 800A5D14 0800E003 */  jr         $ra
/* 96518 800A5D18 1800BD27 */   addiu     $sp, $sp, 0x18
.size razGetHeldWeapon, . - razGetHeldWeapon
