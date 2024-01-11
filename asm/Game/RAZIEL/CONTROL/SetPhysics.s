.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysics
/* 8A938 8009A138 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8A93C 8009A13C 1800B0AF */  sw         $s0, 0x18($sp)
/* 8A940 8009A140 21808000 */  addu       $s0, $a0, $zero
/* 8A944 8009A144 00100224 */  addiu      $v0, $zero, 0x1000
/* 8A948 8009A148 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8A94C 8009A14C 2188C000 */  addu       $s1, $a2, $zero
/* 8A950 8009A150 2000B2AF */  sw         $s2, 0x20($sp)
/* 8A954 8009A154 2190E000 */  addu       $s2, $a3, $zero
/* 8A958 8009A158 003C0500 */  sll        $a3, $a1, 16
/* 8A95C 8009A15C 21280000 */  addu       $a1, $zero, $zero
/* 8A960 8009A160 2130A000 */  addu       $a2, $a1, $zero
/* 8A964 8009A164 2400B3AF */  sw         $s3, 0x24($sp)
/* 8A968 8009A168 4000B38F */  lw         $s3, 0x40($sp)
/* 8A96C 8009A16C F0F5848F */  lw         $a0, %gp_rel(ExternalForces)($gp)
/* 8A970 8009A170 033C0700 */  sra        $a3, $a3, 16
/* 8A974 8009A174 2800BFAF */  sw         $ra, 0x28($sp)
/* 8A978 8009A178 1000A0AF */  sw         $zero, 0x10($sp)
/* 8A97C 8009A17C 2E69020C */  jal        SetExternalForce
/* 8A980 8009A180 1400A2AF */   sw        $v0, 0x14($sp)
/* 8A984 8009A184 740111AE */  sw         $s1, 0x174($s0)
/* 8A988 8009A188 780112AE */  sw         $s2, 0x178($s0)
/* 8A98C 8009A18C 7C0113AE */  sw         $s3, 0x17C($s0)
/* 8A990 8009A190 2800BF8F */  lw         $ra, 0x28($sp)
/* 8A994 8009A194 2400B38F */  lw         $s3, 0x24($sp)
/* 8A998 8009A198 2000B28F */  lw         $s2, 0x20($sp)
/* 8A99C 8009A19C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8A9A0 8009A1A0 1800B08F */  lw         $s0, 0x18($sp)
/* 8A9A4 8009A1A4 0800E003 */  jr         $ra
/* 8A9A8 8009A1A8 3000BD27 */   addiu     $sp, $sp, 0x30
.size SetPhysics, . - SetPhysics
