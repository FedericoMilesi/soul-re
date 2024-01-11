.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_ChangeMode
/* 215AC 80030DAC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 215B0 80030DB0 1000B0AF */  sw         $s0, 0x10($sp)
/* 215B4 80030DB4 10BE9027 */  addiu      $s0, $gp, %gp_rel(gameTrackerX + 0x48)
/* 215B8 80030DB8 88BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 215BC 80030DBC 0400023C */  lui        $v0, (0x40000 >> 16)
/* 215C0 80030DC0 24106200 */  and        $v0, $v1, $v0
/* 215C4 80030DC4 35004014 */  bnez       $v0, .L80030E9C
/* 215C8 80030DC8 1400BFAF */   sw        $ra, 0x14($sp)
/* 215CC 80030DCC 2000023C */  lui        $v0, (0x200000 >> 16)
/* 215D0 80030DD0 24106200 */  and        $v0, $v1, $v0
/* 215D4 80030DD4 2C004014 */  bnez       $v0, .L80030E88
/* 215D8 80030DD8 010A0224 */   addiu     $v0, $zero, 0xA01
/* 215DC 80030DDC 10BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x48)($gp)
/* 215E0 80030DE0 00000000 */  nop
/* 215E4 80030DE4 010A8330 */  andi       $v1, $a0, 0xA01
/* 215E8 80030DE8 16006214 */  bne        $v1, $v0, .L80030E44
/* 215EC 80030DEC 020A8330 */   andi      $v1, $a0, 0xA02
/* 215F0 80030DF0 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 215F4 80030DF4 01000724 */  addiu      $a3, $zero, 0x1
/* 215F8 80030DF8 98B087A7 */  sh         $a3, %gp_rel(theCamera + 0x408)($gp)
/* 215FC 80030DFC 60006294 */  lhu        $v0, 0x60($v1)
/* 21600 80030E00 1000053C */  lui        $a1, (0x100010 >> 16)
/* 21604 80030E04 64004224 */  addiu      $v0, $v0, 0x64
/* 21608 80030E08 600062A4 */  sh         $v0, 0x60($v1)
/* 2160C 80030E0C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21610 80030E10 1000A534 */  ori        $a1, $a1, (0x100010 & 0xFFFF)
/* 21614 80030E14 7C0140AC */  sw         $zero, 0x17C($v0)
/* 21618 80030E18 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 2161C 80030E1C 8FBF87A3 */  sb         $a3, %gp_rel(gameTrackerX + 0x1C7)($gp)
/* 21620 80030E20 A1D1000C */  jal        INSTANCE_Post
/* 21624 80030E24 01000624 */   addiu     $a2, $zero, 0x1
/* 21628 80030E28 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 2162C 80030E2C 00000000 */  nop
/* 21630 80030E30 1400828C */  lw         $v0, 0x14($a0)
/* 21634 80030E34 FFF70324 */  addiu      $v1, $zero, -0x801
/* 21638 80030E38 24104300 */  and        $v0, $v0, $v1
/* 2163C 80030E3C A2C30008 */  j          .L80030E88
/* 21640 80030E40 140082AC */   sw        $v0, 0x14($a0)
.L80030E44:
/* 21644 80030E44 020A0224 */  addiu      $v0, $zero, 0xA02
/* 21648 80030E48 0F006214 */  bne        $v1, $v0, .L80030E88
/* 2164C 80030E4C 01000224 */   addiu     $v0, $zero, 0x1
/* 21650 80030E50 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21654 80030E54 98B082A7 */  sh         $v0, %gp_rel(theCamera + 0x408)($gp)
/* 21658 80030E58 60006294 */  lhu        $v0, 0x60($v1)
/* 2165C 80030E5C 1000053C */  lui        $a1, (0x100010 >> 16)
/* 21660 80030E60 9CFF4224 */  addiu      $v0, $v0, -0x64
/* 21664 80030E64 600062A4 */  sh         $v0, 0x60($v1)
/* 21668 80030E68 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 2166C 80030E6C 1000A534 */  ori        $a1, $a1, (0x100010 & 0xFFFF)
/* 21670 80030E70 7C0140AC */  sw         $zero, 0x17C($v0)
/* 21674 80030E74 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21678 80030E78 8FBF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C7)($gp)
/* 2167C 80030E7C A1D1000C */  jal        INSTANCE_Post
/* 21680 80030E80 21300000 */   addu      $a2, $zero, $zero
/* 21684 80030E84 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
.L80030E88:
/* 21688 80030E88 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 2168C 80030E8C 0400033C */  lui        $v1, (0x40000 >> 16)
/* 21690 80030E90 24104300 */  and        $v0, $v0, $v1
/* 21694 80030E94 06004010 */  beqz       $v0, .L80030EB0
/* 21698 80030E98 00000000 */   nop
.L80030E9C:
/* 2169C 80030E9C CCBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x204)($gp)
/* 216A0 80030EA0 00000000 */  nop
/* 216A4 80030EA4 02004230 */  andi       $v0, $v0, 0x2
/* 216A8 80030EA8 44004010 */  beqz       $v0, .L80030FBC
/* 216AC 80030EAC 00000000 */   nop
.L80030EB0:
/* 216B0 80030EB0 0400028E */  lw         $v0, 0x4($s0)
/* 216B4 80030EB4 60000324 */  addiu      $v1, $zero, 0x60
/* 216B8 80030EB8 60004230 */  andi       $v0, $v0, 0x60
/* 216BC 80030EBC 3F004314 */  bne        $v0, $v1, .L80030FBC
/* 216C0 80030EC0 00000000 */   nop
/* 216C4 80030EC4 0000028E */  lw         $v0, 0x0($s0)
/* 216C8 80030EC8 00000000 */  nop
/* 216CC 80030ECC 0F004230 */  andi       $v0, $v0, 0xF
/* 216D0 80030ED0 3A004014 */  bnez       $v0, .L80030FBC
/* 216D4 80030ED4 00000000 */   nop
/* 216D8 80030ED8 3ABF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x172)($gp)
/* 216DC 80030EDC 00000000 */  nop
/* 216E0 80030EE0 2C006014 */  bnez       $v1, .L80030F94
/* 216E4 80030EE4 07000224 */   addiu     $v0, $zero, 0x7
/* 216E8 80030EE8 04000224 */  addiu      $v0, $zero, 0x4
/* 216EC 80030EEC 3ABF82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 216F0 80030EF0 0D80023C */  lui        $v0, %hi(standardMenu)
/* 216F4 80030EF4 8ABF8393 */  lbu        $v1, %gp_rel(gameTrackerX + 0x1C2)($gp)
/* 216F8 80030EF8 90804224 */  addiu      $v0, $v0, %lo(standardMenu)
/* 216FC 80030EFC 0C8A82AF */  sw         $v0, %gp_rel(currentMenu)($gp)
/* 21700 80030F00 04006010 */  beqz       $v1, .L80030F14
/* 21704 80030F04 0800033C */   lui       $v1, (0x80000 >> 16)
/* 21708 80030F08 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 2170C 80030F0C C9C30008 */  j          .L80030F24
/* 21710 80030F10 25104300 */   or        $v0, $v0, $v1
.L80030F14:
/* 21714 80030F14 F7FF033C */  lui        $v1, (0xFFF7FFFF >> 16)
/* 21718 80030F18 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 2171C 80030F1C FFFF6334 */  ori        $v1, $v1, (0xFFF7FFFF & 0xFFFF)
/* 21720 80030F20 24104300 */  and        $v0, $v0, $v1
.L80030F24:
/* 21724 80030F24 88BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 21728 80030F28 89BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C1)($gp)
/* 2172C 80030F2C 00000000 */  nop
/* 21730 80030F30 04004010 */  beqz       $v0, .L80030F44
/* 21734 80030F34 FFEF0324 */   addiu     $v1, $zero, -0x1001
/* 21738 80030F38 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 2173C 80030F3C D4C30008 */  j          .L80030F50
/* 21740 80030F40 00104234 */   ori       $v0, $v0, 0x1000
.L80030F44:
/* 21744 80030F44 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 21748 80030F48 00000000 */  nop
/* 2174C 80030F4C 24104300 */  and        $v0, $v0, $v1
.L80030F50:
/* 21750 80030F50 8CBE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 21754 80030F54 88BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C0)($gp)
/* 21758 80030F58 00000000 */  nop
/* 2175C 80030F5C 07004010 */  beqz       $v0, .L80030F7C
/* 21760 80030F60 FFDF0324 */   addiu     $v1, $zero, -0x2001
/* 21764 80030F64 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 21768 80030F68 00000000 */  nop
/* 2176C 80030F6C 00204234 */  ori        $v0, $v0, 0x2000
/* 21770 80030F70 8CBE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 21774 80030F74 EFC30008 */  j          .L80030FBC
/* 21778 80030F78 00000000 */   nop
.L80030F7C:
/* 2177C 80030F7C 8CBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 21780 80030F80 00000000 */  nop
/* 21784 80030F84 24104300 */  and        $v0, $v0, $v1
/* 21788 80030F88 8CBE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0xC4)($gp)
/* 2178C 80030F8C EFC30008 */  j          .L80030FBC
/* 21790 80030F90 00000000 */   nop
.L80030F94:
/* 21794 80030F94 07006214 */  bne        $v1, $v0, .L80030FB4
/* 21798 80030F98 00000000 */   nop
/* 2179C 80030F9C 3ABF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x172)
/* 217A0 80030FA0 8B51000C */  jal        DEBUG_EndViewVram
/* 217A4 80030FA4 8EFE8424 */   addiu     $a0, $a0, -0x172
/* 217A8 80030FA8 3ABF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x172)($gp)
/* 217AC 80030FAC EFC30008 */  j          .L80030FBC
/* 217B0 80030FB0 00000000 */   nop
.L80030FB4:
/* 217B4 80030FB4 FFC2000C */  jal        GAMELOOP_ModeStartRunning
/* 217B8 80030FB8 00000000 */   nop
.L80030FBC:
/* 217BC 80030FBC 0400028E */  lw         $v0, 0x4($s0)
/* 217C0 80030FC0 00000000 */  nop
/* 217C4 80030FC4 00404230 */  andi       $v0, $v0, 0x4000
/* 217C8 80030FC8 06004014 */  bnez       $v0, .L80030FE4
/* 217CC 80030FCC 00000000 */   nop
/* 217D0 80030FD0 70BB828F */  lw         $v0, %gp_rel(gamePadControllerOut)($gp)
/* 217D4 80030FD4 00000000 */  nop
/* 217D8 80030FD8 06004228 */  slti       $v0, $v0, 0x6
/* 217DC 80030FDC 18004014 */  bnez       $v0, .L80031040
/* 217E0 80030FE0 00000000 */   nop
.L80030FE4:
/* 217E4 80030FE4 3ABF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 217E8 80030FE8 00000000 */  nop
/* 217EC 80030FEC 14004014 */  bnez       $v0, .L80031040
/* 217F0 80030FF0 00000000 */   nop
/* 217F4 80030FF4 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 217F8 80030FF8 00000000 */  nop
/* 217FC 80030FFC 80004230 */  andi       $v0, $v0, 0x80
/* 21800 80031000 0F004014 */  bnez       $v0, .L80031040
/* 21804 80031004 00000000 */   nop
/* 21808 80031008 94BE8487 */  lh         $a0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 2180C 8003100C 00000000 */  nop
/* 21810 80031010 07008010 */  beqz       $a0, .L80031030
/* 21814 80031014 0B000224 */   addiu     $v0, $zero, 0xB
/* 21818 80031018 98BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 2181C 8003101C 00000000 */  nop
/* 21820 80031020 07006210 */  beq        $v1, $v0, .L80031040
/* 21824 80031024 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 21828 80031028 05008214 */  bne        $a0, $v0, .L80031040
/* 2182C 8003102C 00000000 */   nop
.L80031030:
/* 21830 80031030 35C3000C */  jal        GAMELOOP_ModeStartPause
/* 21834 80031034 00000000 */   nop
/* 21838 80031038 3BC40008 */  j          .L800310EC
/* 2183C 8003103C 00000000 */   nop
.L80031040:
/* 21840 80031040 0400028E */  lw         $v0, 0x4($s0)
/* 21844 80031044 00000000 */  nop
/* 21848 80031048 00404630 */  andi       $a2, $v0, 0x4000
/* 2184C 8003104C 0600C014 */  bnez       $a2, .L80031068
/* 21850 80031050 0040033C */   lui       $v1, (0x40000000 >> 16)
/* 21854 80031054 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 21858 80031058 00000000 */  nop
/* 2185C 8003105C 24104300 */  and        $v0, $v0, $v1
/* 21860 80031060 22004010 */  beqz       $v0, .L800310EC
/* 21864 80031064 00000000 */   nop
.L80031068:
/* 21868 80031068 3ABF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 2186C 8003106C 00000000 */  nop
/* 21870 80031070 1E004010 */  beqz       $v0, .L800310EC
/* 21874 80031074 0020023C */   lui       $v0, (0x20000000 >> 16)
/* 21878 80031078 08BF858F */  lw         $a1, %gp_rel(gameTrackerX + 0x140)($gp)
/* 2187C 8003107C 00000000 */  nop
/* 21880 80031080 2410A200 */  and        $v0, $a1, $v0
/* 21884 80031084 19004014 */  bnez       $v0, .L800310EC
/* 21888 80031088 00000000 */   nop
/* 2188C 8003108C 94BE8487 */  lh         $a0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* 21890 80031090 00000000 */  nop
/* 21894 80031094 07008010 */  beqz       $a0, .L800310B4
/* 21898 80031098 0B000224 */   addiu     $v0, $zero, 0xB
/* 2189C 8003109C 98BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xD0)($gp)
/* 218A0 800310A0 00000000 */  nop
/* 218A4 800310A4 11006210 */  beq        $v1, $v0, .L800310EC
/* 218A8 800310A8 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 218AC 800310AC 0F008214 */  bne        $a0, $v0, .L800310EC
/* 218B0 800310B0 00000000 */   nop
.L800310B4:
/* 218B4 800310B4 0600C010 */  beqz       $a2, .L800310D0
/* 218B8 800310B8 0040023C */   lui       $v0, (0x40000000 >> 16)
/* 218BC 800310BC 2410A200 */  and        $v0, $a1, $v0
/* 218C0 800310C0 04004014 */  bnez       $v0, .L800310D4
/* 218C4 800310C4 FFBF033C */   lui       $v1, (0xBFFFFFFF >> 16)
/* 218C8 800310C8 0E02010C */  jal        SndPlay
/* 218CC 800310CC 05000424 */   addiu     $a0, $zero, 0x5
.L800310D0:
/* 218D0 800310D0 FFBF033C */  lui        $v1, (0xBFFFFFFF >> 16)
.L800310D4:
/* 218D4 800310D4 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 218D8 800310D8 FFFF6334 */  ori        $v1, $v1, (0xBFFFFFFF & 0xFFFF)
/* 218DC 800310DC 24104300 */  and        $v0, $v0, $v1
/* 218E0 800310E0 08BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 218E4 800310E4 FFC2000C */  jal        GAMELOOP_ModeStartRunning
/* 218E8 800310E8 00000000 */   nop
.L800310EC:
/* 218EC 800310EC 10BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x48)($gp)
/* 218F0 800310F0 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 218F4 800310F4 24104300 */  and        $v0, $v0, $v1
/* 218F8 800310F8 08004010 */  beqz       $v0, .L8003111C
/* 218FC 800310FC 00000000 */   nop
/* 21900 80031100 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21904 80031104 00000000 */  nop
/* 21908 80031108 1400628C */  lw         $v0, 0x14($v1)
/* 2190C 8003110C 00000000 */  nop
/* 21910 80031110 00014234 */  ori        $v0, $v0, 0x100
/* 21914 80031114 52C40008 */  j          .L80031148
/* 21918 80031118 140062AC */   sw        $v0, 0x14($v1)
.L8003111C:
/* 2191C 8003111C 18BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x50)($gp)
/* 21920 80031120 00000000 */  nop
/* 21924 80031124 24104300 */  and        $v0, $v0, $v1
/* 21928 80031128 07004010 */  beqz       $v0, .L80031148
/* 2192C 8003112C FFFE0424 */   addiu     $a0, $zero, -0x101
/* 21930 80031130 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 21934 80031134 00000000 */  nop
/* 21938 80031138 1400438C */  lw         $v1, 0x14($v0)
/* 2193C 8003113C 00000000 */  nop
/* 21940 80031140 24186400 */  and        $v1, $v1, $a0
/* 21944 80031144 140043AC */  sw         $v1, 0x14($v0)
.L80031148:
/* 21948 80031148 1400BF8F */  lw         $ra, 0x14($sp)
/* 2194C 8003114C 1000B08F */  lw         $s0, 0x10($sp)
/* 21950 80031150 0800E003 */  jr         $ra
/* 21954 80031154 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMELOOP_ChangeMode, . - GAMELOOP_ChangeMode
