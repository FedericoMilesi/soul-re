.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_CheckPoint
/* B2A8 8001AAA8 ECFF8724 */  addiu      $a3, $a0, -0x14
/* B2AC 8001AAAC 2A10A700 */  slt        $v0, $a1, $a3
/* B2B0 8001AAB0 05004010 */  beqz       $v0, .L8001AAC8
/* B2B4 8001AAB4 2A10C700 */   slt       $v0, $a2, $a3
/* B2B8 8001AAB8 04004010 */  beqz       $v0, .L8001AACC
/* B2BC 8001AABC 14008324 */   addiu     $v1, $a0, 0x14
/* B2C0 8001AAC0 0800E003 */  jr         $ra
/* B2C4 8001AAC4 01000224 */   addiu     $v0, $zero, 0x1
.L8001AAC8:
/* B2C8 8001AAC8 14008324 */  addiu      $v1, $a0, 0x14
.L8001AACC:
/* B2CC 8001AACC 2A106500 */  slt        $v0, $v1, $a1
/* B2D0 8001AAD0 03004010 */  beqz       $v0, .L8001AAE0
/* B2D4 8001AAD4 2A186600 */   slt       $v1, $v1, $a2
/* B2D8 8001AAD8 02006014 */  bnez       $v1, .L8001AAE4
/* B2DC 8001AADC 01000224 */   addiu     $v0, $zero, 0x1
.L8001AAE0:
/* B2E0 8001AAE0 21100000 */  addu       $v0, $zero, $zero
.L8001AAE4:
/* B2E4 8001AAE4 0800E003 */  jr         $ra
/* B2E8 8001AAE8 00000000 */   nop
.size CAMERA_CheckPoint, . - CAMERA_CheckPoint
