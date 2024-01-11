.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielAnimCallbackDuringPause
/* A1680 800B0E80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A1684 800B0E84 1000B0AF */  sw         $s0, 0x10($sp)
/* A1688 800B0E88 2180C000 */  addu       $s0, $a2, $zero
/* A168C 800B0E8C 1400B1AF */  sw         $s1, 0x14($sp)
/* A1690 800B0E90 2188E000 */  addu       $s1, $a3, $zero
/* A1694 800B0E94 04000224 */  addiu      $v0, $zero, 0x4
/* A1698 800B0E98 20000216 */  bne        $s0, $v0, .L800B0F1C
/* A169C 800B0E9C 1800BFAF */   sw        $ra, 0x18($sp)
/* A16A0 800B0EA0 3000A58F */  lw         $a1, 0x30($sp)
/* A16A4 800B0EA4 34F6848F */  lw         $a0, %gp_rel(Raziel + 0x4)($gp)
/* A16A8 800B0EA8 3400A78F */  lw         $a3, 0x34($sp)
/* A16AC 800B0EAC 4DC5010C */  jal        SetAnimationControllerDoneData
/* A16B0 800B0EB0 21302002 */   addu      $a2, $s1, $zero
/* A16B4 800B0EB4 21184000 */  addu       $v1, $v0, $zero
/* A16B8 800B0EB8 0C00648C */  lw         $a0, 0xC($v1)
/* A16BC 800B0EBC 02000224 */  addiu      $v0, $zero, 0x2
/* A16C0 800B0EC0 06008214 */  bne        $a0, $v0, .L800B0EDC
/* A16C4 800B0EC4 00000000 */   nop
/* A16C8 800B0EC8 34F6848F */  lw         $a0, %gp_rel(Raziel + 0x4)($gp)
/* A16CC 800B0ECC 5F87020C */  jal        AlgorithmicWings
/* A16D0 800B0ED0 21286000 */   addu      $a1, $v1, $zero
/* A16D4 800B0ED4 C8C30208 */  j          .L800B0F20
/* A16D8 800B0ED8 21102002 */   addu      $v0, $s1, $zero
.L800B0EDC:
/* A16DC 800B0EDC 08008014 */  bnez       $a0, .L800B0F00
/* A16E0 800B0EE0 2C010724 */   addiu     $a3, $zero, 0x12C
/* A16E4 800B0EE4 0400658C */  lw         $a1, 0x4($v1)
/* A16E8 800B0EE8 0000648C */  lw         $a0, 0x0($v1)
/* A16EC 800B0EEC 0800668C */  lw         $a2, 0x8($v1)
/* A16F0 800B0EF0 9D41020C */  jal        G2Anim_InterpDisableController
/* A16F4 800B0EF4 C8018424 */   addiu     $a0, $a0, 0x1C8
/* A16F8 800B0EF8 C8C30208 */  j          .L800B0F20
/* A16FC 800B0EFC 21102002 */   addu      $v0, $s1, $zero
.L800B0F00:
/* A1700 800B0F00 07009014 */  bne        $a0, $s0, .L800B0F20
/* A1704 800B0F04 21102002 */   addu      $v0, $s1, $zero
/* A1708 800B0F08 0400658C */  lw         $a1, 0x4($v1)
/* A170C 800B0F0C 0000648C */  lw         $a0, 0x0($v1)
/* A1710 800B0F10 0800668C */  lw         $a2, 0x8($v1)
/* A1714 800B0F14 8D41020C */  jal        G2Anim_DisableController
/* A1718 800B0F18 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800B0F1C:
/* A171C 800B0F1C 21102002 */  addu       $v0, $s1, $zero
.L800B0F20:
/* A1720 800B0F20 1800BF8F */  lw         $ra, 0x18($sp)
/* A1724 800B0F24 1400B18F */  lw         $s1, 0x14($sp)
/* A1728 800B0F28 1000B08F */  lw         $s0, 0x10($sp)
/* A172C 800B0F2C 0800E003 */  jr         $ra
/* A1730 800B0F30 2000BD27 */   addiu     $sp, $sp, 0x20
.size RazielAnimCallbackDuringPause, . - RazielAnimCallbackDuringPause
