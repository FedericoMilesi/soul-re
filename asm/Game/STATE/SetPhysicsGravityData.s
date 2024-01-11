.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsGravityData
/* 6193C 8007113C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 61940 80071140 1000B0AF */  sw         $s0, 0x10($sp)
/* 61944 80071144 4000B08F */  lw         $s0, 0x40($sp)
/* 61948 80071148 1800B2AF */  sw         $s2, 0x18($sp)
/* 6194C 8007114C 21908000 */  addu       $s2, $a0, $zero
/* 61950 80071150 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61954 80071154 2198A000 */  addu       $s3, $a1, $zero
/* 61958 80071158 2000B4AF */  sw         $s4, 0x20($sp)
/* 6195C 8007115C 21A0C000 */  addu       $s4, $a2, $zero
/* 61960 80071160 2400B5AF */  sw         $s5, 0x24($sp)
/* 61964 80071164 21A8E000 */  addu       $s5, $a3, $zero
/* 61968 80071168 1400B1AF */  sw         $s1, 0x14($sp)
/* 6196C 8007116C 4400B18F */  lw         $s1, 0x44($sp)
/* 61970 80071170 2800BFAF */  sw         $ra, 0x28($sp)
/* 61974 80071174 6DC3010C */  jal        CIRC_Alloc
/* 61978 80071178 0C000424 */   addiu     $a0, $zero, 0xC
/* 6197C 8007117C 000052A4 */  sh         $s2, 0x0($v0)
/* 61980 80071180 020053A4 */  sh         $s3, 0x2($v0)
/* 61984 80071184 040054A4 */  sh         $s4, 0x4($v0)
/* 61988 80071188 060055A4 */  sh         $s5, 0x6($v0)
/* 6198C 8007118C 080050A4 */  sh         $s0, 0x8($v0)
/* 61990 80071190 0A0051A4 */  sh         $s1, 0xA($v0)
/* 61994 80071194 2800BF8F */  lw         $ra, 0x28($sp)
/* 61998 80071198 2400B58F */  lw         $s5, 0x24($sp)
/* 6199C 8007119C 2000B48F */  lw         $s4, 0x20($sp)
/* 619A0 800711A0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 619A4 800711A4 1800B28F */  lw         $s2, 0x18($sp)
/* 619A8 800711A8 1400B18F */  lw         $s1, 0x14($sp)
/* 619AC 800711AC 1000B08F */  lw         $s0, 0x10($sp)
/* 619B0 800711B0 0800E003 */  jr         $ra
/* 619B4 800711B4 3000BD27 */   addiu     $sp, $sp, 0x30
.size SetPhysicsGravityData, . - SetPhysicsGravityData
