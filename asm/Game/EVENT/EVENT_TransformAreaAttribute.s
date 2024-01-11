.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformAreaAttribute
/* 53A24 80063224 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 53A28 80063228 1000BFAF */  sw         $ra, 0x10($sp)
/* 53A2C 8006322C 0400A88C */  lw         $t0, 0x4($a1)
/* 53A30 80063230 00000000 */  nop
/* 53A34 80063234 05000015 */  bnez       $t0, .L8006324C
/* 53A38 80063238 21180000 */   addu      $v1, $zero, $zero
/* 53A3C 8006323C 01000224 */  addiu      $v0, $zero, 0x1
/* 53A40 80063240 58A482A7 */  sh         $v0, %gp_rel(EventAbortLine)($gp)
/* 53A44 80063244 BC8C0108 */  j          .L800632F0
/* 53A48 80063248 01000324 */   addiu     $v1, $zero, 0x1
.L8006324C:
/* 53A4C 8006324C 41000224 */  addiu      $v0, $zero, 0x41
/* 53A50 80063250 1D00C210 */  beq        $a2, $v0, .L800632C8
/* 53A54 80063254 4200C228 */   slti      $v0, $a2, 0x42
/* 53A58 80063258 05004010 */  beqz       $v0, .L80063270
/* 53A5C 8006325C 03000224 */   addiu     $v0, $zero, 0x3
/* 53A60 80063260 0A00C210 */  beq        $a2, $v0, .L8006328C
/* 53A64 80063264 01000224 */   addiu     $v0, $zero, 0x1
/* 53A68 80063268 BC8C0108 */  j          .L800632F0
/* 53A6C 8006326C 00000000 */   nop
.L80063270:
/* 53A70 80063270 7200C228 */  slti       $v0, $a2, 0x72
/* 53A74 80063274 1E004010 */  beqz       $v0, .L800632F0
/* 53A78 80063278 7000C228 */   slti      $v0, $a2, 0x70
/* 53A7C 8006327C 1C004014 */  bnez       $v0, .L800632F0
/* 53A80 80063280 00000000 */   nop
/* 53A84 80063284 BB8C0108 */  j          .L800632EC
/* 53A88 80063288 0800A6AC */   sw        $a2, 0x8($a1)
.L8006328C:
/* 53A8C 8006328C 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53A90 80063290 0200E584 */  lh         $a1, 0x2($a3)
/* 53A94 80063294 00000000 */  nop
/* 53A98 80063298 0600A22C */  sltiu      $v0, $a1, 0x6
/* 53A9C 8006329C 14004010 */  beqz       $v0, .L800632F0
/* 53AA0 800632A0 00000000 */   nop
/* 53AA4 800632A4 40280500 */  sll        $a1, $a1, 1
/* 53AA8 800632A8 2400A524 */  addiu      $a1, $a1, 0x24
/* 53AAC 800632AC 0000828C */  lw         $v0, 0x0($a0)
/* 53AB0 800632B0 21280501 */  addu       $a1, $t0, $a1
/* 53AB4 800632B4 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53AB8 800632B8 6F88010C */  jal        EVENT_AddShortPointerToStack
/* 53ABC 800632BC 000082AC */   sw        $v0, 0x0($a0)
/* 53AC0 800632C0 BC8C0108 */  j          .L800632F0
/* 53AC4 800632C4 01000324 */   addiu     $v1, $zero, 0x1
.L800632C8:
/* 53AC8 800632C8 0000828C */  lw         $v0, 0x0($a0)
/* 53ACC 800632CC 00000000 */  nop
/* 53AD0 800632D0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 53AD4 800632D4 000082AC */  sw         $v0, 0x0($a0)
/* 53AD8 800632D8 0800058D */  lw         $a1, 0x8($t0)
/* 53ADC 800632DC 6F88010C */  jal        EVENT_AddShortPointerToStack
/* 53AE0 800632E0 3800A524 */   addiu     $a1, $a1, 0x38
/* 53AE4 800632E4 BC8C0108 */  j          .L800632F0
/* 53AE8 800632E8 01000324 */   addiu     $v1, $zero, 0x1
.L800632EC:
/* 53AEC 800632EC 01000324 */  addiu      $v1, $zero, 0x1
.L800632F0:
/* 53AF0 800632F0 1000BF8F */  lw         $ra, 0x10($sp)
/* 53AF4 800632F4 21106000 */  addu       $v0, $v1, $zero
/* 53AF8 800632F8 0800E003 */  jr         $ra
/* 53AFC 800632FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformAreaAttribute, . - EVENT_TransformAreaAttribute
