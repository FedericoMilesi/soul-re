.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel NextTimAddr
/* A99B0 800B91B0 0500E014 */  bnez       $a3, .L800B91C8
/* A99B4 800B91B4 1800A600 */   mult      $a1, $a2
/* A99B8 800B91B8 12180000 */  mflo       $v1
/* A99BC 800B91BC 43100300 */  sra        $v0, $v1, 1
/* A99C0 800B91C0 7BE40208 */  j          .L800B91EC
/* A99C4 800B91C4 2C004224 */   addiu     $v0, $v0, 0x2C
.L800B91C8:
/* A99C8 800B91C8 01000224 */  addiu      $v0, $zero, 0x1
/* A99CC 800B91CC 0500E214 */  bne        $a3, $v0, .L800B91E4
/* A99D0 800B91D0 00000000 */   nop
/* A99D4 800B91D4 1800A600 */  mult       $a1, $a2
/* A99D8 800B91D8 12180000 */  mflo       $v1
/* A99DC 800B91DC 7BE40208 */  j          .L800B91EC
/* A99E0 800B91E0 0C026224 */   addiu     $v0, $v1, 0x20C
.L800B91E4:
/* A99E4 800B91E4 12180000 */  mflo       $v1
/* A99E8 800B91E8 40100300 */  sll        $v0, $v1, 1
.L800B91EC:
/* A99EC 800B91EC 14004224 */  addiu      $v0, $v0, 0x14
/* A99F0 800B91F0 0800E003 */  jr         $ra
/* A99F4 800B91F4 21108200 */   addu      $v0, $a0, $v0
.size NextTimAddr, . - NextTimAddr
