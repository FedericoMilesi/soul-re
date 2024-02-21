.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_PackVRAMObject
/* 4CD6C 8005C56C 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 4CD70 8005C570 5C00B1AF */  sw         $s1, 0x5C($sp)
/* 4CD74 8005C574 21888000 */  addu       $s1, $a0, $zero
/* 4CD78 8005C578 6000BFAF */  sw         $ra, 0x60($sp)
/* 4CD7C 8005C57C 5800B0AF */  sw         $s0, 0x58($sp)
/* 4CD80 8005C580 1000228E */  lw         $v0, 0x10($s1)
/* 4CD84 8005C584 00000000 */  nop
/* 4CD88 8005C588 44004424 */  addiu      $a0, $v0, 0x44
/* 4CD8C 8005C58C 44004384 */  lh         $v1, 0x44($v0)
/* 4CD90 8005C590 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4CD94 8005C594 2F006210 */  beq        $v1, $v0, .L8005C654
/* 4CD98 8005C598 00000000 */   nop
/* 4CD9C 8005C59C C2D0010C */  jal        VRAM_GetObjectVramSpace
/* 4CDA0 8005C5A0 21282002 */   addu      $a1, $s1, $zero
/* 4CDA4 8005C5A4 2B004010 */  beqz       $v0, .L8005C654
/* 4CDA8 8005C5A8 00000000 */   nop
/* 4CDAC 8005C5AC 1800308E */  lw         $s0, 0x18($s1)
/* 4CDB0 8005C5B0 00000000 */  nop
/* 4CDB4 8005C5B4 07000012 */  beqz       $s0, .L8005C5D4
/* 4CDB8 8005C5B8 00020424 */   addiu     $a0, $zero, 0x200
/* 4CDBC 8005C5BC 0C000686 */  lh         $a2, 0xC($s0)
/* 4CDC0 8005C5C0 0E000786 */  lh         $a3, 0xE($s0)
/* 4CDC4 8005C5C4 1000228E */  lw         $v0, 0x10($s1)
/* 4CDC8 8005C5C8 21280000 */  addu       $a1, $zero, $zero
/* 4CDCC 8005C5CC 9CCE010C */  jal        AdjustVramCoordsObject
/* 4CDD0 8005C5D0 1000A2AF */   sw        $v0, 0x10($sp)
.L8005C5D4:
/* 4CDD4 8005C5D4 1800A427 */  addiu      $a0, $sp, 0x18
/* 4CDD8 8005C5D8 0D80053C */  lui        $a1, %hi(D_800D1928)
/* 4CDDC 8005C5DC 2819A524 */  addiu      $a1, $a1, %lo(D_800D1928)
/* 4CDE0 8005C5E0 21302002 */  addu       $a2, $s1, $zero
/* 4CDE4 8005C5E4 1AD1010C */  jal        sprintf
/* 4CDE8 8005C5E8 21382002 */   addu      $a3, $s1, $zero
/* 4CDEC 8005C5EC 10000486 */  lh         $a0, 0x10($s0)
/* 4CDF0 8005C5F0 23000524 */  addiu      $a1, $zero, 0x23
/* 4CDF4 8005C5F4 40200400 */  sll        $a0, $a0, 1
/* 4CDF8 8005C5F8 8140010C */  jal        MEMPACK_Malloc
/* 4CDFC 8005C5FC 14008424 */   addiu     $a0, $a0, 0x14
/* 4CE00 8005C600 14004324 */  addiu      $v1, $v0, 0x14
/* 4CE04 8005C604 1800A427 */  addiu      $a0, $sp, 0x18
/* 4CE08 8005C608 100043AC */  sw         $v1, 0x10($v0)
/* 4CE0C 8005C60C 000040AC */  sw         $zero, 0x0($v0)
/* 4CE10 8005C610 0C000396 */  lhu        $v1, 0xC($s0)
/* 4CE14 8005C614 0780053C */  lui        $a1, %hi(VRAM_TransferBufferToVram)
/* 4CE18 8005C618 040043A4 */  sh         $v1, 0x4($v0)
/* 4CE1C 8005C61C 0E000396 */  lhu        $v1, 0xE($s0)
/* 4CE20 8005C620 7040A524 */  addiu      $a1, $a1, %lo(VRAM_TransferBufferToVram)
/* 4CE24 8005C624 060043A4 */  sh         $v1, 0x6($v0)
/* 4CE28 8005C628 10000396 */  lhu        $v1, 0x10($s0)
/* 4CE2C 8005C62C 21304000 */  addu       $a2, $v0, $zero
/* 4CE30 8005C630 0800C3A4 */  sh         $v1, 0x8($a2)
/* 4CE34 8005C634 12000296 */  lhu        $v0, 0x12($s0)
/* 4CE38 8005C638 21382002 */  addu       $a3, $s1, $zero
/* 4CE3C 8005C63C 0C00C0A4 */  sh         $zero, 0xC($a2)
/* 4CE40 8005C640 0E00C0A4 */  sh         $zero, 0xE($a2)
/* 4CE44 8005C644 0B82010C */  jal        LOAD_NonBlockingBufferedLoad
/* 4CE48 8005C648 0A00C2A4 */   sh        $v0, 0xA($a2)
/* 4CE4C 8005C64C 96710108 */  j          .L8005C658
/* 4CE50 8005C650 00000000 */   nop
.L8005C654:
/* 4CE54 8005C654 180020AE */  sw         $zero, 0x18($s1)
.L8005C658:
/* 4CE58 8005C658 6000BF8F */  lw         $ra, 0x60($sp)
/* 4CE5C 8005C65C 5C00B18F */  lw         $s1, 0x5C($sp)
/* 4CE60 8005C660 5800B08F */  lw         $s0, 0x58($sp)
/* 4CE64 8005C664 0800E003 */  jr         $ra
/* 4CE68 8005C668 6800BD27 */   addiu     $sp, $sp, 0x68
.size STREAM_PackVRAMObject, . - STREAM_PackVRAMObject
