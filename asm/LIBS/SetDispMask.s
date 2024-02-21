.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDispMask
/* AABA4 800BA3A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AABA8 800BA3A8 1400B1AF */  sw         $s1, 0x14($sp)
/* AABAC 800BA3AC 0D80113C */  lui        $s1, %hi(GEnv + 0x2)
/* AABB0 800BA3B0 0EDA3126 */  addiu      $s1, $s1, %lo(GEnv + 0x2)
/* AABB4 800BA3B4 1800BFAF */  sw         $ra, 0x18($sp)
/* AABB8 800BA3B8 1000B0AF */  sw         $s0, 0x10($sp)
/* AABBC 800BA3BC 00002292 */  lbu        $v0, 0x0($s1)
/* AABC0 800BA3C0 00000000 */  nop
/* AABC4 800BA3C4 0200422C */  sltiu      $v0, $v0, 0x2
/* AABC8 800BA3C8 08004014 */  bnez       $v0, .L800BA3EC
/* AABCC 800BA3CC 21808000 */   addu      $s0, $a0, $zero
/* AABD0 800BA3D0 0180043C */  lui        $a0, %hi(D_8001260C)
/* AABD4 800BA3D4 0C268424 */  addiu      $a0, $a0, %lo(D_8001260C)
/* AABD8 800BA3D8 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AABDC 800BA3DC 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AABE0 800BA3E0 00000000 */  nop
/* AABE4 800BA3E4 09F84000 */  jalr       $v0
/* AABE8 800BA3E8 21280002 */   addu      $a1, $s0, $zero
.L800BA3EC:
/* AABEC 800BA3EC 04000016 */  bnez       $s0, .L800BA400
/* AABF0 800BA3F0 6A002426 */   addiu     $a0, $s1, 0x6A
/* AABF4 800BA3F4 FFFF0524 */  addiu      $a1, $zero, -0x1
/* AABF8 800BA3F8 10F2020C */  jal        func_800BC840
/* AABFC 800BA3FC 14000624 */   addiu     $a2, $zero, 0x14
.L800BA400:
/* AAC00 800BA400 0003043C */  lui        $a0, (0x3000001 >> 16)
/* AAC04 800BA404 0D80023C */  lui        $v0, %hi(D_800CDA04)
/* AAC08 800BA408 04DA428C */  lw         $v0, %lo(D_800CDA04)($v0)
/* AAC0C 800BA40C 02000012 */  beqz       $s0, .L800BA418
/* AAC10 800BA410 01008434 */   ori       $a0, $a0, (0x3000001 & 0xFFFF)
/* AAC14 800BA414 0003043C */  lui        $a0, (0x3000000 >> 16)
.L800BA418:
/* AAC18 800BA418 1000428C */  lw         $v0, 0x10($v0)
/* AAC1C 800BA41C 00000000 */  nop
/* AAC20 800BA420 09F84000 */  jalr       $v0
/* AAC24 800BA424 00000000 */   nop
/* AAC28 800BA428 1800BF8F */  lw         $ra, 0x18($sp)
/* AAC2C 800BA42C 1400B18F */  lw         $s1, 0x14($sp)
/* AAC30 800BA430 1000B08F */  lw         $s0, 0x10($sp)
/* AAC34 800BA434 0800E003 */  jr         $ra
/* AAC38 800BA438 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetDispMask, . - SetDispMask
