.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PIPE3D_AnimateTextures
/* 2CA28 8003C228 21488000 */  addu       $t1, $a0, $zero
/* 2CA2C 8003C22C 24002011 */  beqz       $t1, .L8003C2C0
/* 2CA30 8003C230 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 2CA34 8003C234 2200A210 */  beq        $a1, $v0, .L8003C2C0
/* 2CA38 8003C238 04002825 */   addiu     $t0, $t1, 0x4
/* 2CA3C 8003C23C 0000228D */  lw         $v0, 0x0($t1)
/* 2CA40 8003C240 00000000 */  nop
/* 2CA44 8003C244 1E004018 */  blez       $v0, .L8003C2C0
/* 2CA48 8003C248 21380000 */   addu      $a3, $zero, $zero
/* 2CA4C 8003C24C 08002625 */  addiu      $a2, $t1, 0x8
.L8003C250:
/* 2CA50 8003C250 0400C28C */  lw         $v0, 0x4($a2)
/* 2CA54 8003C254 00000000 */  nop
/* 2CA58 8003C258 1B00A200 */  divu       $zero, $a1, $v0
/* 2CA5C 8003C25C 12100000 */  mflo       $v0
/* 2CA60 8003C260 0000C38C */  lw         $v1, 0x0($a2)
/* 2CA64 8003C264 00000000 */  nop
/* 2CA68 8003C268 1B004300 */  divu       $zero, $v0, $v1
/* 2CA6C 8003C26C 10180000 */  mfhi       $v1
/* 2CA70 8003C270 0000048D */  lw         $a0, 0x0($t0)
/* 2CA74 8003C274 00190300 */  sll        $v1, $v1, 4
/* 2CA78 8003C278 21188300 */  addu       $v1, $a0, $v1
/* 2CA7C 8003C27C 1000628C */  lw         $v0, 0x10($v1)
/* 2CA80 8003C280 10006324 */  addiu      $v1, $v1, 0x10
/* 2CA84 8003C284 000082AC */  sw         $v0, 0x0($a0)
/* 2CA88 8003C288 0400628C */  lw         $v0, 0x4($v1)
/* 2CA8C 8003C28C 00000000 */  nop
/* 2CA90 8003C290 040082AC */  sw         $v0, 0x4($a0)
/* 2CA94 8003C294 0800628C */  lw         $v0, 0x8($v1)
/* 2CA98 8003C298 0C000825 */  addiu      $t0, $t0, 0xC
/* 2CA9C 8003C29C 080082AC */  sw         $v0, 0x8($a0)
/* 2CAA0 8003C2A0 0C00628C */  lw         $v0, 0xC($v1)
/* 2CAA4 8003C2A4 0100E724 */  addiu      $a3, $a3, 0x1
/* 2CAA8 8003C2A8 0C0082AC */  sw         $v0, 0xC($a0)
/* 2CAAC 8003C2AC 0000228D */  lw         $v0, 0x0($t1)
/* 2CAB0 8003C2B0 00000000 */  nop
/* 2CAB4 8003C2B4 2A10E200 */  slt        $v0, $a3, $v0
/* 2CAB8 8003C2B8 E5FF4014 */  bnez       $v0, .L8003C250
/* 2CABC 8003C2BC 0C00C624 */   addiu     $a2, $a2, 0xC
.L8003C2C0:
/* 2CAC0 8003C2C0 0800E003 */  jr         $ra
/* 2CAC4 8003C2C4 00000000 */   nop
.size PIPE3D_AnimateTextures, . - PIPE3D_AnimateTextures
