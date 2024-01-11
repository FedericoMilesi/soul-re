.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetTorchParticle
/* 397C4 80048FC4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 397C8 80048FC8 1400B1AF */  sw         $s1, 0x14($sp)
/* 397CC 80048FCC 21888000 */  addu       $s1, $a0, $zero
/* 397D0 80048FD0 002C0500 */  sll        $a1, $a1, 16
/* 397D4 80048FD4 032C0500 */  sra        $a1, $a1, 16
/* 397D8 80048FD8 1800B2AF */  sw         $s2, 0x18($sp)
/* 397DC 80048FDC 2190C000 */  addu       $s2, $a2, $zero
/* 397E0 80048FE0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 397E4 80048FE4 2198E000 */  addu       $s3, $a3, $zero
/* 397E8 80048FE8 2000BFAF */  sw         $ra, 0x20($sp)
/* 397EC 80048FEC DC09010C */  jal        FX_GetParticle
/* 397F0 80048FF0 1000B0AF */   sw        $s0, 0x10($sp)
/* 397F4 80048FF4 21804000 */  addu       $s0, $v0, $zero
/* 397F8 80048FF8 23000012 */  beqz       $s0, .L80049088
/* 397FC 80048FFC 01000524 */   addiu     $a1, $zero, 0x1
/* 39800 80049000 2110A000 */  addu       $v0, $a1, $zero
/* 39804 80049004 0D0002A2 */  sb         $v0, 0xD($s0)
/* 39808 80049008 0580023C */  lui        $v0, %hi(FX_FlamePrimProcess)
/* 3980C 8004900C 9C874224 */  addiu      $v0, $v0, %lo(FX_FlamePrimProcess)
/* 39810 80049010 180002AE */  sw         $v0, 0x18($s0)
/* 39814 80049014 1C00248E */  lw         $a0, 0x1C($s1)
/* 39818 80049018 9D19010C */  jal        FX_GetTextureObject
/* 3981C 8004901C 21304002 */   addu      $a2, $s2, $zero
/* 39820 80049020 0002033C */  lui        $v1, (0x20040F0 >> 16)
/* 39824 80049024 F0406334 */  ori        $v1, $v1, (0x20040F0 & 0xFFFF)
/* 39828 80049028 3C0003AE */  sw         $v1, 0x3C($s0)
/* 3982C 8004902C 2A000396 */  lhu        $v1, 0x2A($s0)
/* 39830 80049030 21200002 */  addu       $a0, $s0, $zero
/* 39834 80049034 100002AE */  sw         $v0, 0x10($s0)
/* 39838 80049038 10000224 */  addiu      $v0, $zero, 0x10
/* 3983C 8004903C 1E0002A6 */  sh         $v0, 0x1E($s0)
/* 39840 80049040 01000224 */  addiu      $v0, $zero, 0x1
/* 39844 80049044 300002A6 */  sh         $v0, 0x30($s0)
/* 39848 80049048 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 3984C 8004904C 0E0002A6 */  sh         $v0, 0xE($s0)
/* 39850 80049050 05000224 */  addiu      $v0, $zero, 0x5
/* 39854 80049054 480002A6 */  sh         $v0, 0x48($s0)
/* 39858 80049058 4A0002A6 */  sh         $v0, 0x4A($s0)
/* 3985C 8004905C 30000224 */  addiu      $v0, $zero, 0x30
/* 39860 80049060 1C0002A6 */  sh         $v0, 0x1C($s0)
/* 39864 80049064 64000224 */  addiu      $v0, $zero, 0x64
/* 39868 80049068 400000AE */  sw         $zero, 0x40($s0)
/* 3986C 8004906C 220002A6 */  sh         $v0, 0x22($s0)
/* 39870 80049070 200013A6 */  sh         $s3, 0x20($s0)
/* 39874 80049074 3800A28F */  lw         $v0, 0x38($sp)
/* 39878 80049078 01006334 */  ori        $v1, $v1, 0x1
/* 3987C 8004907C 460002A2 */  sb         $v0, 0x46($s0)
/* 39880 80049080 1B2D010C */  jal        FX_InsertGeneralEffect
/* 39884 80049084 2A0003A6 */   sh        $v1, 0x2A($s0)
.L80049088:
/* 39888 80049088 21100002 */  addu       $v0, $s0, $zero
/* 3988C 8004908C 2000BF8F */  lw         $ra, 0x20($sp)
/* 39890 80049090 1C00B38F */  lw         $s3, 0x1C($sp)
/* 39894 80049094 1800B28F */  lw         $s2, 0x18($sp)
/* 39898 80049098 1400B18F */  lw         $s1, 0x14($sp)
/* 3989C 8004909C 1000B08F */  lw         $s0, 0x10($sp)
/* 398A0 800490A0 0800E003 */  jr         $ra
/* 398A4 800490A4 2800BD27 */   addiu     $sp, $sp, 0x28
.size FX_GetTorchParticle, . - FX_GetTorchParticle
