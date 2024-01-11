.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsMoveLocalZClamp
/* 68064 80077864 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 68068 80077868 3400B3AF */  sw         $s3, 0x34($sp)
/* 6806C 8007786C 21988000 */  addu       $s3, $a0, $zero
/* 68070 80077870 2800B0AF */  sw         $s0, 0x28($sp)
/* 68074 80077874 2180A000 */  addu       $s0, $a1, $zero
/* 68078 80077878 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 6807C 8007787C 2188C000 */  addu       $s1, $a2, $zero
/* 68080 80077880 3000B2AF */  sw         $s2, 0x30($sp)
/* 68084 80077884 2190E000 */  addu       $s2, $a3, $zero
/* 68088 80077888 1000A427 */  addiu      $a0, $sp, 0x10
/* 6808C 8007788C 21280000 */  addu       $a1, $zero, $zero
/* 68090 80077890 3800BFAF */  sw         $ra, 0x38($sp)
/* 68094 80077894 2EF2020C */  jal        memset
/* 68098 80077898 06000624 */   addiu     $a2, $zero, 0x6
/* 6809C 8007789C 21206002 */  addu       $a0, $s3, $zero
/* 680A0 800778A0 1000A527 */  addiu      $a1, $sp, 0x10
/* 680A4 800778A4 4FDE010C */  jal        PhysicsMove
/* 680A8 800778A8 21302002 */   addu      $a2, $s1, $zero
/* 680AC 800778AC 1000A297 */  lhu        $v0, 0x10($sp)
/* 680B0 800778B0 1400A397 */  lhu        $v1, 0x14($sp)
/* 680B4 800778B4 1800A527 */  addiu      $a1, $sp, 0x18
/* 680B8 800778B8 1800A2A7 */  sh         $v0, 0x18($sp)
/* 680BC 800778BC 1200A297 */  lhu        $v0, 0x12($sp)
/* 680C0 800778C0 2000A627 */  addiu      $a2, $sp, 0x20
/* 680C4 800778C4 1C00A3A7 */  sh         $v1, 0x1C($sp)
/* 680C8 800778C8 23100200 */  negu       $v0, $v0
/* 680CC 800778CC 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 680D0 800778D0 4000648E */  lw         $a0, 0x40($s3)
/* 680D4 800778D4 40811000 */  sll        $s0, $s0, 5
/* 680D8 800778D8 0EF3020C */  jal        ApplyMatrixSV
/* 680DC 800778DC 21209000 */   addu      $a0, $a0, $s0
/* 680E0 800778E0 5C006296 */  lhu        $v0, 0x5C($s3)
/* 680E4 800778E4 2000A397 */  lhu        $v1, 0x20($sp)
/* 680E8 800778E8 00000000 */  nop
/* 680EC 800778EC 21104300 */  addu       $v0, $v0, $v1
/* 680F0 800778F0 5C0062A6 */  sh         $v0, 0x5C($s3)
/* 680F4 800778F4 5E006296 */  lhu        $v0, 0x5E($s3)
/* 680F8 800778F8 2200A397 */  lhu        $v1, 0x22($sp)
/* 680FC 800778FC 00000000 */  nop
/* 68100 80077900 21104300 */  addu       $v0, $v0, $v1
/* 68104 80077904 06004016 */  bnez       $s2, .L80077920
/* 68108 80077908 5E0062A6 */   sh        $v0, 0x5E($s3)
/* 6810C 8007790C 60006296 */  lhu        $v0, 0x60($s3)
/* 68110 80077910 2400A397 */  lhu        $v1, 0x24($sp)
/* 68114 80077914 00000000 */  nop
/* 68118 80077918 21104300 */  addu       $v0, $v0, $v1
/* 6811C 8007791C 600062A6 */  sh         $v0, 0x60($s3)
.L80077920:
/* 68120 80077920 3800BF8F */  lw         $ra, 0x38($sp)
/* 68124 80077924 3400B38F */  lw         $s3, 0x34($sp)
/* 68128 80077928 3000B28F */  lw         $s2, 0x30($sp)
/* 6812C 8007792C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 68130 80077930 2800B08F */  lw         $s0, 0x28($sp)
/* 68134 80077934 0800E003 */  jr         $ra
/* 68138 80077938 4000BD27 */   addiu     $sp, $sp, 0x40
.size PhysicsMoveLocalZClamp, . - PhysicsMoveLocalZClamp
