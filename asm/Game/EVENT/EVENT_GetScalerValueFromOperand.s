.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetScalerValueFromOperand
/* 5918C 8006898C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 59190 80068990 1000BFAF */  sw         $ra, 0x10($sp)
/* 59194 80068994 0000A0AC */  sw         $zero, 0x0($a1)
/* 59198 80068998 0000C0A4 */  sh         $zero, 0x0($a2)
/* 5919C 8006899C 0000828C */  lw         $v0, 0x0($a0)
/* 591A0 800689A0 00000000 */  nop
/* 591A4 800689A4 FFFF4324 */  addiu      $v1, $v0, -0x1
/* 591A8 800689A8 1C00622C */  sltiu      $v0, $v1, 0x1C
/* 591AC 800689AC 4F004010 */  beqz       $v0, .L80068AEC
/* 591B0 800689B0 FF7F0524 */   addiu     $a1, $zero, 0x7FFF
/* 591B4 800689B4 0180023C */  lui        $v0, %hi(jtbl_80011BF0)
/* 591B8 800689B8 F01B4224 */  addiu      $v0, $v0, %lo(jtbl_80011BF0)
/* 591BC 800689BC 80180300 */  sll        $v1, $v1, 2
/* 591C0 800689C0 21186200 */  addu       $v1, $v1, $v0
/* 591C4 800689C4 0000628C */  lw         $v0, 0x0($v1)
/* 591C8 800689C8 00000000 */  nop
/* 591CC 800689CC 08004000 */  jr         $v0
/* 591D0 800689D0 00000000 */   nop
jlabel .L800689D4
/* 591D4 800689D4 789C010C */  jal        EVENT_GetInstanceValue
/* 591D8 800689D8 04008424 */   addiu     $a0, $a0, 0x4
/* 591DC 800689DC BBA20108 */  j          .L80068AEC
/* 591E0 800689E0 21284000 */   addu      $a1, $v0, $zero
jlabel .L800689E4
/* 591E4 800689E4 04008384 */  lh         $v1, 0x4($a0)
/* 591E8 800689E8 01000224 */  addiu      $v0, $zero, 0x1
/* 591EC 800689EC 03006214 */  bne        $v1, $v0, .L800689FC
/* 591F0 800689F0 00000000 */   nop
jlabel .L800689F4
/* 591F4 800689F4 BBA20108 */  j          .L80068AEC
/* 591F8 800689F8 21280000 */   addu      $a1, $zero, $zero
.L800689FC:
/* 591FC 800689FC 7197010C */  jal        EVENT_GetSoundValue
/* 59200 80068A00 04008424 */   addiu     $a0, $a0, 0x4
/* 59204 80068A04 BBA20108 */  j          .L80068AEC
/* 59208 80068A08 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068A0C
/* 5920C 80068A0C 0400828C */  lw         $v0, 0x4($a0)
/* 59210 80068A10 00000000 */  nop
/* 59214 80068A14 00004584 */  lh         $a1, 0x0($v0)
/* 59218 80068A18 BBA20108 */  j          .L80068AEC
/* 5921C 80068A1C 00000000 */   nop
jlabel .L80068A20
/* 59220 80068A20 0400828C */  lw         $v0, 0x4($a0)
/* 59224 80068A24 00000000 */  nop
/* 59228 80068A28 00004590 */  lbu        $a1, 0x0($v0)
/* 5922C 80068A2C BBA20108 */  j          .L80068AEC
/* 59230 80068A30 00000000 */   nop
jlabel .L80068A34
/* 59234 80068A34 0400828C */  lw         $v0, 0x4($a0)
/* 59238 80068A38 00000000 */  nop
/* 5923C 80068A3C 0000458C */  lw         $a1, 0x0($v0)
/* 59240 80068A40 BBA20108 */  j          .L80068AEC
/* 59244 80068A44 00000000 */   nop
jlabel .L80068A48
/* 59248 80068A48 E79C010C */  jal        EVENT_GetSplineValue
/* 5924C 80068A4C 04008424 */   addiu     $a0, $a0, 0x4
/* 59250 80068A50 BBA20108 */  j          .L80068AEC
/* 59254 80068A54 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068A58
/* 59258 80068A58 0C008294 */  lhu        $v0, 0xC($a0)
/* 5925C 80068A5C 0400858C */  lw         $a1, 0x4($a0)
/* 59260 80068A60 BBA20108 */  j          .L80068AEC
/* 59264 80068A64 0000C2A4 */   sh        $v0, 0x0($a2)
jlabel .L80068A68
/* 59268 80068A68 159C010C */  jal        EVENT_GetIntroValue
/* 5926C 80068A6C 04008424 */   addiu     $a0, $a0, 0x4
/* 59270 80068A70 BBA20108 */  j          .L80068AEC
/* 59274 80068A74 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068A78
/* 59278 80068A78 529D010C */  jal        EVENT_GetAnimateValue
/* 5927C 80068A7C 04008424 */   addiu     $a0, $a0, 0x4
/* 59280 80068A80 BBA20108 */  j          .L80068AEC
/* 59284 80068A84 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068A88
/* 59288 80068A88 269D010C */  jal        EVENT_GetAnimateTextureValue
/* 5928C 80068A8C 04008424 */   addiu     $a0, $a0, 0x4
/* 59290 80068A90 BBA20108 */  j          .L80068AEC
/* 59294 80068A94 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068A98
/* 59298 80068A98 DA94010C */  jal        EVENT_GetTGroupValue
/* 5929C 80068A9C 04008424 */   addiu     $a0, $a0, 0x4
/* 592A0 80068AA0 BBA20108 */  j          .L80068AEC
/* 592A4 80068AA4 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068AA8
/* 592A8 80068AA8 0400828C */  lw         $v0, 0x4($a0)
/* 592AC 80068AAC 00000000 */  nop
/* 592B0 80068AB0 70014584 */  lh         $a1, 0x170($v0)
/* 592B4 80068AB4 00000000 */  nop
/* 592B8 80068AB8 0100A224 */  addiu      $v0, $a1, 0x1
/* 592BC 80068ABC 0300422C */  sltiu      $v0, $v0, 0x3
/* 592C0 80068AC0 BBA20108 */  j          .L80068AEC
/* 592C4 80068AC4 01004538 */   xori      $a1, $v0, 0x1
jlabel .L80068AC8
/* 592C8 80068AC8 868E010C */  jal        EVENT_GetVMObjectValue
/* 592CC 80068ACC 04008424 */   addiu     $a0, $a0, 0x4
/* 592D0 80068AD0 BBA20108 */  j          .L80068AEC
/* 592D4 80068AD4 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068AD8
/* 592D8 80068AD8 428B010C */  jal        EVENT_GetGameValue
/* 592DC 80068ADC 04008424 */   addiu     $a0, $a0, 0x4
/* 592E0 80068AE0 BBA20108 */  j          .L80068AEC
/* 592E4 80068AE4 21284000 */   addu      $a1, $v0, $zero
jlabel .L80068AE8
/* 592E8 80068AE8 0C00858C */  lw         $a1, 0xC($a0)
jlabel .L80068AEC
/* 592EC 80068AEC 1000BF8F */  lw         $ra, 0x10($sp)
/* 592F0 80068AF0 2110A000 */  addu       $v0, $a1, $zero
/* 592F4 80068AF4 0800E003 */  jr         $ra
/* 592F8 80068AF8 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_GetScalerValueFromOperand, . - EVENT_GetScalerValueFromOperand
