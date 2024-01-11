.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_MakeSpark
/* 3A3F4 80049BF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3A3F8 80049BF8 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3A3FC 80049BFC 1400B1AF */  sw         $s1, 0x14($sp)
/* 3A400 80049C00 90A2518C */  lw         $s1, %lo(objectAccess + 0x54)($v0)
/* 3A404 80049C04 1800BFAF */  sw         $ra, 0x18($sp)
/* 3A408 80049C08 24002012 */  beqz       $s1, .L80049C9C
/* 3A40C 80049C0C 1000B0AF */   sw        $s0, 0x10($sp)
/* 3A410 80049C10 002C0600 */  sll        $a1, $a2, 16
/* 3A414 80049C14 DC09010C */  jal        FX_GetParticle
/* 3A418 80049C18 032C0500 */   sra       $a1, $a1, 16
/* 3A41C 80049C1C 21804000 */  addu       $s0, $v0, $zero
/* 3A420 80049C20 1E000012 */  beqz       $s0, .L80049C9C
/* 3A424 80049C24 21202002 */   addu      $a0, $s1, $zero
/* 3A428 80049C28 21280000 */  addu       $a1, $zero, $zero
/* 3A42C 80049C2C 30000224 */  addiu      $v0, $zero, 0x30
/* 3A430 80049C30 1C0002A6 */  sh         $v0, 0x1C($s0)
/* 3A434 80049C34 32000224 */  addiu      $v0, $zero, 0x32
/* 3A438 80049C38 200002A6 */  sh         $v0, 0x20($s0)
/* 3A43C 80049C3C 80000224 */  addiu      $v0, $zero, 0x80
/* 3A440 80049C40 240002A6 */  sh         $v0, 0x24($s0)
/* 3A444 80049C44 260002A6 */  sh         $v0, 0x26($s0)
/* 3A448 80049C48 A0000224 */  addiu      $v0, $zero, 0xA0
/* 3A44C 80049C4C 280002A6 */  sh         $v0, 0x28($s0)
/* 3A450 80049C50 01000224 */  addiu      $v0, $zero, 0x1
/* 3A454 80049C54 2130A000 */  addu       $a2, $a1, $zero
/* 3A458 80049C58 2C0000A6 */  sh         $zero, 0x2C($s0)
/* 3A45C 80049C5C 2E0000A6 */  sh         $zero, 0x2E($s0)
/* 3A460 80049C60 9D19010C */  jal        FX_GetTextureObject
/* 3A464 80049C64 300002A6 */   sh        $v0, 0x30($s0)
/* 3A468 80049C68 0002033C */  lui        $v1, (0x2004960 >> 16)
/* 3A46C 80049C6C 60496334 */  ori        $v1, $v1, (0x2004960 & 0xFFFF)
/* 3A470 80049C70 21200002 */  addu       $a0, $s0, $zero
/* 3A474 80049C74 100082AC */  sw         $v0, 0x10($a0)
/* 3A478 80049C78 02000224 */  addiu      $v0, $zero, 0x2
/* 3A47C 80049C7C 460082A0 */  sb         $v0, 0x46($a0)
/* 3A480 80049C80 02000224 */  addiu      $v0, $zero, 0x2
/* 3A484 80049C84 0E0082A4 */  sh         $v0, 0xE($a0)
/* 3A488 80049C88 04000224 */  addiu      $v0, $zero, 0x4
/* 3A48C 80049C8C 3C0083AC */  sw         $v1, 0x3C($a0)
/* 3A490 80049C90 400080AC */  sw         $zero, 0x40($a0)
/* 3A494 80049C94 1B2D010C */  jal        FX_InsertGeneralEffect
/* 3A498 80049C98 1E0082A4 */   sh        $v0, 0x1E($a0)
.L80049C9C:
/* 3A49C 80049C9C 1800BF8F */  lw         $ra, 0x18($sp)
/* 3A4A0 80049CA0 1400B18F */  lw         $s1, 0x14($sp)
/* 3A4A4 80049CA4 1000B08F */  lw         $s0, 0x10($sp)
/* 3A4A8 80049CA8 0800E003 */  jr         $ra
/* 3A4AC 80049CAC 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_MakeSpark, . - FX_MakeSpark
