.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsDropOffData
/* 61AD0 800712D0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61AD4 800712D4 1400B1AF */  sw         $s1, 0x14($sp)
/* 61AD8 800712D8 21888000 */  addu       $s1, $a0, $zero
/* 61ADC 800712DC 1800B2AF */  sw         $s2, 0x18($sp)
/* 61AE0 800712E0 2190A000 */  addu       $s2, $a1, $zero
/* 61AE4 800712E4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61AE8 800712E8 2198C000 */  addu       $s3, $a2, $zero
/* 61AEC 800712EC 2000B4AF */  sw         $s4, 0x20($sp)
/* 61AF0 800712F0 21A0E000 */  addu       $s4, $a3, $zero
/* 61AF4 800712F4 1000B0AF */  sw         $s0, 0x10($sp)
/* 61AF8 800712F8 3800B08F */  lw         $s0, 0x38($sp)
/* 61AFC 800712FC 2400BFAF */  sw         $ra, 0x24($sp)
/* 61B00 80071300 6DC3010C */  jal        CIRC_Alloc
/* 61B04 80071304 0C000424 */   addiu     $a0, $zero, 0xC
/* 61B08 80071308 000051A4 */  sh         $s1, 0x0($v0)
/* 61B0C 8007130C 020052A4 */  sh         $s2, 0x2($v0)
/* 61B10 80071310 040053A4 */  sh         $s3, 0x4($v0)
/* 61B14 80071314 060054A4 */  sh         $s4, 0x6($v0)
/* 61B18 80071318 080050AC */  sw         $s0, 0x8($v0)
/* 61B1C 8007131C 2400BF8F */  lw         $ra, 0x24($sp)
/* 61B20 80071320 2000B48F */  lw         $s4, 0x20($sp)
/* 61B24 80071324 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61B28 80071328 1800B28F */  lw         $s2, 0x18($sp)
/* 61B2C 8007132C 1400B18F */  lw         $s1, 0x14($sp)
/* 61B30 80071330 1000B08F */  lw         $s0, 0x10($sp)
/* 61B34 80071334 0800E003 */  jr         $ra
/* 61B38 80071338 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetPhysicsDropOffData, . - SetPhysicsDropOffData
