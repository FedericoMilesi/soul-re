.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ContinueParticle
/* 3A4B0 80049CB0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 3A4B4 80049CB4 3800B2AF */  sw         $s2, 0x38($sp)
/* 3A4B8 80049CB8 21908000 */  addu       $s2, $a0, $zero
/* 3A4BC 80049CBC 5400BFAF */  sw         $ra, 0x54($sp)
/* 3A4C0 80049CC0 5000BEAF */  sw         $fp, 0x50($sp)
/* 3A4C4 80049CC4 4C00B7AF */  sw         $s7, 0x4C($sp)
/* 3A4C8 80049CC8 4800B6AF */  sw         $s6, 0x48($sp)
/* 3A4CC 80049CCC 4400B5AF */  sw         $s5, 0x44($sp)
/* 3A4D0 80049CD0 4000B4AF */  sw         $s4, 0x40($sp)
/* 3A4D4 80049CD4 3C00B3AF */  sw         $s3, 0x3C($sp)
/* 3A4D8 80049CD8 3400B1AF */  sw         $s1, 0x34($sp)
/* 3A4DC 80049CDC 3000B0AF */  sw         $s0, 0x30($sp)
/* 3A4E0 80049CE0 5C00A5AF */  sw         $a1, 0x5C($sp)
/* 3A4E4 80049CE4 2800A0AF */  sw         $zero, 0x28($sp)
/* 3A4E8 80049CE8 46004A82 */  lb         $t2, 0x46($s2)
/* 3A4EC 80049CEC 00000000 */  nop
/* 3A4F0 80049CF0 0B004105 */  bgez       $t2, .L80049D20
/* 3A4F4 80049CF4 2C00AAAF */   sw        $t2, 0x2C($sp)
/* 3A4F8 80049CF8 3AF2020C */  jal        func_800BC8E8
/* 3A4FC 80049CFC 00000000 */   nop
/* 3A500 80049D00 2C00AA8F */  lw         $t2, 0x2C($sp)
/* 3A504 80049D04 00000000 */  nop
/* 3A508 80049D08 23180A00 */  negu       $v1, $t2
/* 3A50C 80049D0C 1A004300 */  div        $zero, $v0, $v1
/* 3A510 80049D10 10180000 */  mfhi       $v1
/* 3A514 80049D14 00000000 */  nop
/* 3A518 80049D18 0100632C */  sltiu      $v1, $v1, 0x1
/* 3A51C 80049D1C 2C00A3AF */  sw         $v1, 0x2C($sp)
.L80049D20:
/* 3A520 80049D20 0800568E */  lw         $s6, 0x8($s2)
/* 3A524 80049D24 00000000 */  nop
/* 3A528 80049D28 1400C48E */  lw         $a0, 0x14($s6)
/* 3A52C 80049D2C 00000000 */  nop
/* 3A530 80049D30 00088230 */  andi       $v0, $a0, 0x800
/* 3A534 80049D34 D5014014 */  bnez       $v0, .L8004A48C
/* 3A538 80049D38 0004033C */   lui       $v1, (0x4000000 >> 16)
/* 3A53C 80049D3C 1800C28E */  lw         $v0, 0x18($s6)
/* 3A540 80049D40 00000000 */  nop
/* 3A544 80049D44 24104300 */  and        $v0, $v0, $v1
/* 3A548 80049D48 D0014014 */  bnez       $v0, .L8004A48C
/* 3A54C 80049D4C 00028230 */   andi      $v0, $a0, 0x200
/* 3A550 80049D50 CE014010 */  beqz       $v0, .L8004A48C
/* 3A554 80049D54 00000000 */   nop
/* 3A558 80049D58 4000C48E */  lw         $a0, 0x40($s6)
/* 3A55C 80049D5C 00000000 */  nop
/* 3A560 80049D60 CA018010 */  beqz       $a0, .L8004A48C
/* 3A564 80049D64 00000000 */   nop
/* 3A568 80049D68 4400C38E */  lw         $v1, 0x44($s6)
/* 3A56C 80049D6C 00000000 */  nop
/* 3A570 80049D70 C6016010 */  beqz       $v1, .L8004A48C
/* 3A574 80049D74 00000000 */   nop
/* 3A578 80049D78 2C00AA8F */  lw         $t2, 0x2C($sp)
/* 3A57C 80049D7C 00000000 */  nop
/* 3A580 80049D80 C2014019 */  blez       $t2, .L8004A48C
/* 3A584 80049D84 00000000 */   nop
/* 3A588 80049D88 3A004282 */  lb         $v0, 0x3A($s2)
/* 3A58C 80049D8C 20005586 */  lh         $s5, 0x20($s2)
/* 3A590 80049D90 40110200 */  sll        $v0, $v0, 5
/* 3A594 80049D94 21286200 */  addu       $a1, $v1, $v0
/* 3A598 80049D98 21A08200 */  addu       $s4, $a0, $v0
/* 3A59C 80049D9C 0D004392 */  lbu        $v1, 0xD($s2)
/* 3A5A0 80049DA0 01000224 */  addiu      $v0, $zero, 0x1
/* 3A5A4 80049DA4 0A006214 */  bne        $v1, $v0, .L80049DD0
/* 3A5A8 80049DA8 FEFF6224 */   addiu     $v0, $v1, -0x2
/* 3A5AC 80049DAC 00131500 */  sll        $v0, $s5, 12
/* 3A5B0 80049DB0 02004104 */  bgez       $v0, .L80049DBC
/* 3A5B4 80049DB4 21184000 */   addu      $v1, $v0, $zero
/* 3A5B8 80049DB8 7F004324 */  addiu      $v1, $v0, 0x7F
.L80049DBC:
/* 3A5BC 80049DBC C3190300 */  sra        $v1, $v1, 7
/* 3A5C0 80049DC0 1800A3AF */  sw         $v1, 0x18($sp)
/* 3A5C4 80049DC4 1C00A3AF */  sw         $v1, 0x1C($sp)
/* 3A5C8 80049DC8 9D270108 */  j          .L80049E74
/* 3A5CC 80049DCC 2000A3AF */   sw        $v1, 0x20($sp)
.L80049DD0:
/* 3A5D0 80049DD0 FF004230 */  andi       $v0, $v0, 0xFF
/* 3A5D4 80049DD4 0200422C */  sltiu      $v0, $v0, 0x2
/* 3A5D8 80049DD8 05004010 */  beqz       $v0, .L80049DF0
/* 3A5DC 80049DDC 00000000 */   nop
/* 3A5E0 80049DE0 47004282 */  lb         $v0, 0x47($s2)
/* 3A5E4 80049DE4 00000000 */  nop
/* 3A5E8 80049DE8 40110200 */  sll        $v0, $v0, 5
/* 3A5EC 80049DEC 21288200 */  addu       $a1, $a0, $v0
.L80049DF0:
/* 3A5F0 80049DF0 1400A28C */  lw         $v0, 0x14($a1)
/* 3A5F4 80049DF4 1400838E */  lw         $v1, 0x14($s4)
/* 3A5F8 80049DF8 00000000 */  nop
/* 3A5FC 80049DFC 23104300 */  subu       $v0, $v0, $v1
/* 3A600 80049E00 21105500 */  addu       $v0, $v0, $s5
/* 3A604 80049E04 00130200 */  sll        $v0, $v0, 12
/* 3A608 80049E08 02004104 */  bgez       $v0, .L80049E14
/* 3A60C 80049E0C 00000000 */   nop
/* 3A610 80049E10 7F004224 */  addiu      $v0, $v0, 0x7F
.L80049E14:
/* 3A614 80049E14 C3110200 */  sra        $v0, $v0, 7
/* 3A618 80049E18 1800A2AF */  sw         $v0, 0x18($sp)
/* 3A61C 80049E1C 1800A28C */  lw         $v0, 0x18($a1)
/* 3A620 80049E20 1800838E */  lw         $v1, 0x18($s4)
/* 3A624 80049E24 00000000 */  nop
/* 3A628 80049E28 23104300 */  subu       $v0, $v0, $v1
/* 3A62C 80049E2C 21105500 */  addu       $v0, $v0, $s5
/* 3A630 80049E30 00130200 */  sll        $v0, $v0, 12
/* 3A634 80049E34 02004104 */  bgez       $v0, .L80049E40
/* 3A638 80049E38 00000000 */   nop
/* 3A63C 80049E3C 7F004224 */  addiu      $v0, $v0, 0x7F
.L80049E40:
/* 3A640 80049E40 C3110200 */  sra        $v0, $v0, 7
/* 3A644 80049E44 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 3A648 80049E48 1C00A28C */  lw         $v0, 0x1C($a1)
/* 3A64C 80049E4C 1C00838E */  lw         $v1, 0x1C($s4)
/* 3A650 80049E50 00000000 */  nop
/* 3A654 80049E54 23104300 */  subu       $v0, $v0, $v1
/* 3A658 80049E58 21105500 */  addu       $v0, $v0, $s5
/* 3A65C 80049E5C 00130200 */  sll        $v0, $v0, 12
/* 3A660 80049E60 02004104 */  bgez       $v0, .L80049E6C
/* 3A664 80049E64 00000000 */   nop
/* 3A668 80049E68 7F004224 */  addiu      $v0, $v0, 0x7F
.L80049E6C:
/* 3A66C 80049E6C C3110200 */  sra        $v0, $v0, 7
/* 3A670 80049E70 2000A2AF */  sw         $v0, 0x20($sp)
.L80049E74:
/* 3A674 80049E74 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 3A678 80049E78 00000000 */  nop
/* 3A67C 80049E7C 0300C216 */  bne        $s6, $v0, .L80049E8C
/* 3A680 80049E80 E8030224 */   addiu     $v0, $zero, 0x3E8
/* 3A684 80049E84 AC270108 */  j          .L80049EB0
/* 3A688 80049E88 21980000 */   addu      $s3, $zero, $zero
.L80049E8C:
/* 3A68C 80049E8C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3A690 80049E90 00000000 */  nop
/* 3A694 80049E94 05006210 */  beq        $v1, $v0, .L80049EAC
/* 3A698 80049E98 00000000 */   nop
/* 3A69C 80049E9C 39D6000C */  jal        INSTANCE_GetFadeValue
/* 3A6A0 80049EA0 2120C002 */   addu      $a0, $s6, $zero
/* 3A6A4 80049EA4 AC270108 */  j          .L80049EB0
/* 3A6A8 80049EA8 21984000 */   addu      $s3, $v0, $zero
.L80049EAC:
/* 3A6AC 80049EAC 0401D386 */  lh         $s3, 0x104($s6)
.L80049EB0:
/* 3A6B0 80049EB0 C2171500 */  srl        $v0, $s5, 31
/* 3A6B4 80049EB4 2110A202 */  addu       $v0, $s5, $v0
/* 3A6B8 80049EB8 43A80200 */  sra        $s5, $v0, 1
/* 3A6BC 80049EBC 2C00AA8F */  lw         $t2, 0x2C($sp)
/* 3A6C0 80049EC0 00000000 */  nop
/* 3A6C4 80049EC4 71014019 */  blez       $t2, .L8004A48C
/* 3A6C8 80049EC8 21F00000 */   addu      $fp, $zero, $zero
/* 3A6CC 80049ECC 00100A24 */  addiu      $t2, $zero, 0x1000
/* 3A6D0 80049ED0 23B85301 */  subu       $s7, $t2, $s3
.L80049ED4:
/* 3A6D4 80049ED4 44BA848F */  lw         $a0, %gp_rel(gFXT)($gp)
/* 3A6D8 80049ED8 C009010C */  jal        FX_GetPrim
/* 3A6DC 80049EDC 00000000 */   nop
/* 3A6E0 80049EE0 21884000 */  addu       $s1, $v0, $zero
/* 3A6E4 80049EE4 64012012 */  beqz       $s1, .L8004A478
/* 3A6E8 80049EE8 00000000 */   nop
/* 3A6EC 80049EEC 3AF2020C */  jal        func_800BC8E8
/* 3A6F0 80049EF0 00000000 */   nop
/* 3A6F4 80049EF4 1800A38F */  lw         $v1, 0x18($sp)
/* 3A6F8 80049EF8 7F004230 */  andi       $v0, $v0, 0x7F
/* 3A6FC 80049EFC 18006200 */  mult       $v1, $v0
/* 3A700 80049F00 34004296 */  lhu        $v0, 0x34($s2)
/* 3A704 80049F04 14008396 */  lhu        $v1, 0x14($s4)
/* 3A708 80049F08 00000000 */  nop
/* 3A70C 80049F0C 21104300 */  addu       $v0, $v0, $v1
/* 3A710 80049F10 12500000 */  mflo       $t2
/* 3A714 80049F14 031B0A00 */  sra        $v1, $t2, 12
/* 3A718 80049F18 21104300 */  addu       $v0, $v0, $v1
/* 3A71C 80049F1C 23105500 */  subu       $v0, $v0, $s5
/* 3A720 80049F20 3AF2020C */  jal        func_800BC8E8
/* 3A724 80049F24 2C0022A6 */   sh        $v0, 0x2C($s1)
/* 3A728 80049F28 1C00A38F */  lw         $v1, 0x1C($sp)
/* 3A72C 80049F2C 7F004230 */  andi       $v0, $v0, 0x7F
/* 3A730 80049F30 18006200 */  mult       $v1, $v0
/* 3A734 80049F34 36004296 */  lhu        $v0, 0x36($s2)
/* 3A738 80049F38 18008396 */  lhu        $v1, 0x18($s4)
/* 3A73C 80049F3C 00000000 */  nop
/* 3A740 80049F40 21104300 */  addu       $v0, $v0, $v1
/* 3A744 80049F44 12500000 */  mflo       $t2
/* 3A748 80049F48 031B0A00 */  sra        $v1, $t2, 12
/* 3A74C 80049F4C 21104300 */  addu       $v0, $v0, $v1
/* 3A750 80049F50 23105500 */  subu       $v0, $v0, $s5
/* 3A754 80049F54 3AF2020C */  jal        func_800BC8E8
/* 3A758 80049F58 2E0022A6 */   sh        $v0, 0x2E($s1)
/* 3A75C 80049F5C 2000A38F */  lw         $v1, 0x20($sp)
/* 3A760 80049F60 7F004230 */  andi       $v0, $v0, 0x7F
/* 3A764 80049F64 18006200 */  mult       $v1, $v0
/* 3A768 80049F68 38004296 */  lhu        $v0, 0x38($s2)
/* 3A76C 80049F6C 1C008396 */  lhu        $v1, 0x1C($s4)
/* 3A770 80049F70 00000000 */  nop
/* 3A774 80049F74 21104300 */  addu       $v0, $v0, $v1
/* 3A778 80049F78 12500000 */  mflo       $t2
/* 3A77C 80049F7C 031B0A00 */  sra        $v1, $t2, 12
/* 3A780 80049F80 21104300 */  addu       $v0, $v0, $v1
/* 3A784 80049F84 23105500 */  subu       $v0, $v0, $s5
/* 3A788 80049F88 300022A6 */  sh         $v0, 0x30($s1)
/* 3A78C 80049F8C 3B004382 */  lb         $v1, 0x3B($s2)
/* 3A790 80049F90 00000000 */  nop
/* 3A794 80049F94 0500622C */  sltiu      $v0, $v1, 0x5
/* 3A798 80049F98 38004010 */  beqz       $v0, .L8004A07C
/* 3A79C 80049F9C 0180023C */   lui       $v0, %hi(jtbl_80010300)
/* 3A7A0 80049FA0 00034224 */  addiu      $v0, $v0, %lo(jtbl_80010300)
/* 3A7A4 80049FA4 80180300 */  sll        $v1, $v1, 2
/* 3A7A8 80049FA8 21186200 */  addu       $v1, $v1, $v0
/* 3A7AC 80049FAC 0000628C */  lw         $v0, 0x0($v1)
/* 3A7B0 80049FB0 00000000 */  nop
/* 3A7B4 80049FB4 08004000 */  jr         $v0
/* 3A7B8 80049FB8 00000000 */   nop
jlabel .L80049FBC
/* 3A7BC 80049FBC F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 3A7C0 80049FC0 DCE4010C */  jal        func_80079370
/* 3A7C4 80049FC4 C0210400 */   sll       $a0, $a0, 7
/* 3A7C8 80049FC8 80180200 */  sll        $v1, $v0, 2
/* 3A7CC 80049FCC 21186200 */  addu       $v1, $v1, $v0
/* 3A7D0 80049FD0 30002296 */  lhu        $v0, 0x30($s1)
/* 3A7D4 80049FD4 C0180300 */  sll        $v1, $v1, 3
/* 3A7D8 80049FD8 02006104 */  bgez       $v1, .L80049FE4
/* 3A7DC 80049FDC 14004424 */   addiu     $a0, $v0, 0x14
/* 3A7E0 80049FE0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L80049FE4:
/* 3A7E4 80049FE4 03130300 */  sra        $v0, $v1, 12
/* 3A7E8 80049FE8 1E280108 */  j          .L8004A078
/* 3A7EC 80049FEC 21108200 */   addu      $v0, $a0, $v0
jlabel .L80049FF0
/* 3A7F0 80049FF0 F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 3A7F4 80049FF4 DCE4010C */  jal        func_80079370
/* 3A7F8 80049FF8 00220400 */   sll       $a0, $a0, 8
/* 3A7FC 80049FFC 80180200 */  sll        $v1, $v0, 2
/* 3A800 8004A000 21186200 */  addu       $v1, $v1, $v0
/* 3A804 8004A004 30002296 */  lhu        $v0, 0x30($s1)
/* 3A808 8004A008 80180300 */  sll        $v1, $v1, 2
/* 3A80C 8004A00C 02006104 */  bgez       $v1, .L8004A018
/* 3A810 8004A010 0A004424 */   addiu     $a0, $v0, 0xA
/* 3A814 8004A014 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8004A018:
/* 3A818 8004A018 03130300 */  sra        $v0, $v1, 12
/* 3A81C 8004A01C 1E280108 */  j          .L8004A078
/* 3A820 8004A020 21108200 */   addu      $v0, $a0, $v0
jlabel .L8004A024
/* 3A824 8004A024 F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 3A828 8004A028 DCE4010C */  jal        func_80079370
/* 3A82C 8004A02C 00220400 */   sll       $a0, $a0, 8
/* 3A830 8004A030 00190200 */  sll        $v1, $v0, 4
/* 3A834 8004A034 30002496 */  lhu        $a0, 0x30($s1)
/* 3A838 8004A038 23106200 */  subu       $v0, $v1, $v0
/* 3A83C 8004A03C 02004104 */  bgez       $v0, .L8004A048
/* 3A840 8004A040 08008424 */   addiu     $a0, $a0, 0x8
/* 3A844 8004A044 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004A048:
/* 3A848 8004A048 03130200 */  sra        $v0, $v0, 12
/* 3A84C 8004A04C 1E280108 */  j          .L8004A078
/* 3A850 8004A050 21108200 */   addu      $v0, $a0, $v0
jlabel .L8004A054
/* 3A854 8004A054 F4BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x12C)($gp)
/* 3A858 8004A058 DCE4010C */  jal        func_80079370
/* 3A85C 8004A05C 00220400 */   sll       $a0, $a0, 8
/* 3A860 8004A060 30002396 */  lhu        $v1, 0x30($s1)
/* 3A864 8004A064 02004104 */  bgez       $v0, .L8004A070
/* 3A868 8004A068 04006324 */   addiu     $v1, $v1, 0x4
/* 3A86C 8004A06C FF014224 */  addiu      $v0, $v0, 0x1FF
.L8004A070:
/* 3A870 8004A070 43120200 */  sra        $v0, $v0, 9
/* 3A874 8004A074 21106200 */  addu       $v0, $v1, $v0
.L8004A078:
/* 3A878 8004A078 300022A6 */  sh         $v0, 0x30($s1)
jlabel .L8004A07C
/* 3A87C 8004A07C 0D004392 */  lbu        $v1, 0xD($s2)
/* 3A880 8004A080 03000224 */  addiu      $v0, $zero, 0x3
/* 3A884 8004A084 17006214 */  bne        $v1, $v0, .L8004A0E4
/* 3A888 8004A088 00000000 */   nop
/* 3A88C 8004A08C 2C002486 */  lh         $a0, 0x2C($s1)
/* 3A890 8004A090 1400828E */  lw         $v0, 0x14($s4)
/* 3A894 8004A094 1E004386 */  lh         $v1, 0x1E($s2)
/* 3A898 8004A098 23104400 */  subu       $v0, $v0, $a0
/* 3A89C 8004A09C 1A004300 */  div        $zero, $v0, $v1
/* 3A8A0 8004A0A0 12100000 */  mflo       $v0
/* 3A8A4 8004A0A4 2E002486 */  lh         $a0, 0x2E($s1)
/* 3A8A8 8004A0A8 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 3A8AC 8004A0AC 1800828E */  lw         $v0, 0x18($s4)
/* 3A8B0 8004A0B0 1E004386 */  lh         $v1, 0x1E($s2)
/* 3A8B4 8004A0B4 23104400 */  subu       $v0, $v0, $a0
/* 3A8B8 8004A0B8 1A004300 */  div        $zero, $v0, $v1
/* 3A8BC 8004A0BC 12100000 */  mflo       $v0
/* 3A8C0 8004A0C0 30002486 */  lh         $a0, 0x30($s1)
/* 3A8C4 8004A0C4 5E0022A6 */  sh         $v0, 0x5E($s1)
/* 3A8C8 8004A0C8 1C00828E */  lw         $v0, 0x1C($s4)
/* 3A8CC 8004A0CC 1E004386 */  lh         $v1, 0x1E($s2)
/* 3A8D0 8004A0D0 23104400 */  subu       $v0, $v0, $a0
/* 3A8D4 8004A0D4 1A004300 */  div        $zero, $v0, $v1
/* 3A8D8 8004A0D8 12100000 */  mflo       $v0
/* 3A8DC 8004A0DC 69280108 */  j          .L8004A1A4
/* 3A8E0 8004A0E0 600022A6 */   sh        $v0, 0x60($s1)
.L8004A0E4:
/* 3A8E4 8004A0E4 2A004296 */  lhu        $v0, 0x2A($s2)
/* 3A8E8 8004A0E8 00000000 */  nop
/* 3A8EC 8004A0EC 02004230 */  andi       $v0, $v0, 0x2
/* 3A8F0 8004A0F0 0A004010 */  beqz       $v0, .L8004A11C
/* 3A8F4 8004A0F4 00000000 */   nop
/* 3A8F8 8004A0F8 24004296 */  lhu        $v0, 0x24($s2)
/* 3A8FC 8004A0FC 00000000 */  nop
/* 3A900 8004A100 5C0022A6 */  sh         $v0, 0x5C($s1)
/* 3A904 8004A104 26004296 */  lhu        $v0, 0x26($s2)
/* 3A908 8004A108 00000000 */  nop
/* 3A90C 8004A10C 5E0022A6 */  sh         $v0, 0x5E($s1)
/* 3A910 8004A110 28004296 */  lhu        $v0, 0x28($s2)
/* 3A914 8004A114 69280108 */  j          .L8004A1A4
/* 3A918 8004A118 600022A6 */   sh        $v0, 0x60($s1)
.L8004A11C:
/* 3A91C 8004A11C 3AF2020C */  jal        func_800BC8E8
/* 3A920 8004A120 00000000 */   nop
/* 3A924 8004A124 FF014230 */  andi       $v0, $v0, 0x1FF
/* 3A928 8004A128 24004386 */  lh         $v1, 0x24($s2)
/* 3A92C 8004A12C 01FF4224 */  addiu      $v0, $v0, -0xFF
/* 3A930 8004A130 18004300 */  mult       $v0, $v1
/* 3A934 8004A134 12100000 */  mflo       $v0
/* 3A938 8004A138 02004104 */  bgez       $v0, .L8004A144
/* 3A93C 8004A13C 00000000 */   nop
/* 3A940 8004A140 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004A144:
/* 3A944 8004A144 03130200 */  sra        $v0, $v0, 12
/* 3A948 8004A148 3AF2020C */  jal        func_800BC8E8
/* 3A94C 8004A14C 5C0022A6 */   sh        $v0, 0x5C($s1)
/* 3A950 8004A150 FF014230 */  andi       $v0, $v0, 0x1FF
/* 3A954 8004A154 26004386 */  lh         $v1, 0x26($s2)
/* 3A958 8004A158 01FF4224 */  addiu      $v0, $v0, -0xFF
/* 3A95C 8004A15C 18004300 */  mult       $v0, $v1
/* 3A960 8004A160 12100000 */  mflo       $v0
/* 3A964 8004A164 02004104 */  bgez       $v0, .L8004A170
/* 3A968 8004A168 00000000 */   nop
/* 3A96C 8004A16C FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004A170:
/* 3A970 8004A170 03130200 */  sra        $v0, $v0, 12
/* 3A974 8004A174 3AF2020C */  jal        func_800BC8E8
/* 3A978 8004A178 5E0022A6 */   sh        $v0, 0x5E($s1)
/* 3A97C 8004A17C FF014230 */  andi       $v0, $v0, 0x1FF
/* 3A980 8004A180 28004386 */  lh         $v1, 0x28($s2)
/* 3A984 8004A184 01FF4224 */  addiu      $v0, $v0, -0xFF
/* 3A988 8004A188 18004300 */  mult       $v0, $v1
/* 3A98C 8004A18C 12100000 */  mflo       $v0
/* 3A990 8004A190 02004104 */  bgez       $v0, .L8004A19C
/* 3A994 8004A194 00000000 */   nop
/* 3A998 8004A198 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8004A19C:
/* 3A99C 8004A19C 03130200 */  sra        $v0, $v0, 12
/* 3A9A0 8004A1A0 600022A6 */  sh         $v0, 0x60($s1)
.L8004A1A4:
/* 3A9A4 8004A1A4 2C004296 */  lhu        $v0, 0x2C($s2)
/* 3A9A8 8004A1A8 00000000 */  nop
/* 3A9AC 8004A1AC 620022A6 */  sh         $v0, 0x62($s1)
/* 3A9B0 8004A1B0 2E004296 */  lhu        $v0, 0x2E($s2)
/* 3A9B4 8004A1B4 00000000 */  nop
/* 3A9B8 8004A1B8 640022A6 */  sh         $v0, 0x64($s1)
/* 3A9BC 8004A1BC 30004296 */  lhu        $v0, 0x30($s2)
/* 3A9C0 8004A1C0 0C00043C */  lui        $a0, (0xC0008 >> 16)
/* 3A9C4 8004A1C4 660022A6 */  sh         $v0, 0x66($s1)
/* 3A9C8 8004A1C8 1C004396 */  lhu        $v1, 0x1C($s2)
/* 3A9CC 8004A1CC 00100224 */  addiu      $v0, $zero, 0x1000
/* 3A9D0 8004A1D0 3E0022A6 */  sh         $v0, 0x3E($s1)
/* 3A9D4 8004A1D4 400023A6 */  sh         $v1, 0x40($s1)
/* 3A9D8 8004A1D8 3C0023A6 */  sh         $v1, 0x3C($s1)
/* 3A9DC 8004A1DC 1E004296 */  lhu        $v0, 0x1E($s2)
/* 3A9E0 8004A1E0 08008434 */  ori        $a0, $a0, (0xC0008 & 0xFFFF)
/* 3A9E4 8004A1E4 0C0024AE */  sw         $a0, 0xC($s1)
/* 3A9E8 8004A1E8 100022A6 */  sh         $v0, 0x10($s1)
/* 3A9EC 8004A1EC 3C00428E */  lw         $v0, 0x3C($s2)
/* 3A9F0 8004A1F0 00000000 */  nop
/* 3A9F4 8004A1F4 200022AE */  sw         $v0, 0x20($s1)
/* 3A9F8 8004A1F8 2A004296 */  lhu        $v0, 0x2A($s2)
/* 3A9FC 8004A1FC 00000000 */  nop
/* 3AA00 8004A200 01004230 */  andi       $v0, $v0, 0x1
/* 3AA04 8004A204 1B004010 */  beqz       $v0, .L8004A274
/* 3AA08 8004A208 01000224 */   addiu     $v0, $zero, 0x1
/* 3AA0C 8004A20C D2BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 3AA10 8004A210 00000000 */  nop
/* 3AA14 8004A214 05006210 */  beq        $v1, $v0, .L8004A22C
/* 3AA18 8004A218 E8030224 */   addiu     $v0, $zero, 0x3E8
/* 3AA1C 8004A21C D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3AA20 8004A220 00000000 */  nop
/* 3AA24 8004A224 13006210 */  beq        $v1, $v0, .L8004A274
/* 3AA28 8004A228 00000000 */   nop
.L8004A22C:
/* 3AA2C 8004A22C 20003026 */  addiu      $s0, $s1, 0x20
/* 3AA30 8004A230 20002292 */  lbu        $v0, 0x20($s1)
/* 3AA34 8004A234 02000392 */  lbu        $v1, 0x2($s0)
/* 3AA38 8004A238 020002A2 */  sb         $v0, 0x2($s0)
/* 3AA3C 8004A23C 200023A2 */  sb         $v1, 0x20($s1)
/* 3AA40 8004A240 D0BD8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 3AA44 8004A244 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 3AA48 8004A248 0A006210 */  beq        $v1, $v0, .L8004A274
/* 3AA4C 8004A24C 00000000 */   nop
/* 3AA50 8004A250 8124010C */  jal        FX_GetMorphFadeVal
/* 3AA54 8004A254 00000000 */   nop
/* 3AA58 8004A258 1000B0AF */  sw         $s0, 0x10($sp)
/* 3AA5C 8004A25C 3C004426 */  addiu      $a0, $s2, 0x3C
/* 3AA60 8004A260 21280002 */  addu       $a1, $s0, $zero
/* 3AA64 8004A264 00100A24 */  addiu      $t2, $zero, 0x1000
/* 3AA68 8004A268 23304201 */  subu       $a2, $t2, $v0
/* 3AA6C 8004A26C A8F3020C */  jal        func_800BCEA0
/* 3AA70 8004A270 21384000 */   addu      $a3, $v0, $zero
.L8004A274:
/* 3AA74 8004A274 4000428E */  lw         $v0, 0x40($s2)
/* 3AA78 8004A278 3A0033A6 */  sh         $s3, 0x3A($s1)
/* 3AA7C 8004A27C 380033A6 */  sh         $s3, 0x38($s1)
/* 3AA80 8004A280 360033A6 */  sh         $s3, 0x36($s1)
/* 3AA84 8004A284 340033A6 */  sh         $s3, 0x34($s1)
/* 3AA88 8004A288 07006016 */  bnez       $s3, .L8004A2A8
/* 3AA8C 8004A28C 240022AE */   sw        $v0, 0x24($s1)
/* 3AA90 8004A290 1E004286 */  lh         $v0, 0x1E($s2)
/* 3AA94 8004A294 00100A24 */  addiu      $t2, $zero, 0x1000
/* 3AA98 8004A298 1A004201 */  div        $zero, $t2, $v0
/* 3AA9C 8004A29C 12100000 */  mflo       $v0
/* 3AAA0 8004A2A0 BC280108 */  j          .L8004A2F0
/* 3AAA4 8004A2A4 320022A6 */   sh        $v0, 0x32($s1)
.L8004A2A8:
/* 3AAA8 8004A2A8 1E004386 */  lh         $v1, 0x1E($s2)
/* 3AAAC 8004A2AC 00000000 */  nop
/* 3AAB0 8004A2B0 1A00E302 */  div        $zero, $s7, $v1
/* 3AAB4 8004A2B4 12180000 */  mflo       $v1
/* 3AAB8 8004A2B8 20002426 */  addiu      $a0, $s1, 0x20
/* 3AABC 8004A2BC 2800B027 */  addiu      $s0, $sp, 0x28
/* 3AAC0 8004A2C0 21280002 */  addu       $a1, $s0, $zero
/* 3AAC4 8004A2C4 2130E002 */  addu       $a2, $s7, $zero
/* 3AAC8 8004A2C8 21386002 */  addu       $a3, $s3, $zero
/* 3AACC 8004A2CC 320023A6 */  sh         $v1, 0x32($s1)
/* 3AAD0 8004A2D0 A8F3020C */  jal        func_800BCEA0
/* 3AAD4 8004A2D4 1000A4AF */   sw        $a0, 0x10($sp)
/* 3AAD8 8004A2D8 24002426 */  addiu      $a0, $s1, 0x24
/* 3AADC 8004A2DC 21280002 */  addu       $a1, $s0, $zero
/* 3AAE0 8004A2E0 2130E002 */  addu       $a2, $s7, $zero
/* 3AAE4 8004A2E4 21386002 */  addu       $a3, $s3, $zero
/* 3AAE8 8004A2E8 A8F3020C */  jal        func_800BCEA0
/* 3AAEC 8004A2EC 1000A4AF */   sw        $a0, 0x10($sp)
.L8004A2F0:
/* 3AAF0 8004A2F0 1000428E */  lw         $v0, 0x10($s2)
/* 3AAF4 8004A2F4 00000000 */  nop
/* 3AAF8 8004A2F8 0D004010 */  beqz       $v0, .L8004A330
/* 3AAFC 8004A2FC FF03043C */   lui       $a0, (0x3FFFFFF >> 16)
/* 3AB00 8004A300 FFFF8434 */  ori        $a0, $a0, (0x3FFFFFF & 0xFFFF)
/* 3AB04 8004A304 0C00228E */  lw         $v0, 0xC($s1)
/* 3AB08 8004A308 2000238E */  lw         $v1, 0x20($s1)
/* 3AB0C 8004A30C 01004234 */  ori        $v0, $v0, 0x1
/* 3AB10 8004A310 24186400 */  and        $v1, $v1, $a0
/* 3AB14 8004A314 0C0022AE */  sw         $v0, 0xC($s1)
/* 3AB18 8004A318 002C023C */  lui        $v0, (0x2C000000 >> 16)
/* 3AB1C 8004A31C 1000448E */  lw         $a0, 0x10($s2)
/* 3AB20 8004A320 25186200 */  or         $v1, $v1, $v0
/* 3AB24 8004A324 1C0023AE */  sw         $v1, 0x1C($s1)
/* 3AB28 8004A328 D3280108 */  j          .L8004A34C
/* 3AB2C 8004A32C 080024AE */   sw        $a0, 0x8($s1)
.L8004A330:
/* 3AB30 8004A330 FF03023C */  lui        $v0, (0x3FFFFFF >> 16)
/* 3AB34 8004A334 2000238E */  lw         $v1, 0x20($s1)
/* 3AB38 8004A338 FFFF4234 */  ori        $v0, $v0, (0x3FFFFFF & 0xFFFF)
/* 3AB3C 8004A33C 24186200 */  and        $v1, $v1, $v0
/* 3AB40 8004A340 0020023C */  lui        $v0, (0x20000000 >> 16)
/* 3AB44 8004A344 25186200 */  or         $v1, $v1, $v0
/* 3AB48 8004A348 1C0023AE */  sw         $v1, 0x1C($s1)
.L8004A34C:
/* 3AB4C 8004A34C 22004286 */  lh         $v0, 0x22($s2)
/* 3AB50 8004A350 00000000 */  nop
/* 3AB54 8004A354 0B004010 */  beqz       $v0, .L8004A384
/* 3AB58 8004A358 00000000 */   nop
/* 3AB5C 8004A35C 0C00228E */  lw         $v0, 0xC($s1)
/* 3AB60 8004A360 00000000 */  nop
/* 3AB64 8004A364 00204234 */  ori        $v0, $v0, 0x2000
/* 3AB68 8004A368 0C0022AE */  sw         $v0, 0xC($s1)
/* 3AB6C 8004A36C 32004296 */  lhu        $v0, 0x32($s2)
/* 3AB70 8004A370 00000000 */  nop
/* 3AB74 8004A374 3E0022A6 */  sh         $v0, 0x3E($s1)
/* 3AB78 8004A378 22004296 */  lhu        $v0, 0x22($s2)
/* 3AB7C 8004A37C 00000000 */  nop
/* 3AB80 8004A380 5A0022A6 */  sh         $v0, 0x5A($s1)
.L8004A384:
/* 3AB84 8004A384 0D004392 */  lbu        $v1, 0xD($s2)
/* 3AB88 8004A388 01000224 */  addiu      $v0, $zero, 0x1
/* 3AB8C 8004A38C 0B006214 */  bne        $v1, $v0, .L8004A3BC
/* 3AB90 8004A390 0008033C */   lui       $v1, (0x8000000 >> 16)
/* 3AB94 8004A394 180036AE */  sw         $s6, 0x18($s1)
/* 3AB98 8004A398 3A004292 */  lbu        $v0, 0x3A($s2)
/* 3AB9C 8004A39C 00000000 */  nop
/* 3ABA0 8004A3A0 00160200 */  sll        $v0, $v0, 24
/* 3ABA4 8004A3A4 03160200 */  sra        $v0, $v0, 24
/* 3ABA8 8004A3A8 420022A6 */  sh         $v0, 0x42($s1)
/* 3ABAC 8004A3AC 0C00228E */  lw         $v0, 0xC($s1)
/* 3ABB0 8004A3B0 00000000 */  nop
/* 3ABB4 8004A3B4 25104300 */  or         $v0, $v0, $v1
/* 3ABB8 8004A3B8 0C0022AE */  sw         $v0, 0xC($s1)
.L8004A3BC:
/* 3ABBC 8004A3BC 1800428E */  lw         $v0, 0x18($s2)
/* 3ABC0 8004A3C0 00000000 */  nop
/* 3ABC4 8004A3C4 03004014 */  bnez       $v0, .L8004A3D4
/* 3ABC8 8004A3C8 00000000 */   nop
/* 3ABCC 8004A3CC 0580023C */  lui        $v0, %hi(FX_StandardFXPrimProcess)
/* 3ABD0 8004A3D0 98834224 */  addiu      $v0, $v0, %lo(FX_StandardFXPrimProcess)
.L8004A3D4:
/* 3ABD4 8004A3D4 140022AE */  sw         $v0, 0x14($s1)
/* 3ABD8 8004A3D8 1400428E */  lw         $v0, 0x14($s2)
/* 3ABDC 8004A3DC 00000000 */  nop
/* 3ABE0 8004A3E0 05004010 */  beqz       $v0, .L8004A3F8
/* 3ABE4 8004A3E4 21202002 */   addu      $a0, $s1, $zero
/* 3ABE8 8004A3E8 2128C002 */  addu       $a1, $s6, $zero
/* 3ABEC 8004A3EC 5C00A78F */  lw         $a3, 0x5C($sp)
/* 3ABF0 8004A3F0 09F84000 */  jalr       $v0
/* 3ABF4 8004A3F4 21304002 */   addu      $a2, $s2, $zero
.L8004A3F8:
/* 3ABF8 8004A3F8 0D004392 */  lbu        $v1, 0xD($s2)
/* 3ABFC 8004A3FC 03000224 */  addiu      $v0, $zero, 0x3
/* 3AC00 8004A400 1A006214 */  bne        $v1, $v0, .L8004A46C
/* 3AC04 8004A404 21282002 */   addu      $a1, $s1, $zero
/* 3AC08 8004A408 5C00AA8F */  lw         $t2, 0x5C($sp)
/* 3AC0C 8004A40C 2C00A794 */  lhu        $a3, 0x2C($a1)
/* 3AC10 8004A410 2E00A894 */  lhu        $t0, 0x2E($a1)
/* 3AC14 8004A414 3000A994 */  lhu        $t1, 0x30($a1)
/* 3AC18 8004A418 5C00A694 */  lhu        $a2, 0x5C($a1)
/* 3AC1C 8004A41C 0901023C */  lui        $v0, (0x1090000 >> 16)
/* 3AC20 8004A420 0C00A2AC */  sw         $v0, 0xC($a1)
/* 3AC24 8004A424 2118E000 */  addu       $v1, $a3, $zero
/* 3AC28 8004A428 21186600 */  addu       $v1, $v1, $a2
/* 3AC2C 8004A42C 5E00A694 */  lhu        $a2, 0x5E($a1)
/* 3AC30 8004A430 906D4425 */  addiu      $a0, $t2, 0x6D90
/* 3AC34 8004A434 3C00A7A4 */  sh         $a3, 0x3C($a1)
/* 3AC38 8004A438 6000A794 */  lhu        $a3, 0x60($a1)
/* 3AC3C 8004A43C 21100001 */  addu       $v0, $t0, $zero
/* 3AC40 8004A440 4400A3A4 */  sh         $v1, 0x44($a1)
/* 3AC44 8004A444 21182001 */  addu       $v1, $t1, $zero
/* 3AC48 8004A448 3E00A8A4 */  sh         $t0, 0x3E($a1)
/* 3AC4C 8004A44C 4000A9A4 */  sh         $t1, 0x40($a1)
/* 3AC50 8004A450 21104600 */  addu       $v0, $v0, $a2
/* 3AC54 8004A454 21186700 */  addu       $v1, $v1, $a3
/* 3AC58 8004A458 4600A2A4 */  sh         $v0, 0x46($a1)
/* 3AC5C 8004A45C D53E010C */  jal        LIST_InsertFunc
/* 3AC60 8004A460 4800A3A4 */   sh        $v1, 0x48($a1)
/* 3AC64 8004A464 1E290108 */  j          .L8004A478
/* 3AC68 8004A468 00000000 */   nop
.L8004A46C:
/* 3AC6C 8004A46C 5C00AA8F */  lw         $t2, 0x5C($sp)
/* 3AC70 8004A470 8F19010C */  jal        FX_Sprite_Insert
/* 3AC74 8004A474 986D4425 */   addiu     $a0, $t2, 0x6D98
.L8004A478:
/* 3AC78 8004A478 2C00AA8F */  lw         $t2, 0x2C($sp)
/* 3AC7C 8004A47C 0100DE27 */  addiu      $fp, $fp, 0x1
/* 3AC80 8004A480 2A10CA03 */  slt        $v0, $fp, $t2
/* 3AC84 8004A484 93FE4014 */  bnez       $v0, .L80049ED4
/* 3AC88 8004A488 00000000 */   nop
.L8004A48C:
/* 3AC8C 8004A48C 0E004286 */  lh         $v0, 0xE($s2)
/* 3AC90 8004A490 0E004396 */  lhu        $v1, 0xE($s2)
/* 3AC94 8004A494 0A004018 */  blez       $v0, .L8004A4C0
/* 3AC98 8004A498 00000000 */   nop
/* 3AC9C 8004A49C C0C38297 */  lhu        $v0, %gp_rel(FX_Frames)($gp)
/* 3ACA0 8004A4A0 00000000 */  nop
/* 3ACA4 8004A4A4 23106200 */  subu       $v0, $v1, $v0
/* 3ACA8 8004A4A8 0E0042A6 */  sh         $v0, 0xE($s2)
/* 3ACAC 8004A4AC 00140200 */  sll        $v0, $v0, 16
/* 3ACB0 8004A4B0 0300401C */  bgtz       $v0, .L8004A4C0
/* 3ACB4 8004A4B4 00000000 */   nop
/* 3ACB8 8004A4B8 1F2D010C */  jal        FX_DeleteGeneralEffect
/* 3ACBC 8004A4BC 21204002 */   addu      $a0, $s2, $zero
.L8004A4C0:
/* 3ACC0 8004A4C0 5400BF8F */  lw         $ra, 0x54($sp)
/* 3ACC4 8004A4C4 5000BE8F */  lw         $fp, 0x50($sp)
/* 3ACC8 8004A4C8 4C00B78F */  lw         $s7, 0x4C($sp)
/* 3ACCC 8004A4CC 4800B68F */  lw         $s6, 0x48($sp)
/* 3ACD0 8004A4D0 4400B58F */  lw         $s5, 0x44($sp)
/* 3ACD4 8004A4D4 4000B48F */  lw         $s4, 0x40($sp)
/* 3ACD8 8004A4D8 3C00B38F */  lw         $s3, 0x3C($sp)
/* 3ACDC 8004A4DC 3800B28F */  lw         $s2, 0x38($sp)
/* 3ACE0 8004A4E0 3400B18F */  lw         $s1, 0x34($sp)
/* 3ACE4 8004A4E4 3000B08F */  lw         $s0, 0x30($sp)
/* 3ACE8 8004A4E8 0800E003 */  jr         $ra
/* 3ACEC 8004A4EC 5800BD27 */   addiu     $sp, $sp, 0x58
.size FX_ContinueParticle, . - FX_ContinueParticle
