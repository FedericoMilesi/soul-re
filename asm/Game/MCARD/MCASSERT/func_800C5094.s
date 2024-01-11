.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C5094
/* B5894 800C5094 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B5898 800C5098 0180043C */  lui        $a0, %hi(D_80012C84)
/* B589C 800C509C 842C8424 */  addiu      $a0, $a0, %lo(D_80012C84)
/* B58A0 800C50A0 1000BFAF */  sw         $ra, 0x10($sp)
/* B58A4 800C50A4 9901030C */  jal        func_800C0664
/* B58A8 800C50A8 00000000 */   nop
/* B58AC 800C50AC 0180043C */  lui        $a0, %hi(D_80012C90)
/* B58B0 800C50B0 902C8424 */  addiu      $a0, $a0, %lo(D_80012C90)
/* B58B4 800C50B4 0D80053C */  lui        $a1, %hi(CD_intstr + 0x23C)
/* B58B8 800C50B8 06D1010C */  jal        printf
/* B58BC 800C50BC 64ECA524 */   addiu     $a1, $a1, %lo(CD_intstr + 0x23C)
/* B58C0 800C50C0 0D80013C */  lui        $at, %hi(CD_com)
/* B58C4 800C50C4 A1E920A0 */  sb         $zero, %lo(CD_com)($at)
/* B58C8 800C50C8 0D80013C */  lui        $at, %hi(CD_mode)
/* B58CC 800C50CC A0E920A0 */  sb         $zero, %lo(CD_mode)($at)
/* B58D0 800C50D0 0D80013C */  lui        $at, %hi(CD_cbready)
/* B58D4 800C50D4 88E920AC */  sw         $zero, %lo(CD_cbready)($at)
/* B58D8 800C50D8 0D80013C */  lui        $at, %hi(CD_cbsync)
/* B58DC 800C50DC 84E920AC */  sw         $zero, %lo(CD_cbsync)($at)
/* B58E0 800C50E0 0D80013C */  lui        $at, %hi(CD_status1)
/* B58E4 800C50E4 94E920AC */  sw         $zero, %lo(CD_status1)($at)
/* B58E8 800C50E8 0D80013C */  lui        $at, %hi(CD_status)
/* B58EC 800C50EC 9FE6020C */  jal        func_800B9A7C
/* B58F0 800C50F0 90E920AC */   sw        $zero, %lo(CD_status)($at)
/* B58F4 800C50F4 0C80053C */  lui        $a1, %hi(func_800C55D4)
/* B58F8 800C50F8 D455A524 */  addiu      $a1, $a1, %lo(func_800C55D4)
/* B58FC 800C50FC ABE6020C */  jal        func_800B9AAC
/* B5900 800C5100 02000424 */   addiu     $a0, $zero, 0x2
/* B5904 800C5104 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B5908 800C5108 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B590C 800C510C 01000224 */  addiu      $v0, $zero, 0x1
/* B5910 800C5110 000062A0 */  sb         $v0, 0x0($v1)
/* B5914 800C5114 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B5918 800C5118 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B591C 800C511C 00000000 */  nop
/* B5920 800C5120 00004290 */  lbu        $v0, 0x0($v0)
/* B5924 800C5124 00000000 */  nop
/* B5928 800C5128 07004230 */  andi       $v0, $v0, 0x7
/* B592C 800C512C 16004010 */  beqz       $v0, .L800C5188
/* B5930 800C5130 01000424 */   addiu     $a0, $zero, 0x1
/* B5934 800C5134 07000324 */  addiu      $v1, $zero, 0x7
.L800C5138:
/* B5938 800C5138 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B593C 800C513C 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5940 800C5140 00000000 */  nop
/* B5944 800C5144 000044A0 */  sb         $a0, 0x0($v0)
/* B5948 800C5148 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B594C 800C514C 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B5950 800C5150 00000000 */  nop
/* B5954 800C5154 000043A0 */  sb         $v1, 0x0($v0)
/* B5958 800C5158 0D80023C */  lui        $v0, %hi(CD_intstr + 0x228)
/* B595C 800C515C 50EC428C */  lw         $v0, %lo(CD_intstr + 0x228)($v0)
/* B5960 800C5160 00000000 */  nop
/* B5964 800C5164 000043A0 */  sb         $v1, 0x0($v0)
/* B5968 800C5168 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B596C 800C516C 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B5970 800C5170 00000000 */  nop
/* B5974 800C5174 00004290 */  lbu        $v0, 0x0($v0)
/* B5978 800C5178 00000000 */  nop
/* B597C 800C517C 07004230 */  andi       $v0, $v0, 0x7
/* B5980 800C5180 EDFF4014 */  bnez       $v0, .L800C5138
/* B5984 800C5184 00000000 */   nop
.L800C5188:
/* B5988 800C5188 01000424 */  addiu      $a0, $zero, 0x1
/* B598C 800C518C 21280000 */  addu       $a1, $zero, $zero
/* B5990 800C5190 0D80033C */  lui        $v1, %hi(CD_intstr + 0x238)
/* B5994 800C5194 60EC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x238)
/* B5998 800C5198 020060A0 */  sb         $zero, 0x2($v1)
/* B599C 800C519C 02006290 */  lbu        $v0, 0x2($v1)
/* B59A0 800C51A0 21300000 */  addu       $a2, $zero, $zero
/* B59A4 800C51A4 010062A0 */  sb         $v0, 0x1($v1)
/* B59A8 800C51A8 0D80073C */  lui        $a3, %hi(CD_intstr + 0x220)
/* B59AC 800C51AC 48ECE78C */  lw         $a3, %lo(CD_intstr + 0x220)($a3)
/* B59B0 800C51B0 02000224 */  addiu      $v0, $zero, 0x2
/* B59B4 800C51B4 000062A0 */  sb         $v0, 0x0($v1)
/* B59B8 800C51B8 0000E0A0 */  sb         $zero, 0x0($a3)
/* B59BC 800C51BC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B59C0 800C51C0 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B59C4 800C51C4 21380000 */  addu       $a3, $zero, $zero
/* B59C8 800C51C8 000040A0 */  sb         $zero, 0x0($v0)
/* B59CC 800C51CC 0D80033C */  lui        $v1, %hi(CD_intstr + 0x230)
/* B59D0 800C51D0 58EC638C */  lw         $v1, %lo(CD_intstr + 0x230)($v1)
/* B59D4 800C51D4 25130224 */  addiu      $v0, $zero, 0x1325
/* B59D8 800C51D8 9E12030C */  jal        func_800C4A78
/* B59DC 800C51DC 000062AC */   sw        $v0, 0x0($v1)
/* B59E0 800C51E0 0D80023C */  lui        $v0, %hi(CD_status)
/* B59E4 800C51E4 90E9428C */  lw         $v0, %lo(CD_status)($v0)
/* B59E8 800C51E8 00000000 */  nop
/* B59EC 800C51EC 10004230 */  andi       $v0, $v0, 0x10
/* B59F0 800C51F0 05004010 */  beqz       $v0, .L800C5208
/* B59F4 800C51F4 01000424 */   addiu     $a0, $zero, 0x1
/* B59F8 800C51F8 21280000 */  addu       $a1, $zero, $zero
/* B59FC 800C51FC 21300000 */  addu       $a2, $zero, $zero
/* B5A00 800C5200 9E12030C */  jal        func_800C4A78
/* B5A04 800C5204 21380000 */   addu      $a3, $zero, $zero
.L800C5208:
/* B5A08 800C5208 0A000424 */  addiu      $a0, $zero, 0xA
/* B5A0C 800C520C 21280000 */  addu       $a1, $zero, $zero
/* B5A10 800C5210 21300000 */  addu       $a2, $zero, $zero
/* B5A14 800C5214 9E12030C */  jal        func_800C4A78
/* B5A18 800C5218 21380000 */   addu      $a3, $zero, $zero
/* B5A1C 800C521C 11004014 */  bnez       $v0, .L800C5264
/* B5A20 800C5220 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B5A24 800C5224 0C000424 */  addiu      $a0, $zero, 0xC
/* B5A28 800C5228 21280000 */  addu       $a1, $zero, $zero
/* B5A2C 800C522C 21300000 */  addu       $a2, $zero, $zero
/* B5A30 800C5230 9E12030C */  jal        func_800C4A78
/* B5A34 800C5234 21380000 */   addu      $a3, $zero, $zero
/* B5A38 800C5238 09004014 */  bnez       $v0, .L800C5260
/* B5A3C 800C523C 21200000 */   addu      $a0, $zero, $zero
/* B5A40 800C5240 4C11030C */  jal        func_800C4530
/* B5A44 800C5244 21280000 */   addu      $a1, $zero, $zero
/* B5A48 800C5248 21204000 */  addu       $a0, $v0, $zero
/* B5A4C 800C524C 02000324 */  addiu      $v1, $zero, 0x2
/* B5A50 800C5250 04008314 */  bne        $a0, $v1, .L800C5264
/* B5A54 800C5254 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B5A58 800C5258 99140308 */  j          .L800C5264
/* B5A5C 800C525C 21100000 */   addu      $v0, $zero, $zero
.L800C5260:
/* B5A60 800C5260 FFFF0224 */  addiu      $v0, $zero, -0x1
.L800C5264:
/* B5A64 800C5264 1000BF8F */  lw         $ra, 0x10($sp)
/* B5A68 800C5268 1800BD27 */  addiu      $sp, $sp, 0x18
/* B5A6C 800C526C 0800E003 */  jr         $ra
/* B5A70 800C5270 00000000 */   nop
.size func_800C5094, . - func_800C5094
