.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverScale
/* 96818 800A6018 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9681C 800A601C 1400B1AF */  sw         $s1, 0x14($sp)
/* 96820 800A6020 21888000 */  addu       $s1, $a0, $zero
/* 96824 800A6024 1800BFAF */  sw         $ra, 0x18($sp)
/* 96828 800A6028 2F97020C */  jal        razGetHeldWeapon
/* 9682C 800A602C 1000B0AF */   sw        $s0, 0x10($sp)
/* 96830 800A6030 60FA838F */  lw         $v1, %gp_rel(Raziel + 0x430)($gp)
/* 96834 800A6034 00000000 */  nop
/* 96838 800A6038 0C006010 */  beqz       $v1, .L800A606C
/* 9683C 800A603C 21804000 */   addu      $s0, $v0, $zero
/* 96840 800A6040 0A000316 */  bne        $s0, $v1, .L800A606C
/* 96844 800A6044 21200002 */   addu      $a0, $s0, $zero
/* 96848 800A6048 92D1000C */  jal        INSTANCE_Query
/* 9684C 800A604C 28000524 */   addiu     $a1, $zero, 0x28
/* 96850 800A6050 02004230 */  andi       $v0, $v0, 0x2
/* 96854 800A6054 05004010 */  beqz       $v0, .L800A606C
/* 96858 800A6058 21200002 */   addu      $a0, $s0, $zero
/* 9685C 800A605C 8000053C */  lui        $a1, (0x800107 >> 16)
/* 96860 800A6060 0701A534 */  ori        $a1, $a1, (0x800107 & 0xFFFF)
/* 96864 800A6064 A1D1000C */  jal        INSTANCE_Post
/* 96868 800A6068 21302002 */   addu      $a2, $s1, $zero
.L800A606C:
/* 9686C 800A606C 1800BF8F */  lw         $ra, 0x18($sp)
/* 96870 800A6070 1400B18F */  lw         $s1, 0x14($sp)
/* 96874 800A6074 1000B08F */  lw         $s0, 0x10($sp)
/* 96878 800A6078 0800E003 */  jr         $ra
/* 9687C 800A607C 2000BD27 */   addiu     $sp, $sp, 0x20
.size razReaverScale, . - razReaverScale
