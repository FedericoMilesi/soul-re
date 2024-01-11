.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsForceSetWater
/* 6759C 80076D9C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 675A0 80076DA0 1400B1AF */  sw         $s1, 0x14($sp)
/* 675A4 80076DA4 21888000 */  addu       $s1, $a0, $zero
/* 675A8 80076DA8 2140A000 */  addu       $t0, $a1, $zero
/* 675AC 80076DAC 1000B0AF */  sw         $s0, 0x10($sp)
/* 675B0 80076DB0 2180C000 */  addu       $s0, $a2, $zero
/* 675B4 80076DB4 00F4022A */  slti       $v0, $s0, -0xC00
/* 675B8 80076DB8 02004010 */  beqz       $v0, .L80076DC4
/* 675BC 80076DBC 1800BFAF */   sw        $ra, 0x18($sp)
/* 675C0 80076DC0 00F41024 */  addiu      $s0, $zero, -0xC00
.L80076DC4:
/* 675C4 80076DC4 0200001A */  blez       $s0, .L80076DD0
/* 675C8 80076DC8 00000000 */   nop
/* 675CC 80076DCC 21800000 */  addu       $s0, $zero, $zero
.L80076DD0:
/* 675D0 80076DD0 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 675D4 80076DD4 00230700 */  sll        $a0, $a3, 12
/* 675D8 80076DD8 1B008200 */  divu       $zero, $a0, $v0
/* 675DC 80076DDC 12200000 */  mflo       $a0
/* 675E0 80076DE0 3000A28F */  lw         $v0, 0x30($sp)
/* 675E4 80076DE4 00000000 */  nop
/* 675E8 80076DE8 18000202 */  mult       $s0, $v0
/* 675EC 80076DEC 12100000 */  mflo       $v0
/* 675F0 80076DF0 AA2A033C */  lui        $v1, (0x2AAAAAAB >> 16)
/* 675F4 80076DF4 ABAA6334 */  ori        $v1, $v1, (0x2AAAAAAB & 0xFFFF)
/* 675F8 80076DF8 18004300 */  mult       $v0, $v1
/* 675FC 80076DFC C3170200 */  sra        $v0, $v0, 31
/* 67600 80076E00 10180000 */  mfhi       $v1
/* 67604 80076E04 432A0300 */  sra        $a1, $v1, 9
/* 67608 80076E08 0000038D */  lw         $v1, 0x0($t0)
/* 6760C 80076E0C 23804500 */  subu       $s0, $v0, $a1
/* 67610 80076E10 21186400 */  addu       $v1, $v1, $a0
/* 67614 80076E14 01106228 */  slti       $v0, $v1, 0x1001
/* 67618 80076E18 03004014 */  bnez       $v0, .L80076E28
/* 6761C 80076E1C 000003AD */   sw        $v1, 0x0($t0)
/* 67620 80076E20 00F06224 */  addiu      $v0, $v1, -0x1000
/* 67624 80076E24 000002AD */  sw         $v0, 0x0($t0)
.L80076E28:
/* 67628 80076E28 0D00C104 */  bgez       $a2, .L80076E60
/* 6762C 80076E2C 00000000 */   nop
/* 67630 80076E30 0000048D */  lw         $a0, 0x0($t0)
/* 67634 80076E34 DCE4010C */  jal        func_80079370
/* 67638 80076E38 00000000 */   nop
/* 6763C 80076E3C 18000202 */  mult       $s0, $v0
/* 67640 80076E40 12180000 */  mflo       $v1
/* 67644 80076E44 02006104 */  bgez       $v1, .L80076E50
/* 67648 80076E48 00000000 */   nop
/* 6764C 80076E4C FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L80076E50:
/* 67650 80076E50 60002296 */  lhu        $v0, 0x60($s1)
/* 67654 80076E54 031B0300 */  sra        $v1, $v1, 12
/* 67658 80076E58 21104300 */  addu       $v0, $v0, $v1
/* 6765C 80076E5C 600022A6 */  sh         $v0, 0x60($s1)
.L80076E60:
/* 67660 80076E60 1800BF8F */  lw         $ra, 0x18($sp)
/* 67664 80076E64 1400B18F */  lw         $s1, 0x14($sp)
/* 67668 80076E68 1000B08F */  lw         $s0, 0x10($sp)
/* 6766C 80076E6C 0800E003 */  jr         $ra
/* 67670 80076E70 2000BD27 */   addiu     $sp, $sp, 0x20
.size PhysicsForceSetWater, . - PhysicsForceSetWater
