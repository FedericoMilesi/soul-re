.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetOffsetNextPoint
/* 32CB0 800424B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32CB4 800424B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 32CB8 800424B8 21808000 */  addu       $s0, $a0, $zero
/* 32CBC 800424BC 1400B1AF */  sw         $s1, 0x14($sp)
/* 32CC0 800424C0 1800BFAF */  sw         $ra, 0x18($sp)
/* 32CC4 800424C4 5608010C */  jal        SplineGetOffsetNext
/* 32CC8 800424C8 2188A000 */   addu      $s1, $a1, $zero
/* 32CCC 800424CC 08004010 */  beqz       $v0, .L800424F0
/* 32CD0 800424D0 21200002 */   addu      $a0, $s0, $zero
/* 32CD4 800424D4 A0C38627 */  addiu      $a2, $gp, %gp_rel(point.77)
/* 32CD8 800424D8 F306010C */  jal        SplineGetData
/* 32CDC 800424DC 21282002 */   addu      $a1, $s1, $zero
/* 32CE0 800424E0 21184000 */  addu       $v1, $v0, $zero
/* 32CE4 800424E4 A0C38227 */  addiu      $v0, $gp, %gp_rel(point.77)
/* 32CE8 800424E8 02006014 */  bnez       $v1, .L800424F4
/* 32CEC 800424EC 00000000 */   nop
.L800424F0:
/* 32CF0 800424F0 21100000 */  addu       $v0, $zero, $zero
.L800424F4:
/* 32CF4 800424F4 1800BF8F */  lw         $ra, 0x18($sp)
/* 32CF8 800424F8 1400B18F */  lw         $s1, 0x14($sp)
/* 32CFC 800424FC 1000B08F */  lw         $s0, 0x10($sp)
/* 32D00 80042500 0800E003 */  jr         $ra
/* 32D04 80042504 2000BD27 */   addiu     $sp, $sp, 0x20
.size SplineGetOffsetNextPoint, . - SplineGetOffsetNextPoint
