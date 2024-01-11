.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800789C4
/* 691C4 800789C4 801F023C */  lui        $v0, (0x1F800024 >> 16)
/* 691C8 800789C8 00005FAC */  sw         $ra, (0x1F800000 & 0xFFFF)($v0)
/* 691CC 800789CC 040050AC */  sw         $s0, (0x1F800004 & 0xFFFF)($v0)
/* 691D0 800789D0 080051AC */  sw         $s1, (0x1F800008 & 0xFFFF)($v0)
/* 691D4 800789D4 0C0052AC */  sw         $s2, (0x1F80000C & 0xFFFF)($v0)
/* 691D8 800789D8 100053AC */  sw         $s3, (0x1F800010 & 0xFFFF)($v0)
/* 691DC 800789DC 140054AC */  sw         $s4, (0x1F800014 & 0xFFFF)($v0)
/* 691E0 800789E0 180055AC */  sw         $s5, (0x1F800018 & 0xFFFF)($v0)
/* 691E4 800789E4 1C0056AC */  sw         $s6, (0x1F80001C & 0xFFFF)($v0)
/* 691E8 800789E8 200057AC */  sw         $s7, (0x1F800020 & 0xFFFF)($v0)
/* 691EC 800789EC 24005EAC */  sw         $fp, (0x1F800024 & 0xFFFF)($v0)
/* 691F0 800789F0 0800918C */  lw         $s1, 0x8($a0)
/* 691F4 800789F4 0C00908C */  lw         $s0, 0xC($a0)
/* 691F8 800789F8 17002012 */  beqz       $s1, .L80078A58
/* 691FC 800789FC 21B88000 */   addu      $s7, $a0, $zero
.L80078A00:
/* 69200 80078A00 0000128E */  lw         $s2, 0x0($s0)
/* 69204 80078A04 0C00138E */  lw         $s3, 0xC($s0)
/* 69208 80078A08 02004232 */  andi       $v0, $s2, 0x2
/* 6920C 80078A0C 0F004014 */  bnez       $v0, .L80078A4C
/* 69210 80078A10 00000000 */   nop
/* 69214 80078A14 2400048E */  lw         $a0, 0x24($s0)
/* 69218 80078A18 00000000 */  nop
/* 6921C 80078A1C 0000948C */  lw         $s4, 0x0($a0)
/* 69220 80078A20 01007326 */  addiu      $s3, $s3, 0x1
/* 69224 80078A24 2A087402 */  slt        $at, $s3, $s4
/* 69228 80078A28 02002014 */  bnez       $at, .L80078A34
/* 6922C 80078A2C 00000000 */   nop
/* 69230 80078A30 21980000 */  addu       $s3, $zero, $zero
.L80078A34:
/* 69234 80078A34 A2E2010C */  jal        func_80078A88
/* 69238 80078A38 10000422 */   addi      $a0, $s0, 0x10 # handwritten instruction
/* 6923C 80078A3C 03004010 */  beqz       $v0, .L80078A4C
/* 69240 80078A40 0C0013AE */   sw        $s3, 0xC($s0)
/* 69244 80078A44 16E1010C */  jal        func_80078458
/* 69248 80078A48 00000000 */   nop
.L80078A4C:
/* 6924C 80078A4C FFFF3122 */  addi       $s1, $s1, -0x1 # handwritten instruction
/* 69250 80078A50 EBFF2016 */  bnez       $s1, .L80078A00
/* 69254 80078A54 3C001022 */   addi      $s0, $s0, 0x3C # handwritten instruction
.L80078A58:
/* 69258 80078A58 801F023C */  lui        $v0, (0x1F800018 >> 16)
/* 6925C 80078A5C 00005F8C */  lw         $ra, (0x1F800000 & 0xFFFF)($v0)
/* 69260 80078A60 0400508C */  lw         $s0, (0x1F800004 & 0xFFFF)($v0)
/* 69264 80078A64 0800518C */  lw         $s1, (0x1F800008 & 0xFFFF)($v0)
/* 69268 80078A68 0C00528C */  lw         $s2, (0x1F80000C & 0xFFFF)($v0)
/* 6926C 80078A6C 1000538C */  lw         $s3, (0x1F800010 & 0xFFFF)($v0)
/* 69270 80078A70 1400548C */  lw         $s4, (0x1F800014 & 0xFFFF)($v0)
/* 69274 80078A74 1C00568C */  lw         $s6, (0x1F80001C & 0xFFFF)($v0)
/* 69278 80078A78 2000578C */  lw         $s7, (0x1F800020 & 0xFFFF)($v0)
/* 6927C 80078A7C 24005E8C */  lw         $fp, (0x1F800024 & 0xFFFF)($v0)
/* 69280 80078A80 0800E003 */  jr         $ra
/* 69284 80078A84 1800558C */   lw        $s5, (0x1F800018 & 0xFFFF)($v0)
.size func_800789C4, . - func_800789C4
