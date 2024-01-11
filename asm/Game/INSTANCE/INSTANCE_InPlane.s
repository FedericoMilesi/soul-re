.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_InPlane
/* 24F94 80034794 1C00828C */  lw         $v0, 0x1C($a0)
/* 24F98 80034798 00000000 */  nop
/* 24F9C 8003479C 12004010 */  beqz       $v0, .L800347E8
/* 24FA0 800347A0 21300000 */   addu      $a2, $zero, $zero
/* 24FA4 800347A4 2C00428C */  lw         $v0, 0x2C($v0)
/* 24FA8 800347A8 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 24FAC 800347AC 24104300 */  and        $v0, $v0, $v1
/* 24FB0 800347B0 0C004010 */  beqz       $v0, .L800347E4
/* 24FB4 800347B4 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 24FB8 800347B8 1800828C */  lw         $v0, 0x18($a0)
/* 24FBC 800347BC 00000000 */  nop
/* 24FC0 800347C0 24104300 */  and        $v0, $v0, $v1
/* 24FC4 800347C4 05004014 */  bnez       $v0, .L800347DC
/* 24FC8 800347C8 00000000 */   nop
/* 24FCC 800347CC 0600A014 */  bnez       $a1, .L800347E8
/* 24FD0 800347D0 00000000 */   nop
/* 24FD4 800347D4 FAD10008 */  j          .L800347E8
/* 24FD8 800347D8 01000624 */   addiu     $a2, $zero, 0x1
.L800347DC:
/* 24FDC 800347DC 0200A010 */  beqz       $a1, .L800347E8
/* 24FE0 800347E0 00000000 */   nop
.L800347E4:
/* 24FE4 800347E4 01000624 */  addiu      $a2, $zero, 0x1
.L800347E8:
/* 24FE8 800347E8 0800E003 */  jr         $ra
/* 24FEC 800347EC 2110C000 */   addu      $v0, $a2, $zero
.size INSTANCE_InPlane, . - INSTANCE_InPlane
