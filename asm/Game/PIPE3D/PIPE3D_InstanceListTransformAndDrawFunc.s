.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel PIPE3D_InstanceListTransformAndDrawFunc
/* 2BBB0 8003B3B0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 2BBB4 8003B3B4 4000B0AF */  sw         $s0, 0x40($sp)
/* 2BBB8 8003B3B8 2180E000 */  addu       $s0, $a3, $zero
/* 2BBBC 8003B3BC 5800BFAF */  sw         $ra, 0x58($sp)
/* 2BBC0 8003B3C0 5400B5AF */  sw         $s5, 0x54($sp)
/* 2BBC4 8003B3C4 5000B4AF */  sw         $s4, 0x50($sp)
/* 2BBC8 8003B3C8 4C00B3AF */  sw         $s3, 0x4C($sp)
/* 2BBCC 8003B3CC 4800B2AF */  sw         $s2, 0x48($sp)
/* 2BBD0 8003B3D0 4400B1AF */  sw         $s1, 0x44($sp)
/* 2BBD4 8003B3D4 5C000296 */  lhu        $v0, 0x5C($s0)
/* 2BBD8 8003B3D8 0800958C */  lw         $s5, 0x8($a0)
/* 2BBDC 8003B3DC 04BE938F */  lw         $s3, %gp_rel(gameTrackerX + 0x3C)($gp)
/* 2BBE0 8003B3E0 08BE928F */  lw         $s2, %gp_rel(gameTrackerX + 0x40)($gp)
/* 2BBE4 8003B3E4 3800A2A7 */  sh         $v0, 0x38($sp)
/* 2BBE8 8003B3E8 5E000296 */  lhu        $v0, 0x5E($s0)
/* 2BBEC 8003B3EC 21A0A000 */  addu       $s4, $a1, $zero
/* 2BBF0 8003B3F0 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 2BBF4 8003B3F4 60000296 */  lhu        $v0, 0x60($s0)
/* 2BBF8 8003B3F8 2188C000 */  addu       $s1, $a2, $zero
/* 2BBFC 8003B3FC 0F008010 */  beqz       $a0, .L8003B43C
/* 2BC00 8003B400 3C00A2A7 */   sh        $v0, 0x3C($sp)
/* 2BC04 8003B404 06008294 */  lhu        $v0, 0x6($a0)
/* 2BC08 8003B408 00000000 */  nop
/* 2BC0C 8003B40C 01004230 */  andi       $v0, $v0, 0x1
/* 2BC10 8003B410 0A004010 */  beqz       $v0, .L8003B43C
/* 2BC14 8003B414 00000000 */   nop
/* 2BC18 8003B418 0000838C */  lw         $v1, 0x0($a0)
/* 2BC1C 8003B41C 40BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x178)($gp)
/* 2BC20 8003B420 00000000 */  nop
/* 2BC24 8003B424 05006210 */  beq        $v1, $v0, .L8003B43C
/* 2BC28 8003B428 00000000 */   nop
/* 2BC2C 8003B42C 366D010C */  jal        WARPGATE_IsObjectOnWarpSide
/* 2BC30 8003B430 21200002 */   addu      $a0, $s0, $zero
/* 2BC34 8003B434 B0004010 */  beqz       $v0, .L8003B6F8
/* 2BC38 8003B438 00000000 */   nop
.L8003B43C:
/* 2BC3C 8003B43C 1C00038E */  lw         $v1, 0x1C($s0)
/* 2BC40 8003B440 26010286 */  lh         $v0, 0x126($s0)
/* 2BC44 8003B444 0C00638C */  lw         $v1, 0xC($v1)
/* 2BC48 8003B448 80100200 */  sll        $v0, $v0, 2
/* 2BC4C 8003B44C 21104300 */  addu       $v0, $v0, $v1
/* 2BC50 8003B450 0000428C */  lw         $v0, 0x0($v0)
/* 2BC54 8003B454 08002326 */  addiu      $v1, $s1, 0x8
/* 2BC58 8003B458 24004584 */  lh         $a1, 0x24($v0)
/* 2BC5C 8003B45C 00006C8C */  lw         $t4, 0x0($v1)
/* 2BC60 8003B460 04006D8C */  lw         $t5, 0x4($v1)
/* 2BC64 8003B464 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 2BC68 8003B468 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 2BC6C 8003B46C 08006C8C */  lw         $t4, 0x8($v1)
/* 2BC70 8003B470 0C006D8C */  lw         $t5, 0xC($v1)
/* 2BC74 8003B474 10006E8C */  lw         $t6, 0x10($v1)
/* 2BC78 8003B478 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 2BC7C 8003B47C 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 2BC80 8003B480 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 2BC84 8003B484 3800A627 */  addiu      $a2, $sp, 0x38
/* 2BC88 8003B488 0000C0C8 */  lwc2       $0, 0x0($a2)
/* 2BC8C 8003B48C 0400C1C8 */  lwc2       $1, 0x4($a2)
/* 2BC90 8003B490 00000000 */  nop
/* 2BC94 8003B494 00000000 */  nop
/* 2BC98 8003B498 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2BC9C 8003B49C 1800A227 */  addiu      $v0, $sp, 0x18
/* 2BCA0 8003B4A0 000059E8 */  swc2       $25, 0x0($v0)
/* 2BCA4 8003B4A4 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 2BCA8 8003B4A8 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 2BCAC 8003B4AC 1800A38F */  lw         $v1, 0x18($sp)
/* 2BCB0 8003B4B0 4800228E */  lw         $v0, 0x48($s1)
/* 2BCB4 8003B4B4 00000000 */  nop
/* 2BCB8 8003B4B8 23186200 */  subu       $v1, $v1, $v0
/* 2BCBC 8003B4BC 23200500 */  negu       $a0, $a1
/* 2BCC0 8003B4C0 2A108300 */  slt        $v0, $a0, $v1
/* 2BCC4 8003B4C4 8C004010 */  beqz       $v0, .L8003B6F8
/* 2BCC8 8003B4C8 1800A3AF */   sw        $v1, 0x18($sp)
/* 2BCCC 8003B4CC 6400228E */  lw         $v0, 0x64($s1)
/* 2BCD0 8003B4D0 00000000 */  nop
/* 2BCD4 8003B4D4 21104500 */  addu       $v0, $v0, $a1
/* 2BCD8 8003B4D8 2A106200 */  slt        $v0, $v1, $v0
/* 2BCDC 8003B4DC 86004010 */  beqz       $v0, .L8003B6F8
/* 2BCE0 8003B4E0 00000000 */   nop
/* 2BCE4 8003B4E4 1C00A28F */  lw         $v0, 0x1C($sp)
/* 2BCE8 8003B4E8 4C00238E */  lw         $v1, 0x4C($s1)
/* 2BCEC 8003B4EC 00000000 */  nop
/* 2BCF0 8003B4F0 23104300 */  subu       $v0, $v0, $v1
/* 2BCF4 8003B4F4 2A108200 */  slt        $v0, $a0, $v0
/* 2BCF8 8003B4F8 7F004010 */  beqz       $v0, .L8003B6F8
/* 2BCFC 8003B4FC 00000000 */   nop
/* 2BD00 8003B500 2000A28F */  lw         $v0, 0x20($sp)
/* 2BD04 8003B504 5000238E */  lw         $v1, 0x50($s1)
/* 2BD08 8003B508 00000000 */  nop
/* 2BD0C 8003B50C 23104300 */  subu       $v0, $v0, $v1
/* 2BD10 8003B510 2A108200 */  slt        $v0, $a0, $v0
/* 2BD14 8003B514 78004010 */  beqz       $v0, .L8003B6F8
/* 2BD18 8003B518 28002226 */   addiu     $v0, $s1, 0x28
/* 2BD1C 8003B51C 00004C8C */  lw         $t4, 0x0($v0)
/* 2BD20 8003B520 04004D8C */  lw         $t5, 0x4($v0)
/* 2BD24 8003B524 0000CC48 */  ctc2       $t4, $0 # handwritten instruction
/* 2BD28 8003B528 0008CD48 */  ctc2       $t5, $1 # handwritten instruction
/* 2BD2C 8003B52C 08004C8C */  lw         $t4, 0x8($v0)
/* 2BD30 8003B530 0C004D8C */  lw         $t5, 0xC($v0)
/* 2BD34 8003B534 10004E8C */  lw         $t6, 0x10($v0)
/* 2BD38 8003B538 0010CC48 */  ctc2       $t4, $2 # handwritten instruction
/* 2BD3C 8003B53C 0018CD48 */  ctc2       $t5, $3 # handwritten instruction
/* 2BD40 8003B540 0020CE48 */  ctc2       $t6, $4 # handwritten instruction
/* 2BD44 8003B544 0000C0C8 */  lwc2       $0, 0x0($a2)
/* 2BD48 8003B548 0400C1C8 */  lwc2       $1, 0x4($a2)
/* 2BD4C 8003B54C 00000000 */  nop
/* 2BD50 8003B550 00000000 */  nop
/* 2BD54 8003B554 1260484A */  MVMVA      1, 0, 0, 3, 0
/* 2BD58 8003B558 2800A227 */  addiu      $v0, $sp, 0x28
/* 2BD5C 8003B55C 000059E8 */  swc2       $25, 0x0($v0)
/* 2BD60 8003B560 04005AE8 */  swc2       $26, 0x4($v0) # handwritten instruction
/* 2BD64 8003B564 08005BE8 */  swc2       $27, 0x8($v0) # handwritten instruction
/* 2BD68 8003B568 2800A28F */  lw         $v0, 0x28($sp)
/* 2BD6C 8003B56C 5400238E */  lw         $v1, 0x54($s1)
/* 2BD70 8003B570 00000000 */  nop
/* 2BD74 8003B574 23104300 */  subu       $v0, $v0, $v1
/* 2BD78 8003B578 2A108200 */  slt        $v0, $a0, $v0
/* 2BD7C 8003B57C 5E004010 */  beqz       $v0, .L8003B6F8
/* 2BD80 8003B580 00000000 */   nop
/* 2BD84 8003B584 2C00A28F */  lw         $v0, 0x2C($sp)
/* 2BD88 8003B588 5800238E */  lw         $v1, 0x58($s1)
/* 2BD8C 8003B58C 00000000 */  nop
/* 2BD90 8003B590 23104300 */  subu       $v0, $v0, $v1
/* 2BD94 8003B594 2A108200 */  slt        $v0, $a0, $v0
/* 2BD98 8003B598 57004010 */  beqz       $v0, .L8003B6F8
/* 2BD9C 8003B59C 00000000 */   nop
/* 2BDA0 8003B5A0 1400028E */  lw         $v0, 0x14($s0)
/* 2BDA4 8003B5A4 00000000 */  nop
/* 2BDA8 8003B5A8 80004230 */  andi       $v0, $v0, 0x80
/* 2BDAC 8003B5AC 0D004010 */  beqz       $v0, .L8003B5E4
/* 2BDB0 8003B5B0 00000000 */   nop
/* 2BDB4 8003B5B4 1C00038E */  lw         $v1, 0x1C($s0)
/* 2BDB8 8003B5B8 26010286 */  lh         $v0, 0x126($s0)
/* 2BDBC 8003B5BC 0C00638C */  lw         $v1, 0xC($v1)
/* 2BDC0 8003B5C0 80100200 */  sll        $v0, $v0, 2
/* 2BDC4 8003B5C4 21104300 */  addu       $v0, $v0, $v1
/* 2BDC8 8003B5C8 0000428C */  lw         $v0, 0x0($v0)
/* 2BDCC 8003B5CC 6C000586 */  lh         $a1, 0x6C($s0)
/* 2BDD0 8003B5D0 2000448C */  lw         $a0, 0x20($v0)
/* 2BDD4 8003B5D4 8AF0000C */  jal        PIPE3D_AnimateTextures
/* 2BDD8 8003B5D8 00000000 */   nop
/* 2BDDC 8003B5DC 88ED0008 */  j          .L8003B620
/* 2BDE0 8003B5E0 21200002 */   addu      $a0, $s0, $zero
.L8003B5E4:
/* 2BDE4 8003B5E4 1C00038E */  lw         $v1, 0x1C($s0)
/* 2BDE8 8003B5E8 26010286 */  lh         $v0, 0x126($s0)
/* 2BDEC 8003B5EC 0C00638C */  lw         $v1, 0xC($v1)
/* 2BDF0 8003B5F0 80100200 */  sll        $v0, $v0, 2
/* 2BDF4 8003B5F4 21104300 */  addu       $v0, $v0, $v1
/* 2BDF8 8003B5F8 0000428C */  lw         $v0, 0x0($v0)
/* 2BDFC 8003B5FC F4BE858F */  lw         $a1, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 2BE00 8003B600 2000448C */  lw         $a0, 0x20($v0)
/* 2BE04 8003B604 8AF0000C */  jal        PIPE3D_AnimateTextures
/* 2BE08 8003B608 00000000 */   nop
/* 2BE0C 8003B60C 6C000296 */  lhu        $v0, 0x6C($s0)
/* 2BE10 8003B610 00000000 */  nop
/* 2BE14 8003B614 01004224 */  addiu      $v0, $v0, 0x1
/* 2BE18 8003B618 6C0002A6 */  sh         $v0, 0x6C($s0)
/* 2BE1C 8003B61C 21200002 */  addu       $a0, $s0, $zero
.L8003B620:
/* 2BE20 8003B620 00DA000C */  jal        LIGHT_SetMatrixForLightGroupInstance
/* 2BE24 8003B624 2128A002 */   addu      $a1, $s5, $zero
/* 2BE28 8003B628 3A010296 */  lhu        $v0, 0x13A($s0)
/* 2BE2C 8003B62C 00000000 */  nop
/* 2BE30 8003B630 0B004230 */  andi       $v0, $v0, 0xB
/* 2BE34 8003B634 06004010 */  beqz       $v0, .L8003B650
/* 2BE38 8003B638 8000033C */   lui       $v1, (0x800000 >> 16)
/* 2BE3C 8003B63C 1800028E */  lw         $v0, 0x18($s0)
/* 2BE40 8003B640 00000000 */  nop
/* 2BE44 8003B644 24104300 */  and        $v0, $v0, $v1
/* 2BE48 8003B648 0A004010 */  beqz       $v0, .L8003B674
/* 2BE4C 8003B64C 21200002 */   addu      $a0, $s0, $zero
.L8003B650:
/* 2BE50 8003B650 21200002 */  addu       $a0, $s0, $zero
/* 2BE54 8003B654 21282002 */  addu       $a1, $s1, $zero
/* 2BE58 8003B658 21306002 */  addu       $a2, $s3, $zero
/* 2BE5C 8003B65C 21384002 */  addu       $a3, $s2, $zero
/* 2BE60 8003B660 1000B4AF */  sw         $s4, 0x10($sp)
/* 2BE64 8003B664 2FEC000C */  jal        PIPE3D_InstanceTransformAndDraw
/* 2BE68 8003B668 1400A0AF */   sw        $zero, 0x14($sp)
/* 2BE6C 8003B66C A3ED0008 */  j          .L8003B68C
/* 2BE70 8003B670 00000000 */   nop
.L8003B674:
/* 2BE74 8003B674 21306002 */  addu       $a2, $s3, $zero
/* 2BE78 8003B678 1000B4AF */  sw         $s4, 0x10($sp)
/* 2BE7C 8003B67C 1400A0AF */  sw         $zero, 0x14($sp)
/* 2BE80 8003B680 6000258E */  lw         $a1, 0x60($s1)
/* 2BE84 8003B684 18F1000C */  jal        PIPE3D_HalvePlaneInstanceTransformAndDraw
/* 2BE88 8003B688 21384002 */   addu      $a3, $s2, $zero
.L8003B68C:
/* 2BE8C 8003B68C 1800028E */  lw         $v0, 0x18($s0)
/* 2BE90 8003B690 00000000 */  nop
/* 2BE94 8003B694 40004230 */  andi       $v0, $v0, 0x40
/* 2BE98 8003B698 05004010 */  beqz       $v0, .L8003B6B0
/* 2BE9C 8003B69C 21280002 */   addu      $a1, $s0, $zero
/* 2BEA0 8003B6A0 6000248E */  lw         $a0, 0x60($s1)
/* 2BEA4 8003B6A4 21304002 */  addu       $a2, $s2, $zero
/* 2BEA8 8003B6A8 F2DA000C */  jal        LIGHT_DrawShadow
/* 2BEAC 8003B6AC 21388002 */   addu      $a3, $s4, $zero
.L8003B6B0:
/* 2BEB0 8003B6B0 1401028E */  lw         $v0, 0x114($s0)
/* 2BEB4 8003B6B4 00000000 */  nop
/* 2BEB8 8003B6B8 08004010 */  beqz       $v0, .L8003B6DC
/* 2BEBC 8003B6BC 21280002 */   addu      $a1, $s0, $zero
/* 2BEC0 8003B6C0 21306002 */  addu       $a2, $s3, $zero
/* 2BEC4 8003B6C4 1000B4AF */  sw         $s4, 0x10($sp)
/* 2BEC8 8003B6C8 6000248E */  lw         $a0, 0x60($s1)
/* 2BECC 8003B6CC 1401028E */  lw         $v0, 0x114($s0)
/* 2BED0 8003B6D0 00000000 */  nop
/* 2BED4 8003B6D4 09F84000 */  jalr       $v0
/* 2BED8 8003B6D8 21384002 */   addu      $a3, $s2, $zero
.L8003B6DC:
/* 2BEDC 8003B6DC 24C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x25C)($gp)
/* 2BEE0 8003B6E0 00000000 */  nop
/* 2BEE4 8003B6E4 01004224 */  addiu      $v0, $v0, 0x1
/* 2BEE8 8003B6E8 24C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x25C)($gp)
/* 2BEEC 8003B6EC 1400028E */  lw         $v0, 0x14($s0)
/* 2BEF0 8003B6F0 C1ED0008 */  j          .L8003B704
/* 2BEF4 8003B6F4 00024234 */   ori       $v0, $v0, 0x200
.L8003B6F8:
/* 2BEF8 8003B6F8 1400028E */  lw         $v0, 0x14($s0)
/* 2BEFC 8003B6FC FFFD0324 */  addiu      $v1, $zero, -0x201
/* 2BF00 8003B700 24104300 */  and        $v0, $v0, $v1
.L8003B704:
/* 2BF04 8003B704 140002AE */  sw         $v0, 0x14($s0)
/* 2BF08 8003B708 5800BF8F */  lw         $ra, 0x58($sp)
/* 2BF0C 8003B70C 5400B58F */  lw         $s5, 0x54($sp)
/* 2BF10 8003B710 5000B48F */  lw         $s4, 0x50($sp)
/* 2BF14 8003B714 4C00B38F */  lw         $s3, 0x4C($sp)
/* 2BF18 8003B718 4800B28F */  lw         $s2, 0x48($sp)
/* 2BF1C 8003B71C 4400B18F */  lw         $s1, 0x44($sp)
/* 2BF20 8003B720 4000B08F */  lw         $s0, 0x40($sp)
/* 2BF24 8003B724 0800E003 */  jr         $ra
/* 2BF28 8003B728 6000BD27 */   addiu     $sp, $sp, 0x60
.size PIPE3D_InstanceListTransformAndDrawFunc, . - PIPE3D_InstanceListTransformAndDrawFunc
