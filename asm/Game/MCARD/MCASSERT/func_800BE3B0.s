.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE3B0
/* AEBB0 800BE3B0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* AEBB4 800BE3B4 1400B1AF */  sw         $s1, 0x14($sp)
/* AEBB8 800BE3B8 2188A000 */  addu       $s1, $a1, $zero
/* AEBBC 800BE3BC 1800B2AF */  sw         $s2, 0x18($sp)
/* AEBC0 800BE3C0 2190C000 */  addu       $s2, $a2, $zero
/* AEBC4 800BE3C4 2000B4AF */  sw         $s4, 0x20($sp)
/* AEBC8 800BE3C8 21A08000 */  addu       $s4, $a0, $zero
/* AEBCC 800BE3CC 1000B0AF */  sw         $s0, 0x10($sp)
/* AEBD0 800BE3D0 03001024 */  addiu      $s0, $zero, 0x3
/* AEBD4 800BE3D4 3000BEAF */  sw         $fp, 0x30($sp)
/* AEBD8 800BE3D8 01001E24 */  addiu      $fp, $zero, 0x1
/* AEBDC 800BE3DC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AEBE0 800BE3E0 FF009332 */  andi       $s3, $s4, 0xFF
/* AEBE4 800BE3E4 0D80033C */  lui        $v1, %hi(ratan_tbl + 0x840)
/* AEBE8 800BE3E8 BCE36324 */  addiu      $v1, $v1, %lo(ratan_tbl + 0x840)
/* AEBEC 800BE3EC 2400B5AF */  sw         $s5, 0x24($sp)
/* AEBF0 800BE3F0 0D80153C */  lui        $s5, %hi(CD_cbsync)
/* AEBF4 800BE3F4 84E9B58E */  lw         $s5, %lo(CD_cbsync)($s5)
/* AEBF8 800BE3F8 80101300 */  sll        $v0, $s3, 2
/* AEBFC 800BE3FC 2800B6AF */  sw         $s6, 0x28($sp)
/* AEC00 800BE400 21B04300 */  addu       $s6, $v0, $v1
/* AEC04 800BE404 2C00B7AF */  sw         $s7, 0x2C($sp)
/* AEC08 800BE408 FFFF1724 */  addiu      $s7, $zero, -0x1
/* AEC0C 800BE40C 3400BFAF */  sw         $ra, 0x34($sp)
.L800BE410:
/* AEC10 800BE410 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEC14 800BE414 0B007E12 */  beq        $s3, $fp, .L800BE444
/* AEC18 800BE418 84E920AC */   sw        $zero, %lo(CD_cbsync)($at)
/* AEC1C 800BE41C 0D80023C */  lui        $v0, %hi(CD_status)
/* AEC20 800BE420 90E94290 */  lbu        $v0, %lo(CD_status)($v0)
/* AEC24 800BE424 00000000 */  nop
/* AEC28 800BE428 10004230 */  andi       $v0, $v0, 0x10
/* AEC2C 800BE42C 05004010 */  beqz       $v0, .L800BE444
/* AEC30 800BE430 01000424 */   addiu     $a0, $zero, 0x1
/* AEC34 800BE434 21280000 */  addu       $a1, $zero, $zero
/* AEC38 800BE438 21300000 */  addu       $a2, $zero, $zero
/* AEC3C 800BE43C 9E12030C */  jal        func_800C4A78
/* AEC40 800BE440 21380000 */   addu      $a3, $zero, $zero
.L800BE444:
/* AEC44 800BE444 0B002012 */  beqz       $s1, .L800BE474
/* AEC48 800BE448 00000000 */   nop
/* AEC4C 800BE44C 0000C28E */  lw         $v0, 0x0($s6)
/* AEC50 800BE450 00000000 */  nop
/* AEC54 800BE454 07004010 */  beqz       $v0, .L800BE474
/* AEC58 800BE458 02000424 */   addiu     $a0, $zero, 0x2
/* AEC5C 800BE45C 21282002 */  addu       $a1, $s1, $zero
/* AEC60 800BE460 21304002 */  addu       $a2, $s2, $zero
/* AEC64 800BE464 9E12030C */  jal        func_800C4A78
/* AEC68 800BE468 21380000 */   addu      $a3, $zero, $zero
/* AEC6C 800BE46C 0A004014 */  bnez       $v0, .L800BE498
/* AEC70 800BE470 00000000 */   nop
.L800BE474:
/* AEC74 800BE474 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AEC78 800BE478 84E935AC */  sw         $s5, %lo(CD_cbsync)($at)
/* AEC7C 800BE47C FF008432 */  andi       $a0, $s4, 0xFF
/* AEC80 800BE480 21282002 */  addu       $a1, $s1, $zero
/* AEC84 800BE484 21304002 */  addu       $a2, $s2, $zero
/* AEC88 800BE488 9E12030C */  jal        func_800C4A78
/* AEC8C 800BE48C 21380000 */   addu      $a3, $zero, $zero
/* AEC90 800BE490 06004010 */  beqz       $v0, .L800BE4AC
/* AEC94 800BE494 21100000 */   addu      $v0, $zero, $zero
.L800BE498:
/* AEC98 800BE498 FFFF1026 */  addiu      $s0, $s0, -0x1
/* AEC9C 800BE49C DCFF1716 */  bne        $s0, $s7, .L800BE410
/* AECA0 800BE4A0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* AECA4 800BE4A4 0D80013C */  lui        $at, %hi(CD_cbsync)
/* AECA8 800BE4A8 84E935AC */  sw         $s5, %lo(CD_cbsync)($at)
.L800BE4AC:
/* AECAC 800BE4AC 06004014 */  bnez       $v0, .L800BE4C8
/* AECB0 800BE4B0 21200000 */   addu      $a0, $zero, $zero
/* AECB4 800BE4B4 4C11030C */  jal        func_800C4530
/* AECB8 800BE4B8 21284002 */   addu      $a1, $s2, $zero
/* AECBC 800BE4BC 02004238 */  xori       $v0, $v0, 0x2
/* AECC0 800BE4C0 33F90208 */  j          .L800BE4CC
/* AECC4 800BE4C4 0100422C */   sltiu     $v0, $v0, 0x1
.L800BE4C8:
/* AECC8 800BE4C8 21100000 */  addu       $v0, $zero, $zero
.L800BE4CC:
/* AECCC 800BE4CC 3400BF8F */  lw         $ra, 0x34($sp)
/* AECD0 800BE4D0 3000BE8F */  lw         $fp, 0x30($sp)
/* AECD4 800BE4D4 2C00B78F */  lw         $s7, 0x2C($sp)
/* AECD8 800BE4D8 2800B68F */  lw         $s6, 0x28($sp)
/* AECDC 800BE4DC 2400B58F */  lw         $s5, 0x24($sp)
/* AECE0 800BE4E0 2000B48F */  lw         $s4, 0x20($sp)
/* AECE4 800BE4E4 1C00B38F */  lw         $s3, 0x1C($sp)
/* AECE8 800BE4E8 1800B28F */  lw         $s2, 0x18($sp)
/* AECEC 800BE4EC 1400B18F */  lw         $s1, 0x14($sp)
/* AECF0 800BE4F0 1000B08F */  lw         $s0, 0x10($sp)
/* AECF4 800BE4F4 0800E003 */  jr         $ra
/* AECF8 800BE4F8 3800BD27 */   addiu     $sp, $sp, 0x38
.size func_800BE3B0, . - func_800BE3B0
