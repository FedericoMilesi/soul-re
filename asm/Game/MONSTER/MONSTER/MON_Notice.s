.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Notice
/* 7BF98 8008B798 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7BF9C 8008B79C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7BFA0 8008B7A0 21888000 */  addu       $s1, $a0, $zero
/* 7BFA4 8008B7A4 1800BFAF */  sw         $ra, 0x18($sp)
/* 7BFA8 8008B7A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 7BFAC 8008B7AC 1800228E */  lw         $v0, 0x18($s1)
/* 7BFB0 8008B7B0 6C01308E */  lw         $s0, 0x16C($s1)
/* 7BFB4 8008B7B4 10004230 */  andi       $v0, $v0, 0x10
/* 7BFB8 8008B7B8 0A004010 */  beqz       $v0, .L8008B7E4
/* 7BFBC 8008B7BC 08000224 */   addiu     $v0, $zero, 0x8
/* 7BFC0 8008B7C0 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7BFC4 8008B7C4 00000000 */  nop
/* 7BFC8 8008B7C8 03006214 */  bne        $v1, $v0, .L8008B7D8
/* 7BFCC 8008B7CC 0D000524 */   addiu     $a1, $zero, 0xD
/* 7BFD0 8008B7D0 F72D0208 */  j          .L8008B7DC
/* 7BFD4 8008B7D4 14000524 */   addiu     $a1, $zero, 0x14
.L8008B7D8:
/* 7BFD8 8008B7D8 21202002 */  addu       $a0, $s1, $zero
.L8008B7DC:
/* 7BFDC 8008B7DC 91FE010C */  jal        MON_SwitchState
/* 7BFE0 8008B7E0 00000000 */   nop
.L8008B7E4:
/* 7BFE4 8008B7E4 C400028E */  lw         $v0, 0xC4($s0)
/* 7BFE8 8008B7E8 00000000 */  nop
/* 7BFEC 8008B7EC 0B004010 */  beqz       $v0, .L8008B81C
/* 7BFF0 8008B7F0 21202002 */   addu      $a0, $s1, $zero
/* 7BFF4 8008B7F4 0400428C */  lw         $v0, 0x4($v0)
/* 7BFF8 8008B7F8 00000000 */  nop
/* 7BFFC 8008B7FC 5C004224 */  addiu      $v0, $v0, 0x5C
/* 7C000 8008B800 200102AE */  sw         $v0, 0x120($s0)
/* 7C004 8008B804 C400028E */  lw         $v0, 0xC4($s0)
/* 7C008 8008B808 6801038E */  lw         $v1, 0x168($s0)
/* 7C00C 8008B80C 0400458C */  lw         $a1, 0x4($v0)
/* 7C010 8008B810 1C006684 */  lh         $a2, 0x1C($v1)
/* 7C014 8008B814 6604020C */  jal        MON_TurnToPosition
/* 7C018 8008B818 5C00A524 */   addiu     $a1, $a1, 0x5C
.L8008B81C:
/* 7C01C 8008B81C 0917020C */  jal        MON_DefaultQueueHandler
/* 7C020 8008B820 21202002 */   addu      $a0, $s1, $zero
/* 7C024 8008B824 1800BF8F */  lw         $ra, 0x18($sp)
/* 7C028 8008B828 1400B18F */  lw         $s1, 0x14($sp)
/* 7C02C 8008B82C 1000B08F */  lw         $s0, 0x10($sp)
/* 7C030 8008B830 0800E003 */  jr         $ra
/* 7C034 8008B834 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_Notice, . - MON_Notice
