.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_StartGenericBlastring
/* 3D5E8 8004CDE8 0D80023C */  lui        $v0, %hi(objectAccess + 0x54)
/* 3D5EC 8004CDEC 90A2438C */  lw         $v1, %lo(objectAccess + 0x54)($v0)
/* 3D5F0 8004CDF0 70FFBD27 */  addiu      $sp, $sp, -0x90
/* 3D5F4 8004CDF4 7C00B1AF */  sw         $s1, 0x7C($sp)
/* 3D5F8 8004CDF8 21888000 */  addu       $s1, $a0, $zero
/* 3D5FC 8004CDFC 8800BFAF */  sw         $ra, 0x88($sp)
/* 3D600 8004CE00 8400B3AF */  sw         $s3, 0x84($sp)
/* 3D604 8004CE04 8000B2AF */  sw         $s2, 0x80($sp)
/* 3D608 8004CE08 7800B0AF */  sw         $s0, 0x78($sp)
/* 3D60C 8004CE0C 71006010 */  beqz       $v1, .L8004CFD4
/* 3D610 8004CE10 21100000 */   addu      $v0, $zero, $zero
/* 3D614 8004CE14 40100500 */  sll        $v0, $a1, 1
/* 3D618 8004CE18 1C00638C */  lw         $v1, 0x1C($v1)
/* 3D61C 8004CE1C 21104500 */  addu       $v0, $v0, $a1
/* 3D620 8004CE20 1000638C */  lw         $v1, 0x10($v1)
/* 3D624 8004CE24 00110200 */  sll        $v0, $v0, 4
/* 3D628 8004CE28 21806200 */  addu       $s0, $v1, $v0
/* 3D62C 8004CE2C 01000282 */  lb         $v0, 0x1($s0)
/* 3D630 8004CE30 00000000 */  nop
/* 3D634 8004CE34 07004010 */  beqz       $v0, .L8004CE54
/* 3D638 8004CE38 00000000 */   nop
/* 3D63C 8004CE3C 4C01248E */  lw         $a0, 0x14C($s1)
/* 3D640 8004CE40 00000000 */  nop
/* 3D644 8004CE44 03008014 */  bnez       $a0, .L8004CE54
/* 3D648 8004CE48 21888000 */   addu      $s1, $a0, $zero
/* 3D64C 8004CE4C F5330108 */  j          .L8004CFD4
/* 3D650 8004CE50 21100000 */   addu      $v0, $zero, $zero
.L8004CE54:
/* 3D654 8004CE54 0200C014 */  bnez       $a2, .L8004CE60
/* 3D658 8004CE58 2190C000 */   addu      $s2, $a2, $zero
/* 3D65C 8004CE5C 0C001282 */  lb         $s2, 0xC($s0)
.L8004CE60:
/* 3D660 8004CE60 0200E014 */  bnez       $a3, .L8004CE6C
/* 3D664 8004CE64 2198E000 */   addu      $s3, $a3, $zero
/* 3D668 8004CE68 0A001386 */  lh         $s3, 0xA($s0)
.L8004CE6C:
/* 3D66C 8004CE6C 4CE8000C */  jal        MATH3D_SetUnityMatrix
/* 3D670 8004CE70 5800A427 */   addiu     $a0, $sp, 0x58
/* 3D674 8004CE74 4000238E */  lw         $v1, 0x40($s1)
/* 3D678 8004CE78 00000000 */  nop
/* 3D67C 8004CE7C 0B006010 */  beqz       $v1, .L8004CEAC
/* 3D680 8004CE80 40111200 */   sll       $v0, $s2, 5
/* 3D684 8004CE84 21106200 */  addu       $v0, $v1, $v0
/* 3D688 8004CE88 14004394 */  lhu        $v1, 0x14($v0)
/* 3D68C 8004CE8C 00000000 */  nop
/* 3D690 8004CE90 5000A3A7 */  sh         $v1, 0x50($sp)
/* 3D694 8004CE94 18004394 */  lhu        $v1, 0x18($v0)
/* 3D698 8004CE98 00000000 */  nop
/* 3D69C 8004CE9C 5200A3A7 */  sh         $v1, 0x52($sp)
/* 3D6A0 8004CEA0 1C004294 */  lhu        $v0, 0x1C($v0)
/* 3D6A4 8004CEA4 B4330108 */  j          .L8004CED0
/* 3D6A8 8004CEA8 5400A2A7 */   sh        $v0, 0x54($sp)
.L8004CEAC:
/* 3D6AC 8004CEAC 5C002296 */  lhu        $v0, 0x5C($s1)
/* 3D6B0 8004CEB0 00000000 */  nop
/* 3D6B4 8004CEB4 5000A2A7 */  sh         $v0, 0x50($sp)
/* 3D6B8 8004CEB8 5E002296 */  lhu        $v0, 0x5E($s1)
/* 3D6BC 8004CEBC 00000000 */  nop
/* 3D6C0 8004CEC0 5200A2A7 */  sh         $v0, 0x52($sp)
/* 3D6C4 8004CEC4 60002296 */  lhu        $v0, 0x60($s1)
/* 3D6C8 8004CEC8 00000000 */  nop
/* 3D6CC 8004CECC 5400A2A7 */  sh         $v0, 0x54($sp)
.L8004CED0:
/* 3D6D0 8004CED0 5000A297 */  lhu        $v0, 0x50($sp)
/* 3D6D4 8004CED4 04000396 */  lhu        $v1, 0x4($s0)
/* 3D6D8 8004CED8 00000000 */  nop
/* 3D6DC 8004CEDC 21104300 */  addu       $v0, $v0, $v1
/* 3D6E0 8004CEE0 5000A2A7 */  sh         $v0, 0x50($sp)
/* 3D6E4 8004CEE4 5200A297 */  lhu        $v0, 0x52($sp)
/* 3D6E8 8004CEE8 06000396 */  lhu        $v1, 0x6($s0)
/* 3D6EC 8004CEEC 00000000 */  nop
/* 3D6F0 8004CEF0 21104300 */  addu       $v0, $v0, $v1
/* 3D6F4 8004CEF4 5200A2A7 */  sh         $v0, 0x52($sp)
/* 3D6F8 8004CEF8 5400A297 */  lhu        $v0, 0x54($sp)
/* 3D6FC 8004CEFC 08000396 */  lhu        $v1, 0x8($s0)
/* 3D700 8004CF00 00000000 */  nop
/* 3D704 8004CF04 21104300 */  addu       $v0, $v0, $v1
/* 3D708 8004CF08 5400A2A7 */  sh         $v0, 0x54($sp)
/* 3D70C 8004CF0C 0E000286 */  lh         $v0, 0xE($s0)
/* 3D710 8004CF10 00000000 */  nop
/* 3D714 8004CF14 1000A2AF */  sw         $v0, 0x10($sp)
/* 3D718 8004CF18 14000286 */  lh         $v0, 0x14($s0)
/* 3D71C 8004CF1C 00000000 */  nop
/* 3D720 8004CF20 1400A2AF */  sw         $v0, 0x14($sp)
/* 3D724 8004CF24 16000286 */  lh         $v0, 0x16($s0)
/* 3D728 8004CF28 00000000 */  nop
/* 3D72C 8004CF2C 1800A2AF */  sw         $v0, 0x18($sp)
/* 3D730 8004CF30 10000286 */  lh         $v0, 0x10($s0)
/* 3D734 8004CF34 00000000 */  nop
/* 3D738 8004CF38 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3D73C 8004CF3C 12000286 */  lh         $v0, 0x12($s0)
/* 3D740 8004CF40 00000000 */  nop
/* 3D744 8004CF44 2000A2AF */  sw         $v0, 0x20($sp)
/* 3D748 8004CF48 1800028E */  lw         $v0, 0x18($s0)
/* 3D74C 8004CF4C 00000000 */  nop
/* 3D750 8004CF50 00130200 */  sll        $v0, $v0, 12
/* 3D754 8004CF54 2400A2AF */  sw         $v0, 0x24($sp)
/* 3D758 8004CF58 1C00028E */  lw         $v0, 0x1C($s0)
/* 3D75C 8004CF5C 00000000 */  nop
/* 3D760 8004CF60 2800A2AF */  sw         $v0, 0x28($sp)
/* 3D764 8004CF64 20000286 */  lh         $v0, 0x20($s0)
/* 3D768 8004CF68 00000000 */  nop
/* 3D76C 8004CF6C 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 3D770 8004CF70 22000286 */  lh         $v0, 0x22($s0)
/* 3D774 8004CF74 00000000 */  nop
/* 3D778 8004CF78 3000A2AF */  sw         $v0, 0x30($sp)
/* 3D77C 8004CF7C 24000286 */  lh         $v0, 0x24($s0)
/* 3D780 8004CF80 00000000 */  nop
/* 3D784 8004CF84 3400A2AF */  sw         $v0, 0x34($sp)
/* 3D788 8004CF88 2800028E */  lw         $v0, 0x28($s0)
/* 3D78C 8004CF8C 00000000 */  nop
/* 3D790 8004CF90 3800A2AF */  sw         $v0, 0x38($sp)
/* 3D794 8004CF94 2C00028E */  lw         $v0, 0x2C($s0)
/* 3D798 8004CF98 21202002 */  addu       $a0, $s1, $zero
/* 3D79C 8004CF9C 3C00A2AF */  sw         $v0, 0x3C($sp)
/* 3D7A0 8004CFA0 26000282 */  lb         $v0, 0x26($s0)
/* 3D7A4 8004CFA4 5000A527 */  addiu      $a1, $sp, 0x50
/* 3D7A8 8004CFA8 4000A2AF */  sw         $v0, 0x40($sp)
/* 3D7AC 8004CFAC 02000286 */  lh         $v0, 0x2($s0)
/* 3D7B0 8004CFB0 5800A627 */  addiu      $a2, $sp, 0x58
/* 3D7B4 8004CFB4 4400A2AF */  sw         $v0, 0x44($sp)
/* 3D7B8 8004CFB8 0D000282 */  lb         $v0, 0xD($s0)
/* 3D7BC 8004CFBC 21386002 */  addu       $a3, $s3, $zero
/* 3D7C0 8004CFC0 CE2F010C */  jal        FX_DoBlastRing
/* 3D7C4 8004CFC4 4800A2AF */   sw        $v0, 0x48($sp)
/* 3D7C8 8004CFC8 27000392 */  lbu        $v1, 0x27($s0)
/* 3D7CC 8004CFCC 00000000 */  nop
/* 3D7D0 8004CFD0 6A0043A0 */  sb         $v1, 0x6A($v0)
.L8004CFD4:
/* 3D7D4 8004CFD4 8800BF8F */  lw         $ra, 0x88($sp)
/* 3D7D8 8004CFD8 8400B38F */  lw         $s3, 0x84($sp)
/* 3D7DC 8004CFDC 8000B28F */  lw         $s2, 0x80($sp)
/* 3D7E0 8004CFE0 7C00B18F */  lw         $s1, 0x7C($sp)
/* 3D7E4 8004CFE4 7800B08F */  lw         $s0, 0x78($sp)
/* 3D7E8 8004CFE8 0800E003 */  jr         $ra
/* 3D7EC 8004CFEC 9000BD27 */   addiu     $sp, $sp, 0x90
.size FX_StartGenericBlastring, . - FX_StartGenericBlastring
