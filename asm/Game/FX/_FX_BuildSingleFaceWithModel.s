.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _FX_BuildSingleFaceWithModel
/* 33524 80042D24 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 33528 80042D28 3000B0AF */  sw         $s0, 0x30($sp)
/* 3352C 80042D2C 7800B08F */  lw         $s0, 0x78($sp)
/* 33530 80042D30 3800B2AF */  sw         $s2, 0x38($sp)
/* 33534 80042D34 6C00B28F */  lw         $s2, 0x6C($sp)
/* 33538 80042D38 4400B5AF */  sw         $s5, 0x44($sp)
/* 3353C 80042D3C 7000B58F */  lw         $s5, 0x70($sp)
/* 33540 80042D40 4000B4AF */  sw         $s4, 0x40($sp)
/* 33544 80042D44 7C00B48F */  lw         $s4, 0x7C($sp)
/* 33548 80042D48 4800B6AF */  sw         $s6, 0x48($sp)
/* 3354C 80042D4C 21B0A000 */  addu       $s6, $a1, $zero
/* 33550 80042D50 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 33554 80042D54 21B8C000 */  addu       $s7, $a2, $zero
/* 33558 80042D58 5000BEAF */  sw         $fp, 0x50($sp)
/* 3355C 80042D5C 21F0E000 */  addu       $fp, $a3, $zero
/* 33560 80042D60 3400B1AF */  sw         $s1, 0x34($sp)
/* 33564 80042D64 5400BFAF */  sw         $ra, 0x54($sp)
/* 33568 80042D68 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 3356C 80042D6C 0400938C */  lw         $s3, 0x4($a0)
/* 33570 80042D70 06000016 */  bnez       $s0, .L80042D8C
/* 33574 80042D74 21880000 */   addu      $s1, $zero, $zero
/* 33578 80042D78 AC09010C */  jal        FX_GetMatrix
/* 3357C 80042D7C 21204002 */   addu      $a0, $s2, $zero
/* 33580 80042D80 21804000 */  addu       $s0, $v0, $zero
/* 33584 80042D84 1A000012 */  beqz       $s0, .L80042DF0
/* 33588 80042D88 21102002 */   addu      $v0, $s1, $zero
.L80042D8C:
/* 3358C 80042D8C C009010C */  jal        FX_GetPrim
/* 33590 80042D90 21204002 */   addu      $a0, $s2, $zero
/* 33594 80042D94 21884000 */  addu       $s1, $v0, $zero
/* 33598 80042D98 15002012 */  beqz       $s1, .L80042DF0
/* 3359C 80042D9C 21102002 */   addu      $v0, $s1, $zero
/* 335A0 80042DA0 0F00A012 */  beqz       $s5, .L80042DE0
/* 335A4 80042DA4 21202002 */   addu      $a0, $s1, $zero
/* 335A8 80042DA8 21300002 */  addu       $a2, $s0, $zero
/* 335AC 80042DAC 7400A58F */  lw         $a1, 0x74($sp)
/* 335B0 80042DB0 6800A28F */  lw         $v0, 0x68($sp)
/* 335B4 80042DB4 21380000 */  addu       $a3, $zero, $zero
/* 335B8 80042DB8 1000B6AF */  sw         $s6, 0x10($sp)
/* 335BC 80042DBC 1400B3AF */  sw         $s3, 0x14($sp)
/* 335C0 80042DC0 1800B7AF */  sw         $s7, 0x18($sp)
/* 335C4 80042DC4 1C00BEAF */  sw         $fp, 0x1C($sp)
/* 335C8 80042DC8 2400B2AF */  sw         $s2, 0x24($sp)
/* 335CC 80042DCC 2000A2AF */  sw         $v0, 0x20($sp)
/* 335D0 80042DD0 00141400 */  sll        $v0, $s4, 16
/* 335D4 80042DD4 03140200 */  sra        $v0, $v0, 16
/* 335D8 80042DD8 09F8A002 */  jalr       $s5
/* 335DC 80042DDC 2800A2AF */   sw        $v0, 0x28($sp)
.L80042DE0:
/* 335E0 80042DE0 906D4426 */  addiu      $a0, $s2, 0x6D90
/* 335E4 80042DE4 D53E010C */  jal        LIST_InsertFunc
/* 335E8 80042DE8 21282002 */   addu      $a1, $s1, $zero
/* 335EC 80042DEC 21102002 */  addu       $v0, $s1, $zero
.L80042DF0:
/* 335F0 80042DF0 5400BF8F */  lw         $ra, 0x54($sp)
/* 335F4 80042DF4 5000BE8F */  lw         $fp, 0x50($sp)
/* 335F8 80042DF8 4C00B78F */  lw         $s7, 0x4C($sp)
/* 335FC 80042DFC 4800B68F */  lw         $s6, 0x48($sp)
/* 33600 80042E00 4400B58F */  lw         $s5, 0x44($sp)
/* 33604 80042E04 4000B48F */  lw         $s4, 0x40($sp)
/* 33608 80042E08 3C00B38F */  lw         $s3, 0x3C($sp)
/* 3360C 80042E0C 3800B28F */  lw         $s2, 0x38($sp)
/* 33610 80042E10 3400B18F */  lw         $s1, 0x34($sp)
/* 33614 80042E14 3000B08F */  lw         $s0, 0x30($sp)
/* 33618 80042E18 0800E003 */  jr         $ra
/* 3361C 80042E1C 5800BD27 */   addiu     $sp, $sp, 0x58
.size _FX_BuildSingleFaceWithModel, . - _FX_BuildSingleFaceWithModel
