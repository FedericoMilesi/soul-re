.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel strcmpi
/* 65070 80074870 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 65074 80074874 1400B1AF */  sw         $s1, 0x14($sp)
/* 65078 80074878 21888000 */  addu       $s1, $a0, $zero
/* 6507C 8007487C 1800B2AF */  sw         $s2, 0x18($sp)
/* 65080 80074880 2190A000 */  addu       $s2, $a1, $zero
/* 65084 80074884 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 65088 80074888 1000B0AF */  sw         $s0, 0x10($sp)
.L8007488C:
/* 6508C 8007488C 00002492 */  lbu        $a0, 0x0($s1)
/* 65090 80074890 15D2010C */  jal        mytolower
/* 65094 80074894 01003126 */   addiu     $s1, $s1, 0x1
/* 65098 80074898 00004492 */  lbu        $a0, 0x0($s2)
/* 6509C 8007489C 01005226 */  addiu      $s2, $s2, 0x1
/* 650A0 800748A0 15D2010C */  jal        mytolower
/* 650A4 800748A4 21804000 */   addu      $s0, $v0, $zero
/* 650A8 800748A8 03000216 */  bne        $s0, $v0, .L800748B8
/* 650AC 800748AC 23100202 */   subu      $v0, $s0, $v0
/* 650B0 800748B0 F6FF0016 */  bnez       $s0, .L8007488C
/* 650B4 800748B4 21100000 */   addu      $v0, $zero, $zero
.L800748B8:
/* 650B8 800748B8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 650BC 800748BC 1800B28F */  lw         $s2, 0x18($sp)
/* 650C0 800748C0 1400B18F */  lw         $s1, 0x14($sp)
/* 650C4 800748C4 1000B08F */  lw         $s0, 0x10($sp)
/* 650C8 800748C8 0800E003 */  jr         $ra
/* 650CC 800748CC 2000BD27 */   addiu     $sp, $sp, 0x20
.size strcmpi, . - strcmpi
