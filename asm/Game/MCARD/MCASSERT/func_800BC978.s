.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC978
/* AD178 800BC978 0D80023C */  lui        $v0, %hi(_qout + 0x2C)
/* AD17C 800BC97C 64DB428C */  lw         $v0, %lo(_qout + 0x2C)($v0)
/* AD180 800BC980 0D80053C */  lui        $a1, %hi(_qout + 0x30)
/* AD184 800BC984 68DBA58C */  lw         $a1, %lo(_qout + 0x30)($a1)
/* AD188 800BC988 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AD18C 800BC98C 2000BFAF */  sw         $ra, 0x20($sp)
/* AD190 800BC990 1C00B1AF */  sw         $s1, 0x1C($sp)
/* AD194 800BC994 1800B0AF */  sw         $s0, 0x18($sp)
/* AD198 800BC998 0000508C */  lw         $s0, 0x0($v0)
.L800BC99C:
/* AD19C 800BC99C 0000A28C */  lw         $v0, 0x0($a1)
/* AD1A0 800BC9A0 00000000 */  nop
/* AD1A4 800BC9A4 1000A2AF */  sw         $v0, 0x10($sp)
/* AD1A8 800BC9A8 1000A38F */  lw         $v1, 0x10($sp)
/* AD1AC 800BC9AC 0000A28C */  lw         $v0, 0x0($a1)
/* AD1B0 800BC9B0 00000000 */  nop
/* AD1B4 800BC9B4 F9FF6214 */  bne        $v1, $v0, .L800BC99C
/* AD1B8 800BC9B8 00000000 */   nop
/* AD1BC 800BC9BC 1000A28F */  lw         $v0, 0x10($sp)
/* AD1C0 800BC9C0 0D80033C */  lui        $v1, %hi(Hcount)
/* AD1C4 800BC9C4 6CDB638C */  lw         $v1, %lo(Hcount)($v1)
/* AD1C8 800BC9C8 00000000 */  nop
/* AD1CC 800BC9CC 23104300 */  subu       $v0, $v0, $v1
/* AD1D0 800BC9D0 05008104 */  bgez       $a0, .L800BC9E8
/* AD1D4 800BC9D4 FFFF5130 */   andi      $s1, $v0, 0xFFFF
/* AD1D8 800BC9D8 0D80023C */  lui        $v0, %hi(Vcount)
/* AD1DC 800BC9DC ACE8428C */  lw         $v0, %lo(Vcount)($v0)
/* AD1E0 800BC9E0 B7F20208 */  j          .L800BCADC
/* AD1E4 800BC9E4 00000000 */   nop
.L800BC9E8:
/* AD1E8 800BC9E8 01000224 */  addiu      $v0, $zero, 0x1
/* AD1EC 800BC9EC 3A008210 */  beq        $a0, $v0, .L800BCAD8
/* AD1F0 800BC9F0 00000000 */   nop
/* AD1F4 800BC9F4 07008018 */  blez       $a0, .L800BCA14
/* AD1F8 800BC9F8 00000000 */   nop
/* AD1FC 800BC9FC 0D80023C */  lui        $v0, %hi(Hcount + 0x4)
/* AD200 800BCA00 70DB428C */  lw         $v0, %lo(Hcount + 0x4)($v0)
/* AD204 800BCA04 00000000 */  nop
/* AD208 800BCA08 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AD20C 800BCA0C 87F20208 */  j          .L800BCA1C
/* AD210 800BCA10 21104400 */   addu      $v0, $v0, $a0
.L800BCA14:
/* AD214 800BCA14 0D80023C */  lui        $v0, %hi(Hcount + 0x4)
/* AD218 800BCA18 70DB428C */  lw         $v0, %lo(Hcount + 0x4)($v0)
.L800BCA1C:
/* AD21C 800BCA1C 02008018 */  blez       $a0, .L800BCA28
/* AD220 800BCA20 21280000 */   addu      $a1, $zero, $zero
/* AD224 800BCA24 FFFF8524 */  addiu      $a1, $a0, -0x1
.L800BCA28:
/* AD228 800BCA28 BCF2020C */  jal        func_800BCAF0
/* AD22C 800BCA2C 21204000 */   addu      $a0, $v0, $zero
/* AD230 800BCA30 0D80023C */  lui        $v0, %hi(_qout + 0x2C)
/* AD234 800BCA34 64DB428C */  lw         $v0, %lo(_qout + 0x2C)($v0)
/* AD238 800BCA38 00000000 */  nop
/* AD23C 800BCA3C 0000508C */  lw         $s0, 0x0($v0)
/* AD240 800BCA40 0D80043C */  lui        $a0, %hi(Vcount)
/* AD244 800BCA44 ACE8848C */  lw         $a0, %lo(Vcount)($a0)
/* AD248 800BCA48 01000524 */  addiu      $a1, $zero, 0x1
/* AD24C 800BCA4C BCF2020C */  jal        func_800BCAF0
/* AD250 800BCA50 01008424 */   addiu     $a0, $a0, 0x1
/* AD254 800BCA54 4000023C */  lui        $v0, (0x400000 >> 16)
/* AD258 800BCA58 24100202 */  and        $v0, $s0, $v0
/* AD25C 800BCA5C 0F004010 */  beqz       $v0, .L800BCA9C
/* AD260 800BCA60 00000000 */   nop
/* AD264 800BCA64 0D80033C */  lui        $v1, %hi(_qout + 0x2C)
/* AD268 800BCA68 64DB638C */  lw         $v1, %lo(_qout + 0x2C)($v1)
/* AD26C 800BCA6C 00000000 */  nop
/* AD270 800BCA70 0000628C */  lw         $v0, 0x0($v1)
/* AD274 800BCA74 00000000 */  nop
/* AD278 800BCA78 26100202 */  xor        $v0, $s0, $v0
/* AD27C 800BCA7C 07004004 */  bltz       $v0, .L800BCA9C
/* AD280 800BCA80 0080043C */   lui       $a0, (0x80000000 >> 16)
.L800BCA84:
/* AD284 800BCA84 0000628C */  lw         $v0, 0x0($v1)
/* AD288 800BCA88 00000000 */  nop
/* AD28C 800BCA8C 26100202 */  xor        $v0, $s0, $v0
/* AD290 800BCA90 24104400 */  and        $v0, $v0, $a0
/* AD294 800BCA94 FBFF4010 */  beqz       $v0, .L800BCA84
/* AD298 800BCA98 00000000 */   nop
.L800BCA9C:
/* AD29C 800BCA9C 0D80023C */  lui        $v0, %hi(Vcount)
/* AD2A0 800BCAA0 ACE8428C */  lw         $v0, %lo(Vcount)($v0)
/* AD2A4 800BCAA4 0D80043C */  lui        $a0, %hi(_qout + 0x30)
/* AD2A8 800BCAA8 68DB848C */  lw         $a0, %lo(_qout + 0x30)($a0)
/* AD2AC 800BCAAC 0D80013C */  lui        $at, %hi(Hcount + 0x4)
/* AD2B0 800BCAB0 70DB22AC */  sw         $v0, %lo(Hcount + 0x4)($at)
.L800BCAB4:
/* AD2B4 800BCAB4 0000828C */  lw         $v0, 0x0($a0)
/* AD2B8 800BCAB8 0D80013C */  lui        $at, %hi(Hcount)
/* AD2BC 800BCABC 6CDB22AC */  sw         $v0, %lo(Hcount)($at)
/* AD2C0 800BCAC0 0D80033C */  lui        $v1, %hi(Hcount)
/* AD2C4 800BCAC4 6CDB638C */  lw         $v1, %lo(Hcount)($v1)
/* AD2C8 800BCAC8 0000828C */  lw         $v0, 0x0($a0)
/* AD2CC 800BCACC 00000000 */  nop
/* AD2D0 800BCAD0 F8FF6214 */  bne        $v1, $v0, .L800BCAB4
/* AD2D4 800BCAD4 00000000 */   nop
.L800BCAD8:
/* AD2D8 800BCAD8 21102002 */  addu       $v0, $s1, $zero
.L800BCADC:
/* AD2DC 800BCADC 2000BF8F */  lw         $ra, 0x20($sp)
/* AD2E0 800BCAE0 1C00B18F */  lw         $s1, 0x1C($sp)
/* AD2E4 800BCAE4 1800B08F */  lw         $s0, 0x18($sp)
/* AD2E8 800BCAE8 0800E003 */  jr         $ra
/* AD2EC 800BCAEC 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BC978, . - func_800BC978
