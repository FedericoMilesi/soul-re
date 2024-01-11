.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_StartVertexBlood
/* 7CA54 8008C254 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 7CA58 8008C258 5000B2AF */  sw         $s2, 0x50($sp)
/* 7CA5C 8008C25C 21908000 */  addu       $s2, $a0, $zero
/* 7CA60 8008C260 4800B0AF */  sw         $s0, 0x48($sp)
/* 7CA64 8008C264 2180A000 */  addu       $s0, $a1, $zero
/* 7CA68 8008C268 5800B4AF */  sw         $s4, 0x58($sp)
/* 7CA6C 8008C26C 6000BFAF */  sw         $ra, 0x60($sp)
/* 7CA70 8008C270 5C00B5AF */  sw         $s5, 0x5C($sp)
/* 7CA74 8008C274 5400B3AF */  sw         $s3, 0x54($sp)
/* 7CA78 8008C278 4C00B1AF */  sw         $s1, 0x4C($sp)
/* 7CA7C 8008C27C 1C00438E */  lw         $v1, 0x1C($s2)
/* 7CA80 8008C280 26014286 */  lh         $v0, 0x126($s2)
/* 7CA84 8008C284 0C00638C */  lw         $v1, 0xC($v1)
/* 7CA88 8008C288 80100200 */  sll        $v0, $v0, 2
/* 7CA8C 8008C28C 21104300 */  addu       $v0, $v0, $v1
/* 7CA90 8008C290 9802438E */  lw         $v1, 0x298($s2)
/* 7CA94 8008C294 0000518C */  lw         $s1, 0x0($v0)
/* 7CA98 8008C298 07006014 */  bnez       $v1, .L8008C2B8
/* 7CA9C 8008C29C 21A0C000 */   addu      $s4, $a2, $zero
/* 7CAA0 8008C2A0 7B30020C */  jal        MONSTER_InitVertexColors
/* 7CAA4 8008C2A4 21282002 */   addu      $a1, $s1, $zero
/* 7CAA8 8008C2A8 9802428E */  lw         $v0, 0x298($s2)
/* 7CAAC 8008C2AC 00000000 */  nop
/* 7CAB0 8008C2B0 41004010 */  beqz       $v0, .L8008C3B8
/* 7CAB4 8008C2B4 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8008C2B8:
/* 7CAB8 8008C2B8 21204002 */  addu       $a0, $s2, $zero
/* 7CABC 8008C2BC 2800B327 */  addiu      $s3, $sp, 0x28
/* 7CAC0 8008C2C0 21286002 */  addu       $a1, $s3, $zero
/* 7CAC4 8008C2C4 0980023C */  lui        $v0, %hi(ProcessBloodyMess)
/* 7CAC8 8008C2C8 E0C05524 */  addiu      $s5, $v0, %lo(ProcessBloodyMess)
/* 7CACC 8008C2CC 2130A002 */  addu       $a2, $s5, $zero
/* 7CAD0 8008C2D0 1000A727 */  addiu      $a3, $sp, 0x10
/* 7CAD4 8008C2D4 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 7CAD8 8008C2D8 0100023C */  lui        $v0, (0x10000 >> 16)
/* 7CADC 8008C2DC 0300088A */  lwl        $t0, 0x3($s0)
/* 7CAE0 8008C2E0 0000089A */  lwr        $t0, 0x0($s0)
/* 7CAE4 8008C2E4 0700098A */  lwl        $t1, 0x7($s0)
/* 7CAE8 8008C2E8 0400099A */  lwr        $t1, 0x4($s0)
/* 7CAEC 8008C2EC 2B00A8AB */  swl        $t0, 0x2B($sp)
/* 7CAF0 8008C2F0 2800A8BB */  swr        $t0, 0x28($sp)
/* 7CAF4 8008C2F4 2F00A9AB */  swl        $t1, 0x2F($sp)
/* 7CAF8 8008C2F8 2C00A9BB */  swr        $t1, 0x2C($sp)
/* 7CAFC 8008C2FC 1000A3AF */  sw         $v1, 0x10($sp)
/* 7CB00 8008C300 1400A2AF */  sw         $v0, 0x14($sp)
/* 7CB04 8008C304 1800A3AF */  sw         $v1, 0x18($sp)
/* 7CB08 8008C308 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 7CB0C 8008C30C C62F020C */  jal        MONSTER_ProcessClosestVerts
/* 7CB10 8008C310 2000B4AF */   sw        $s4, 0x20($sp)
/* 7CB14 8008C314 1400A28F */  lw         $v0, 0x14($sp)
/* 7CB18 8008C318 00000000 */  nop
/* 7CB1C 8008C31C 33004228 */  slti       $v0, $v0, 0x33
/* 7CB20 8008C320 22004014 */  bnez       $v0, .L8008C3AC
/* 7CB24 8008C324 00000000 */   nop
/* 7CB28 8008C328 1800A28F */  lw         $v0, 0x18($sp)
/* 7CB2C 8008C32C 4000508E */  lw         $s0, 0x40($s2)
/* 7CB30 8008C330 0400318E */  lw         $s1, 0x4($s1)
/* 7CB34 8008C334 40110200 */  sll        $v0, $v0, 5
/* 7CB38 8008C338 21800202 */  addu       $s0, $s0, $v0
/* 7CB3C 8008C33C 52F2020C */  jal        SetRotMatrix
/* 7CB40 8008C340 21200002 */   addu      $a0, $s0, $zero
/* 7CB44 8008C344 4AF2020C */  jal        SetTransMatrix
/* 7CB48 8008C348 21200002 */   addu      $a0, $s0, $zero
/* 7CB4C 8008C34C 3000A527 */  addiu      $a1, $sp, 0x30
/* 7CB50 8008C350 1000A48F */  lw         $a0, 0x10($sp)
/* 7CB54 8008C354 4000A627 */  addiu      $a2, $sp, 0x40
/* 7CB58 8008C358 C0200400 */  sll        $a0, $a0, 3
/* 7CB5C 8008C35C 98F4020C */  jal        RotTrans
/* 7CB60 8008C360 21202402 */   addu      $a0, $s1, $a0
/* 7CB64 8008C364 21206002 */  addu       $a0, $s3, $zero
/* 7CB68 8008C368 3000A397 */  lhu        $v1, 0x30($sp)
/* 7CB6C 8008C36C 3400A597 */  lhu        $a1, 0x34($sp)
/* 7CB70 8008C370 3800A697 */  lhu        $a2, 0x38($sp)
/* 7CB74 8008C374 01000224 */  addiu      $v0, $zero, 0x1
/* 7CB78 8008C378 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 7CB7C 8008C37C 1400A0AF */  sw         $zero, 0x14($sp)
/* 7CB80 8008C380 2800A3A7 */  sh         $v1, 0x28($sp)
/* 7CB84 8008C384 2A00A5A7 */  sh         $a1, 0x2A($sp)
/* 7CB88 8008C388 CF29010C */  jal        FX_MakeHitFX
/* 7CB8C 8008C38C 2C00A6A7 */   sh        $a2, 0x2C($sp)
/* 7CB90 8008C390 21204002 */  addu       $a0, $s2, $zero
/* 7CB94 8008C394 21286002 */  addu       $a1, $s3, $zero
/* 7CB98 8008C398 2130A002 */  addu       $a2, $s5, $zero
/* 7CB9C 8008C39C C62F020C */  jal        MONSTER_ProcessClosestVerts
/* 7CBA0 8008C3A0 1000A727 */   addiu     $a3, $sp, 0x10
/* 7CBA4 8008C3A4 ED300208 */  j          .L8008C3B4
/* 7CBA8 8008C3A8 00000000 */   nop
.L8008C3AC:
/* 7CBAC 8008C3AC CF29010C */  jal        FX_MakeHitFX
/* 7CBB0 8008C3B0 21206002 */   addu      $a0, $s3, $zero
.L8008C3B4:
/* 7CBB4 8008C3B4 1000A28F */  lw         $v0, 0x10($sp)
.L8008C3B8:
/* 7CBB8 8008C3B8 6000BF8F */  lw         $ra, 0x60($sp)
/* 7CBBC 8008C3BC 5C00B58F */  lw         $s5, 0x5C($sp)
/* 7CBC0 8008C3C0 5800B48F */  lw         $s4, 0x58($sp)
/* 7CBC4 8008C3C4 5400B38F */  lw         $s3, 0x54($sp)
/* 7CBC8 8008C3C8 5000B28F */  lw         $s2, 0x50($sp)
/* 7CBCC 8008C3CC 4C00B18F */  lw         $s1, 0x4C($sp)
/* 7CBD0 8008C3D0 4800B08F */  lw         $s0, 0x48($sp)
/* 7CBD4 8008C3D4 0800E003 */  jr         $ra
/* 7CBD8 8008C3D8 6800BD27 */   addiu     $sp, $sp, 0x68
.size MONSTER_StartVertexBlood, . - MONSTER_StartVertexBlood
