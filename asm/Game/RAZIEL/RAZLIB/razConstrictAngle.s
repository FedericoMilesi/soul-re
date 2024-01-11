.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel razConstrictAngle
/* 95B18 800A5318 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 95B1C 800A531C 2000B0AF */  sw         $s0, 0x20($sp)
/* 95B20 800A5320 48FA9087 */  lh         $s0, %gp_rel(Raziel + 0x418)($gp)
/* 95B24 800A5324 2400B1AF */  sw         $s1, 0x24($sp)
/* 95B28 800A5328 21880000 */  addu       $s1, $zero, $zero
/* 95B2C 800A532C 3000BFAF */  sw         $ra, 0x30($sp)
/* 95B30 800A5330 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 95B34 800A5334 2800B2AF */  sw         $s2, 0x28($sp)
/* 95B38 800A5338 5C008294 */  lhu        $v0, 0x5C($a0)
/* 95B3C 800A533C 21982002 */  addu       $s3, $s1, $zero
/* 95B40 800A5340 1000A2A7 */  sh         $v0, 0x10($sp)
/* 95B44 800A5344 5E008294 */  lhu        $v0, 0x5E($a0)
/* 95B48 800A5348 21902002 */  addu       $s2, $s1, $zero
/* 95B4C 800A534C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 95B50 800A5350 2000022A */  slti       $v0, $s0, 0x20
.L800A5354:
/* 95B54 800A5354 03004014 */  bnez       $v0, .L800A5364
/* 95B58 800A5358 01000626 */   addiu     $a2, $s0, 0x1
/* 95B5C 800A535C 21800000 */  addu       $s0, $zero, $zero
/* 95B60 800A5360 01000626 */  addiu      $a2, $s0, 0x1
.L800A5364:
/* 95B64 800A5364 2000C228 */  slti       $v0, $a2, 0x20
/* 95B68 800A5368 02004014 */  bnez       $v0, .L800A5374
/* 95B6C 800A536C 80181000 */   sll       $v1, $s0, 2
/* 95B70 800A5370 21300000 */  addu       $a2, $zero, $zero
.L800A5374:
/* 95B74 800A5374 80100600 */  sll        $v0, $a2, 2
/* 95B78 800A5378 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* 95B7C 800A537C 4CFA888F */  lw         $t0, %gp_rel(Raziel + 0x41C)($gp)
/* 95B80 800A5380 21186400 */  addu       $v1, $v1, $a0
/* 95B84 800A5384 21104400 */  addu       $v0, $v0, $a0
/* 95B88 800A5388 0000638C */  lw         $v1, 0x0($v1)
/* 95B8C 800A538C 0000428C */  lw         $v0, 0x0($v0)
/* 95B90 800A5390 00608848 */  mtc2       $t0, $12 # handwritten instruction
/* 95B94 800A5394 00708248 */  mtc2       $v0, $14 # handwritten instruction
/* 95B98 800A5398 00688348 */  mtc2       $v1, $13 # handwritten instruction
/* 95B9C 800A539C 00000000 */  nop
/* 95BA0 800A53A0 00000000 */  nop
/* 95BA4 800A53A4 0600404B */  NCLIP
/* 95BA8 800A53A8 1800A227 */  addiu      $v0, $sp, 0x18
/* 95BAC 800A53AC 000058E8 */  swc2       $24, 0x0($v0)
/* 95BB0 800A53B0 1800A28F */  lw         $v0, 0x18($sp)
/* 95BB4 800A53B4 00000000 */  nop
/* 95BB8 800A53B8 03004018 */  blez       $v0, .L800A53C8
/* 95BBC 800A53BC 00000000 */   nop
/* 95BC0 800A53C0 F3940208 */  j          .L800A53CC
/* 95BC4 800A53C4 01003126 */   addiu     $s1, $s1, 0x1
.L800A53C8:
/* 95BC8 800A53C8 FFFF3126 */  addiu      $s1, $s1, -0x1
.L800A53CC:
/* 95BCC 800A53CC 80281000 */  sll        $a1, $s0, 2
/* 95BD0 800A53D0 01001026 */  addiu      $s0, $s0, 0x1
/* 95BD4 800A53D4 01005226 */  addiu      $s2, $s2, 0x1
/* 95BD8 800A53D8 44FA828F */  lw         $v0, %gp_rel(Raziel + 0x414)($gp)
/* 95BDC 800A53DC 80300600 */  sll        $a2, $a2, 2
/* 95BE0 800A53E0 4CFA8427 */  addiu      $a0, $gp, %gp_rel(Raziel + 0x41C)
/* 95BE4 800A53E4 1000A727 */  addiu      $a3, $sp, 0x10
/* 95BE8 800A53E8 21284500 */  addu       $a1, $v0, $a1
/* 95BEC 800A53EC AF7A000C */  jal        COLLIDE_PointInTriangle2DPub
/* 95BF0 800A53F0 21304600 */   addu      $a2, $v0, $a2
/* 95BF4 800A53F4 21986202 */  addu       $s3, $s3, $v0
/* 95BF8 800A53F8 2000422A */  slti       $v0, $s2, 0x20
/* 95BFC 800A53FC D5FF4014 */  bnez       $v0, .L800A5354
/* 95C00 800A5400 2000022A */   slti      $v0, $s0, 0x20
/* 95C04 800A5404 02006012 */  beqz       $s3, .L800A5410
/* 95C08 800A5408 21100000 */   addu      $v0, $zero, $zero
/* 95C0C 800A540C 21102002 */  addu       $v0, $s1, $zero
.L800A5410:
/* 95C10 800A5410 3000BF8F */  lw         $ra, 0x30($sp)
/* 95C14 800A5414 2C00B38F */  lw         $s3, 0x2C($sp)
/* 95C18 800A5418 2800B28F */  lw         $s2, 0x28($sp)
/* 95C1C 800A541C 2400B18F */  lw         $s1, 0x24($sp)
/* 95C20 800A5420 2000B08F */  lw         $s0, 0x20($sp)
/* 95C24 800A5424 0800E003 */  jr         $ra
/* 95C28 800A5428 3800BD27 */   addiu     $sp, $sp, 0x38
.size razConstrictAngle, . - razConstrictAngle
