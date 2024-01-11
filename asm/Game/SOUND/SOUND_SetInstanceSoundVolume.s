.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_SetInstanceSoundVolume
/* 30400 8003FC00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 30404 8003FC04 1000B0AF */  sw         $s0, 0x10($sp)
/* 30408 8003FC08 2180A000 */  addu       $s0, $a1, $zero
/* 3040C 8003FC0C 1400B1AF */  sw         $s1, 0x14($sp)
/* 30410 8003FC10 1800BFAF */  sw         $ra, 0x18($sp)
/* 30414 8003FC14 01008290 */  lbu        $v0, 0x1($a0)
/* 30418 8003FC18 02000324 */  addiu      $v1, $zero, 0x2
/* 3041C 8003FC1C 0F004230 */  andi       $v0, $v0, 0xF
/* 30420 8003FC20 33004314 */  bne        $v0, $v1, .L8003FCF0
/* 30424 8003FC24 2188C000 */   addu      $s1, $a2, $zero
/* 30428 8003FC28 00008490 */  lbu        $a0, 0x0($a0)
/* 3042C 8003FC2C 32FB000C */  jal        SndGetSfxChannel
/* 30430 8003FC30 00000000 */   nop
/* 30434 8003FC34 21204000 */  addu       $a0, $v0, $zero
/* 30438 8003FC38 2D008010 */  beqz       $a0, .L8003FCF0
/* 3043C 8003FC3C 00000000 */   nop
/* 30440 8003FC40 02002106 */  bgez       $s1, .L8003FC4C
/* 30444 8003FC44 00000000 */   nop
/* 30448 8003FC48 23881100 */  negu       $s1, $s1
.L8003FC4C:
/* 3044C 8003FC4C 0800001A */  blez       $s0, .L8003FC70
/* 30450 8003FC50 00000000 */   nop
/* 30454 8003FC54 08008384 */  lh         $v1, 0x8($a0)
/* 30458 8003FC58 00000000 */  nop
/* 3045C 8003FC5C 21107000 */  addu       $v0, $v1, $s0
/* 30460 8003FC60 80004228 */  slti       $v0, $v0, 0x80
/* 30464 8003FC64 02004014 */  bnez       $v0, .L8003FC70
/* 30468 8003FC68 7F000224 */   addiu     $v0, $zero, 0x7F
/* 3046C 8003FC6C 23804300 */  subu       $s0, $v0, $v1
.L8003FC70:
/* 30470 8003FC70 07000106 */  bgez       $s0, .L8003FC90
/* 30474 8003FC74 00000000 */   nop
/* 30478 8003FC78 08008384 */  lh         $v1, 0x8($a0)
/* 3047C 8003FC7C 00000000 */  nop
/* 30480 8003FC80 21107000 */  addu       $v0, $v1, $s0
/* 30484 8003FC84 02004104 */  bgez       $v0, .L8003FC90
/* 30488 8003FC88 00000000 */   nop
/* 3048C 8003FC8C 23800300 */  negu       $s0, $v1
.L8003FC90:
/* 30490 8003FC90 13002012 */  beqz       $s1, .L8003FCE0
/* 30494 8003FC94 00000000 */   nop
/* 30498 8003FC98 1A001102 */  div        $zero, $s0, $s1
/* 3049C 8003FC9C 12100000 */  mflo       $v0
/* 304A0 8003FCA0 03000106 */  bgez       $s0, .L8003FCB0
/* 304A4 8003FCA4 0E0082A4 */   sh        $v0, 0xE($a0)
/* 304A8 8003FCA8 2DFF0008 */  j          .L8003FCB4
/* 304AC 8003FCAC FFFF0224 */   addiu     $v0, $zero, -0x1
.L8003FCB0:
/* 304B0 8003FCB0 01000224 */  addiu      $v0, $zero, 0x1
.L8003FCB4:
/* 304B4 8003FCB4 100082A4 */  sh         $v0, 0x10($a0)
/* 304B8 8003FCB8 1A001102 */  div        $zero, $s0, $s1
/* 304BC 8003FCBC 10100000 */  mfhi       $v0
/* 304C0 8003FCC0 140080A4 */  sh         $zero, 0x14($a0)
/* 304C4 8003FCC4 0A0091A4 */  sh         $s1, 0xA($a0)
/* 304C8 8003FCC8 0C0091A4 */  sh         $s1, 0xC($a0)
/* 304CC 8003FCCC 02004104 */  bgez       $v0, .L8003FCD8
/* 304D0 8003FCD0 00000000 */   nop
/* 304D4 8003FCD4 23100200 */  negu       $v0, $v0
.L8003FCD8:
/* 304D8 8003FCD8 3CFF0008 */  j          .L8003FCF0
/* 304DC 8003FCDC 120082A4 */   sh        $v0, 0x12($a0)
.L8003FCE0:
/* 304E0 8003FCE0 08008294 */  lhu        $v0, 0x8($a0)
/* 304E4 8003FCE4 0A0080A4 */  sh         $zero, 0xA($a0)
/* 304E8 8003FCE8 21105000 */  addu       $v0, $v0, $s0
/* 304EC 8003FCEC 080082A4 */  sh         $v0, 0x8($a0)
.L8003FCF0:
/* 304F0 8003FCF0 1800BF8F */  lw         $ra, 0x18($sp)
/* 304F4 8003FCF4 1400B18F */  lw         $s1, 0x14($sp)
/* 304F8 8003FCF8 1000B08F */  lw         $s0, 0x10($sp)
/* 304FC 8003FCFC 0800E003 */  jr         $ra
/* 30500 8003FD00 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUND_SetInstanceSoundVolume, . - SOUND_SetInstanceSoundVolume
