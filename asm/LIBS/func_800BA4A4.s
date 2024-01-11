.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA4A4
/* AACA4 800BA4A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AACA8 800BA4A8 21408000 */  addu       $t0, $a0, $zero
/* AACAC 800BA4AC 1800B0AF */  sw         $s0, 0x18($sp)
/* AACB0 800BA4B0 0D80043C */  lui        $a0, %hi(GEnv + 0x2)
/* AACB4 800BA4B4 0EDA8424 */  addiu      $a0, $a0, %lo(GEnv + 0x2)
/* AACB8 800BA4B8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* AACBC 800BA4BC 00008390 */  lbu        $v1, 0x0($a0)
/* AACC0 800BA4C0 01000224 */  addiu      $v0, $zero, 0x1
/* AACC4 800BA4C4 06006210 */  beq        $v1, $v0, .L800BA4E0
/* AACC8 800BA4C8 2180A000 */   addu      $s0, $a1, $zero
/* AACCC 800BA4CC 02000224 */  addiu      $v0, $zero, 0x2
/* AACD0 800BA4D0 26006210 */  beq        $v1, $v0, .L800BA56C
/* AACD4 800BA4D4 00000000 */   nop
/* AACD8 800BA4D8 6CE90208 */  j          .L800BA5B0
/* AACDC 800BA4DC 00000000 */   nop
.L800BA4E0:
/* AACE0 800BA4E0 04000586 */  lh         $a1, 0x4($s0)
/* AACE4 800BA4E4 02008384 */  lh         $v1, 0x2($a0)
/* AACE8 800BA4E8 00000000 */  nop
/* AACEC 800BA4EC 2A106500 */  slt        $v0, $v1, $a1
/* AACF0 800BA4F0 1B004014 */  bnez       $v0, .L800BA560
/* AACF4 800BA4F4 00000000 */   nop
/* AACF8 800BA4F8 00000786 */  lh         $a3, 0x0($s0)
/* AACFC 800BA4FC 00000000 */  nop
/* AAD00 800BA500 2110A700 */  addu       $v0, $a1, $a3
/* AAD04 800BA504 2A106200 */  slt        $v0, $v1, $v0
/* AAD08 800BA508 15004014 */  bnez       $v0, .L800BA560
/* AAD0C 800BA50C 00000000 */   nop
/* AAD10 800BA510 02000386 */  lh         $v1, 0x2($s0)
/* AAD14 800BA514 04008484 */  lh         $a0, 0x4($a0)
/* AAD18 800BA518 00000000 */  nop
/* AAD1C 800BA51C 2A108300 */  slt        $v0, $a0, $v1
/* AAD20 800BA520 0F004014 */  bnez       $v0, .L800BA560
/* AAD24 800BA524 00000000 */   nop
/* AAD28 800BA528 06000686 */  lh         $a2, 0x6($s0)
/* AAD2C 800BA52C 00000000 */  nop
/* AAD30 800BA530 21106600 */  addu       $v0, $v1, $a2
/* AAD34 800BA534 2A108200 */  slt        $v0, $a0, $v0
/* AAD38 800BA538 09004014 */  bnez       $v0, .L800BA560
/* AAD3C 800BA53C 00000000 */   nop
/* AAD40 800BA540 0700A018 */  blez       $a1, .L800BA560
/* AAD44 800BA544 00000000 */   nop
/* AAD48 800BA548 0500E004 */  bltz       $a3, .L800BA560
/* AAD4C 800BA54C 00000000 */   nop
/* AAD50 800BA550 03006004 */  bltz       $v1, .L800BA560
/* AAD54 800BA554 00000000 */   nop
/* AAD58 800BA558 1500C01C */  bgtz       $a2, .L800BA5B0
/* AAD5C 800BA55C 00000000 */   nop
.L800BA560:
/* AAD60 800BA560 0180043C */  lui        $a0, %hi(D_80012634)
/* AAD64 800BA564 5DE90208 */  j          .L800BA574
/* AAD68 800BA568 34268424 */   addiu     $a0, $a0, %lo(D_80012634)
.L800BA56C:
/* AAD6C 800BA56C 0180043C */  lui        $a0, %hi(D_80012654)
/* AAD70 800BA570 54268424 */  addiu      $a0, $a0, %lo(D_80012654)
.L800BA574:
/* AAD74 800BA574 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAD78 800BA578 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AAD7C 800BA57C 00000000 */  nop
/* AAD80 800BA580 09F84000 */  jalr       $v0
/* AAD84 800BA584 21280001 */   addu      $a1, $t0, $zero
/* AAD88 800BA588 00000586 */  lh         $a1, 0x0($s0)
/* AAD8C 800BA58C 02000686 */  lh         $a2, 0x2($s0)
/* AAD90 800BA590 04000786 */  lh         $a3, 0x4($s0)
/* AAD94 800BA594 06000386 */  lh         $v1, 0x6($s0)
/* AAD98 800BA598 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AAD9C 800BA59C 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AADA0 800BA5A0 0180043C */  lui        $a0, %hi(D_80012640)
/* AADA4 800BA5A4 40268424 */  addiu      $a0, $a0, %lo(D_80012640)
/* AADA8 800BA5A8 09F84000 */  jalr       $v0
/* AADAC 800BA5AC 1000A3AF */   sw        $v1, 0x10($sp)
.L800BA5B0:
/* AADB0 800BA5B0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* AADB4 800BA5B4 1800B08F */  lw         $s0, 0x18($sp)
/* AADB8 800BA5B8 0800E003 */  jr         $ra
/* AADBC 800BA5BC 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BA4A4, . - func_800BA4A4
