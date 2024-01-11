.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BCEA0
/* AD6A0 800BCEA0 00008890 */  lbu        $t0, 0x0($a0)
/* AD6A4 800BCEA4 01008990 */  lbu        $t1, 0x1($a0)
/* AD6A8 800BCEA8 02008A90 */  lbu        $t2, 0x2($a0)
/* AD6AC 800BCEAC 00408648 */  mtc2       $a2, $8 # handwritten instruction
/* AD6B0 800BCEB0 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* AD6B4 800BCEB4 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* AD6B8 800BCEB8 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* AD6BC 800BCEBC 00000000 */  nop
/* AD6C0 800BCEC0 3D00904B */  GPF        0
/* AD6C4 800BCEC4 0000A890 */  lbu        $t0, 0x0($a1)
/* AD6C8 800BCEC8 0100A990 */  lbu        $t1, 0x1($a1)
/* AD6CC 800BCECC 0200AA90 */  lbu        $t2, 0x2($a1)
/* AD6D0 800BCED0 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* AD6D4 800BCED4 00408748 */  mtc2       $a3, $8 # handwritten instruction
/* AD6D8 800BCED8 00488848 */  mtc2       $t0, $9 # handwritten instruction
/* AD6DC 800BCEDC 00508948 */  mtc2       $t1, $10 # handwritten instruction
/* AD6E0 800BCEE0 00588A48 */  mtc2       $t2, $11 # handwritten instruction
/* AD6E4 800BCEE4 0C000B24 */  addiu      $t3, $zero, 0xC
/* AD6E8 800BCEE8 3E00A04B */  GPL        0
/* AD6EC 800BCEEC 1000AD8F */  lw         $t5, 0x10($sp)
/* AD6F0 800BCEF0 00C80848 */  mfc2       $t0, $25 # handwritten instruction
/* AD6F4 800BCEF4 00D00948 */  mfc2       $t1, $26 # handwritten instruction
/* AD6F8 800BCEF8 00D80A48 */  mfc2       $t2, $27 # handwritten instruction
/* AD6FC 800BCEFC 07406801 */  srav       $t0, $t0, $t3
/* AD700 800BCF00 07486901 */  srav       $t1, $t1, $t3
/* AD704 800BCF04 07506A01 */  srav       $t2, $t2, $t3
/* AD708 800BCF08 0000A8A1 */  sb         $t0, 0x0($t5)
/* AD70C 800BCF0C 0100A9A1 */  sb         $t1, 0x1($t5)
/* AD710 800BCF10 0200AAA1 */  sb         $t2, 0x2($t5)
/* AD714 800BCF14 0800E003 */  jr         $ra
/* AD718 800BCF18 00000000 */   nop
/* AD71C 800BCF1C 00000000 */  nop
.size func_800BCEA0, . - func_800BCEA0
