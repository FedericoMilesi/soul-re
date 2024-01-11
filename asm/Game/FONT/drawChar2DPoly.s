.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel drawChar2DPoly
/* 1D928 8002D128 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 1D92C 8002D12C 0000B0AF */  sw         $s0, 0x0($sp)
/* 1D930 8002D130 2180A000 */  addu       $s0, $a1, $zero
/* 1D934 8002D134 0D80023C */  lui        $v0, %hi(fontPos)
/* 1D938 8002D138 C09F4224 */  addiu      $v0, $v0, %lo(fontPos)
/* 1D93C 8002D13C 80200400 */  sll        $a0, $a0, 2
/* 1D940 8002D140 21288200 */  addu       $a1, $a0, $v0
/* 1D944 8002D144 0400B1AF */  sw         $s1, 0x4($sp)
/* 1D948 8002D148 0000A380 */  lb         $v1, 0x0($a1)
/* 1D94C 8002D14C 00000000 */  nop
/* 1D950 8002D150 02006104 */  bgez       $v1, .L8002D15C
/* 1D954 8002D154 00000000 */   nop
/* 1D958 8002D158 23180300 */  negu       $v1, $v1
.L8002D15C:
/* 1D95C 8002D15C 0100A480 */  lb         $a0, 0x1($a1)
/* 1D960 8002D160 00000000 */  nop
/* 1D964 8002D164 02008104 */  bgez       $a0, .L8002D170
/* 1D968 8002D168 21C00002 */   addu      $t8, $s0, $zero
/* 1D96C 8002D16C 23200400 */  negu       $a0, $a0
.L8002D170:
/* 1D970 8002D170 FCB98287 */  lh         $v0, %gp_rel(fontTracker + 0x610)($gp)
/* 1D974 8002D174 0200B980 */  lb         $t9, 0x2($a1)
/* 1D978 8002D178 0300A580 */  lb         $a1, 0x3($a1)
/* 1D97C 8002D17C 9CBF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 1D980 8002D180 21586200 */  addu       $t3, $v1, $v0
/* 1D984 8002D184 21786001 */  addu       $t7, $t3, $zero
/* 1D988 8002D188 FEB98287 */  lh         $v0, %gp_rel(fontTracker + 0x612)($gp)
/* 1D98C 8002D18C 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1D990 8002D190 21508200 */  addu       $t2, $a0, $v0
/* 1D994 8002D194 02002107 */  bgez       $t9, .L8002D1A0
/* 1D998 8002D198 21202003 */   addu      $a0, $t9, $zero
/* 1D99C 8002D19C 23200400 */  negu       $a0, $a0
.L8002D1A0:
/* 1D9A0 8002D1A0 21686401 */  addu       $t5, $t3, $a0
/* 1D9A4 8002D1A4 21484001 */  addu       $t1, $t2, $zero
/* 1D9A8 8002D1A8 0200A104 */  bgez       $a1, .L8002D1B4
/* 1D9AC 8002D1AC 2110A000 */   addu      $v0, $a1, $zero
/* 1D9B0 8002D1B0 23100200 */  negu       $v0, $v0
.L8002D1B4:
/* 1D9B4 8002D1B4 21402201 */  addu       $t0, $t1, $v0
/* 1D9B8 8002D1B8 2170A001 */  addu       $t6, $t5, $zero
/* 1D9BC 8002D1BC 21600001 */  addu       $t4, $t0, $zero
/* 1D9C0 8002D1C0 21800403 */  addu       $s0, $t8, $a0
/* 1D9C4 8002D1C4 F4FF4224 */  addiu      $v0, $v0, -0xC
/* 1D9C8 8002D1C8 2320C200 */  subu       $a0, $a2, $v0
/* 1D9CC 8002D1CC 0400678C */  lw         $a3, 0x4($v1)
/* 1D9D0 8002D1D0 0500A104 */  bgez       $a1, .L8002D1E8
/* 1D9D4 8002D1D4 0C00C624 */   addiu     $a2, $a2, 0xC
/* 1D9D8 8002D1D8 21508001 */  addu       $t2, $t4, $zero
/* 1D9DC 8002D1DC 21402001 */  addu       $t0, $t1, $zero
/* 1D9E0 8002D1E0 21484001 */  addu       $t1, $t2, $zero
/* 1D9E4 8002D1E4 21600001 */  addu       $t4, $t0, $zero
.L8002D1E8:
/* 1D9E8 8002D1E8 0E002107 */  bgez       $t9, .L8002D224
/* 1D9EC 8002D1EC 09000224 */   addiu     $v0, $zero, 0x9
/* 1D9F0 8002D1F0 21106001 */  addu       $v0, $t3, $zero
/* 1D9F4 8002D1F4 21184001 */  addu       $v1, $t2, $zero
/* 1D9F8 8002D1F8 2158A001 */  addu       $t3, $t5, $zero
/* 1D9FC 8002D1FC 21502001 */  addu       $t2, $t1, $zero
/* 1DA00 8002D200 21684000 */  addu       $t5, $v0, $zero
/* 1DA04 8002D204 21486000 */  addu       $t1, $v1, $zero
/* 1DA08 8002D208 2110C001 */  addu       $v0, $t6, $zero
/* 1DA0C 8002D20C 21188001 */  addu       $v1, $t4, $zero
/* 1DA10 8002D210 2170E001 */  addu       $t6, $t7, $zero
/* 1DA14 8002D214 21600001 */  addu       $t4, $t0, $zero
/* 1DA18 8002D218 21784000 */  addu       $t7, $v0, $zero
/* 1DA1C 8002D21C 21406000 */  addu       $t0, $v1, $zero
/* 1DA20 8002D220 09000224 */  addiu      $v0, $zero, 0x9
.L8002D224:
/* 1DA24 8002D224 0300E2A0 */  sb         $v0, 0x3($a3)
/* 1DA28 8002D228 2C000224 */  addiu      $v0, $zero, 0x2C
/* 1DA2C 8002D22C 0700E2A0 */  sb         $v0, 0x7($a3)
/* 1DA30 8002D230 09BA8293 */  lbu        $v0, %gp_rel(fontTracker + 0x61D)($gp)
/* 1DA34 8002D234 00000000 */  nop
/* 1DA38 8002D238 04004014 */  bnez       $v0, .L8002D24C
/* 1DA3C 8002D23C 2C000224 */   addiu     $v0, $zero, 0x2C
/* 1DA40 8002D240 2D000224 */  addiu      $v0, $zero, 0x2D
/* 1DA44 8002D244 A3B40008 */  j          .L8002D28C
/* 1DA48 8002D248 0700E2A0 */   sb        $v0, 0x7($a3)
.L8002D24C:
/* 1DA4C 8002D24C 09BA8393 */  lbu        $v1, %gp_rel(fontTracker + 0x61D)($gp)
/* 1DA50 8002D250 0700E2A0 */  sb         $v0, 0x7($a3)
/* 1DA54 8002D254 40100300 */  sll        $v0, $v1, 1
/* 1DA58 8002D258 21104300 */  addu       $v0, $v0, $v1
/* 1DA5C 8002D25C 80100200 */  sll        $v0, $v0, 2
/* 1DA60 8002D260 A0908327 */  addiu      $v1, $gp, %gp_rel(the_font_color_table)
/* 1DA64 8002D264 21104300 */  addu       $v0, $v0, $v1
/* 1DA68 8002D268 00004390 */  lbu        $v1, 0x0($v0)
/* 1DA6C 8002D26C 00000000 */  nop
/* 1DA70 8002D270 0400E3A0 */  sb         $v1, 0x4($a3)
/* 1DA74 8002D274 04004390 */  lbu        $v1, 0x4($v0)
/* 1DA78 8002D278 00000000 */  nop
/* 1DA7C 8002D27C 0500E3A0 */  sb         $v1, 0x5($a3)
/* 1DA80 8002D280 08004290 */  lbu        $v0, 0x8($v0)
/* 1DA84 8002D284 00000000 */  nop
/* 1DA88 8002D288 0600E2A0 */  sb         $v0, 0x6($a3)
.L8002D28C:
/* 1DA8C 8002D28C 0700E290 */  lbu        $v0, 0x7($a3)
/* 1DA90 8002D290 0C00EBA0 */  sb         $t3, 0xC($a3)
/* 1DA94 8002D294 0D00EAA0 */  sb         $t2, 0xD($a3)
/* 1DA98 8002D298 1400EDA0 */  sb         $t5, 0x14($a3)
/* 1DA9C 8002D29C 1500E9A0 */  sb         $t1, 0x15($a3)
/* 1DAA0 8002D2A0 1C00EFA0 */  sb         $t7, 0x1C($a3)
/* 1DAA4 8002D2A4 1D00E8A0 */  sb         $t0, 0x1D($a3)
/* 1DAA8 8002D2A8 2400EEA0 */  sb         $t6, 0x24($a3)
/* 1DAAC 8002D2AC 2500ECA0 */  sb         $t4, 0x25($a3)
/* 1DAB0 8002D2B0 0800F8A4 */  sh         $t8, 0x8($a3)
/* 1DAB4 8002D2B4 0A00E4A4 */  sh         $a0, 0xA($a3)
/* 1DAB8 8002D2B8 1000F0A4 */  sh         $s0, 0x10($a3)
/* 1DABC 8002D2BC 1200E4A4 */  sh         $a0, 0x12($a3)
/* 1DAC0 8002D2C0 1800F8A4 */  sh         $t8, 0x18($a3)
/* 1DAC4 8002D2C4 1A00E6A4 */  sh         $a2, 0x1A($a3)
/* 1DAC8 8002D2C8 2000F0A4 */  sh         $s0, 0x20($a3)
/* 1DACC 8002D2CC 2200E6A4 */  sh         $a2, 0x22($a3)
/* 1DAD0 8002D2D0 FD004230 */  andi       $v0, $v0, 0xFD
/* 1DAD4 8002D2D4 0700E2A0 */  sb         $v0, 0x7($a3)
/* 1DAD8 8002D2D8 F8B98297 */  lhu        $v0, %gp_rel(fontTracker + 0x60C)($gp)
/* 1DADC 8002D2DC FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 1DAE0 8002D2E0 1600E2A4 */  sh         $v0, 0x16($a3)
/* 1DAE4 8002D2E4 FAB98297 */  lhu        $v0, %gp_rel(fontTracker + 0x60E)($gp)
/* 1DAE8 8002D2E8 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 1DAEC 8002D2EC 0E00E2A4 */  sh         $v0, 0xE($a3)
/* 1DAF0 8002D2F0 0000228E */  lw         $v0, 0x0($s1)
/* 1DAF4 8002D2F4 0009033C */  lui        $v1, (0x9000000 >> 16)
/* 1DAF8 8002D2F8 24104400 */  and        $v0, $v0, $a0
/* 1DAFC 8002D2FC 25104300 */  or         $v0, $v0, $v1
/* 1DB00 8002D300 2420E400 */  and        $a0, $a3, $a0
/* 1DB04 8002D304 0000E2AC */  sw         $v0, 0x0($a3)
/* 1DB08 8002D308 000024AE */  sw         $a0, 0x0($s1)
/* 1DB0C 8002D30C 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1DB10 8002D310 2800E724 */  addiu      $a3, $a3, 0x28
/* 1DB14 8002D314 040047AC */  sw         $a3, 0x4($v0)
/* 1DB18 8002D318 0400B18F */  lw         $s1, 0x4($sp)
/* 1DB1C 8002D31C 0000B08F */  lw         $s0, 0x0($sp)
/* 1DB20 8002D320 0800E003 */  jr         $ra
/* 1DB24 8002D324 0800BD27 */   addiu     $sp, $sp, 0x8
.size drawChar2DPoly, . - drawChar2DPoly
