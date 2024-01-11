.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel G2Quat_FromMatrix_S
/* 6A290 80079A90 0000A884 */  lh         $t0, 0x0($a1)
/* 6A294 80079A94 0800A984 */  lh         $t1, 0x8($a1)
/* 6A298 80079A98 1000AA84 */  lh         $t2, 0x10($a1)
/* 6A29C 80079A9C D8FFBD23 */  addi       $sp, $sp, -0x28 # handwritten instruction
/* 6A2A0 80079AA0 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A2A4 80079AA4 1400B0AF */  sw         $s0, 0x14($sp)
/* 6A2A8 80079AA8 1800B1AF */  sw         $s1, 0x18($sp)
/* 6A2AC 80079AAC 21808000 */  addu       $s0, $a0, $zero
/* 6A2B0 80079AB0 20200901 */  add        $a0, $t0, $t1 # handwritten instruction
/* 6A2B4 80079AB4 20208A00 */  add        $a0, $a0, $t2 # handwritten instruction
/* 6A2B8 80079AB8 24008018 */  blez       $a0, .L80079B4C
/* 6A2BC 80079ABC 2188A000 */   addu      $s1, $a1, $zero
/* 6A2C0 80079AC0 6EE7000C */  jal        MATH3D_FastSqrt
/* 6A2C4 80079AC4 00108420 */   addi      $a0, $a0, 0x1000 # handwritten instruction
/* 6A2C8 80079AC8 8000083C */  lui        $t0, (0x800000 >> 16)
/* 6A2CC 80079ACC 1A000201 */  div        $zero, $t0, $v0
/* 6A2D0 80079AD0 0E002886 */  lh         $t0, 0xE($s1)
/* 6A2D4 80079AD4 0A002986 */  lh         $t1, 0xA($s1)
/* 6A2D8 80079AD8 04002A86 */  lh         $t2, 0x4($s1)
/* 6A2DC 80079ADC 0C002B86 */  lh         $t3, 0xC($s1)
/* 6A2E0 80079AE0 06002C86 */  lh         $t4, 0x6($s1)
/* 6A2E4 80079AE4 02002D86 */  lh         $t5, 0x2($s1)
/* 6A2E8 80079AE8 43180200 */  sra        $v1, $v0, 1
/* 6A2EC 80079AEC 060003A6 */  sh         $v1, 0x6($s0)
/* 6A2F0 80079AF0 22400901 */  sub        $t0, $t0, $t1 # handwritten instruction
/* 6A2F4 80079AF4 22504B01 */  sub        $t2, $t2, $t3 # handwritten instruction
/* 6A2F8 80079AF8 22608D01 */  sub        $t4, $t4, $t5 # handwritten instruction
/* 6A2FC 80079AFC 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 6A300 80079B00 00508A48 */  mtc2       $t2, $10 # handwritten instruction
/* 6A304 80079B04 00588C48 */  mtc2       $t4, $11 # handwritten instruction
/* 6A308 80079B08 12100000 */  mflo       $v0
/* 6A30C 80079B0C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6A310 80079B10 00000000 */  nop
/* 6A314 80079B14 00000000 */  nop
/* 6A318 80079B18 3D00984B */  GPF        1
/* 6A31C 80079B1C 21200002 */  addu       $a0, $s0, $zero
/* 6A320 80079B20 1000BF8F */  lw         $ra, 0x10($sp)
/* 6A324 80079B24 1400B08F */  lw         $s0, 0x14($sp)
/* 6A328 80079B28 1800B18F */  lw         $s1, 0x18($sp)
/* 6A32C 80079B2C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 6A330 80079B30 00500A48 */  mfc2       $t2, $10 # handwritten instruction
/* 6A334 80079B34 00580C48 */  mfc2       $t4, $11 # handwritten instruction
/* 6A338 80079B38 000088A4 */  sh         $t0, 0x0($a0)
/* 6A33C 80079B3C 02008AA4 */  sh         $t2, 0x2($a0)
/* 6A340 80079B40 04008CA4 */  sh         $t4, 0x4($a0)
/* 6A344 80079B44 0800E003 */  jr         $ra
/* 6A348 80079B48 2800BD23 */   addi      $sp, $sp, 0x28 # handwritten instruction
.L80079B4C:
/* 6A34C 80079B4C 1C00B2AF */  sw         $s2, 0x1C($sp)
/* 6A350 80079B50 2000B3AF */  sw         $s3, 0x20($sp)
/* 6A354 80079B54 2400B4AF */  sw         $s4, 0x24($sp)
/* 6A358 80079B58 00001220 */  addi       $s2, $zero, 0x0 # handwritten instruction
/* 6A35C 80079B5C 02001320 */  addi       $s3, $zero, 0x2 # handwritten instruction
/* 6A360 80079B60 04001420 */  addi       $s4, $zero, 0x4 # handwritten instruction
/* 6A364 80079B64 21580001 */  addu       $t3, $t0, $zero
/* 6A368 80079B68 21602001 */  addu       $t4, $t1, $zero
/* 6A36C 80079B6C 2A080901 */  slt        $at, $t0, $t1
/* 6A370 80079B70 07002010 */  beqz       $at, .L80079B90
/* 6A374 80079B74 21684001 */   addu      $t5, $t2, $zero
/* 6A378 80079B78 02001220 */  addi       $s2, $zero, 0x2 # handwritten instruction
/* 6A37C 80079B7C 04001320 */  addi       $s3, $zero, 0x4 # handwritten instruction
/* 6A380 80079B80 00001420 */  addi       $s4, $zero, 0x0 # handwritten instruction
/* 6A384 80079B84 21582001 */  addu       $t3, $t1, $zero
/* 6A388 80079B88 21604001 */  addu       $t4, $t2, $zero
/* 6A38C 80079B8C 21680001 */  addu       $t5, $t0, $zero
.L80079B90:
/* 6A390 80079B90 2A086A01 */  slt        $at, $t3, $t2
/* 6A394 80079B94 07002010 */  beqz       $at, .L80079BB4
/* 6A398 80079B98 00000000 */   nop
/* 6A39C 80079B9C 04001220 */  addi       $s2, $zero, 0x4 # handwritten instruction
/* 6A3A0 80079BA0 00001320 */  addi       $s3, $zero, 0x0 # handwritten instruction
/* 6A3A4 80079BA4 02001420 */  addi       $s4, $zero, 0x2 # handwritten instruction
/* 6A3A8 80079BA8 21584001 */  addu       $t3, $t2, $zero
/* 6A3AC 80079BAC 21600001 */  addu       $t4, $t0, $zero
/* 6A3B0 80079BB0 21682001 */  addu       $t5, $t1, $zero
.L80079BB4:
/* 6A3B4 80079BB4 20208D01 */  add        $a0, $t4, $t5 # handwritten instruction
/* 6A3B8 80079BB8 22206401 */  sub        $a0, $t3, $a0 # handwritten instruction
/* 6A3BC 80079BBC 6EE7000C */  jal        MATH3D_FastSqrt
/* 6A3C0 80079BC0 00108420 */   addi      $a0, $a0, 0x1000 # handwritten instruction
/* 6A3C4 80079BC4 8000083C */  lui        $t0, (0x800000 >> 16)
/* 6A3C8 80079BC8 1A000201 */  div        $zero, $t0, $v0
/* 6A3CC 80079BCC 43180200 */  sra        $v1, $v0, 1
/* 6A3D0 80079BD0 20201202 */  add        $a0, $s0, $s2 # handwritten instruction
/* 6A3D4 80079BD4 000083A4 */  sh         $v1, 0x0($a0)
/* 6A3D8 80079BD8 40401200 */  sll        $t0, $s2, 1
/* 6A3DC 80079BDC 20401101 */  add        $t0, $t0, $s1 # handwritten instruction
/* 6A3E0 80079BE0 20401201 */  add        $t0, $t0, $s2 # handwritten instruction
/* 6A3E4 80079BE4 40481300 */  sll        $t1, $s3, 1
/* 6A3E8 80079BE8 20483101 */  add        $t1, $t1, $s1 # handwritten instruction
/* 6A3EC 80079BEC 20483301 */  add        $t1, $t1, $s3 # handwritten instruction
/* 6A3F0 80079BF0 40501400 */  sll        $t2, $s4, 1
/* 6A3F4 80079BF4 20505101 */  add        $t2, $t2, $s1 # handwritten instruction
/* 6A3F8 80079BF8 20505401 */  add        $t2, $t2, $s4 # handwritten instruction
/* 6A3FC 80079BFC 20581301 */  add        $t3, $t0, $s3 # handwritten instruction
/* 6A400 80079C00 20601401 */  add        $t4, $t0, $s4 # handwritten instruction
/* 6A404 80079C04 20683201 */  add        $t5, $t1, $s2 # handwritten instruction
/* 6A408 80079C08 20703401 */  add        $t6, $t1, $s4 # handwritten instruction
/* 6A40C 80079C0C 20785201 */  add        $t7, $t2, $s2 # handwritten instruction
/* 6A410 80079C10 20C05301 */  add        $t8, $t2, $s3 # handwritten instruction
/* 6A414 80079C14 0000CE85 */  lh         $t6, 0x0($t6)
/* 6A418 80079C18 00001887 */  lh         $t8, 0x0($t8)
/* 6A41C 80079C1C 00006B85 */  lh         $t3, 0x0($t3)
/* 6A420 80079C20 0000AD85 */  lh         $t5, 0x0($t5)
/* 6A424 80079C24 00008C85 */  lh         $t4, 0x0($t4)
/* 6A428 80079C28 0000EF85 */  lh         $t7, 0x0($t7)
/* 6A42C 80079C2C 22400E03 */  sub        $t0, $t8, $t6 # handwritten instruction
/* 6A430 80079C30 2048AB01 */  add        $t1, $t5, $t3 # handwritten instruction
/* 6A434 80079C34 2050EC01 */  add        $t2, $t7, $t4 # handwritten instruction
/* 6A438 80079C38 12100000 */  mflo       $v0
/* 6A43C 80079C3C 00408248 */  mtc2       $v0, $8 # handwritten instruction
/* 6A440 80079C40 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* 6A444 80079C44 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* 6A448 80079C48 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* 6A44C 80079C4C 00000000 */  nop
/* 6A450 80079C50 00000000 */  nop
/* 6A454 80079C54 3D00984B */  GPF        1
/* 6A458 80079C58 21200002 */  addu       $a0, $s0, $zero
/* 6A45C 80079C5C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6A460 80079C60 1400B08F */  lw         $s0, 0x14($sp)
/* 6A464 80079C64 1800B18F */  lw         $s1, 0x18($sp)
/* 6A468 80079C68 1C00B28F */  lw         $s2, 0x1C($sp)
/* 6A46C 80079C6C 00480848 */  mfc2       $t0, $9 # handwritten instruction
/* 6A470 80079C70 00500948 */  mfc2       $t1, $10 # handwritten instruction
/* 6A474 80079C74 00580A48 */  mfc2       $t2, $11 # handwritten instruction
/* 6A478 80079C78 060088A4 */  sh         $t0, 0x6($a0)
/* 6A47C 80079C7C 20986402 */  add        $s3, $s3, $a0 # handwritten instruction
/* 6A480 80079C80 20A08402 */  add        $s4, $s4, $a0 # handwritten instruction
/* 6A484 80079C84 000069A6 */  sh         $t1, 0x0($s3)
/* 6A488 80079C88 00008AA6 */  sh         $t2, 0x0($s4)
/* 6A48C 80079C8C 2000B38F */  lw         $s3, 0x20($sp)
/* 6A490 80079C90 2400B48F */  lw         $s4, 0x24($sp)
/* 6A494 80079C94 0800E003 */  jr         $ra
/* 6A498 80079C98 2800BD23 */   addi      $sp, $sp, 0x28 # handwritten instruction
.size G2Quat_FromMatrix_S, . - G2Quat_FromMatrix_S
