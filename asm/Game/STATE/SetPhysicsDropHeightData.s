.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetPhysicsDropHeightData
/* 61CC4 800714C4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 61CC8 800714C8 1000B0AF */  sw         $s0, 0x10($sp)
/* 61CCC 800714CC 21808000 */  addu       $s0, $a0, $zero
/* 61CD0 800714D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 61CD4 800714D4 2188A000 */  addu       $s1, $a1, $zero
/* 61CD8 800714D8 1800B2AF */  sw         $s2, 0x18($sp)
/* 61CDC 800714DC 2190C000 */  addu       $s2, $a2, $zero
/* 61CE0 800714E0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 61CE4 800714E4 6DC3010C */  jal        CIRC_Alloc
/* 61CE8 800714E8 14000424 */   addiu     $a0, $zero, 0x14
/* 61CEC 800714EC 080051A4 */  sh         $s1, 0x8($v0)
/* 61CF0 800714F0 060052A4 */  sh         $s2, 0x6($v0)
/* 61CF4 800714F4 00000396 */  lhu        $v1, 0x0($s0)
/* 61CF8 800714F8 00000000 */  nop
/* 61CFC 800714FC 000043A4 */  sh         $v1, 0x0($v0)
/* 61D00 80071500 02000396 */  lhu        $v1, 0x2($s0)
/* 61D04 80071504 00000000 */  nop
/* 61D08 80071508 020043A4 */  sh         $v1, 0x2($v0)
/* 61D0C 8007150C 04000396 */  lhu        $v1, 0x4($s0)
/* 61D10 80071510 00000000 */  nop
/* 61D14 80071514 19006324 */  addiu      $v1, $v1, 0x19
/* 61D18 80071518 040043A4 */  sh         $v1, 0x4($v0)
/* 61D1C 8007151C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 61D20 80071520 1800B28F */  lw         $s2, 0x18($sp)
/* 61D24 80071524 1400B18F */  lw         $s1, 0x14($sp)
/* 61D28 80071528 1000B08F */  lw         $s0, 0x10($sp)
/* 61D2C 8007152C 0800E003 */  jr         $ra
/* 61D30 80071530 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetPhysicsDropHeightData, . - SetPhysicsDropHeightData
