.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB3A0
/* ABBA0 800BB3A0 00140400 */  sll        $v0, $a0, 16
/* ABBA4 800BB3A4 03340200 */  sra        $a2, $v0, 16
/* ABBA8 800BB3A8 0B00C004 */  bltz       $a2, .L800BB3D8
/* ABBAC 800BB3AC 21100000 */   addu      $v0, $zero, $zero
/* ABBB0 800BB3B0 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* ABBB4 800BB3B4 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* ABBB8 800BB3B8 00000000 */  nop
/* ABBBC 800BB3BC FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABBC0 800BB3C0 2A104600 */  slt        $v0, $v0, $a2
/* ABBC4 800BB3C4 0D80063C */  lui        $a2, %hi(GEnv + 0x4)
/* ABBC8 800BB3C8 10DAC694 */  lhu        $a2, %lo(GEnv + 0x4)($a2)
/* ABBCC 800BB3CC 02004014 */  bnez       $v0, .L800BB3D8
/* ABBD0 800BB3D0 FFFFC224 */   addiu     $v0, $a2, -0x1
/* ABBD4 800BB3D4 21108000 */  addu       $v0, $a0, $zero
.L800BB3D8:
/* ABBD8 800BB3D8 21204000 */  addu       $a0, $v0, $zero
/* ABBDC 800BB3DC 00140500 */  sll        $v0, $a1, 16
/* ABBE0 800BB3E0 03340200 */  sra        $a2, $v0, 16
/* ABBE4 800BB3E4 0C00C004 */  bltz       $a2, .L800BB418
/* ABBE8 800BB3E8 00000000 */   nop
/* ABBEC 800BB3EC 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* ABBF0 800BB3F0 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* ABBF4 800BB3F4 00000000 */  nop
/* ABBF8 800BB3F8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABBFC 800BB3FC 2A104600 */  slt        $v0, $v0, $a2
/* ABC00 800BB400 0D80063C */  lui        $a2, %hi(GEnv + 0x6)
/* ABC04 800BB404 12DAC694 */  lhu        $a2, %lo(GEnv + 0x6)($a2)
/* ABC08 800BB408 05004010 */  beqz       $v0, .L800BB420
/* ABC0C 800BB40C FF03A330 */   andi      $v1, $a1, 0x3FF
/* ABC10 800BB410 07ED0208 */  j          .L800BB41C
/* ABC14 800BB414 FFFFC524 */   addiu     $a1, $a2, -0x1
.L800BB418:
/* ABC18 800BB418 21280000 */  addu       $a1, $zero, $zero
.L800BB41C:
/* ABC1C 800BB41C FF03A330 */  andi       $v1, $a1, 0x3FF
.L800BB420:
/* ABC20 800BB420 801A0300 */  sll        $v1, $v1, 10
/* ABC24 800BB424 FF038230 */  andi       $v0, $a0, 0x3FF
/* ABC28 800BB428 00E3043C */  lui        $a0, (0xE3000000 >> 16)
/* ABC2C 800BB42C 25104400 */  or         $v0, $v0, $a0
/* ABC30 800BB430 0800E003 */  jr         $ra
/* ABC34 800BB434 25106200 */   or        $v0, $v1, $v0
.size func_800BB3A0, . - func_800BB3A0
