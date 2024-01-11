.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_FindNearestImpalingIntro
/* 73EA0 800836A0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 73EA4 800836A4 2000B4AF */  sw         $s4, 0x20($sp)
/* 73EA8 800836A8 21A0A000 */  addu       $s4, $a1, $zero
/* 73EAC 800836AC 2400BFAF */  sw         $ra, 0x24($sp)
/* 73EB0 800836B0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 73EB4 800836B4 1800B2AF */  sw         $s2, 0x18($sp)
/* 73EB8 800836B8 1400B1AF */  sw         $s1, 0x14($sp)
/* 73EBC 800836BC 1C66010C */  jal        STREAM_GetLevelWithID
/* 73EC0 800836C0 1000B0AF */   sw        $s0, 0x10($sp)
/* 73EC4 800836C4 39004010 */  beqz       $v0, .L800837AC
/* 73EC8 800836C8 21900000 */   addu      $s2, $zero, $zero
/* 73ECC 800836CC 7800518C */  lw         $s1, 0x78($v0)
/* 73ED0 800836D0 00000000 */  nop
/* 73ED4 800836D4 3500201A */  blez       $s1, .L800837AC
/* 73ED8 800836D8 FF7F133C */   lui       $s3, (0x7FFFFFFF >> 16)
/* 73EDC 800836DC FFFF7336 */  ori        $s3, $s3, (0x7FFFFFFF & 0xFFFF)
/* 73EE0 800836E0 7C00438C */  lw         $v1, 0x7C($v0)
.L800836E4:
/* 73EE4 800836E4 00000000 */  nop
/* 73EE8 800836E8 2C00628C */  lw         $v0, 0x2C($v1)
/* 73EEC 800836EC 00000000 */  nop
/* 73EF0 800836F0 00804230 */  andi       $v0, $v0, 0x8000
/* 73EF4 800836F4 10004010 */  beqz       $v0, .L80083738
/* 73EF8 800836F8 00000000 */   nop
/* 73EFC 800836FC 21906000 */  addu       $s2, $v1, $zero
/* 73F00 80083700 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 73F04 80083704 20004286 */  lh         $v0, 0x20($s2)
/* 73F08 80083708 00008486 */  lh         $a0, 0x0($s4)
/* 73F0C 8008370C 22004386 */  lh         $v1, 0x22($s2)
/* 73F10 80083710 02008586 */  lh         $a1, 0x2($s4)
/* 73F14 80083714 04008686 */  lh         $a2, 0x4($s4)
/* 73F18 80083718 23204400 */  subu       $a0, $v0, $a0
/* 73F1C 8008371C 24004286 */  lh         $v0, 0x24($s2)
/* 73F20 80083720 23286500 */  subu       $a1, $v1, $a1
/* 73F24 80083724 B7E6000C */  jal        MATH3D_LengthXYZ
/* 73F28 80083728 23304600 */   subu      $a2, $v0, $a2
/* 73F2C 8008372C 21984000 */  addu       $s3, $v0, $zero
/* 73F30 80083730 D10D0208 */  j          .L80083744
/* 73F34 80083734 4C004326 */   addiu     $v1, $s2, 0x4C
.L80083738:
/* 73F38 80083738 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 73F3C 8008373C E9FF201E */  bgtz       $s1, .L800836E4
/* 73F40 80083740 4C006324 */   addiu     $v1, $v1, 0x4C
.L80083744:
/* 73F44 80083744 1900201A */  blez       $s1, .L800837AC
/* 73F48 80083748 21806000 */   addu      $s0, $v1, $zero
.L8008374C:
/* 73F4C 8008374C 2C00028E */  lw         $v0, 0x2C($s0)
/* 73F50 80083750 00000000 */  nop
/* 73F54 80083754 00804230 */  andi       $v0, $v0, 0x8000
/* 73F58 80083758 11004010 */  beqz       $v0, .L800837A0
/* 73F5C 8008375C 00000000 */   nop
/* 73F60 80083760 20000286 */  lh         $v0, 0x20($s0)
/* 73F64 80083764 00008486 */  lh         $a0, 0x0($s4)
/* 73F68 80083768 22000386 */  lh         $v1, 0x22($s0)
/* 73F6C 8008376C 02008586 */  lh         $a1, 0x2($s4)
/* 73F70 80083770 04008686 */  lh         $a2, 0x4($s4)
/* 73F74 80083774 23204400 */  subu       $a0, $v0, $a0
/* 73F78 80083778 24000286 */  lh         $v0, 0x24($s0)
/* 73F7C 8008377C 23286500 */  subu       $a1, $v1, $a1
/* 73F80 80083780 B7E6000C */  jal        MATH3D_LengthXYZ
/* 73F84 80083784 23304600 */   subu      $a2, $v0, $a2
/* 73F88 80083788 21184000 */  addu       $v1, $v0, $zero
/* 73F8C 8008378C 2A107300 */  slt        $v0, $v1, $s3
/* 73F90 80083790 03004010 */  beqz       $v0, .L800837A0
/* 73F94 80083794 00000000 */   nop
/* 73F98 80083798 21900002 */  addu       $s2, $s0, $zero
/* 73F9C 8008379C 21986000 */  addu       $s3, $v1, $zero
.L800837A0:
/* 73FA0 800837A0 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 73FA4 800837A4 E9FF201E */  bgtz       $s1, .L8008374C
/* 73FA8 800837A8 4C001026 */   addiu     $s0, $s0, 0x4C
.L800837AC:
/* 73FAC 800837AC 21104002 */  addu       $v0, $s2, $zero
/* 73FB0 800837B0 2400BF8F */  lw         $ra, 0x24($sp)
/* 73FB4 800837B4 2000B48F */  lw         $s4, 0x20($sp)
/* 73FB8 800837B8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 73FBC 800837BC 1800B28F */  lw         $s2, 0x18($sp)
/* 73FC0 800837C0 1400B18F */  lw         $s1, 0x14($sp)
/* 73FC4 800837C4 1000B08F */  lw         $s0, 0x10($sp)
/* 73FC8 800837C8 0800E003 */  jr         $ra
/* 73FCC 800837CC 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_FindNearestImpalingIntro, . - MON_FindNearestImpalingIntro
