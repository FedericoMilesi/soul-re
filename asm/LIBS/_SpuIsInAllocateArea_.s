.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SpuIsInAllocateArea_
/* B7370 800C6B70 0D80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
/* B7374 800C6B74 84ED428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
/* B7378 800C6B78 0D80033C */  lui        $v1, %hi(_spu_memList)
/* B737C 800C6B7C F4F4638C */  lw         $v1, %lo(_spu_memList)($v1)
/* B7380 800C6B80 00000000 */  nop
/* B7384 800C6B84 03006014 */  bnez       $v1, .L800C6B94
/* B7388 800C6B88 04204400 */   sllv      $a0, $a0, $v0
/* B738C 800C6B8C FD1A0308 */  j          .L800C6BF4
/* B7390 800C6B90 21100000 */   addu      $v0, $zero, $zero
.L800C6B94:
/* B7394 800C6B94 0080083C */  lui        $t0, (0x80000000 >> 16)
/* B7398 800C6B98 0040073C */  lui        $a3, (0x40000000 >> 16)
/* B739C 800C6B9C FF0F063C */  lui        $a2, (0xFFFFFFF >> 16)
/* B73A0 800C6BA0 FFFFC634 */  ori        $a2, $a2, (0xFFFFFFF & 0xFFFF)
/* B73A4 800C6BA4 21286000 */  addu       $a1, $v1, $zero
.L800C6BA8:
/* B73A8 800C6BA8 0000A38C */  lw         $v1, 0x0($a1)
/* B73AC 800C6BAC 00000000 */  nop
/* B73B0 800C6BB0 24106800 */  and        $v0, $v1, $t0
/* B73B4 800C6BB4 0C004014 */  bnez       $v0, .L800C6BE8
/* B73B8 800C6BB8 24106700 */   and       $v0, $v1, $a3
/* B73BC 800C6BBC 0C004014 */  bnez       $v0, .L800C6BF0
/* B73C0 800C6BC0 24186600 */   and       $v1, $v1, $a2
/* B73C4 800C6BC4 2B106400 */  sltu       $v0, $v1, $a0
/* B73C8 800C6BC8 0A004010 */  beqz       $v0, .L800C6BF4
/* B73CC 800C6BCC 01000224 */   addiu     $v0, $zero, 0x1
/* B73D0 800C6BD0 0400A28C */  lw         $v0, 0x4($a1)
/* B73D4 800C6BD4 00000000 */  nop
/* B73D8 800C6BD8 21106200 */  addu       $v0, $v1, $v0
/* B73DC 800C6BDC 2B108200 */  sltu       $v0, $a0, $v0
/* B73E0 800C6BE0 04004014 */  bnez       $v0, .L800C6BF4
/* B73E4 800C6BE4 01000224 */   addiu     $v0, $zero, 0x1
.L800C6BE8:
/* B73E8 800C6BE8 EA1A0308 */  j          .L800C6BA8
/* B73EC 800C6BEC 0800A524 */   addiu     $a1, $a1, 0x8
.L800C6BF0:
/* B73F0 800C6BF0 21100000 */  addu       $v0, $zero, $zero
.L800C6BF4:
/* B73F4 800C6BF4 0800E003 */  jr         $ra
/* B73F8 800C6BF8 00000000 */   nop
/* B73FC 800C6BFC 00000000 */  nop
.size _SpuIsInAllocateArea_, . - _SpuIsInAllocateArea_
