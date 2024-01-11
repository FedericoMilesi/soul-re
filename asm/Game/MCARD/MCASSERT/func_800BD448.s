.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD448
/* ADC48 800BD448 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* ADC4C 800BD44C 1400B1AF */  sw         $s1, 0x14($sp)
/* ADC50 800BD450 21888000 */  addu       $s1, $a0, $zero
/* ADC54 800BD454 1800B2AF */  sw         $s2, 0x18($sp)
/* ADC58 800BD458 1C00BFAF */  sw         $ra, 0x1C($sp)
/* ADC5C 800BD45C 1000B0AF */  sw         $s0, 0x10($sp)
/* ADC60 800BD460 0D80013C */  lui        $at, %hi(_padIntExec)
/* ADC64 800BD464 3CE920AC */  sw         $zero, %lo(_padIntExec)($at)
/* ADC68 800BD468 0D80013C */  lui        $at, %hi(_padModeMtap)
/* ADC6C 800BD46C 50E920AC */  sw         $zero, %lo(_padModeMtap)($at)
/* ADC70 800BD470 0E0C030C */  jal        func_800C3038
/* ADC74 800BD474 2190A000 */   addu      $s2, $a1, $zero
/* ADC78 800BD478 0E80103C */  lui        $s0, %hi(GsOUT_PACKET_P_dup1 + 0xA0)
/* ADC7C 800BD47C 08D71026 */  addiu      $s0, $s0, %lo(GsOUT_PACKET_P_dup1 + 0xA0)
/* ADC80 800BD480 0C80023C */  lui        $v0, %hi(func_800BD610)
/* ADC84 800BD484 10D64224 */  addiu      $v0, $v0, %lo(func_800BD610)
/* ADC88 800BD488 0D80013C */  lui        $at, %hi(_padFuncNextPort)
/* ADC8C 800BD48C 04E922AC */  sw         $v0, %lo(_padFuncNextPort)($at)
/* ADC90 800BD490 0C80023C */  lui        $v0, %hi(func_800BD5A8)
/* ADC94 800BD494 A8D54224 */  addiu      $v0, $v0, %lo(func_800BD5A8)
/* ADC98 800BD498 0D80013C */  lui        $at, %hi(_padFuncClrInfo)
/* ADC9C 800BD49C 08E922AC */  sw         $v0, %lo(_padFuncClrInfo)($at)
/* ADCA0 800BD4A0 0C80023C */  lui        $v0, %hi(func_800BD714)
/* ADCA4 800BD4A4 14D74224 */  addiu      $v0, $v0, %lo(func_800BD714)
/* ADCA8 800BD4A8 0D80013C */  lui        $at, %hi(_padFuncGetTxd)
/* ADCAC 800BD4AC 0CE922AC */  sw         $v0, %lo(_padFuncGetTxd)($at)
/* ADCB0 800BD4B0 0C80023C */  lui        $v0, %hi(func_800BD7D0)
/* ADCB4 800BD4B4 D0D74224 */  addiu      $v0, $v0, %lo(func_800BD7D0)
/* ADCB8 800BD4B8 0D80013C */  lui        $at, %hi(_padFuncCurrLimit)
/* ADCBC 800BD4BC 10E922AC */  sw         $v0, %lo(_padFuncCurrLimit)($at)
/* ADCC0 800BD4C0 0C80023C */  lui        $v0, %hi(func_800BDA4C)
/* ADCC4 800BD4C4 4CDA4224 */  addiu      $v0, $v0, %lo(func_800BDA4C)
/* ADCC8 800BD4C8 0D80013C */  lui        $at, %hi(_padFuncPtr2Port)
/* ADCCC 800BD4CC 14E922AC */  sw         $v0, %lo(_padFuncPtr2Port)($at)
/* ADCD0 800BD4D0 0C80023C */  lui        $v0, %hi(func_800BDA84)
/* ADCD4 800BD4D4 84DA4224 */  addiu      $v0, $v0, %lo(func_800BDA84)
/* ADCD8 800BD4D8 0D80013C */  lui        $at, %hi(_padFuncPort2Info)
/* ADCDC 800BD4DC 18E922AC */  sw         $v0, %lo(_padFuncPort2Info)($at)
/* ADCE0 800BD4E0 0C80023C */  lui        $v0, %hi(func_800BD704)
/* ADCE4 800BD4E4 04D74224 */  addiu      $v0, $v0, %lo(func_800BD704)
/* ADCE8 800BD4E8 21200002 */  addu       $a0, $s0, $zero
/* ADCEC 800BD4EC 0D80013C */  lui        $at, %hi(_padInfoDir)
/* ADCF0 800BD4F0 38E930AC */  sw         $s0, %lo(_padInfoDir)($at)
/* ADCF4 800BD4F4 0D80013C */  lui        $at, %hi(_padFuncClrCmdNo)
/* ADCF8 800BD4F8 28E922AC */  sw         $v0, %lo(_padFuncClrCmdNo)($at)
/* ADCFC 800BD4FC 3E0D030C */  jal        func_800C34F8
/* ADD00 800BD500 E0010524 */   addiu     $a1, $zero, 0x1E0
/* ADD04 800BD504 21400000 */  addu       $t0, $zero, $zero
/* ADD08 800BD508 FF000924 */  addiu      $t1, $zero, 0xFF
/* ADD0C 800BD50C 40000426 */  addiu      $a0, $s0, 0x40
/* ADD10 800BD510 0E80073C */  lui        $a3, %hi(GsOUT_PACKET_P_dup1 + 0x58)
/* ADD14 800BD514 C0D6E724 */  addiu      $a3, $a3, %lo(GsOUT_PACKET_P_dup1 + 0x58)
/* ADD18 800BD518 0E80063C */  lui        $a2, %hi(GsOUT_PACKET_P_dup1 + 0x10)
/* ADD1C 800BD51C 78D6C624 */  addiu      $a2, $a2, %lo(GsOUT_PACKET_P_dup1 + 0x10)
/* ADD20 800BD520 300011AE */  sw         $s1, 0x30($s0)
/* ADD24 800BD524 200112AE */  sw         $s2, 0x120($s0)
.L800BD528:
/* ADD28 800BD528 F0FF828C */  lw         $v0, -0x10($a0)
/* ADD2C 800BD52C 5D000526 */  addiu      $a1, $s0, 0x5D
/* ADD30 800BD530 CCFF80AC */  sw         $zero, -0x34($a0)
/* ADD34 800BD534 D0FF90AC */  sw         $s0, -0x30($a0)
/* ADD38 800BD538 000049A0 */  sb         $t1, 0x0($v0)
/* ADD3C 800BD53C F0FF828C */  lw         $v0, -0x10($a0)
/* ADD40 800BD540 05000324 */  addiu      $v1, $zero, 0x5
/* ADD44 800BD544 010040A0 */  sb         $zero, 0x1($v0)
/* ADD48 800BD548 FCFF86AC */  sw         $a2, -0x4($a0)
/* ADD4C 800BD54C 000087AC */  sw         $a3, 0x0($a0)
.L800BD550:
/* ADD50 800BD550 0000A9A0 */  sb         $t1, 0x0($a1)
/* ADD54 800BD554 FFFF6324 */  addiu      $v1, $v1, -0x1
/* ADD58 800BD558 FDFF6104 */  bgez       $v1, .L800BD550
/* ADD5C 800BD55C 0100A524 */   addiu     $a1, $a1, 0x1
/* ADD60 800BD560 2300E724 */  addiu      $a3, $a3, 0x23
/* ADD64 800BD564 2300C624 */  addiu      $a2, $a2, 0x23
/* ADD68 800BD568 01000825 */  addiu      $t0, $t0, 0x1
/* ADD6C 800BD56C F0008424 */  addiu      $a0, $a0, 0xF0
/* ADD70 800BD570 02000229 */  slti       $v0, $t0, 0x2
/* ADD74 800BD574 ECFF4014 */  bnez       $v0, .L800BD528
/* ADD78 800BD578 F0001026 */   addiu     $s0, $s0, 0xF0
/* ADD7C 800BD57C E508030C */  jal        func_800C2394
/* ADD80 800BD580 00000000 */   nop
/* ADD84 800BD584 01000224 */  addiu      $v0, $zero, 0x1
/* ADD88 800BD588 0D80013C */  lui        $at, %hi(_padIntExec)
/* ADD8C 800BD58C 3CE922AC */  sw         $v0, %lo(_padIntExec)($at)
/* ADD90 800BD590 1C00BF8F */  lw         $ra, 0x1C($sp)
/* ADD94 800BD594 1800B28F */  lw         $s2, 0x18($sp)
/* ADD98 800BD598 1400B18F */  lw         $s1, 0x14($sp)
/* ADD9C 800BD59C 1000B08F */  lw         $s0, 0x10($sp)
/* ADDA0 800BD5A0 0800E003 */  jr         $ra
/* ADDA4 800BD5A4 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BD448, . - func_800BD448
