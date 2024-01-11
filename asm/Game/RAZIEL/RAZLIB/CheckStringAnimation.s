.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckStringAnimation
/* 97DCC 800A75CC D8FB828F */  lw         $v0, %gp_rel(Raziel + 0x5A8)($gp)
/* 97DD0 800A75D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 97DD4 800A75D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 97DD8 800A75D8 21888000 */  addu       $s1, $a0, $zero
/* 97DDC 800A75DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 97DE0 800A75E0 21800000 */  addu       $s0, $zero, $zero
/* 97DE4 800A75E4 07004010 */  beqz       $v0, .L800A7604
/* 97DE8 800A75E8 1800BFAF */   sw        $ra, 0x18($sp)
/* 97DEC 800A75EC E39C020C */  jal        razProcessSAnim
/* 97DF0 800A75F0 00000000 */   nop
/* 97DF4 800A75F4 D8FB838F */  lw         $v1, %gp_rel(Raziel + 0x5A8)($gp)
/* 97DF8 800A75F8 00000000 */  nop
/* 97DFC 800A75FC 05006014 */  bnez       $v1, .L800A7614
/* 97E00 800A7600 21804000 */   addu      $s0, $v0, $zero
.L800A7604:
/* 97E04 800A7604 21202002 */  addu       $a0, $s1, $zero
/* 97E08 800A7608 1000053C */  lui        $a1, (0x100000 >> 16)
/* 97E0C 800A760C A1D1000C */  jal        INSTANCE_Post
/* 97E10 800A7610 21300000 */   addu      $a2, $zero, $zero
.L800A7614:
/* 97E14 800A7614 21100002 */  addu       $v0, $s0, $zero
/* 97E18 800A7618 1800BF8F */  lw         $ra, 0x18($sp)
/* 97E1C 800A761C 1400B18F */  lw         $s1, 0x14($sp)
/* 97E20 800A7620 1000B08F */  lw         $s0, 0x10($sp)
/* 97E24 800A7624 0800E003 */  jr         $ra
/* 97E28 800A7628 2000BD27 */   addiu     $sp, $sp, 0x20
.size CheckStringAnimation, . - CheckStringAnimation
