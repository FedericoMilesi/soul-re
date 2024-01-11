.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BirthProjectilePhysOb
/* 5B234 8006AA34 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 5B238 8006AA38 3800B4AF */  sw         $s4, 0x38($sp)
/* 5B23C 8006AA3C 21A0A000 */  addu       $s4, $a1, $zero
/* 5B240 8006AA40 0D80023C */  lui        $v0, %hi(objectAccess + 0x9C)
/* 5B244 8006AA44 D8A2458C */  lw         $a1, %lo(objectAccess + 0x9C)($v0)
/* 5B248 8006AA48 3400B3AF */  sw         $s3, 0x34($sp)
/* 5B24C 8006AA4C 21988000 */  addu       $s3, $a0, $zero
/* 5B250 8006AA50 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 5B254 8006AA54 2188C000 */  addu       $s1, $a2, $zero
/* 5B258 8006AA58 2800B0AF */  sw         $s0, 0x28($sp)
/* 5B25C 8006AA5C 21800000 */  addu       $s0, $zero, $zero
/* 5B260 8006AA60 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 5B264 8006AA64 5F00A010 */  beqz       $a1, .L8006ABE4
/* 5B268 8006AA68 3000B2AF */   sw        $s2, 0x30($sp)
/* 5B26C 8006AA6C ACCF000C */  jal        INSTANCE_BirthObject
/* 5B270 8006AA70 21300002 */   addu      $a2, $s0, $zero
/* 5B274 8006AA74 21804000 */  addu       $s0, $v0, $zero
/* 5B278 8006AA78 5B000012 */  beqz       $s0, .L8006ABE8
/* 5B27C 8006AA7C 21100002 */   addu      $v0, $s0, $zero
/* 5B280 8006AA80 6C01028E */  lw         $v0, 0x16C($s0)
/* 5B284 8006AA84 2400038E */  lw         $v1, 0x24($s0)
/* 5B288 8006AA88 040051AC */  sw         $s1, 0x4($v0)
/* 5B28C 8006AA8C 40101100 */  sll        $v0, $s1, 1
/* 5B290 8006AA90 21105100 */  addu       $v0, $v0, $s1
/* 5B294 8006AA94 0C00638C */  lw         $v1, 0xC($v1)
/* 5B298 8006AA98 80100200 */  sll        $v0, $v0, 2
/* 5B29C 8006AA9C 21186200 */  addu       $v1, $v1, $v0
/* 5B2A0 8006AAA0 00006290 */  lbu        $v0, 0x0($v1)
/* 5B2A4 8006AAA4 00000000 */  nop
/* 5B2A8 8006AAA8 00160200 */  sll        $v0, $v0, 24
/* 5B2AC 8006AAAC 03160200 */  sra        $v0, $v0, 24
/* 5B2B0 8006AAB0 260102A6 */  sh         $v0, 0x126($s0)
/* 5B2B4 8006AAB4 00006280 */  lb         $v0, 0x0($v1)
/* 5B2B8 8006AAB8 6C01128E */  lw         $s2, 0x16C($s0)
/* 5B2BC 8006AABC 14004014 */  bnez       $v0, .L8006AB10
/* 5B2C0 8006AAC0 21200002 */   addu      $a0, $s0, $zero
/* 5B2C4 8006AAC4 2000023C */  lui        $v0, (0x202020 >> 16)
/* 5B2C8 8006AAC8 20204234 */  ori        $v0, $v0, (0x202020 & 0xFFFF)
/* 5B2CC 8006AACC 78000524 */  addiu      $a1, $zero, 0x78
/* 5B2D0 8006AAD0 2000A627 */  addiu      $a2, $sp, 0x20
/* 5B2D4 8006AAD4 20000724 */  addiu      $a3, $zero, 0x20
/* 5B2D8 8006AAD8 10000324 */  addiu      $v1, $zero, 0x10
/* 5B2DC 8006AADC 2000A0A7 */  sh         $zero, 0x20($sp)
/* 5B2E0 8006AAE0 2200A0A7 */  sh         $zero, 0x22($sp)
/* 5B2E4 8006AAE4 2400A0A7 */  sh         $zero, 0x24($sp)
/* 5B2E8 8006AAE8 1000A3AF */  sw         $v1, 0x10($sp)
/* 5B2EC 8006AAEC 80000324 */  addiu      $v1, $zero, 0x80
/* 5B2F0 8006AAF0 1400A3AF */  sw         $v1, 0x14($sp)
/* 5B2F4 8006AAF4 7F3B010C */  jal        FX_StartFField
/* 5B2F8 8006AAF8 1800A2AF */   sw        $v0, 0x18($sp)
/* 5B2FC 8006AAFC 21184000 */  addu       $v1, $v0, $zero
/* 5B300 8006AB00 02006010 */  beqz       $v1, .L8006AB0C
/* 5B304 8006AB04 01000224 */   addiu     $v0, $zero, 0x1
/* 5B308 8006AB08 0D0062A0 */  sb         $v0, 0xD($v1)
.L8006AB0C:
/* 5B30C 8006AB0C 21200002 */  addu       $a0, $s0, $zero
.L8006AB10:
/* 5B310 8006AB10 21286002 */  addu       $a1, $s3, $zero
/* 5B314 8006AB14 47D5000C */  jal        INSTANCE_LinkToParent
/* 5B318 8006AB18 21308002 */   addu      $a2, $s4, $zero
/* 5B31C 8006AB1C 21200002 */  addu       $a0, $s0, $zero
/* 5B320 8006AB20 EBB7010C */  jal        TurnOffCollisionPhysOb
/* 5B324 8006AB24 07000524 */   addiu     $a1, $zero, 0x7
/* 5B328 8006AB28 2400118E */  lw         $s1, 0x24($s0)
/* 5B32C 8006AB2C 00000000 */  nop
/* 5B330 8006AB30 02002396 */  lhu        $v1, 0x2($s1)
/* 5B334 8006AB34 07000224 */  addiu      $v0, $zero, 0x7
/* 5B338 8006AB38 16006214 */  bne        $v1, $v0, .L8006AB94
/* 5B33C 8006AB3C 00000000 */   nop
/* 5B340 8006AB40 6C01028E */  lw         $v0, 0x16C($s0)
/* 5B344 8006AB44 00000000 */  nop
/* 5B348 8006AB48 0400438C */  lw         $v1, 0x4($v0)
/* 5B34C 8006AB4C 00000000 */  nop
/* 5B350 8006AB50 40100300 */  sll        $v0, $v1, 1
/* 5B354 8006AB54 21104300 */  addu       $v0, $v0, $v1
/* 5B358 8006AB58 0C00238E */  lw         $v1, 0xC($s1)
/* 5B35C 8006AB5C 80100200 */  sll        $v0, $v0, 2
/* 5B360 8006AB60 21186200 */  addu       $v1, $v1, $v0
/* 5B364 8006AB64 01006680 */  lb         $a2, 0x1($v1)
/* 5B368 8006AB68 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5B36C 8006AB6C 0900C210 */  beq        $a2, $v0, .L8006AB94
/* 5B370 8006AB70 21200002 */   addu      $a0, $s0, $zero
/* 5B374 8006AB74 1000A0AF */  sw         $zero, 0x10($sp)
/* 5B378 8006AB78 21280000 */  addu       $a1, $zero, $zero
/* 5B37C 8006AB7C 39C9010C */  jal        G2EmulationInstanceSetAnimation
/* 5B380 8006AB80 2138A000 */   addu      $a3, $a1, $zero
/* 5B384 8006AB84 21200002 */  addu       $a0, $s0, $zero
/* 5B388 8006AB88 21280000 */  addu       $a1, $zero, $zero
/* 5B38C 8006AB8C 71C9010C */  jal        G2EmulationInstanceSetMode
/* 5B390 8006AB90 02000624 */   addiu     $a2, $zero, 0x2
.L8006AB94:
/* 5B394 8006AB94 06002296 */  lhu        $v0, 0x6($s1)
/* 5B398 8006AB98 00000000 */  nop
/* 5B39C 8006AB9C 01004230 */  andi       $v0, $v0, 0x1
/* 5B3A0 8006ABA0 0D004010 */  beqz       $v0, .L8006ABD8
/* 5B3A4 8006ABA4 21100002 */   addu      $v0, $s0, $zero
/* 5B3A8 8006ABA8 80100324 */  addiu      $v1, $zero, 0x1080
/* 5B3AC 8006ABAC 000043AE */  sw         $v1, 0x0($s2)
/* 5B3B0 8006ABB0 080040AE */  sw         $zero, 0x8($s2)
/* 5B3B4 8006ABB4 260040A6 */  sh         $zero, 0x26($s2)
/* 5B3B8 8006ABB8 240040A6 */  sh         $zero, 0x24($s2)
/* 5B3BC 8006ABBC 740140AC */  sw         $zero, 0x174($v0)
/* 5B3C0 8006ABC0 780140AC */  sw         $zero, 0x178($v0)
/* 5B3C4 8006ABC4 7C0140AC */  sw         $zero, 0x17C($v0)
/* 5B3C8 8006ABC8 800140AC */  sw         $zero, 0x180($v0)
/* 5B3CC 8006ABCC 840140AC */  sw         $zero, 0x184($v0)
/* 5B3D0 8006ABD0 FAAA0108 */  j          .L8006ABE8
/* 5B3D4 8006ABD4 880140AC */   sw        $zero, 0x188($v0)
.L8006ABD8:
/* 5B3D8 8006ABD8 0900023C */  lui        $v0, (0x96000 >> 16)
/* 5B3DC 8006ABDC 00604234 */  ori        $v0, $v0, (0x96000 & 0xFFFF)
/* 5B3E0 8006ABE0 440042AE */  sw         $v0, 0x44($s2)
.L8006ABE4:
/* 5B3E4 8006ABE4 21100002 */  addu       $v0, $s0, $zero
.L8006ABE8:
/* 5B3E8 8006ABE8 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 5B3EC 8006ABEC 3800B48F */  lw         $s4, 0x38($sp)
/* 5B3F0 8006ABF0 3400B38F */  lw         $s3, 0x34($sp)
/* 5B3F4 8006ABF4 3000B28F */  lw         $s2, 0x30($sp)
/* 5B3F8 8006ABF8 2C00B18F */  lw         $s1, 0x2C($sp)
/* 5B3FC 8006ABFC 2800B08F */  lw         $s0, 0x28($sp)
/* 5B400 8006AC00 0800E003 */  jr         $ra
/* 5B404 8006AC04 4000BD27 */   addiu     $sp, $sp, 0x40
.size BirthProjectilePhysOb, . - BirthProjectilePhysOb
