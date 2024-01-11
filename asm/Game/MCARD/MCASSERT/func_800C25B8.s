.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C25B8
/* B2DB8 800C25B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2DBC 800C25BC 1400BFAF */  sw         $ra, 0x14($sp)
/* B2DC0 800C25C0 1000B0AF */  sw         $s0, 0x10($sp)
/* B2DC4 800C25C4 0D80013C */  lui        $at, %hi(_padIntExec)
/* B2DC8 800C25C8 A5FC020C */  jal        func_800BF294
/* B2DCC 800C25CC 3CE920AC */   sw        $zero, %lo(_padIntExec)($at)
/* B2DD0 800C25D0 02000424 */  addiu      $a0, $zero, 0x2
/* B2DD4 800C25D4 0E80103C */  lui        $s0, %hi(StStartFrame + 0x14)
/* B2DD8 800C25D8 58FD1026 */  addiu      $s0, $s0, %lo(StStartFrame + 0x14)
/* B2DDC 800C25DC 541E030C */  jal        func_800C7950
/* B2DE0 800C25E0 21280002 */   addu      $a1, $s0, $zero
/* B2DE4 800C25E4 02000424 */  addiu      $a0, $zero, 0x2
/* B2DE8 800C25E8 581E030C */  jal        func_800C7960
/* B2DEC 800C25EC 21280002 */   addu      $a1, $s0, $zero
/* B2DF0 800C25F0 03000424 */  addiu      $a0, $zero, 0x3
/* B2DF4 800C25F4 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B2DF8 800C25F8 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B2DFC 800C25FC FEFF0224 */  addiu      $v0, $zero, -0x2
/* B2E00 800C2600 000062AC */  sw         $v0, 0x0($v1)
/* B2E04 800C2604 0400628C */  lw         $v0, 0x4($v1)
/* B2E08 800C2608 21280000 */  addu       $a1, $zero, $zero
/* B2E0C 800C260C 01004234 */  ori        $v0, $v0, 0x1
/* B2E10 800C2610 CC08030C */  jal        func_800C2330
/* B2E14 800C2614 040062AC */   sw        $v0, 0x4($v1)
/* B2E18 800C2618 11FC020C */  jal        func_800BF044
/* B2E1C 800C261C 00000000 */   nop
/* B2E20 800C2620 0D80043C */  lui        $a0, %hi(_padInfoDir)
/* B2E24 800C2624 38E9848C */  lw         $a0, %lo(_padInfoDir)($a0)
/* B2E28 800C2628 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B2E2C 800C262C 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B2E30 800C2630 00000000 */  nop
/* B2E34 800C2634 09F84000 */  jalr       $v0
/* B2E38 800C2638 00000000 */   nop
/* B2E3C 800C263C 0D80043C */  lui        $a0, %hi(_padInfoDir)
/* B2E40 800C2640 38E9848C */  lw         $a0, %lo(_padInfoDir)($a0)
/* B2E44 800C2644 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B2E48 800C2648 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B2E4C 800C264C 00000000 */  nop
/* B2E50 800C2650 09F84000 */  jalr       $v0
/* B2E54 800C2654 F0008424 */   addiu     $a0, $a0, 0xF0
/* B2E58 800C2658 0E80023C */  lui        $v0, %hi(StStartFrame + 0x24)
/* B2E5C 800C265C 68FD4224 */  addiu      $v0, $v0, %lo(StStartFrame + 0x24)
/* B2E60 800C2660 040040AC */  sw         $zero, 0x4($v0)
/* B2E64 800C2664 000040AC */  sw         $zero, 0x0($v0)
/* B2E68 800C2668 01000224 */  addiu      $v0, $zero, 0x1
/* B2E6C 800C266C 0D80013C */  lui        $at, %hi(_padIntExec)
/* B2E70 800C2670 3CE922AC */  sw         $v0, %lo(_padIntExec)($at)
/* B2E74 800C2674 1400BF8F */  lw         $ra, 0x14($sp)
/* B2E78 800C2678 1000B08F */  lw         $s0, 0x10($sp)
/* B2E7C 800C267C 0800E003 */  jr         $ra
/* B2E80 800C2680 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C25B8, . - func_800C25B8
