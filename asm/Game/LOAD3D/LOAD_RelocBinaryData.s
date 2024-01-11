.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_RelocBinaryData
/* 28998 80038198 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 2899C 8003819C 1800B0AF */  sw         $s0, 0x18($sp)
/* 289A0 800381A0 21808000 */  addu       $s0, $a0, $zero
/* 289A4 800381A4 1000A427 */  addiu      $a0, $sp, 0x10
/* 289A8 800381A8 04000226 */  addiu      $v0, $s0, 0x4
/* 289AC 800381AC 0300A524 */  addiu      $a1, $a1, 0x3
/* 289B0 800381B0 2800BFAF */  sw         $ra, 0x28($sp)
/* 289B4 800381B4 2400B3AF */  sw         $s3, 0x24($sp)
/* 289B8 800381B8 2000B2AF */  sw         $s2, 0x20($sp)
/* 289BC 800381BC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 289C0 800381C0 040082AC */  sw         $v0, 0x4($a0)
/* 289C4 800381C4 0000038E */  lw         $v1, 0x0($s0)
/* 289C8 800381C8 83880500 */  sra        $s1, $a1, 2
/* 289CC 800381CC 00026224 */  addiu      $v0, $v1, 0x200
/* 289D0 800381D0 02004104 */  bgez       $v0, .L800381DC
/* 289D4 800381D4 1000A3AF */   sw        $v1, 0x10($sp)
/* 289D8 800381D8 FF036224 */  addiu      $v0, $v1, 0x3FF
.L800381DC:
/* 289DC 800381DC 43120200 */  sra        $v0, $v0, 9
/* 289E0 800381E0 409A0200 */  sll        $s3, $v0, 9
/* 289E4 800381E4 C0920200 */  sll        $s2, $v0, 11
/* 289E8 800381E8 21281202 */  addu       $a1, $s0, $s2
/* 289EC 800381EC 21F3000C */  jal        RESOLVE_Pointers
/* 289F0 800381F0 21300002 */   addu      $a2, $s0, $zero
/* 289F4 800381F4 23103302 */  subu       $v0, $s1, $s3
/* 289F8 800381F8 80100200 */  sll        $v0, $v0, 2
/* 289FC 800381FC 21180202 */  addu       $v1, $s0, $v0
/* 28A00 80038200 2B100302 */  sltu       $v0, $s0, $v1
/* 28A04 80038204 0B004010 */  beqz       $v0, .L80038234
/* 28A08 80038208 80101300 */   sll       $v0, $s3, 2
/* 28A0C 8003820C 21204002 */  addu       $a0, $s2, $zero
/* 28A10 80038210 21109000 */  addu       $v0, $a0, $s0
.L80038214:
/* 28A14 80038214 0000428C */  lw         $v0, 0x0($v0)
/* 28A18 80038218 00000000 */  nop
/* 28A1C 8003821C 000002AE */  sw         $v0, 0x0($s0)
/* 28A20 80038220 04001026 */  addiu      $s0, $s0, 0x4
/* 28A24 80038224 2B100302 */  sltu       $v0, $s0, $v1
/* 28A28 80038228 FAFF4014 */  bnez       $v0, .L80038214
/* 28A2C 8003822C 21109000 */   addu      $v0, $a0, $s0
/* 28A30 80038230 80101300 */  sll        $v0, $s3, 2
.L80038234:
/* 28A34 80038234 2800BF8F */  lw         $ra, 0x28($sp)
/* 28A38 80038238 2400B38F */  lw         $s3, 0x24($sp)
/* 28A3C 8003823C 2000B28F */  lw         $s2, 0x20($sp)
/* 28A40 80038240 1C00B18F */  lw         $s1, 0x1C($sp)
/* 28A44 80038244 1800B08F */  lw         $s0, 0x18($sp)
/* 28A48 80038248 0800E003 */  jr         $ra
/* 28A4C 8003824C 3000BD27 */   addiu     $sp, $sp, 0x30
.size LOAD_RelocBinaryData, . - LOAD_RelocBinaryData
