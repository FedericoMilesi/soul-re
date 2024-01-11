.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C47B0
/* B4FB0 800C47B0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* B4FB4 800C47B4 3400B7AF */  sw         $s7, 0x34($sp)
/* B4FB8 800C47B8 21B88000 */  addu       $s7, $a0, $zero
/* B4FBC 800C47BC 2400B3AF */  sw         $s3, 0x24($sp)
/* B4FC0 800C47C0 2198A000 */  addu       $s3, $a1, $zero
/* B4FC4 800C47C4 FFFF0424 */  addiu      $a0, $zero, -0x1
/* B4FC8 800C47C8 3C00BFAF */  sw         $ra, 0x3C($sp)
/* B4FCC 800C47CC 3800BEAF */  sw         $fp, 0x38($sp)
/* B4FD0 800C47D0 3000B6AF */  sw         $s6, 0x30($sp)
/* B4FD4 800C47D4 2C00B5AF */  sw         $s5, 0x2C($sp)
/* B4FD8 800C47D8 2800B4AF */  sw         $s4, 0x28($sp)
/* B4FDC 800C47DC 2000B2AF */  sw         $s2, 0x20($sp)
/* B4FE0 800C47E0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B4FE4 800C47E4 5EF2020C */  jal        func_800BC978
/* B4FE8 800C47E8 1800B0AF */   sw        $s0, 0x18($sp)
/* B4FEC 800C47EC 0D801E3C */  lui        $fp, %hi(CD_comstr)
/* B4FF0 800C47F0 A8E9DE27 */  addiu      $fp, $fp, %lo(CD_comstr)
/* B4FF4 800C47F4 0D80153C */  lui        $s5, %hi(CD_intstr)
/* B4FF8 800C47F8 28EAB526 */  addiu      $s5, $s5, %lo(CD_intstr)
/* B4FFC 800C47FC 0D80123C */  lui        $s2, %hi(CD_intstr + 0x238)
/* B5000 800C4800 60EC5226 */  addiu      $s2, $s2, %lo(CD_intstr + 0x238)
/* B5004 800C4804 01005626 */  addiu      $s6, $s2, 0x1
/* B5008 800C4808 02005426 */  addiu      $s4, $s2, 0x2
/* B500C 800C480C C0034224 */  addiu      $v0, $v0, 0x3C0
/* B5010 800C4810 0E80013C */  lui        $at, %hi(StStartFrame + 0x5C)
/* B5014 800C4814 A0FD22AC */  sw         $v0, %lo(StStartFrame + 0x5C)($at)
/* B5018 800C4818 0180023C */  lui        $v0, %hi(D_80012C20)
/* B501C 800C481C 202C4224 */  addiu      $v0, $v0, %lo(D_80012C20)
/* B5020 800C4820 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B5024 800C4824 A4FD20AC */  sw         $zero, %lo(StStartFrame + 0x60)($at)
/* B5028 800C4828 0E80013C */  lui        $at, %hi(StStartFrame + 0x64)
/* B502C 800C482C A8FD22AC */  sw         $v0, %lo(StStartFrame + 0x64)($at)
.L800C4830:
/* B5030 800C4830 5EF2020C */  jal        func_800BC978
/* B5034 800C4834 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B5038 800C4838 0E80033C */  lui        $v1, %hi(StStartFrame + 0x5C)
/* B503C 800C483C A0FD638C */  lw         $v1, %lo(StStartFrame + 0x5C)($v1)
/* B5040 800C4840 00000000 */  nop
/* B5044 800C4844 2A186200 */  slt        $v1, $v1, $v0
/* B5048 800C4848 0C006014 */  bnez       $v1, .L800C487C
/* B504C 800C484C 00000000 */   nop
/* B5050 800C4850 0E80023C */  lui        $v0, %hi(StStartFrame + 0x60)
/* B5054 800C4854 A4FD428C */  lw         $v0, %lo(StStartFrame + 0x60)($v0)
/* B5058 800C4858 00000000 */  nop
/* B505C 800C485C 21184000 */  addu       $v1, $v0, $zero
/* B5060 800C4860 01004224 */  addiu      $v0, $v0, 0x1
/* B5064 800C4864 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B5068 800C4868 A4FD22AC */  sw         $v0, %lo(StStartFrame + 0x60)($at)
/* B506C 800C486C 3C00023C */  lui        $v0, (0x3C0000 >> 16)
/* B5070 800C4870 2A104300 */  slt        $v0, $v0, $v1
/* B5074 800C4874 1B004010 */  beqz       $v0, .L800C48E4
/* B5078 800C4878 00000000 */   nop
.L800C487C:
/* B507C 800C487C 0180043C */  lui        $a0, %hi(D_80012B90)
/* B5080 800C4880 9901030C */  jal        func_800C0664
/* B5084 800C4884 902B8424 */   addiu     $a0, $a0, %lo(D_80012B90)
/* B5088 800C4888 00004492 */  lbu        $a0, 0x0($s2)
/* B508C 800C488C 01004292 */  lbu        $v0, 0x1($s2)
/* B5090 800C4890 0E80053C */  lui        $a1, %hi(StStartFrame + 0x64)
/* B5094 800C4894 A8FDA58C */  lw         $a1, %lo(StStartFrame + 0x64)($a1)
/* B5098 800C4898 80100200 */  sll        $v0, $v0, 2
/* B509C 800C489C 21105500 */  addu       $v0, $v0, $s5
/* B50A0 800C48A0 80200400 */  sll        $a0, $a0, 2
/* B50A4 800C48A4 0000438C */  lw         $v1, 0x0($v0)
/* B50A8 800C48A8 0D80023C */  lui        $v0, %hi(CD_com)
/* B50AC 800C48AC A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B50B0 800C48B0 21209500 */  addu       $a0, $a0, $s5
/* B50B4 800C48B4 80100200 */  sll        $v0, $v0, 2
/* B50B8 800C48B8 21105E00 */  addu       $v0, $v0, $fp
/* B50BC 800C48BC 1000A3AF */  sw         $v1, 0x10($sp)
/* B50C0 800C48C0 0000468C */  lw         $a2, 0x0($v0)
/* B50C4 800C48C4 0000878C */  lw         $a3, 0x0($a0)
/* B50C8 800C48C8 0180043C */  lui        $a0, %hi(D_80012BA0)
/* B50CC 800C48CC 06D1010C */  jal        printf
/* B50D0 800C48D0 A02B8424 */   addiu     $a0, $a0, %lo(D_80012BA0)
/* B50D4 800C48D4 A113030C */  jal        func_800C4E84
/* B50D8 800C48D8 00000000 */   nop
/* B50DC 800C48DC 3A120308 */  j          .L800C48E8
/* B50E0 800C48E0 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800C48E4:
/* B50E4 800C48E4 21100000 */  addu       $v0, $zero, $zero
.L800C48E8:
/* B50E8 800C48E8 57004014 */  bnez       $v0, .L800C4A48
/* B50EC 800C48EC FFFF0224 */   addiu     $v0, $zero, -0x1
/* B50F0 800C48F0 E8E6020C */  jal        func_800B9BA0
/* B50F4 800C48F4 00000000 */   nop
/* B50F8 800C48F8 29004010 */  beqz       $v0, .L800C49A0
/* B50FC 800C48FC 00000000 */   nop
/* B5100 800C4900 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5104 800C4904 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5108 800C4908 00000000 */  nop
/* B510C 800C490C 00004290 */  lbu        $v0, 0x0($v0)
/* B5110 800C4910 00000000 */  nop
/* B5114 800C4914 03005130 */  andi       $s1, $v0, 0x3
.L800C4918:
/* B5118 800C4918 F30F030C */  jal        func_800C3FCC
/* B511C 800C491C 00000000 */   nop
/* B5120 800C4920 21804000 */  addu       $s0, $v0, $zero
/* B5124 800C4924 1A000012 */  beqz       $s0, .L800C4990
/* B5128 800C4928 04000232 */   andi      $v0, $s0, 0x4
/* B512C 800C492C 0B004010 */  beqz       $v0, .L800C495C
/* B5130 800C4930 02000232 */   andi      $v0, $s0, 0x2
/* B5134 800C4934 0D80023C */  lui        $v0, %hi(CD_cbready)
/* B5138 800C4938 88E9428C */  lw         $v0, %lo(CD_cbready)($v0)
/* B513C 800C493C 00000000 */  nop
/* B5140 800C4940 05004010 */  beqz       $v0, .L800C4958
/* B5144 800C4944 00000000 */   nop
/* B5148 800C4948 0000C492 */  lbu        $a0, 0x0($s6)
/* B514C 800C494C 0E80053C */  lui        $a1, %hi(StStartFrame + 0x4C)
/* B5150 800C4950 09F84000 */  jalr       $v0
/* B5154 800C4954 90FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x4C)
.L800C4958:
/* B5158 800C4958 02000232 */  andi       $v0, $s0, 0x2
.L800C495C:
/* B515C 800C495C EEFF4010 */  beqz       $v0, .L800C4918
/* B5160 800C4960 00000000 */   nop
/* B5164 800C4964 0D80023C */  lui        $v0, %hi(CD_cbsync)
/* B5168 800C4968 84E9428C */  lw         $v0, %lo(CD_cbsync)($v0)
/* B516C 800C496C 00000000 */  nop
/* B5170 800C4970 E9FF4010 */  beqz       $v0, .L800C4918
/* B5174 800C4974 00000000 */   nop
/* B5178 800C4978 00004492 */  lbu        $a0, 0x0($s2)
/* B517C 800C497C 0E80053C */  lui        $a1, %hi(StStartFrame + 0x44)
/* B5180 800C4980 09F84000 */  jalr       $v0
/* B5184 800C4984 88FDA524 */   addiu     $a1, $a1, %lo(StStartFrame + 0x44)
/* B5188 800C4988 46120308 */  j          .L800C4918
/* B518C 800C498C 00000000 */   nop
.L800C4990:
/* B5190 800C4990 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5194 800C4994 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5198 800C4998 00000000 */  nop
/* B519C 800C499C 000051A0 */  sb         $s1, 0x0($v0)
.L800C49A0:
/* B51A0 800C49A0 00008292 */  lbu        $v0, 0x0($s4)
/* B51A4 800C49A4 00000000 */  nop
/* B51A8 800C49A8 FF004630 */  andi       $a2, $v0, 0xFF
/* B51AC 800C49AC 1000C010 */  beqz       $a2, .L800C49F0
/* B51B0 800C49B0 00000000 */   nop
/* B51B4 800C49B4 020040A2 */  sb         $zero, 0x2($s2)
/* B51B8 800C49B8 0E80043C */  lui        $a0, %hi(StStartFrame + 0x54)
/* B51BC 800C49BC 98FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x54)
/* B51C0 800C49C0 1D006012 */  beqz       $s3, .L800C4A38
/* B51C4 800C49C4 21286002 */   addu      $a1, $s3, $zero
/* B51C8 800C49C8 07000324 */  addiu      $v1, $zero, 0x7
/* B51CC 800C49CC FFFF0724 */  addiu      $a3, $zero, -0x1
.L800C49D0:
/* B51D0 800C49D0 00008290 */  lbu        $v0, 0x0($a0)
/* B51D4 800C49D4 01008424 */  addiu      $a0, $a0, 0x1
/* B51D8 800C49D8 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B51DC 800C49DC 0000A2A0 */  sb         $v0, 0x0($a1)
/* B51E0 800C49E0 FBFF6714 */  bne        $v1, $a3, .L800C49D0
/* B51E4 800C49E4 0100A524 */   addiu     $a1, $a1, 0x1
/* B51E8 800C49E8 92120308 */  j          .L800C4A48
/* B51EC 800C49EC 2110C000 */   addu      $v0, $a2, $zero
.L800C49F0:
/* B51F0 800C49F0 FFFF8292 */  lbu        $v0, -0x1($s4)
/* B51F4 800C49F4 00000000 */  nop
/* B51F8 800C49F8 FF004630 */  andi       $a2, $v0, 0xFF
/* B51FC 800C49FC 1000C010 */  beqz       $a2, .L800C4A40
/* B5200 800C4A00 00000000 */   nop
/* B5204 800C4A04 010040A2 */  sb         $zero, 0x1($s2)
/* B5208 800C4A08 21286002 */  addu       $a1, $s3, $zero
/* B520C 800C4A0C 0E80043C */  lui        $a0, %hi(StStartFrame + 0x4C)
/* B5210 800C4A10 90FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x4C)
/* B5214 800C4A14 0800A010 */  beqz       $a1, .L800C4A38
/* B5218 800C4A18 07000324 */   addiu     $v1, $zero, 0x7
/* B521C 800C4A1C FFFF0724 */  addiu      $a3, $zero, -0x1
.L800C4A20:
/* B5220 800C4A20 00008290 */  lbu        $v0, 0x0($a0)
/* B5224 800C4A24 01008424 */  addiu      $a0, $a0, 0x1
/* B5228 800C4A28 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B522C 800C4A2C 0000A2A0 */  sb         $v0, 0x0($a1)
/* B5230 800C4A30 FBFF6714 */  bne        $v1, $a3, .L800C4A20
/* B5234 800C4A34 0100A524 */   addiu     $a1, $a1, 0x1
.L800C4A38:
/* B5238 800C4A38 92120308 */  j          .L800C4A48
/* B523C 800C4A3C 2110C000 */   addu      $v0, $a2, $zero
.L800C4A40:
/* B5240 800C4A40 7BFFE012 */  beqz       $s7, .L800C4830
/* B5244 800C4A44 21100000 */   addu      $v0, $zero, $zero
.L800C4A48:
/* B5248 800C4A48 3C00BF8F */  lw         $ra, 0x3C($sp)
/* B524C 800C4A4C 3800BE8F */  lw         $fp, 0x38($sp)
/* B5250 800C4A50 3400B78F */  lw         $s7, 0x34($sp)
/* B5254 800C4A54 3000B68F */  lw         $s6, 0x30($sp)
/* B5258 800C4A58 2C00B58F */  lw         $s5, 0x2C($sp)
/* B525C 800C4A5C 2800B48F */  lw         $s4, 0x28($sp)
/* B5260 800C4A60 2400B38F */  lw         $s3, 0x24($sp)
/* B5264 800C4A64 2000B28F */  lw         $s2, 0x20($sp)
/* B5268 800C4A68 1C00B18F */  lw         $s1, 0x1C($sp)
/* B526C 800C4A6C 1800B08F */  lw         $s0, 0x18($sp)
/* B5270 800C4A70 0800E003 */  jr         $ra
/* B5274 800C4A74 4000BD27 */   addiu     $sp, $sp, 0x40
.size func_800C47B0, . - func_800C47B0
