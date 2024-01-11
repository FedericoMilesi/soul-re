.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOBS_IsAPushBlockAttached
/* 595C4 80068DC4 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 595C8 80068DC8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 595CC 80068DCC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 595D0 80068DD0 21988000 */  addu       $s3, $a0, $zero
/* 595D4 80068DD4 2000BFAF */  sw         $ra, 0x20($sp)
/* 595D8 80068DD8 1800B2AF */  sw         $s2, 0x18($sp)
/* 595DC 80068DDC 1400B1AF */  sw         $s1, 0x14($sp)
/* 595E0 80068DE0 1000B0AF */  sw         $s0, 0x10($sp)
/* 595E4 80068DE4 0400508C */  lw         $s0, 0x4($v0)
/* 595E8 80068DE8 00000000 */  nop
/* 595EC 80068DEC 0F000012 */  beqz       $s0, .L80068E2C
/* 595F0 80068DF0 21900000 */   addu      $s2, $zero, $zero
.L80068DF4:
/* 595F4 80068DF4 8C00038E */  lw         $v1, 0x8C($s0)
/* 595F8 80068DF8 3C00628E */  lw         $v0, 0x3C($s3)
/* 595FC 80068DFC 0800118E */  lw         $s1, 0x8($s0)
/* 59600 80068E00 07006214 */  bne        $v1, $v0, .L80068E20
/* 59604 80068E04 21200002 */   addu      $a0, $s0, $zero
/* 59608 80068E08 B0A3010C */  jal        CheckPhysObAbility
/* 5960C 80068E0C 02000524 */   addiu     $a1, $zero, 0x2
/* 59610 80068E10 03004010 */  beqz       $v0, .L80068E20
/* 59614 80068E14 00000000 */   nop
/* 59618 80068E18 8BA30108 */  j          .L80068E2C
/* 5961C 80068E1C 21900002 */   addu      $s2, $s0, $zero
.L80068E20:
/* 59620 80068E20 21802002 */  addu       $s0, $s1, $zero
/* 59624 80068E24 F3FF0016 */  bnez       $s0, .L80068DF4
/* 59628 80068E28 00000000 */   nop
.L80068E2C:
/* 5962C 80068E2C 21104002 */  addu       $v0, $s2, $zero
/* 59630 80068E30 2000BF8F */  lw         $ra, 0x20($sp)
/* 59634 80068E34 1C00B38F */  lw         $s3, 0x1C($sp)
/* 59638 80068E38 1800B28F */  lw         $s2, 0x18($sp)
/* 5963C 80068E3C 1400B18F */  lw         $s1, 0x14($sp)
/* 59640 80068E40 1000B08F */  lw         $s0, 0x10($sp)
/* 59644 80068E44 0800E003 */  jr         $ra
/* 59648 80068E48 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSOBS_IsAPushBlockAttached, . - PHYSOBS_IsAPushBlockAttached
