.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_DrawSavedOT
/* 20718 8002FF18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2071C 8002FF1C F8BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x30)($gp)
/* 20720 8002FF20 A4BF858F */  lw         $a1, %gp_rel(gameTrackerX + 0x1DC)($gp)
/* 20724 8002FF24 1000BFAF */  sw         $ra, 0x10($sp)
/* 20728 8002FF28 40100300 */  sll        $v0, $v1, 1
/* 2072C 8002FF2C 21104300 */  addu       $v0, $v0, $v1
/* 20730 8002FF30 C0100200 */  sll        $v0, $v0, 3
/* 20734 8002FF34 23104300 */  subu       $v0, $v0, $v1
/* 20738 8002FF38 80100200 */  sll        $v0, $v0, 2
/* 2073C 8002FF3C 88BC8327 */  addiu      $v1, $gp, %gp_rel(draw)
/* 20740 8002FF40 21104300 */  addu       $v0, $v0, $v1
/* 20744 8002FF44 A8BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x1E0)($gp)
/* 20748 8002FF48 0A004684 */  lh         $a2, 0xA($v0)
/* 2074C 8002FF4C 3F00A310 */  beq        $a1, $v1, .L8003004C
/* 20750 8002FF50 21588000 */   addu      $t3, $a0, $zero
/* 20754 8002FF54 FCFF0A24 */  addiu      $t2, $zero, -0x4
/* 20758 8002FF58 EFFF0924 */  addiu      $t1, $zero, -0x11
/* 2075C 8002FF5C 0400083C */  lui        $t0, (0x40000 >> 16)
/* 20760 8002FF60 FBFF073C */  lui        $a3, (0xFFFBFFFF >> 16)
/* 20764 8002FF64 FFFFE734 */  ori        $a3, $a3, (0xFFFBFFFF & 0xFFFF)
.L8002FF68:
/* 20768 8002FF68 0700A490 */  lbu        $a0, %lo(D_80000007)($a1)
/* 2076C 8002FF6C 34000224 */  addiu      $v0, $zero, 0x34
/* 20770 8002FF70 24188A00 */  and        $v1, $a0, $t2
/* 20774 8002FF74 0E006214 */  bne        $v1, $v0, .L8002FFB0
/* 20778 8002FF78 24000224 */   addiu     $v0, $zero, 0x24
/* 2077C 8002FF7C 1A00A394 */  lhu        $v1, %lo(D_8000001A)($a1)
/* 20780 8002FF80 00000000 */  nop
/* 20784 8002FF84 0F006230 */  andi       $v0, $v1, 0xF
/* 20788 8002FF88 08004228 */  slti       $v0, $v0, 0x8
/* 2078C 8002FF8C 26004010 */  beqz       $v0, .L80030028
/* 20790 8002FF90 00000000 */   nop
/* 20794 8002FF94 0300C010 */  beqz       $a2, .L8002FFA4
/* 20798 8002FF98 10006234 */   ori       $v0, $v1, 0x10
/* 2079C 8002FF9C 0AC00008 */  j          .L80030028
/* 207A0 8002FFA0 1A00A2A4 */   sh        $v0, %lo(D_8000001A)($a1)
.L8002FFA4:
/* 207A4 8002FFA4 24106900 */  and        $v0, $v1, $t1
/* 207A8 8002FFA8 0AC00008 */  j          .L80030028
/* 207AC 8002FFAC 1A00A2A4 */   sh        $v0, 0x1A($a1)
.L8002FFB0:
/* 207B0 8002FFB0 0E006214 */  bne        $v1, $v0, .L8002FFEC
/* 207B4 8002FFB4 E3000224 */   addiu     $v0, $zero, 0xE3
/* 207B8 8002FFB8 1600A394 */  lhu        $v1, 0x16($a1)
/* 207BC 8002FFBC 00000000 */  nop
/* 207C0 8002FFC0 0F006230 */  andi       $v0, $v1, 0xF
/* 207C4 8002FFC4 08004228 */  slti       $v0, $v0, 0x8
/* 207C8 8002FFC8 17004010 */  beqz       $v0, .L80030028
/* 207CC 8002FFCC 00000000 */   nop
/* 207D0 8002FFD0 0300C010 */  beqz       $a2, .L8002FFE0
/* 207D4 8002FFD4 10006234 */   ori       $v0, $v1, 0x10
/* 207D8 8002FFD8 0AC00008 */  j          .L80030028
/* 207DC 8002FFDC 1600A2A4 */   sh        $v0, 0x16($a1)
.L8002FFE0:
/* 207E0 8002FFE0 24106900 */  and        $v0, $v1, $t1
/* 207E4 8002FFE4 0AC00008 */  j          .L80030028
/* 207E8 8002FFE8 1600A2A4 */   sh        $v0, 0x16($a1)
.L8002FFEC:
/* 207EC 8002FFEC 0F008214 */  bne        $a0, $v0, .L8003002C
/* 207F0 8002FFF0 FF00033C */   lui       $v1, (0xFFFFFF >> 16)
/* 207F4 8002FFF4 0600C010 */  beqz       $a2, .L80030010
/* 207F8 8002FFF8 00000000 */   nop
/* 207FC 8002FFFC 0400A28C */  lw         $v0, 0x4($a1)
/* 20800 80030000 0800A38C */  lw         $v1, 0x8($a1)
/* 20804 80030004 25104800 */  or         $v0, $v0, $t0
/* 20808 80030008 08C00008 */  j          .L80030020
/* 2080C 8003000C 25186800 */   or        $v1, $v1, $t0
.L80030010:
/* 20810 80030010 0400A28C */  lw         $v0, 0x4($a1)
/* 20814 80030014 0800A38C */  lw         $v1, 0x8($a1)
/* 20818 80030018 24104700 */  and        $v0, $v0, $a3
/* 2081C 8003001C 24186700 */  and        $v1, $v1, $a3
.L80030020:
/* 20820 80030020 0400A2AC */  sw         $v0, 0x4($a1)
/* 20824 80030024 0800A3AC */  sw         $v1, 0x8($a1)
.L80030028:
/* 20828 80030028 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
.L8003002C:
/* 2082C 8003002C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 20830 80030030 0000A28C */  lw         $v0, 0x0($a1)
/* 20834 80030034 A8BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1E0)($gp)
/* 20838 80030038 24104300 */  and        $v0, $v0, $v1
/* 2083C 8003003C 0080033C */  lui        $v1, %hi(D_80000007)
/* 20840 80030040 25284300 */  or         $a1, $v0, $v1
/* 20844 80030044 C8FFA414 */  bne        $a1, $a0, .L8002FF68
/* 20848 80030048 00000000 */   nop
.L8003004C:
/* 2084C 8003004C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 20850 80030050 A8BF858F */  lw         $a1, %gp_rel(gameTrackerX + 0x1E0)($gp)
/* 20854 80030054 FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 20858 80030058 0000A38C */  lw         $v1, 0x0($a1)
/* 2085C 8003005C 00FF023C */  lui        $v0, (0xFF000000 >> 16)
/* 20860 80030060 24186200 */  and        $v1, $v1, $v0
/* 20864 80030064 FC2F6225 */  addiu      $v0, $t3, 0x2FFC
/* 20868 80030068 24104400 */  and        $v0, $v0, $a0
/* 2086C 8003006C 25186200 */  or         $v1, $v1, $v0
/* 20870 80030070 0000A3AC */  sw         $v1, 0x0($a1)
/* 20874 80030074 A4BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1DC)($gp)
/* 20878 80030078 1CEA020C */  jal        func_800BA870
/* 2087C 8003007C 00000000 */   nop
/* 20880 80030080 1000BF8F */  lw         $ra, 0x10($sp)
/* 20884 80030084 00000000 */  nop
/* 20888 80030088 0800E003 */  jr         $ra
/* 2088C 8003008C 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_DrawSavedOT, . - GAMELOOP_DrawSavedOT
