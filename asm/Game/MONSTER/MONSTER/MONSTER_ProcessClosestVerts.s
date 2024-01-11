.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_ProcessClosestVerts
/* 7C718 8008BF18 88FFBD27 */  addiu      $sp, $sp, -0x78
/* 7C71C 8008BF1C 7000BEAF */  sw         $fp, 0x70($sp)
/* 7C720 8008BF20 21F08000 */  addu       $fp, $a0, $zero
/* 7C724 8008BF24 7400BFAF */  sw         $ra, 0x74($sp)
/* 7C728 8008BF28 6C00B7AF */  sw         $s7, 0x6C($sp)
/* 7C72C 8008BF2C 6800B6AF */  sw         $s6, 0x68($sp)
/* 7C730 8008BF30 6400B5AF */  sw         $s5, 0x64($sp)
/* 7C734 8008BF34 6000B4AF */  sw         $s4, 0x60($sp)
/* 7C738 8008BF38 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 7C73C 8008BF3C 5800B2AF */  sw         $s2, 0x58($sp)
/* 7C740 8008BF40 5400B1AF */  sw         $s1, 0x54($sp)
/* 7C744 8008BF44 5000B0AF */  sw         $s0, 0x50($sp)
/* 7C748 8008BF48 7C00A5AF */  sw         $a1, 0x7C($sp)
/* 7C74C 8008BF4C 8000A6AF */  sw         $a2, 0x80($sp)
/* 7C750 8008BF50 8400A7AF */  sw         $a3, 0x84($sp)
/* 7C754 8008BF54 1C00C38F */  lw         $v1, 0x1C($fp)
/* 7C758 8008BF58 2601C287 */  lh         $v0, 0x126($fp)
/* 7C75C 8008BF5C 0C00638C */  lw         $v1, 0xC($v1)
/* 7C760 8008BF60 80100200 */  sll        $v0, $v0, 2
/* 7C764 8008BF64 21104300 */  addu       $v0, $v0, $v1
/* 7C768 8008BF68 0000578C */  lw         $s7, 0x0($v0)
/* 7C76C 8008BF6C 01001224 */  addiu      $s2, $zero, 0x1
/* 7C770 8008BF70 1800E28E */  lw         $v0, 0x18($s7)
/* 7C774 8008BF74 0400F48E */  lw         $s4, 0x4($s7)
/* 7C778 8008BF78 1C00E38E */  lw         $v1, 0x1C($s7)
/* 7C77C 8008BF7C 2A104202 */  slt        $v0, $s2, $v0
/* 7C780 8008BF80 4B004010 */  beqz       $v0, .L8008C0B0
/* 7C784 8008BF84 2800B627 */   addiu     $s6, $sp, 0x28
/* 7C788 8008BF88 20007324 */  addiu      $s3, $v1, 0x20
.L8008BF8C:
/* 7C78C 8008BF8C 02006386 */  lh         $v1, 0x2($s3)
/* 7C790 8008BF90 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7C794 8008BF94 40006210 */  beq        $v1, $v0, .L8008C098
/* 7C798 8008BF98 2120C002 */   addu      $a0, $s6, $zero
/* 7C79C 8008BF9C 40111200 */  sll        $v0, $s2, 5
/* 7C7A0 8008BFA0 4000C58F */  lw         $a1, 0x40($fp)
/* 7C7A4 8008BFA4 00007086 */  lh         $s0, 0x0($s3)
/* 7C7A8 8008BFA8 2128A200 */  addu       $a1, $a1, $v0
/* 7C7AC 8008BFAC C0801000 */  sll        $s0, $s0, 3
/* 7C7B0 8008BFB0 21809002 */  addu       $s0, $s4, $s0
/* 7C7B4 8008BFB4 C0100300 */  sll        $v0, $v1, 3
/* 7C7B8 8008BFB8 F5EA000C */  jal        PIPE3D_InvertTransform
/* 7C7BC 8008BFBC 21A88202 */   addu      $s5, $s4, $v0
/* 7C7C0 8008BFC0 52F2020C */  jal        func_800BC948
/* 7C7C4 8008BFC4 2120C002 */   addu      $a0, $s6, $zero
/* 7C7C8 8008BFC8 4AF2020C */  jal        func_800BC928
/* 7C7CC 8008BFCC 2120C002 */   addu      $a0, $s6, $zero
/* 7C7D0 8008BFD0 1800A527 */  addiu      $a1, $sp, 0x18
/* 7C7D4 8008BFD4 7C00A48F */  lw         $a0, 0x7C($sp)
/* 7C7D8 8008BFD8 98F4020C */  jal        func_800BD260
/* 7C7DC 8008BFDC 4800A627 */   addiu     $a2, $sp, 0x48
/* 7C7E0 8008BFE0 2B10B002 */  sltu       $v0, $s5, $s0
/* 7C7E4 8008BFE4 2C004014 */  bnez       $v0, .L8008C098
/* 7C7E8 8008BFE8 00000000 */   nop
/* 7C7EC 8008BFEC 04001126 */  addiu      $s1, $s0, 0x4
.L8008BFF0:
/* 7C7F0 8008BFF0 00000386 */  lh         $v1, 0x0($s0)
/* 7C7F4 8008BFF4 1800A28F */  lw         $v0, 0x18($sp)
/* 7C7F8 8008BFF8 00000000 */  nop
/* 7C7FC 8008BFFC 23386200 */  subu       $a3, $v1, $v0
/* 7C800 8008C000 FEFF2386 */  lh         $v1, -0x2($s1)
/* 7C804 8008C004 1C00A28F */  lw         $v0, 0x1C($sp)
/* 7C808 8008C008 0200E104 */  bgez       $a3, .L8008C014
/* 7C80C 8008C00C 2120E000 */   addu      $a0, $a3, $zero
/* 7C810 8008C010 23200400 */  negu       $a0, $a0
.L8008C014:
/* 7C814 8008C014 23386200 */  subu       $a3, $v1, $v0
/* 7C818 8008C018 0200E104 */  bgez       $a3, .L8008C024
/* 7C81C 8008C01C 00000000 */   nop
/* 7C820 8008C020 23380700 */  negu       $a3, $a3
.L8008C024:
/* 7C824 8008C024 2128E000 */  addu       $a1, $a3, $zero
/* 7C828 8008C028 2A10A400 */  slt        $v0, $a1, $a0
/* 7C82C 8008C02C 02004010 */  beqz       $v0, .L8008C038
/* 7C830 8008C030 00000000 */   nop
/* 7C834 8008C034 21288000 */  addu       $a1, $a0, $zero
.L8008C038:
/* 7C838 8008C038 00002386 */  lh         $v1, 0x0($s1)
/* 7C83C 8008C03C 2000A28F */  lw         $v0, 0x20($sp)
/* 7C840 8008C040 2120A000 */  addu       $a0, $a1, $zero
/* 7C844 8008C044 23386200 */  subu       $a3, $v1, $v0
/* 7C848 8008C048 0200E104 */  bgez       $a3, .L8008C054
/* 7C84C 8008C04C 00000000 */   nop
/* 7C850 8008C050 23380700 */  negu       $a3, $a3
.L8008C054:
/* 7C854 8008C054 2A10E400 */  slt        $v0, $a3, $a0
/* 7C858 8008C058 02004010 */  beqz       $v0, .L8008C064
/* 7C85C 8008C05C 00000000 */   nop
/* 7C860 8008C060 21388000 */  addu       $a3, $a0, $zero
.L8008C064:
/* 7C864 8008C064 2120C003 */  addu       $a0, $fp, $zero
/* 7C868 8008C068 23281402 */  subu       $a1, $s0, $s4
/* 7C86C 8008C06C 8400A88F */  lw         $t0, 0x84($sp)
/* 7C870 8008C070 C3280500 */  sra        $a1, $a1, 3
/* 7C874 8008C074 1000A8AF */  sw         $t0, 0x10($sp)
/* 7C878 8008C078 8000A88F */  lw         $t0, 0x80($sp)
/* 7C87C 8008C07C 00000000 */  nop
/* 7C880 8008C080 09F80001 */  jalr       $t0
/* 7C884 8008C084 21304002 */   addu      $a2, $s2, $zero
/* 7C888 8008C088 08001026 */  addiu      $s0, $s0, 0x8
/* 7C88C 8008C08C 2B10B002 */  sltu       $v0, $s5, $s0
/* 7C890 8008C090 D7FF4010 */  beqz       $v0, .L8008BFF0
/* 7C894 8008C094 08003126 */   addiu     $s1, $s1, 0x8
.L8008C098:
/* 7C898 8008C098 01005226 */  addiu      $s2, $s2, 0x1
/* 7C89C 8008C09C 1800E28E */  lw         $v0, 0x18($s7)
/* 7C8A0 8008C0A0 00000000 */  nop
/* 7C8A4 8008C0A4 2A104202 */  slt        $v0, $s2, $v0
/* 7C8A8 8008C0A8 B8FF4014 */  bnez       $v0, .L8008BF8C
/* 7C8AC 8008C0AC 18007326 */   addiu     $s3, $s3, 0x18
.L8008C0B0:
/* 7C8B0 8008C0B0 7400BF8F */  lw         $ra, 0x74($sp)
/* 7C8B4 8008C0B4 7000BE8F */  lw         $fp, 0x70($sp)
/* 7C8B8 8008C0B8 6C00B78F */  lw         $s7, 0x6C($sp)
/* 7C8BC 8008C0BC 6800B68F */  lw         $s6, 0x68($sp)
/* 7C8C0 8008C0C0 6400B58F */  lw         $s5, 0x64($sp)
/* 7C8C4 8008C0C4 6000B48F */  lw         $s4, 0x60($sp)
/* 7C8C8 8008C0C8 5C00B38F */  lw         $s3, 0x5C($sp)
/* 7C8CC 8008C0CC 5800B28F */  lw         $s2, 0x58($sp)
/* 7C8D0 8008C0D0 5400B18F */  lw         $s1, 0x54($sp)
/* 7C8D4 8008C0D4 5000B08F */  lw         $s0, 0x50($sp)
/* 7C8D8 8008C0D8 0800E003 */  jr         $ra
/* 7C8DC 8008C0DC 7800BD27 */   addiu     $sp, $sp, 0x78
.size MONSTER_ProcessClosestVerts, . - MONSTER_ProcessClosestVerts
