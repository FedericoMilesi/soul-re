.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateLevel
/* 4C2F4 8005BAF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4C2F8 8005BAF8 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C2FC 8005BAFC 21808000 */  addu       $s0, $a0, $zero
/* 4C300 8005BB00 1400B1AF */  sw         $s1, 0x14($sp)
/* 4C304 8005BB04 1800BFAF */  sw         $ra, 0x18($sp)
/* 4C308 8005BB08 0000048E */  lw         $a0, 0x0($s0)
/* 4C30C 8005BB0C 8E6F010C */  jal        RelocateTerrain
/* 4C310 8005BB10 2188A000 */   addu      $s1, $a1, $zero
/* 4C314 8005BB14 0C00048E */  lw         $a0, 0xC($s0)
/* 4C318 8005BB18 0800058E */  lw         $a1, 0x8($s0)
/* 4C31C 8005BB1C CA6F010C */  jal        RelocateVMObjects
/* 4C320 8005BB20 21302002 */   addu      $a2, $s1, $zero
/* 4C324 8005BB24 3400048E */  lw         $a0, 0x34($s0)
/* 4C328 8005BB28 3000058E */  lw         $a1, 0x30($s0)
/* 4C32C 8005BB2C E06F010C */  jal        RelocateBGObjects
/* 4C330 8005BB30 21302002 */   addu      $a2, $s1, $zero
/* 4C334 8005BB34 5C00048E */  lw         $a0, 0x5C($s0)
/* 4C338 8005BB38 5800058E */  lw         $a1, 0x58($s0)
/* 4C33C 8005BB3C 0D6F010C */  jal        RelocateCameras
/* 4C340 8005BB40 21302002 */   addu      $a2, $s1, $zero
/* 4C344 8005BB44 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* 4C348 8005BB48 21280002 */  addu       $a1, $s0, $zero
/* 4C34C 8005BB4C 326F010C */  jal        RelocateSavedCameras
/* 4C350 8005BB50 21302002 */   addu      $a2, $s1, $zero
/* 4C354 8005BB54 21302002 */  addu       $a2, $s1, $zero
/* 4C358 8005BB58 E400048E */  lw         $a0, 0xE4($s0)
/* 4C35C 8005BB5C 04002286 */  lh         $v0, 0x4($s1)
/* 4C360 8005BB60 6C00038E */  lw         $v1, 0x6C($s0)
/* 4C364 8005BB64 E000058E */  lw         $a1, 0xE0($s0)
/* 4C368 8005BB68 21186200 */  addu       $v1, $v1, $v0
/* 4C36C 8005BB6C 3670010C */  jal        RelocatePlanMarkers
/* 4C370 8005BB70 6C0003AE */   sw        $v1, 0x6C($s0)
/* 4C374 8005BB74 EC00048E */  lw         $a0, 0xEC($s0)
/* 4C378 8005BB78 E800058E */  lw         $a1, 0xE8($s0)
/* 4C37C 8005BB7C 4B70010C */  jal        RelocateSFXMarkers
/* 4C380 8005BB80 21302002 */   addu      $a2, $s1, $zero
/* 4C384 8005BB84 3800038E */  lw         $v1, 0x38($s0)
/* 4C388 8005BB88 01800224 */  addiu      $v0, $zero, -0x7FFF
/* 4C38C 8005BB8C 07006210 */  beq        $v1, $v0, .L8005BBAC
/* 4C390 8005BB90 FF7F0224 */   addiu     $v0, $zero, 0x7FFF
/* 4C394 8005BB94 05006210 */  beq        $v1, $v0, .L8005BBAC
/* 4C398 8005BB98 00000000 */   nop
/* 4C39C 8005BB9C 04002286 */  lh         $v0, 0x4($s1)
/* 4C3A0 8005BBA0 00000000 */  nop
/* 4C3A4 8005BBA4 21106200 */  addu       $v0, $v1, $v0
/* 4C3A8 8005BBA8 380002AE */  sw         $v0, 0x38($s0)
.L8005BBAC:
/* 4C3AC 8005BBAC 0000038E */  lw         $v1, 0x0($s0)
/* 4C3B0 8005BBB0 00000000 */  nop
/* 4C3B4 8005BBB4 4400628C */  lw         $v0, 0x44($v1)
/* 4C3B8 8005BBB8 00000000 */  nop
/* 4C3BC 8005BBBC 18004018 */  blez       $v0, .L8005BC20
/* 4C3C0 8005BBC0 21500000 */   addu      $t2, $zero, $zero
/* 4C3C4 8005BBC4 21584001 */  addu       $t3, $t2, $zero
.L8005BBC8:
/* 4C3C8 8005BBC8 4800628C */  lw         $v0, 0x48($v1)
/* 4C3CC 8005BBCC 00002696 */  lhu        $a2, 0x0($s1)
/* 4C3D0 8005BBD0 02002896 */  lhu        $t0, 0x2($s1)
/* 4C3D4 8005BBD4 04002996 */  lhu        $t1, 0x4($s1)
/* 4C3D8 8005BBD8 21104B00 */  addu       $v0, $v0, $t3
/* 4C3DC 8005BBDC 0C004724 */  addiu      $a3, $v0, 0xC
/* 4C3E0 8005BBE0 0C004394 */  lhu        $v1, 0xC($v0)
/* 4C3E4 8005BBE4 0200E494 */  lhu        $a0, 0x2($a3)
/* 4C3E8 8005BBE8 0400E594 */  lhu        $a1, 0x4($a3)
/* 4C3EC 8005BBEC 21186600 */  addu       $v1, $v1, $a2
/* 4C3F0 8005BBF0 21208800 */  addu       $a0, $a0, $t0
/* 4C3F4 8005BBF4 2128A900 */  addu       $a1, $a1, $t1
/* 4C3F8 8005BBF8 0C0043A4 */  sh         $v1, 0xC($v0)
/* 4C3FC 8005BBFC 0200E4A4 */  sh         $a0, 0x2($a3)
/* 4C400 8005BC00 0400E5A4 */  sh         $a1, 0x4($a3)
/* 4C404 8005BC04 0000038E */  lw         $v1, 0x0($s0)
/* 4C408 8005BC08 01004A25 */  addiu      $t2, $t2, 0x1
/* 4C40C 8005BC0C 4400628C */  lw         $v0, 0x44($v1)
/* 4C410 8005BC10 00000000 */  nop
/* 4C414 8005BC14 2A104201 */  slt        $v0, $t2, $v0
/* 4C418 8005BC18 EBFF4014 */  bnez       $v0, .L8005BBC8
/* 4C41C 8005BC1C 24006B25 */   addiu     $t3, $t3, 0x24
.L8005BC20:
/* 4C420 8005BC20 1800BF8F */  lw         $ra, 0x18($sp)
/* 4C424 8005BC24 1400B18F */  lw         $s1, 0x14($sp)
/* 4C428 8005BC28 1000B08F */  lw         $s0, 0x10($sp)
/* 4C42C 8005BC2C 0800E003 */  jr         $ra
/* 4C430 8005BC30 2000BD27 */   addiu     $sp, $sp, 0x20
.size RelocateLevel, . - RelocateLevel
