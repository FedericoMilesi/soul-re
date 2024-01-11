.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3FCC
/* B47CC 800C3FCC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B47D0 800C3FD0 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B47D4 800C3FD4 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B47D8 800C3FD8 01000224 */  addiu      $v0, $zero, 0x1
/* B47DC 800C3FDC 2800BFAF */  sw         $ra, 0x28($sp)
/* B47E0 800C3FE0 2400B1AF */  sw         $s1, 0x24($sp)
/* B47E4 800C3FE4 2000B0AF */  sw         $s0, 0x20($sp)
/* B47E8 800C3FE8 000062A0 */  sb         $v0, 0x0($v1)
/* B47EC 800C3FEC 0D80043C */  lui        $a0, %hi(CD_intstr + 0x22C)
/* B47F0 800C3FF0 54EC848C */  lw         $a0, %lo(CD_intstr + 0x22C)($a0)
/* B47F4 800C3FF4 00000000 */  nop
/* B47F8 800C3FF8 00008290 */  lbu        $v0, 0x0($a0)
/* B47FC 800C3FFC 00000000 */  nop
/* B4800 800C4000 07004230 */  andi       $v0, $v0, 0x7
/* B4804 800C4004 1000A2A3 */  sb         $v0, 0x10($sp)
/* B4808 800C4008 1000A293 */  lbu        $v0, 0x10($sp)
/* B480C 800C400C 00000000 */  nop
/* B4810 800C4010 41014010 */  beqz       $v0, .L800C4518
/* B4814 800C4014 21880000 */   addu      $s1, $zero, $zero
/* B4818 800C4018 0C100308 */  j          .L800C4030
/* B481C 800C401C 00000000 */   nop
.L800C4020:
/* B4820 800C4020 00008290 */  lbu        $v0, 0x0($a0)
/* B4824 800C4024 00000000 */  nop
/* B4828 800C4028 07004230 */  andi       $v0, $v0, 0x7
/* B482C 800C402C 1000A2A3 */  sb         $v0, 0x10($sp)
.L800C4030:
/* B4830 800C4030 00008290 */  lbu        $v0, 0x0($a0)
/* B4834 800C4034 1000A393 */  lbu        $v1, 0x10($sp)
/* B4838 800C4038 07004230 */  andi       $v0, $v0, 0x7
/* B483C 800C403C F8FF6214 */  bne        $v1, $v0, .L800C4020
/* B4840 800C4040 21800000 */   addu      $s0, $zero, $zero
/* B4844 800C4044 1800A427 */  addiu      $a0, $sp, 0x18
.L800C4048:
/* B4848 800C4048 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B484C 800C404C 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B4850 800C4050 00000000 */  nop
/* B4854 800C4054 00004290 */  lbu        $v0, 0x0($v0)
/* B4858 800C4058 00000000 */  nop
/* B485C 800C405C 20004230 */  andi       $v0, $v0, 0x20
/* B4860 800C4060 0A004010 */  beqz       $v0, .L800C408C
/* B4864 800C4064 21189000 */   addu      $v1, $a0, $s0
/* B4868 800C4068 0D80023C */  lui        $v0, %hi(CD_intstr + 0x224)
/* B486C 800C406C 4CEC428C */  lw         $v0, %lo(CD_intstr + 0x224)($v0)
/* B4870 800C4070 00000000 */  nop
/* B4874 800C4074 00004290 */  lbu        $v0, 0x0($v0)
/* B4878 800C4078 01001026 */  addiu      $s0, $s0, 0x1
/* B487C 800C407C 000062A0 */  sb         $v0, 0x0($v1)
/* B4880 800C4080 0800022A */  slti       $v0, $s0, 0x8
/* B4884 800C4084 F0FF4014 */  bnez       $v0, .L800C4048
/* B4888 800C4088 00000000 */   nop
.L800C408C:
/* B488C 800C408C 0800022A */  slti       $v0, $s0, 0x8
/* B4890 800C4090 08004010 */  beqz       $v0, .L800C40B4
/* B4894 800C4094 21180002 */   addu      $v1, $s0, $zero
/* B4898 800C4098 1800A427 */  addiu      $a0, $sp, 0x18
/* B489C 800C409C 21108300 */  addu       $v0, $a0, $v1
.L800C40A0:
/* B48A0 800C40A0 000040A0 */  sb         $zero, 0x0($v0)
/* B48A4 800C40A4 01006324 */  addiu      $v1, $v1, 0x1
/* B48A8 800C40A8 08006228 */  slti       $v0, $v1, 0x8
/* B48AC 800C40AC FCFF4014 */  bnez       $v0, .L800C40A0
/* B48B0 800C40B0 21108300 */   addu      $v0, $a0, $v1
.L800C40B4:
/* B48B4 800C40B4 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B48B8 800C40B8 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B48BC 800C40BC 01000224 */  addiu      $v0, $zero, 0x1
/* B48C0 800C40C0 000062A0 */  sb         $v0, 0x0($v1)
/* B48C4 800C40C4 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B48C8 800C40C8 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B48CC 800C40CC 07000324 */  addiu      $v1, $zero, 0x7
/* B48D0 800C40D0 000043A0 */  sb         $v1, 0x0($v0)
/* B48D4 800C40D4 0D80023C */  lui        $v0, %hi(CD_intstr + 0x228)
/* B48D8 800C40D8 50EC428C */  lw         $v0, %lo(CD_intstr + 0x228)($v0)
/* B48DC 800C40DC 00000000 */  nop
/* B48E0 800C40E0 000043A0 */  sb         $v1, 0x0($v0)
/* B48E4 800C40E4 1000A393 */  lbu        $v1, 0x10($sp)
/* B48E8 800C40E8 03000224 */  addiu      $v0, $zero, 0x3
/* B48EC 800C40EC 0B006214 */  bne        $v1, $v0, .L800C411C
/* B48F0 800C40F0 00000000 */   nop
/* B48F4 800C40F4 0D80023C */  lui        $v0, %hi(CD_com)
/* B48F8 800C40F8 A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B48FC 800C40FC 00000000 */  nop
/* B4900 800C4100 80100200 */  sll        $v0, $v0, 2
/* B4904 800C4104 0D80013C */  lui        $at, %hi(CD_intstr + 0x120)
/* B4908 800C4108 21082200 */  addu       $at, $at, $v0
/* B490C 800C410C 48EB228C */  lw         $v0, %lo(CD_intstr + 0x120)($at)
/* B4910 800C4110 00000000 */  nop
/* B4914 800C4114 1A004010 */  beqz       $v0, .L800C4180
/* B4918 800C4118 00000000 */   nop
.L800C411C:
/* B491C 800C411C 0D80023C */  lui        $v0, %hi(CD_status)
/* B4920 800C4120 90E9428C */  lw         $v0, %lo(CD_status)($v0)
/* B4924 800C4124 00000000 */  nop
/* B4928 800C4128 10004230 */  andi       $v0, $v0, 0x10
/* B492C 800C412C 0C004014 */  bnez       $v0, .L800C4160
/* B4930 800C4130 00000000 */   nop
/* B4934 800C4134 1800A293 */  lbu        $v0, 0x18($sp)
/* B4938 800C4138 00000000 */  nop
/* B493C 800C413C 10004230 */  andi       $v0, $v0, 0x10
/* B4940 800C4140 07004010 */  beqz       $v0, .L800C4160
/* B4944 800C4144 00000000 */   nop
/* B4948 800C4148 0D80023C */  lui        $v0, %hi(CD_nopen)
/* B494C 800C414C 98E9428C */  lw         $v0, %lo(CD_nopen)($v0)
/* B4950 800C4150 00000000 */  nop
/* B4954 800C4154 01004224 */  addiu      $v0, $v0, 0x1
/* B4958 800C4158 0D80013C */  lui        $at, %hi(CD_nopen)
/* B495C 800C415C 98E922AC */  sw         $v0, %lo(CD_nopen)($at)
.L800C4160:
/* B4960 800C4160 1800A293 */  lbu        $v0, 0x18($sp)
/* B4964 800C4164 1900A393 */  lbu        $v1, 0x19($sp)
/* B4968 800C4168 FF004230 */  andi       $v0, $v0, 0xFF
/* B496C 800C416C 1D005130 */  andi       $s1, $v0, 0x1D
/* B4970 800C4170 0D80013C */  lui        $at, %hi(CD_status)
/* B4974 800C4174 90E922AC */  sw         $v0, %lo(CD_status)($at)
/* B4978 800C4178 0D80013C */  lui        $at, %hi(CD_status1)
/* B497C 800C417C 94E923AC */  sw         $v1, %lo(CD_status1)($at)
.L800C4180:
/* B4980 800C4180 1000A393 */  lbu        $v1, 0x10($sp)
/* B4984 800C4184 05000224 */  addiu      $v0, $zero, 0x5
/* B4988 800C4188 1D006214 */  bne        $v1, $v0, .L800C4200
/* B498C 800C418C 00000000 */   nop
/* B4990 800C4190 0D80023C */  lui        $v0, %hi(CD_debug)
/* B4994 800C4194 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* B4998 800C4198 00000000 */  nop
/* B499C 800C419C 03004228 */  slti       $v0, $v0, 0x3
/* B49A0 800C41A0 17004014 */  bnez       $v0, .L800C4200
/* B49A4 800C41A4 00000000 */   nop
/* B49A8 800C41A8 0180043C */  lui        $a0, %hi(D_80012BBC)
/* B49AC 800C41AC 06D1010C */  jal        printf
/* B49B0 800C41B0 BC2B8424 */   addiu     $a0, $a0, %lo(D_80012BBC)
/* B49B4 800C41B4 0D80023C */  lui        $v0, %hi(CD_debug)
/* B49B8 800C41B8 8CE9428C */  lw         $v0, %lo(CD_debug)($v0)
/* B49BC 800C41BC 00000000 */  nop
/* B49C0 800C41C0 03004228 */  slti       $v0, $v0, 0x3
/* B49C4 800C41C4 0E004014 */  bnez       $v0, .L800C4200
/* B49C8 800C41C8 00000000 */   nop
/* B49CC 800C41CC 0D80023C */  lui        $v0, %hi(CD_com)
/* B49D0 800C41D0 A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B49D4 800C41D4 0D80063C */  lui        $a2, %hi(CD_status)
/* B49D8 800C41D8 90E9C68C */  lw         $a2, %lo(CD_status)($a2)
/* B49DC 800C41DC 0D80073C */  lui        $a3, %hi(CD_status1)
/* B49E0 800C41E0 94E9E78C */  lw         $a3, %lo(CD_status1)($a3)
/* B49E4 800C41E4 80100200 */  sll        $v0, $v0, 2
/* B49E8 800C41E8 0D80053C */  lui        $a1, %hi(CD_comstr)
/* B49EC 800C41EC 2128A200 */  addu       $a1, $a1, $v0
/* B49F0 800C41F0 A8E9A58C */  lw         $a1, %lo(CD_comstr)($a1)
/* B49F4 800C41F4 0180043C */  lui        $a0, %hi(D_80012BC8)
/* B49F8 800C41F8 06D1010C */  jal        printf
/* B49FC 800C41FC C82B8424 */   addiu     $a0, $a0, %lo(D_80012BC8)
.L800C4200:
/* B4A00 800C4200 1000A293 */  lbu        $v0, 0x10($sp)
/* B4A04 800C4204 00000000 */  nop
/* B4A08 800C4208 FFFF4324 */  addiu      $v1, $v0, -0x1
/* B4A0C 800C420C 0500622C */  sltiu      $v0, $v1, 0x5
/* B4A10 800C4210 BA004010 */  beqz       $v0, .L800C44FC
/* B4A14 800C4214 80100300 */   sll       $v0, $v1, 2
/* B4A18 800C4218 0180013C */  lui        $at, %hi(jtbl_80012C04)
/* B4A1C 800C421C 21082200 */  addu       $at, $at, $v0
/* B4A20 800C4220 042C228C */  lw         $v0, %lo(jtbl_80012C04)($at)
/* B4A24 800C4224 00000000 */  nop
/* B4A28 800C4228 08004000 */  jr         $v0
/* B4A2C 800C422C 00000000 */   nop
jlabel .L800C4230
/* B4A30 800C4230 12002012 */  beqz       $s1, .L800C427C
/* B4A34 800C4234 05000224 */   addiu     $v0, $zero, 0x5
/* B4A38 800C4238 0D80033C */  lui        $v1, %hi(CD_intstr + 0x238)
/* B4A3C 800C423C 60EC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x238)
/* B4A40 800C4240 000062A0 */  sb         $v0, 0x0($v1)
/* B4A44 800C4244 0E80033C */  lui        $v1, %hi(StStartFrame + 0x44)
/* B4A48 800C4248 88FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x44)
/* B4A4C 800C424C 49006010 */  beqz       $v1, .L800C4374
/* B4A50 800C4250 1800A527 */   addiu     $a1, $sp, 0x18
/* B4A54 800C4254 07000424 */  addiu      $a0, $zero, 0x7
/* B4A58 800C4258 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C425C:
/* B4A5C 800C425C 0000A290 */  lbu        $v0, 0x0($a1)
/* B4A60 800C4260 0100A524 */  addiu      $a1, $a1, 0x1
/* B4A64 800C4264 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4A68 800C4268 000062A0 */  sb         $v0, 0x0($v1)
/* B4A6C 800C426C FBFF8614 */  bne        $a0, $a2, .L800C425C
/* B4A70 800C4270 01006324 */   addiu     $v1, $v1, 0x1
/* B4A74 800C4274 47110308 */  j          .L800C451C
/* B4A78 800C4278 02000224 */   addiu     $v0, $zero, 0x2
.L800C427C:
/* B4A7C 800C427C 0D80023C */  lui        $v0, %hi(CD_com)
/* B4A80 800C4280 A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B4A84 800C4284 00000000 */  nop
/* B4A88 800C4288 80100200 */  sll        $v0, $v0, 2
/* B4A8C 800C428C 0D80013C */  lui        $at, %hi(CD_intstr + 0x20)
/* B4A90 800C4290 21082200 */  addu       $at, $at, $v0
/* B4A94 800C4294 48EA228C */  lw         $v0, %lo(CD_intstr + 0x20)($at)
/* B4A98 800C4298 00000000 */  nop
/* B4A9C 800C429C 12004010 */  beqz       $v0, .L800C42E8
/* B4AA0 800C42A0 03000224 */   addiu     $v0, $zero, 0x3
/* B4AA4 800C42A4 0D80033C */  lui        $v1, %hi(CD_intstr + 0x238)
/* B4AA8 800C42A8 60EC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x238)
/* B4AAC 800C42AC 000062A0 */  sb         $v0, 0x0($v1)
/* B4AB0 800C42B0 0E80033C */  lui        $v1, %hi(StStartFrame + 0x44)
/* B4AB4 800C42B4 88FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x44)
/* B4AB8 800C42B8 09006010 */  beqz       $v1, .L800C42E0
/* B4ABC 800C42BC 1800A527 */   addiu     $a1, $sp, 0x18
/* B4AC0 800C42C0 07000424 */  addiu      $a0, $zero, 0x7
/* B4AC4 800C42C4 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C42C8:
/* B4AC8 800C42C8 0000A290 */  lbu        $v0, 0x0($a1)
/* B4ACC 800C42CC 0100A524 */  addiu      $a1, $a1, 0x1
/* B4AD0 800C42D0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4AD4 800C42D4 000062A0 */  sb         $v0, 0x0($v1)
/* B4AD8 800C42D8 FBFF8614 */  bne        $a0, $a2, .L800C42C8
/* B4ADC 800C42DC 01006324 */   addiu     $v1, $v1, 0x1
.L800C42E0:
/* B4AE0 800C42E0 47110308 */  j          .L800C451C
/* B4AE4 800C42E4 01000224 */   addiu     $v0, $zero, 0x1
.L800C42E8:
/* B4AE8 800C42E8 0D80033C */  lui        $v1, %hi(CD_intstr + 0x238)
/* B4AEC 800C42EC 60EC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x238)
/* B4AF0 800C42F0 02000224 */  addiu      $v0, $zero, 0x2
/* B4AF4 800C42F4 000062A0 */  sb         $v0, 0x0($v1)
/* B4AF8 800C42F8 0E80033C */  lui        $v1, %hi(StStartFrame + 0x44)
/* B4AFC 800C42FC 88FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x44)
/* B4B00 800C4300 1C006010 */  beqz       $v1, .L800C4374
/* B4B04 800C4304 1800A527 */   addiu     $a1, $sp, 0x18
/* B4B08 800C4308 07000424 */  addiu      $a0, $zero, 0x7
/* B4B0C 800C430C FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C4310:
/* B4B10 800C4310 0000A290 */  lbu        $v0, 0x0($a1)
/* B4B14 800C4314 0100A524 */  addiu      $a1, $a1, 0x1
/* B4B18 800C4318 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4B1C 800C431C 000062A0 */  sb         $v0, 0x0($v1)
/* B4B20 800C4320 FBFF8614 */  bne        $a0, $a2, .L800C4310
/* B4B24 800C4324 01006324 */   addiu     $v1, $v1, 0x1
/* B4B28 800C4328 47110308 */  j          .L800C451C
/* B4B2C 800C432C 02000224 */   addiu     $v0, $zero, 0x2
jlabel .L800C4330
/* B4B30 800C4330 02002012 */  beqz       $s1, .L800C433C
/* B4B34 800C4334 02000224 */   addiu     $v0, $zero, 0x2
/* B4B38 800C4338 05000224 */  addiu      $v0, $zero, 0x5
.L800C433C:
/* B4B3C 800C433C 0D80013C */  lui        $at, %hi(CD_intstr + 0x238)
/* B4B40 800C4340 60EC22A0 */  sb         $v0, %lo(CD_intstr + 0x238)($at)
/* B4B44 800C4344 0E80033C */  lui        $v1, %hi(StStartFrame + 0x44)
/* B4B48 800C4348 88FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x44)
/* B4B4C 800C434C 09006010 */  beqz       $v1, .L800C4374
/* B4B50 800C4350 1800A527 */   addiu     $a1, $sp, 0x18
/* B4B54 800C4354 07000424 */  addiu      $a0, $zero, 0x7
/* B4B58 800C4358 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C435C:
/* B4B5C 800C435C 0000A290 */  lbu        $v0, 0x0($a1)
/* B4B60 800C4360 0100A524 */  addiu      $a1, $a1, 0x1
/* B4B64 800C4364 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4B68 800C4368 000062A0 */  sb         $v0, 0x0($v1)
/* B4B6C 800C436C FBFF8614 */  bne        $a0, $a2, .L800C435C
/* B4B70 800C4370 01006324 */   addiu     $v1, $v1, 0x1
.L800C4374:
/* B4B74 800C4374 47110308 */  j          .L800C451C
/* B4B78 800C4378 02000224 */   addiu     $v0, $zero, 0x2
jlabel .L800C437C
/* B4B7C 800C437C 04002012 */  beqz       $s1, .L800C4390
/* B4B80 800C4380 01000224 */   addiu     $v0, $zero, 0x1
/* B4B84 800C4384 02000216 */  bne        $s0, $v0, .L800C4390
/* B4B88 800C4388 00000000 */   nop
/* B4B8C 800C438C 21880000 */  addu       $s1, $zero, $zero
.L800C4390:
/* B4B90 800C4390 02002012 */  beqz       $s1, .L800C439C
/* B4B94 800C4394 01000324 */   addiu     $v1, $zero, 0x1
/* B4B98 800C4398 05000324 */  addiu      $v1, $zero, 0x5
.L800C439C:
/* B4B9C 800C439C 0D80023C */  lui        $v0, %hi(CD_intstr + 0x238)
/* B4BA0 800C43A0 60EC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x238)
/* B4BA4 800C43A4 010043A0 */  sb         $v1, 0x1($v0)
/* B4BA8 800C43A8 0E80033C */  lui        $v1, %hi(StStartFrame + 0x4C)
/* B4BAC 800C43AC 90FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x4C)
/* B4BB0 800C43B0 09006010 */  beqz       $v1, .L800C43D8
/* B4BB4 800C43B4 1800A527 */   addiu     $a1, $sp, 0x18
/* B4BB8 800C43B8 07000424 */  addiu      $a0, $zero, 0x7
/* B4BBC 800C43BC FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C43C0:
/* B4BC0 800C43C0 0000A290 */  lbu        $v0, 0x0($a1)
/* B4BC4 800C43C4 0100A524 */  addiu      $a1, $a1, 0x1
/* B4BC8 800C43C8 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4BCC 800C43CC 000062A0 */  sb         $v0, 0x0($v1)
/* B4BD0 800C43D0 FBFF8614 */  bne        $a0, $a2, .L800C43C0
/* B4BD4 800C43D4 01006324 */   addiu     $v1, $v1, 0x1
.L800C43D8:
/* B4BD8 800C43D8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B4BDC 800C43DC 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B4BE0 800C43E0 00000000 */  nop
/* B4BE4 800C43E4 000040A0 */  sb         $zero, 0x0($v0)
/* B4BE8 800C43E8 0D80033C */  lui        $v1, %hi(CD_intstr + 0x22C)
/* B4BEC 800C43EC 54EC638C */  lw         $v1, %lo(CD_intstr + 0x22C)($v1)
/* B4BF0 800C43F0 04000224 */  addiu      $v0, $zero, 0x4
/* B4BF4 800C43F4 47110308 */  j          .L800C451C
/* B4BF8 800C43F8 000060A0 */   sb        $zero, 0x0($v1)
jlabel .L800C43FC
/* B4BFC 800C43FC 0E80043C */  lui        $a0, %hi(StStartFrame + 0x54)
/* B4C00 800C4400 98FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x54)
/* B4C04 800C4404 0D80023C */  lui        $v0, %hi(CD_intstr + 0x238)
/* B4C08 800C4408 60EC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x238)
/* B4C0C 800C440C 04000324 */  addiu      $v1, $zero, 0x4
/* B4C10 800C4410 020043A0 */  sb         $v1, 0x2($v0)
/* B4C14 800C4414 02004390 */  lbu        $v1, 0x2($v0)
/* B4C18 800C4418 1800A527 */  addiu      $a1, $sp, 0x18
/* B4C1C 800C441C 010043A0 */  sb         $v1, 0x1($v0)
/* B4C20 800C4420 08008010 */  beqz       $a0, .L800C4444
/* B4C24 800C4424 07000324 */   addiu     $v1, $zero, 0x7
/* B4C28 800C4428 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C442C:
/* B4C2C 800C442C 0000A290 */  lbu        $v0, 0x0($a1)
/* B4C30 800C4430 0100A524 */  addiu      $a1, $a1, 0x1
/* B4C34 800C4434 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B4C38 800C4438 000082A0 */  sb         $v0, 0x0($a0)
/* B4C3C 800C443C FBFF6614 */  bne        $v1, $a2, .L800C442C
/* B4C40 800C4440 01008424 */   addiu     $a0, $a0, 0x1
.L800C4444:
/* B4C44 800C4444 0E80033C */  lui        $v1, %hi(StStartFrame + 0x4C)
/* B4C48 800C4448 90FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x4C)
/* B4C4C 800C444C 09006010 */  beqz       $v1, .L800C4474
/* B4C50 800C4450 1800A527 */   addiu     $a1, $sp, 0x18
/* B4C54 800C4454 07000424 */  addiu      $a0, $zero, 0x7
/* B4C58 800C4458 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C445C:
/* B4C5C 800C445C 0000A290 */  lbu        $v0, 0x0($a1)
/* B4C60 800C4460 0100A524 */  addiu      $a1, $a1, 0x1
/* B4C64 800C4464 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4C68 800C4468 000062A0 */  sb         $v0, 0x0($v1)
/* B4C6C 800C446C FBFF8614 */  bne        $a0, $a2, .L800C445C
/* B4C70 800C4470 01006324 */   addiu     $v1, $v1, 0x1
.L800C4474:
/* B4C74 800C4474 47110308 */  j          .L800C451C
/* B4C78 800C4478 04000224 */   addiu     $v0, $zero, 0x4
jlabel .L800C447C
/* B4C7C 800C447C 0E80043C */  lui        $a0, %hi(StStartFrame + 0x44)
/* B4C80 800C4480 88FD8424 */  addiu      $a0, $a0, %lo(StStartFrame + 0x44)
/* B4C84 800C4484 0D80023C */  lui        $v0, %hi(CD_intstr + 0x238)
/* B4C88 800C4488 60EC4224 */  addiu      $v0, $v0, %lo(CD_intstr + 0x238)
/* B4C8C 800C448C 05000324 */  addiu      $v1, $zero, 0x5
/* B4C90 800C4490 010043A0 */  sb         $v1, 0x1($v0)
/* B4C94 800C4494 01004390 */  lbu        $v1, 0x1($v0)
/* B4C98 800C4498 1800A527 */  addiu      $a1, $sp, 0x18
/* B4C9C 800C449C 000043A0 */  sb         $v1, 0x0($v0)
/* B4CA0 800C44A0 08008010 */  beqz       $a0, .L800C44C4
/* B4CA4 800C44A4 07000324 */   addiu     $v1, $zero, 0x7
/* B4CA8 800C44A8 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C44AC:
/* B4CAC 800C44AC 0000A290 */  lbu        $v0, 0x0($a1)
/* B4CB0 800C44B0 0100A524 */  addiu      $a1, $a1, 0x1
/* B4CB4 800C44B4 FFFF6324 */  addiu      $v1, $v1, -0x1
/* B4CB8 800C44B8 000082A0 */  sb         $v0, 0x0($a0)
/* B4CBC 800C44BC FBFF6614 */  bne        $v1, $a2, .L800C44AC
/* B4CC0 800C44C0 01008424 */   addiu     $a0, $a0, 0x1
.L800C44C4:
/* B4CC4 800C44C4 0E80033C */  lui        $v1, %hi(StStartFrame + 0x4C)
/* B4CC8 800C44C8 90FD6324 */  addiu      $v1, $v1, %lo(StStartFrame + 0x4C)
/* B4CCC 800C44CC 09006010 */  beqz       $v1, .L800C44F4
/* B4CD0 800C44D0 1800A527 */   addiu     $a1, $sp, 0x18
/* B4CD4 800C44D4 07000424 */  addiu      $a0, $zero, 0x7
/* B4CD8 800C44D8 FFFF0624 */  addiu      $a2, $zero, -0x1
.L800C44DC:
/* B4CDC 800C44DC 0000A290 */  lbu        $v0, 0x0($a1)
/* B4CE0 800C44E0 0100A524 */  addiu      $a1, $a1, 0x1
/* B4CE4 800C44E4 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B4CE8 800C44E8 000062A0 */  sb         $v0, 0x0($v1)
/* B4CEC 800C44EC FBFF8614 */  bne        $a0, $a2, .L800C44DC
/* B4CF0 800C44F0 01006324 */   addiu     $v1, $v1, 0x1
.L800C44F4:
/* B4CF4 800C44F4 47110308 */  j          .L800C451C
/* B4CF8 800C44F8 06000224 */   addiu     $v0, $zero, 0x6
.L800C44FC:
/* B4CFC 800C44FC 0180043C */  lui        $a0, %hi(D_80012BE4)
/* B4D00 800C4500 9901030C */  jal        puts
/* B4D04 800C4504 E42B8424 */   addiu     $a0, $a0, %lo(D_80012BE4)
/* B4D08 800C4508 1000A593 */  lbu        $a1, 0x10($sp)
/* B4D0C 800C450C 0180043C */  lui        $a0, %hi(D_80012BF8)
/* B4D10 800C4510 06D1010C */  jal        printf
/* B4D14 800C4514 F82B8424 */   addiu     $a0, $a0, %lo(D_80012BF8)
.L800C4518:
/* B4D18 800C4518 21100000 */  addu       $v0, $zero, $zero
.L800C451C:
/* B4D1C 800C451C 2800BF8F */  lw         $ra, 0x28($sp)
/* B4D20 800C4520 2400B18F */  lw         $s1, 0x24($sp)
/* B4D24 800C4524 2000B08F */  lw         $s0, 0x20($sp)
/* B4D28 800C4528 0800E003 */  jr         $ra
/* B4D2C 800C452C 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800C3FCC, . - func_800C3FCC
