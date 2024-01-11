.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCameraSpline
/* E980 8001E180 0400A38C */  lw         $v1, 0x4($a1)
/* E984 8001E184 00000000 */  nop
/* E988 8001E188 05006010 */  beqz       $v1, .L8001E1A0
/* E98C 8001E18C 01000224 */   addiu     $v0, $zero, 0x1
/* E990 8001E190 0F006210 */  beq        $v1, $v0, .L8001E1D0
/* E994 8001E194 00000000 */   nop
/* E998 8001E198 7E780008 */  j          .L8001E1F8
/* E99C 8001E19C 00000000 */   nop
.L8001E1A0:
/* E9A0 8001E1A0 0800A58C */  lw         $a1, 0x8($a1)
/* E9A4 8001E1A4 00000000 */  nop
/* E9A8 8001E1A8 0600A010 */  beqz       $a1, .L8001E1C4
/* E9AC 8001E1AC 00000000 */   nop
/* E9B0 8001E1B0 3800A28C */  lw         $v0, 0x38($a1)
/* E9B4 8001E1B4 00000000 */  nop
/* E9B8 8001E1B8 ACB082AF */  sw         $v0, %gp_rel(theCamera + 0x41C)($gp)
/* E9BC 8001E1BC 0800E003 */  jr         $ra
/* E9C0 8001E1C0 01000224 */   addiu     $v0, $zero, 0x1
.L8001E1C4:
/* E9C4 8001E1C4 ACB080AF */  sw         $zero, %gp_rel(theCamera + 0x41C)($gp)
/* E9C8 8001E1C8 0800E003 */  jr         $ra
/* E9CC 8001E1CC 01000224 */   addiu     $v0, $zero, 0x1
.L8001E1D0:
/* E9D0 8001E1D0 0800A58C */  lw         $a1, 0x8($a1)
/* E9D4 8001E1D4 00000000 */  nop
/* E9D8 8001E1D8 0600A010 */  beqz       $a1, .L8001E1F4
/* E9DC 8001E1DC 01000224 */   addiu     $v0, $zero, 0x1
/* E9E0 8001E1E0 3800A28C */  lw         $v0, 0x38($a1)
/* E9E4 8001E1E4 00000000 */  nop
/* E9E8 8001E1E8 B0B082AF */  sw         $v0, %gp_rel(theCamera + 0x420)($gp)
/* E9EC 8001E1EC 0800E003 */  jr         $ra
/* E9F0 8001E1F0 01000224 */   addiu     $v0, $zero, 0x1
.L8001E1F4:
/* E9F4 8001E1F4 B0B080AF */  sw         $zero, %gp_rel(theCamera + 0x420)($gp)
.L8001E1F8:
/* E9F8 8001E1F8 0800E003 */  jr         $ra
/* E9FC 8001E1FC 00000000 */   nop
.size SIGNAL_HandleCameraSpline, . - SIGNAL_HandleCameraSpline
