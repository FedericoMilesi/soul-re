.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_OffsetInstancePosition
/* 4CA70 8005C270 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4CA74 8005C274 1000B0AF */  sw         $s0, 0x10($sp)
/* 4CA78 8005C278 21808000 */  addu       $s0, $a0, $zero
/* 4CA7C 8005C27C 1400B1AF */  sw         $s1, 0x14($sp)
/* 4CA80 8005C280 2188A000 */  addu       $s1, $a1, $zero
/* 4CA84 8005C284 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4CA88 8005C288 1800B2AF */  sw         $s2, 0x18($sp)
/* 4CA8C 8005C28C 5C000296 */  lhu        $v0, 0x5C($s0)
/* 4CA90 8005C290 00002396 */  lhu        $v1, 0x0($s1)
/* 4CA94 8005C294 00000000 */  nop
/* 4CA98 8005C298 21104300 */  addu       $v0, $v0, $v1
/* 4CA9C 8005C29C 5C0002A6 */  sh         $v0, 0x5C($s0)
/* 4CAA0 8005C2A0 5E000296 */  lhu        $v0, 0x5E($s0)
/* 4CAA4 8005C2A4 02002396 */  lhu        $v1, 0x2($s1)
/* 4CAA8 8005C2A8 00000000 */  nop
/* 4CAAC 8005C2AC 21104300 */  addu       $v0, $v0, $v1
/* 4CAB0 8005C2B0 5E0002A6 */  sh         $v0, 0x5E($s0)
/* 4CAB4 8005C2B4 60000296 */  lhu        $v0, 0x60($s0)
/* 4CAB8 8005C2B8 04002396 */  lhu        $v1, 0x4($s1)
/* 4CABC 8005C2BC 00000000 */  nop
/* 4CAC0 8005C2C0 21104300 */  addu       $v0, $v0, $v1
/* 4CAC4 8005C2C4 600002A6 */  sh         $v0, 0x60($s0)
/* 4CAC8 8005C2C8 64000296 */  lhu        $v0, 0x64($s0)
/* 4CACC 8005C2CC 00002396 */  lhu        $v1, 0x0($s1)
/* 4CAD0 8005C2D0 00000000 */  nop
/* 4CAD4 8005C2D4 21104300 */  addu       $v0, $v0, $v1
/* 4CAD8 8005C2D8 640002A6 */  sh         $v0, 0x64($s0)
/* 4CADC 8005C2DC 66000296 */  lhu        $v0, 0x66($s0)
/* 4CAE0 8005C2E0 02002396 */  lhu        $v1, 0x2($s1)
/* 4CAE4 8005C2E4 00000000 */  nop
/* 4CAE8 8005C2E8 21104300 */  addu       $v0, $v0, $v1
/* 4CAEC 8005C2EC 660002A6 */  sh         $v0, 0x66($s0)
/* 4CAF0 8005C2F0 68000296 */  lhu        $v0, 0x68($s0)
/* 4CAF4 8005C2F4 04002396 */  lhu        $v1, 0x4($s1)
/* 4CAF8 8005C2F8 00000000 */  nop
/* 4CAFC 8005C2FC 21104300 */  addu       $v0, $v0, $v1
/* 4CB00 8005C300 680002A6 */  sh         $v0, 0x68($s0)
/* 4CB04 8005C304 20010296 */  lhu        $v0, 0x120($s0)
/* 4CB08 8005C308 00002396 */  lhu        $v1, 0x0($s1)
/* 4CB0C 8005C30C 2190C000 */  addu       $s2, $a2, $zero
/* 4CB10 8005C310 21104300 */  addu       $v0, $v0, $v1
/* 4CB14 8005C314 200102A6 */  sh         $v0, 0x120($s0)
/* 4CB18 8005C318 22010296 */  lhu        $v0, 0x122($s0)
/* 4CB1C 8005C31C 02002396 */  lhu        $v1, 0x2($s1)
/* 4CB20 8005C320 00000000 */  nop
/* 4CB24 8005C324 21104300 */  addu       $v0, $v0, $v1
/* 4CB28 8005C328 220102A6 */  sh         $v0, 0x122($s0)
/* 4CB2C 8005C32C 24010296 */  lhu        $v0, 0x124($s0)
/* 4CB30 8005C330 04002396 */  lhu        $v1, 0x4($s1)
/* 4CB34 8005C334 00000000 */  nop
/* 4CB38 8005C338 21104300 */  addu       $v0, $v0, $v1
/* 4CB3C 8005C33C 5E7B000C */  jal        COLLIDE_UpdateAllTransforms
/* 4CB40 8005C340 240102A6 */   sh        $v0, 0x124($s0)
/* 4CB44 8005C344 21200002 */  addu       $a0, $s0, $zero
/* 4CB48 8005C348 927B000C */  jal        COLLIDE_MoveAllTransforms
/* 4CB4C 8005C34C 21282002 */   addu      $a1, $s1, $zero
/* 4CB50 8005C350 98AD828F */  lw         $v0, %gp_rel(theCamera + 0x108)($gp)
/* 4CB54 8005C354 00000000 */  nop
/* 4CB58 8005C358 05000216 */  bne        $s0, $v0, .L8005C370
/* 4CB5C 8005C35C 21282002 */   addu      $a1, $s1, $zero
/* 4CB60 8005C360 98AD8427 */  addiu      $a0, $gp, %gp_rel(theCamera + 0x108)
/* 4CB64 8005C364 F8FE8424 */  addiu      $a0, $a0, -0x108
/* 4CB68 8005C368 165F000C */  jal        CAMERA_Relocate
/* 4CB6C 8005C36C 21304002 */   addu      $a2, $s2, $zero
.L8005C370:
/* 4CB70 8005C370 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4CB74 8005C374 1800B28F */  lw         $s2, 0x18($sp)
/* 4CB78 8005C378 1400B18F */  lw         $s1, 0x14($sp)
/* 4CB7C 8005C37C 1000B08F */  lw         $s0, 0x10($sp)
/* 4CB80 8005C380 0800E003 */  jr         $ra
/* 4CB84 8005C384 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_OffsetInstancePosition, . - STREAM_OffsetInstancePosition
