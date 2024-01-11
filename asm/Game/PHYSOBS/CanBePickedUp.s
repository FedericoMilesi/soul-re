.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CanBePickedUp
/* 5AE94 8006A694 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 5AE98 8006A698 5400B1AF */  sw         $s1, 0x54($sp)
/* 5AE9C 8006A69C 21888000 */  addu       $s1, $a0, $zero
/* 5AEA0 8006A6A0 5000B0AF */  sw         $s0, 0x50($sp)
/* 5AEA4 8006A6A4 2180A000 */  addu       $s0, $a1, $zero
/* 5AEA8 8006A6A8 5800B2AF */  sw         $s2, 0x58($sp)
/* 5AEAC 8006A6AC 2190C000 */  addu       $s2, $a2, $zero
/* 5AEB0 8006A6B0 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 5AEB4 8006A6B4 57000012 */  beqz       $s0, .L8006A814
/* 5AEB8 8006A6B8 21100000 */   addu      $v0, $zero, $zero
/* 5AEBC 8006A6BC 1C00028E */  lw         $v0, 0x1C($s0)
/* 5AEC0 8006A6C0 00000000 */  nop
/* 5AEC4 8006A6C4 2C00428C */  lw         $v0, 0x2C($v0)
/* 5AEC8 8006A6C8 0800033C */  lui        $v1, (0x80000 >> 16)
/* 5AECC 8006A6CC 24104300 */  and        $v0, $v0, $v1
/* 5AED0 8006A6D0 03004010 */  beqz       $v0, .L8006A6E0
/* 5AED4 8006A6D4 00000000 */   nop
.L8006A6D8:
/* 5AED8 8006A6D8 05AA0108 */  j          .L8006A814
/* 5AEDC 8006A6DC 01000224 */   addiu     $v0, $zero, 0x1
.L8006A6E0:
/* 5AEE0 8006A6E0 4000028E */  lw         $v0, 0x40($s0)
/* 5AEE4 8006A6E4 00000000 */  nop
/* 5AEE8 8006A6E8 FBFF4010 */  beqz       $v0, .L8006A6D8
/* 5AEEC 8006A6EC 21202002 */   addu      $a0, $s1, $zero
/* 5AEF0 8006A6F0 B0A3010C */  jal        CheckPhysObAbility
/* 5AEF4 8006A6F4 01000524 */   addiu     $a1, $zero, 0x1
/* 5AEF8 8006A6F8 46004010 */  beqz       $v0, .L8006A814
/* 5AEFC 8006A6FC 21100000 */   addu      $v0, $zero, $zero
/* 5AF00 8006A700 4000228E */  lw         $v0, 0x40($s1)
/* 5AF04 8006A704 00000000 */  nop
/* 5AF08 8006A708 F3FF4010 */  beqz       $v0, .L8006A6D8
/* 5AF0C 8006A70C 40191200 */   sll       $v1, $s2, 5
/* 5AF10 8006A710 54004294 */  lhu        $v0, 0x54($v0)
/* 5AF14 8006A714 00000000 */  nop
/* 5AF18 8006A718 4800A2A7 */  sh         $v0, 0x48($sp)
/* 5AF1C 8006A71C 4000228E */  lw         $v0, 0x40($s1)
/* 5AF20 8006A720 00000000 */  nop
/* 5AF24 8006A724 58004294 */  lhu        $v0, 0x58($v0)
/* 5AF28 8006A728 00000000 */  nop
/* 5AF2C 8006A72C 4A00A2A7 */  sh         $v0, 0x4A($sp)
/* 5AF30 8006A730 4000228E */  lw         $v0, 0x40($s1)
/* 5AF34 8006A734 00000000 */  nop
/* 5AF38 8006A738 5C004294 */  lhu        $v0, 0x5C($v0)
/* 5AF3C 8006A73C 00000000 */  nop
/* 5AF40 8006A740 4C00A2A7 */  sh         $v0, 0x4C($sp)
/* 5AF44 8006A744 4000028E */  lw         $v0, 0x40($s0)
/* 5AF48 8006A748 00000000 */  nop
/* 5AF4C 8006A74C 21106200 */  addu       $v0, $v1, $v0
/* 5AF50 8006A750 14004294 */  lhu        $v0, 0x14($v0)
/* 5AF54 8006A754 00000000 */  nop
/* 5AF58 8006A758 4000A2A7 */  sh         $v0, 0x40($sp)
/* 5AF5C 8006A75C 4000028E */  lw         $v0, 0x40($s0)
/* 5AF60 8006A760 00000000 */  nop
/* 5AF64 8006A764 21106200 */  addu       $v0, $v1, $v0
/* 5AF68 8006A768 18004294 */  lhu        $v0, 0x18($v0)
/* 5AF6C 8006A76C 21202002 */  addu       $a0, $s1, $zero
/* 5AF70 8006A770 4200A2A7 */  sh         $v0, 0x42($sp)
/* 5AF74 8006A774 4000028E */  lw         $v0, 0x40($s0)
/* 5AF78 8006A778 20000524 */  addiu      $a1, $zero, 0x20
/* 5AF7C 8006A77C 21186200 */  addu       $v1, $v1, $v0
/* 5AF80 8006A780 1C006394 */  lhu        $v1, 0x1C($v1)
/* 5AF84 8006A784 4000A227 */  addiu      $v0, $sp, 0x40
/* 5AF88 8006A788 2400A2AF */  sw         $v0, 0x24($sp)
/* 5AF8C 8006A78C 4800A227 */  addiu      $v0, $sp, 0x48
/* 5AF90 8006A790 2800A2AF */  sw         $v0, 0x28($sp)
/* 5AF94 8006A794 B0A3010C */  jal        CheckPhysObAbility
/* 5AF98 8006A798 4400A3A7 */   sh        $v1, 0x44($sp)
/* 5AF9C 8006A79C 08004010 */  beqz       $v0, .L8006A7C0
/* 5AFA0 8006A7A0 21202002 */   addu      $a0, $s1, $zero
/* 5AFA4 8006A7A4 4400A287 */  lh         $v0, 0x44($sp)
/* 5AFA8 8006A7A8 4C00A387 */  lh         $v1, 0x4C($sp)
/* 5AFAC 8006A7AC 00000000 */  nop
/* 5AFB0 8006A7B0 2A104300 */  slt        $v0, $v0, $v1
/* 5AFB4 8006A7B4 17004014 */  bnez       $v0, .L8006A814
/* 5AFB8 8006A7B8 01000224 */   addiu     $v0, $zero, 0x1
/* 5AFBC 8006A7BC 21202002 */  addu       $a0, $s1, $zero
.L8006A7C0:
/* 5AFC0 8006A7C0 59D2010C */  jal        PHYSICS_CheckLineInWorld
/* 5AFC4 8006A7C4 1000A527 */   addiu     $a1, $sp, 0x10
/* 5AFC8 8006A7C8 1000A297 */  lhu        $v0, 0x10($sp)
/* 5AFCC 8006A7CC 00000000 */  nop
/* 5AFD0 8006A7D0 0200422C */  sltiu      $v0, $v0, 0x2
/* 5AFD4 8006A7D4 C0FF4014 */  bnez       $v0, .L8006A6D8
/* 5AFD8 8006A7D8 00000000 */   nop
/* 5AFDC 8006A7DC 4000A287 */  lh         $v0, 0x40($sp)
/* 5AFE0 8006A7E0 4800A487 */  lh         $a0, 0x48($sp)
/* 5AFE4 8006A7E4 4200A387 */  lh         $v1, 0x42($sp)
/* 5AFE8 8006A7E8 4A00A587 */  lh         $a1, 0x4A($sp)
/* 5AFEC 8006A7EC 4C00A687 */  lh         $a2, 0x4C($sp)
/* 5AFF0 8006A7F0 23204400 */  subu       $a0, $v0, $a0
/* 5AFF4 8006A7F4 4400A287 */  lh         $v0, 0x44($sp)
/* 5AFF8 8006A7F8 23286500 */  subu       $a1, $v1, $a1
/* 5AFFC 8006A7FC B7E6000C */  jal        MATH3D_LengthXYZ
/* 5B000 8006A800 23304600 */   subu      $a2, $v0, $a2
/* 5B004 8006A804 15004328 */  slti       $v1, $v0, 0x15
/* 5B008 8006A808 02006010 */  beqz       $v1, .L8006A814
/* 5B00C 8006A80C 21100000 */   addu      $v0, $zero, $zero
/* 5B010 8006A810 01000224 */  addiu      $v0, $zero, 0x1
.L8006A814:
/* 5B014 8006A814 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 5B018 8006A818 5800B28F */  lw         $s2, 0x58($sp)
/* 5B01C 8006A81C 5400B18F */  lw         $s1, 0x54($sp)
/* 5B020 8006A820 5000B08F */  lw         $s0, 0x50($sp)
/* 5B024 8006A824 0800E003 */  jr         $ra
/* 5B028 8006A828 6000BD27 */   addiu     $sp, $sp, 0x60
.size CanBePickedUp, . - CanBePickedUp
