.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB438
/* ABC38 800BB438 00140400 */  sll        $v0, $a0, 16
/* ABC3C 800BB43C 03340200 */  sra        $a2, $v0, 16
/* ABC40 800BB440 0B00C004 */  bltz       $a2, .L800BB470
/* ABC44 800BB444 21100000 */   addu      $v0, $zero, $zero
/* ABC48 800BB448 0D80023C */  lui        $v0, %hi(GEnv + 0x4)
/* ABC4C 800BB44C 10DA4284 */  lh         $v0, %lo(GEnv + 0x4)($v0)
/* ABC50 800BB450 00000000 */  nop
/* ABC54 800BB454 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABC58 800BB458 2A104600 */  slt        $v0, $v0, $a2
/* ABC5C 800BB45C 0D80063C */  lui        $a2, %hi(GEnv + 0x4)
/* ABC60 800BB460 10DAC694 */  lhu        $a2, %lo(GEnv + 0x4)($a2)
/* ABC64 800BB464 02004014 */  bnez       $v0, .L800BB470
/* ABC68 800BB468 FFFFC224 */   addiu     $v0, $a2, -0x1
/* ABC6C 800BB46C 21108000 */  addu       $v0, $a0, $zero
.L800BB470:
/* ABC70 800BB470 21204000 */  addu       $a0, $v0, $zero
/* ABC74 800BB474 00140500 */  sll        $v0, $a1, 16
/* ABC78 800BB478 03340200 */  sra        $a2, $v0, 16
/* ABC7C 800BB47C 0C00C004 */  bltz       $a2, .L800BB4B0
/* ABC80 800BB480 00000000 */   nop
/* ABC84 800BB484 0D80023C */  lui        $v0, %hi(GEnv + 0x6)
/* ABC88 800BB488 12DA4284 */  lh         $v0, %lo(GEnv + 0x6)($v0)
/* ABC8C 800BB48C 00000000 */  nop
/* ABC90 800BB490 FFFF4224 */  addiu      $v0, $v0, -0x1
/* ABC94 800BB494 2A104600 */  slt        $v0, $v0, $a2
/* ABC98 800BB498 0D80063C */  lui        $a2, %hi(GEnv + 0x6)
/* ABC9C 800BB49C 12DAC694 */  lhu        $a2, %lo(GEnv + 0x6)($a2)
/* ABCA0 800BB4A0 05004010 */  beqz       $v0, .L800BB4B8
/* ABCA4 800BB4A4 FF03A330 */   andi      $v1, $a1, 0x3FF
/* ABCA8 800BB4A8 2DED0208 */  j          .L800BB4B4
/* ABCAC 800BB4AC FFFFC524 */   addiu     $a1, $a2, -0x1
.L800BB4B0:
/* ABCB0 800BB4B0 21280000 */  addu       $a1, $zero, $zero
.L800BB4B4:
/* ABCB4 800BB4B4 FF03A330 */  andi       $v1, $a1, 0x3FF
.L800BB4B8:
/* ABCB8 800BB4B8 801A0300 */  sll        $v1, $v1, 10
/* ABCBC 800BB4BC FF038230 */  andi       $v0, $a0, 0x3FF
/* ABCC0 800BB4C0 00E4043C */  lui        $a0, (0xE4000000 >> 16)
/* ABCC4 800BB4C4 25104400 */  or         $v0, $v0, $a0
/* ABCC8 800BB4C8 0800E003 */  jr         $ra
/* ABCCC 800BB4CC 25106200 */   or        $v0, $v1, $v0
.size func_800BB438, . - func_800BB438
