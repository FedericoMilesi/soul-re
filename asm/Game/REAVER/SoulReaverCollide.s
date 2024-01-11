.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverCollide
/* 6A890 8007A090 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6A894 8007A094 2000B2AF */  sw         $s2, 0x20($sp)
/* 6A898 8007A098 21908000 */  addu       $s2, $a0, $zero
/* 6A89C 8007A09C 2800BFAF */  sw         $ra, 0x28($sp)
/* 6A8A0 8007A0A0 2400B3AF */  sw         $s3, 0x24($sp)
/* 6A8A4 8007A0A4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6A8A8 8007A0A8 1800B0AF */  sw         $s0, 0x18($sp)
/* 6A8AC 8007A0AC C000508E */  lw         $s0, 0xC0($s2)
/* 6A8B0 8007A0B0 00000000 */  nop
/* 6A8B4 8007A0B4 0400028E */  lw         $v0, 0x4($s0)
/* 6A8B8 8007A0B8 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* 6A8BC 8007A0BC 24104300 */  and        $v0, $v0, $v1
/* 6A8C0 8007A0C0 0101033C */  lui        $v1, (0x1010000 >> 16)
/* 6A8C4 8007A0C4 3A004314 */  bne        $v0, $v1, .L8007A1B0
/* 6A8C8 8007A0C8 00000000 */   nop
/* 6A8CC 8007A0CC 0800028E */  lw         $v0, 0x8($s0)
/* 6A8D0 8007A0D0 00000000 */  nop
/* 6A8D4 8007A0D4 04004390 */  lbu        $v1, 0x4($v0)
/* 6A8D8 8007A0D8 09000224 */  addiu      $v0, $zero, 0x9
/* 6A8DC 8007A0DC 34006214 */  bne        $v1, $v0, .L8007A1B0
/* 6A8E0 8007A0E0 00000000 */   nop
/* 6A8E4 8007A0E4 0C00028E */  lw         $v0, 0xC($s0)
/* 6A8E8 8007A0E8 00000000 */  nop
/* 6A8EC 8007A0EC 04004390 */  lbu        $v1, 0x4($v0)
/* 6A8F0 8007A0F0 08000224 */  addiu      $v0, $zero, 0x8
/* 6A8F4 8007A0F4 2E006214 */  bne        $v1, $v0, .L8007A1B0
/* 6A8F8 8007A0F8 00000000 */   nop
/* 6A8FC 8007A0FC 1400138E */  lw         $s3, 0x14($s0)
/* 6A900 8007A100 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 6A904 8007A104 21280000 */   addu      $a1, $zero, $zero
/* 6A908 8007A108 6C01428E */  lw         $v0, 0x16C($s2)
/* 6A90C 8007A10C 00000000 */  nop
/* 6A910 8007A110 04004384 */  lh         $v1, 0x4($v0)
/* 6A914 8007A114 00000000 */  nop
/* 6A918 8007A118 0B006018 */  blez       $v1, .L8007A148
/* 6A91C 8007A11C 21880000 */   addu      $s1, $zero, $zero
/* 6A920 8007A120 03006228 */  slti       $v0, $v1, 0x3
/* 6A924 8007A124 05004014 */  bnez       $v0, .L8007A13C
/* 6A928 8007A128 06000224 */   addiu     $v0, $zero, 0x6
/* 6A92C 8007A12C 05006210 */  beq        $v1, $v0, .L8007A144
/* 6A930 8007A130 00000000 */   nop
/* 6A934 8007A134 52E80108 */  j          .L8007A148
/* 6A938 8007A138 00000000 */   nop
.L8007A13C:
/* 6A93C 8007A13C 52E80108 */  j          .L8007A148
/* 6A940 8007A140 00101124 */   addiu     $s1, $zero, 0x1000
.L8007A144:
/* 6A944 8007A144 20001124 */  addiu      $s1, $zero, 0x20
.L8007A148:
/* 6A948 8007A148 4801428E */  lw         $v0, 0x148($s2)
/* 6A94C 8007A14C 00000000 */  nop
/* 6A950 8007A150 17004010 */  beqz       $v0, .L8007A1B0
/* 6A954 8007A154 21204002 */   addu      $a0, $s2, $zero
/* 6A958 8007A158 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* 6A95C 8007A15C 21280000 */   addu      $a1, $zero, $zero
/* 6A960 8007A160 21286002 */  addu       $a1, $s3, $zero
/* 6A964 8007A164 21302002 */  addu       $a2, $s1, $zero
/* 6A968 8007A168 1000A0AF */  sw         $zero, 0x10($sp)
/* 6A96C 8007A16C 4801448E */  lw         $a0, 0x148($s2)
/* 6A970 8007A170 95C3010C */  jal        SetMonsterHitData
/* 6A974 8007A174 21380000 */   addu      $a3, $zero, $zero
/* 6A978 8007A178 0001053C */  lui        $a1, (0x100001F >> 16)
/* 6A97C 8007A17C 1F00A534 */  ori        $a1, $a1, (0x100001F & 0xFFFF)
/* 6A980 8007A180 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6A984 8007A184 A1D1000C */  jal        INSTANCE_Post
/* 6A988 8007A188 21304000 */   addu      $a2, $v0, $zero
/* 6A98C 8007A18C 21204002 */  addu       $a0, $s2, $zero
/* 6A990 8007A190 32000624 */  addiu      $a2, $zero, 0x32
/* 6A994 8007A194 05000592 */  lbu        $a1, 0x5($s0)
/* 6A998 8007A198 7FC5010C */  jal        SetFXHitData
/* 6A99C 8007A19C 21382002 */   addu      $a3, $s1, $zero
/* 6A9A0 8007A1A0 21206002 */  addu       $a0, $s3, $zero
/* 6A9A4 8007A1A4 4000053C */  lui        $a1, (0x400000 >> 16)
/* 6A9A8 8007A1A8 A1D1000C */  jal        INSTANCE_Post
/* 6A9AC 8007A1AC 21304000 */   addu      $a2, $v0, $zero
.L8007A1B0:
/* 6A9B0 8007A1B0 07000392 */  lbu        $v1, 0x7($s0)
/* 6A9B4 8007A1B4 03000224 */  addiu      $v0, $zero, 0x3
/* 6A9B8 8007A1B8 08006210 */  beq        $v1, $v0, .L8007A1DC
/* 6A9BC 8007A1BC 21200002 */   addu      $a0, $s0, $zero
/* 6A9C0 8007A1C0 1400038E */  lw         $v1, 0x14($s0)
/* 6A9C4 8007A1C4 00000000 */  nop
/* 6A9C8 8007A1C8 1400628C */  lw         $v0, 0x14($v1)
/* 6A9CC 8007A1CC 00000000 */  nop
/* 6A9D0 8007A1D0 04004234 */  ori        $v0, $v0, 0x4
/* 6A9D4 8007A1D4 79E80108 */  j          .L8007A1E4
/* 6A9D8 8007A1D8 140062AC */   sw        $v0, 0x14($v1)
.L8007A1DC:
/* 6A9DC 8007A1DC 8A93000C */  jal        COLLIDE_SetBSPTreeFlag
/* 6A9E0 8007A1E0 00080524 */   addiu     $a1, $zero, 0x800
.L8007A1E4:
/* 6A9E4 8007A1E4 2800BF8F */  lw         $ra, 0x28($sp)
/* 6A9E8 8007A1E8 2400B38F */  lw         $s3, 0x24($sp)
/* 6A9EC 8007A1EC 2000B28F */  lw         $s2, 0x20($sp)
/* 6A9F0 8007A1F0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6A9F4 8007A1F4 1800B08F */  lw         $s0, 0x18($sp)
/* 6A9F8 8007A1F8 0800E003 */  jr         $ra
/* 6A9FC 8007A1FC 3000BD27 */   addiu     $sp, $sp, 0x30
.size SoulReaverCollide, . - SoulReaverCollide
