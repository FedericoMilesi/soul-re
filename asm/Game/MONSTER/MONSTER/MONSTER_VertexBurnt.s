.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_VertexBurnt
/* 7CFD4 8008C7D4 1C00838C */  lw         $v1, 0x1C($a0)
/* 7CFD8 8008C7D8 26018284 */  lh         $v0, 0x126($a0)
/* 7CFDC 8008C7DC 0C00638C */  lw         $v1, 0xC($v1)
/* 7CFE0 8008C7E0 80100200 */  sll        $v0, $v0, 2
/* 7CFE4 8008C7E4 21104300 */  addu       $v0, $v0, $v1
/* 7CFE8 8008C7E8 0000488C */  lw         $t0, 0x0($v0)
/* 7CFEC 8008C7EC 9802828C */  lw         $v0, 0x298($a0)
/* 7CFF0 8008C7F0 0400A68C */  lw         $a2, 0x4($a1)
/* 7CFF4 8008C7F4 20004010 */  beqz       $v0, .L8008C878
/* 7CFF8 8008C7F8 00000000 */   nop
/* 7CFFC 8008C7FC 0000028D */  lw         $v0, 0x0($t0)
/* 7D000 8008C800 00000000 */  nop
/* 7D004 8008C804 1C004018 */  blez       $v0, .L8008C878
/* 7D008 8008C808 21380000 */   addu      $a3, $zero, $zero
.L8008C80C:
/* 7D00C 8008C80C 9802828C */  lw         $v0, 0x298($a0)
/* 7D010 8008C810 80180700 */  sll        $v1, $a3, 2
/* 7D014 8008C814 21184300 */  addu       $v1, $v0, $v1
/* 7D018 8008C818 00006590 */  lbu        $a1, 0x0($v1)
/* 7D01C 8008C81C 00000000 */  nop
/* 7D020 8008C820 2A10A600 */  slt        $v0, $a1, $a2
/* 7D024 8008C824 02004014 */  bnez       $v0, .L8008C830
/* 7D028 8008C828 2310A600 */   subu      $v0, $a1, $a2
/* 7D02C 8008C82C 000062A0 */  sb         $v0, 0x0($v1)
.L8008C830:
/* 7D030 8008C830 01006590 */  lbu        $a1, 0x1($v1)
/* 7D034 8008C834 00000000 */  nop
/* 7D038 8008C838 2A10A600 */  slt        $v0, $a1, $a2
/* 7D03C 8008C83C 02004014 */  bnez       $v0, .L8008C848
/* 7D040 8008C840 2310A600 */   subu      $v0, $a1, $a2
/* 7D044 8008C844 010062A0 */  sb         $v0, 0x1($v1)
.L8008C848:
/* 7D048 8008C848 02006590 */  lbu        $a1, 0x2($v1)
/* 7D04C 8008C84C 00000000 */  nop
/* 7D050 8008C850 2A10A600 */  slt        $v0, $a1, $a2
/* 7D054 8008C854 02004014 */  bnez       $v0, .L8008C860
/* 7D058 8008C858 2310A600 */   subu      $v0, $a1, $a2
/* 7D05C 8008C85C 020062A0 */  sb         $v0, 0x2($v1)
.L8008C860:
/* 7D060 8008C860 030060A0 */  sb         $zero, 0x3($v1)
/* 7D064 8008C864 0000028D */  lw         $v0, 0x0($t0)
/* 7D068 8008C868 0100E724 */  addiu      $a3, $a3, 0x1
/* 7D06C 8008C86C 2A10E200 */  slt        $v0, $a3, $v0
/* 7D070 8008C870 E6FF4014 */  bnez       $v0, .L8008C80C
/* 7D074 8008C874 00000000 */   nop
.L8008C878:
/* 7D078 8008C878 0800E003 */  jr         $ra
/* 7D07C 8008C87C 00000000 */   nop
.size MONSTER_VertexBurnt, . - MONSTER_VertexBurnt
