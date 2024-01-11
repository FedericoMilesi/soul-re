.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SplineHelpMove
/* BAC0 8001B2C0 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* BAC4 8001B2C4 3400B1AF */  sw         $s1, 0x34($sp)
/* BAC8 8001B2C8 21888000 */  addu       $s1, $a0, $zero
/* BACC 8001B2CC 88AC8487 */  lh         $a0, %gp_rel(splinecam_helprot + 0x4)($gp)
/* BAD0 8001B2D0 4000BFAF */  sw         $ra, 0x40($sp)
/* BAD4 8001B2D4 3C00B3AF */  sw         $s3, 0x3C($sp)
/* BAD8 8001B2D8 3800B2AF */  sw         $s2, 0x38($sp)
/* BADC 8001B2DC 3000B0AF */  sw         $s0, 0x30($sp)
/* BAE0 8001B2E0 B6012586 */  lh         $a1, 0x1B6($s1)
/* BAE4 8001B2E4 2404328E */  lw         $s2, 0x424($s1)
/* BAE8 8001B2E8 0801338E */  lw         $s3, 0x108($s1)
/* BAEC 8001B2EC BC59000C */  jal        CAMERA_AngleDifference
/* BAF0 8001B2F0 00000000 */   nop
/* BAF4 8001B2F4 00140200 */  sll        $v0, $v0, 16
/* BAF8 8001B2F8 03140200 */  sra        $v0, $v0, 16
/* BAFC 8001B2FC 90014228 */  slti       $v0, $v0, 0x190
/* BB00 8001B300 09004010 */  beqz       $v0, .L8001B328
/* BB04 8001B304 2000B027 */   addiu     $s0, $sp, 0x20
/* BB08 8001B308 B6012296 */  lhu        $v0, 0x1B6($s1)
/* BB0C 8001B30C 00000000 */  nop
/* BB10 8001B310 00084224 */  addiu      $v0, $v0, 0x800
/* BB14 8001B314 88AC82A7 */  sh         $v0, %gp_rel(splinecam_helprot + 0x4)($gp)
/* BB18 8001B318 B6012296 */  lhu        $v0, 0x1B6($s1)
/* BB1C 8001B31C 00000000 */  nop
/* BB20 8001B320 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* BB24 8001B324 B60122A6 */  sh         $v0, 0x1B6($s1)
.L8001B328:
/* BB28 8001B328 21200002 */  addu       $a0, $s0, $zero
/* BB2C 8001B32C AA012526 */  addiu      $a1, $s1, 0x1AA
/* BB30 8001B330 88AC8627 */  addiu      $a2, $gp, %gp_rel(splinecam_helprot + 0x4)
/* BB34 8001B334 A8012786 */  lh         $a3, 0x1A8($s1)
/* BB38 8001B338 6F5A000C */  jal        CAMERA_CalcPosition
/* BB3C 8001B33C FCFFC624 */   addiu     $a2, $a2, -0x4
/* BB40 8001B340 21202002 */  addu       $a0, $s1, $zero
/* BB44 8001B344 21300002 */  addu       $a2, $s0, $zero
/* BB48 8001B348 1800B027 */  addiu      $s0, $sp, 0x18
/* BB4C 8001B34C 1000B0AF */  sw         $s0, 0x10($sp)
/* BB50 8001B350 0000458E */  lw         $a1, 0x0($s2)
/* BB54 8001B354 506B000C */  jal        CAMERA_SplineGetNearestPoint2
/* BB58 8001B358 3C042726 */   addiu     $a3, $s1, 0x43C
/* BB5C 8001B35C 2800A427 */  addiu      $a0, $sp, 0x28
/* BB60 8001B360 00012526 */  addiu      $a1, $s1, 0x100
/* BB64 8001B364 C45E000C */  jal        CAMERA_CalcRotation
/* BB68 8001B368 21300002 */   addu      $a2, $s0, $zero
/* BB6C 8001B36C 2800A297 */  lhu        $v0, 0x28($sp)
/* BB70 8001B370 2C00A397 */  lhu        $v1, 0x2C($sp)
/* BB74 8001B374 84AC82A7 */  sh         $v0, %gp_rel(splinecam_helprot)($gp)
/* BB78 8001B378 88AC83A7 */  sh         $v1, %gp_rel(splinecam_helprot + 0x4)($gp)
/* BB7C 8001B37C FC002596 */  lhu        $a1, 0xFC($s1)
/* BB80 8001B380 78006486 */  lh         $a0, 0x78($s3)
/* BB84 8001B384 0008A524 */  addiu      $a1, $a1, 0x800
/* BB88 8001B388 002C0500 */  sll        $a1, $a1, 16
/* BB8C 8001B38C BC59000C */  jal        CAMERA_AngleDifference
/* BB90 8001B390 032C0500 */   sra       $a1, $a1, 16
/* BB94 8001B394 00140200 */  sll        $v0, $v0, 16
/* BB98 8001B398 03140200 */  sra        $v0, $v0, 16
/* BB9C 8001B39C 84034228 */  slti       $v0, $v0, 0x384
/* BBA0 8001B3A0 1C004010 */  beqz       $v0, .L8001B414
/* BBA4 8001B3A4 00000000 */   nop
/* BBA8 8001B3A8 2C00A497 */  lhu        $a0, 0x2C($sp)
/* BBAC 8001B3AC 00000000 */  nop
/* BBB0 8001B3B0 00088424 */  addiu      $a0, $a0, 0x800
/* BBB4 8001B3B4 FF0F8430 */  andi       $a0, $a0, 0xFFF
/* BBB8 8001B3B8 2C00A4A7 */  sh         $a0, 0x2C($sp)
/* BBBC 8001B3BC FC002586 */  lh         $a1, 0xFC($s1)
/* BBC0 8001B3C0 DA59000C */  jal        CAMERA_SignedAngleDifference
/* BBC4 8001B3C4 00000000 */   nop
/* BBC8 8001B3C8 00140200 */  sll        $v0, $v0, 16
/* BBCC 8001B3CC 03240200 */  sra        $a0, $v0, 16
/* BBD0 8001B3D0 02008104 */  bgez       $a0, .L8001B3DC
/* BBD4 8001B3D4 21108000 */   addu      $v0, $a0, $zero
/* BBD8 8001B3D8 23100200 */  negu       $v0, $v0
.L8001B3DC:
/* BBDC 8001B3DC 84034228 */  slti       $v0, $v0, 0x384
/* BBE0 8001B3E0 0C004010 */  beqz       $v0, .L8001B414
/* BBE4 8001B3E4 C0100400 */   sll       $v0, $a0, 3
/* BBE8 8001B3E8 21104400 */  addu       $v0, $v0, $a0
/* BBEC 8001B3EC 80100200 */  sll        $v0, $v0, 2
/* BBF0 8001B3F0 21104400 */  addu       $v0, $v0, $a0
/* BBF4 8001B3F4 C0180200 */  sll        $v1, $v0, 3
/* BBF8 8001B3F8 21104300 */  addu       $v0, $v0, $v1
/* BBFC 8001B3FC 80100200 */  sll        $v0, $v0, 2
/* BC00 8001B400 23104400 */  subu       $v0, $v0, $a0
/* BC04 8001B404 FC002396 */  lhu        $v1, 0xFC($s1)
/* BC08 8001B408 C3120200 */  sra        $v0, $v0, 11
/* BC0C 8001B40C 21186200 */  addu       $v1, $v1, $v0
/* BC10 8001B410 FC0023A6 */  sh         $v1, 0xFC($s1)
.L8001B414:
/* BC14 8001B414 4000BF8F */  lw         $ra, 0x40($sp)
/* BC18 8001B418 3C00B38F */  lw         $s3, 0x3C($sp)
/* BC1C 8001B41C 3800B28F */  lw         $s2, 0x38($sp)
/* BC20 8001B420 3400B18F */  lw         $s1, 0x34($sp)
/* BC24 8001B424 3000B08F */  lw         $s0, 0x30($sp)
/* BC28 8001B428 0800E003 */  jr         $ra
/* BC2C 8001B42C 4800BD27 */   addiu     $sp, $sp, 0x48
.size CAMERA_SplineHelpMove, . - CAMERA_SplineHelpMove
