.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_Normalize
/* 2A40C 80039C0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2A410 80039C10 1000B0AF */  sw         $s0, 0x10($sp)
/* 2A414 80039C14 21808000 */  addu       $s0, $a0, $zero
/* 2A418 80039C18 1400BFAF */  sw         $ra, 0x14($sp)
/* 2A41C 80039C1C 00000486 */  lh         $a0, 0x0($s0)
/* 2A420 80039C20 02000586 */  lh         $a1, 0x2($s0)
/* 2A424 80039C24 04000686 */  lh         $a2, 0x4($s0)
/* 2A428 80039C28 80200400 */  sll        $a0, $a0, 2
/* 2A42C 80039C2C 80280500 */  sll        $a1, $a1, 2
/* 2A430 80039C30 B7E6000C */  jal        MATH3D_LengthXYZ
/* 2A434 80039C34 80300600 */   sll       $a2, $a2, 2
/* 2A438 80039C38 21284000 */  addu       $a1, $v0, $zero
/* 2A43C 80039C3C 1300A010 */  beqz       $a1, .L80039C8C
/* 2A440 80039C40 00000000 */   nop
/* 2A444 80039C44 00000486 */  lh         $a0, 0x0($s0)
/* 2A448 80039C48 00000000 */  nop
/* 2A44C 80039C4C 80230400 */  sll        $a0, $a0, 14
/* 2A450 80039C50 1A008500 */  div        $zero, $a0, $a1
/* 2A454 80039C54 12200000 */  mflo       $a0
/* 2A458 80039C58 02000386 */  lh         $v1, 0x2($s0)
/* 2A45C 80039C5C 00000000 */  nop
/* 2A460 80039C60 801B0300 */  sll        $v1, $v1, 14
/* 2A464 80039C64 1A006500 */  div        $zero, $v1, $a1
/* 2A468 80039C68 12180000 */  mflo       $v1
/* 2A46C 80039C6C 04000286 */  lh         $v0, 0x4($s0)
/* 2A470 80039C70 00000000 */  nop
/* 2A474 80039C74 80130200 */  sll        $v0, $v0, 14
/* 2A478 80039C78 1A004500 */  div        $zero, $v0, $a1
/* 2A47C 80039C7C 12100000 */  mflo       $v0
/* 2A480 80039C80 000004A6 */  sh         $a0, 0x0($s0)
/* 2A484 80039C84 020003A6 */  sh         $v1, 0x2($s0)
/* 2A488 80039C88 040002A6 */  sh         $v0, 0x4($s0)
.L80039C8C:
/* 2A48C 80039C8C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2A490 80039C90 1000B08F */  lw         $s0, 0x10($sp)
/* 2A494 80039C94 0800E003 */  jr         $ra
/* 2A498 80039C98 1800BD27 */   addiu     $sp, $sp, 0x18
.size MATH3D_Normalize, . - MATH3D_Normalize
