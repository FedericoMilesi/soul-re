.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerAutoFace
/* 9F710 800AEF10 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9F714 800AEF14 1800B0AF */  sw         $s0, 0x18($sp)
/* 9F718 800AEF18 21808000 */  addu       $s0, $a0, $zero
/* 9F71C 800AEF1C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9F720 800AEF20 2188A000 */  addu       $s1, $a1, $zero
/* 9F724 800AEF24 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 9F728 800AEF28 3800BEAF */  sw         $fp, 0x38($sp)
/* 9F72C 800AEF2C 3400B7AF */  sw         $s7, 0x34($sp)
/* 9F730 800AEF30 3000B6AF */  sw         $s6, 0x30($sp)
/* 9F734 800AEF34 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 9F738 800AEF38 2800B4AF */  sw         $s4, 0x28($sp)
/* 9F73C 800AEF3C 2400B3AF */  sw         $s3, 0x24($sp)
/* 9F740 800AEF40 2000B2AF */  sw         $s2, 0x20($sp)
/* 9F744 800AEF44 A9C9010C */  jal        G2EmulationQueryAnimation
/* 9F748 800AEF48 4800A6AF */   sw        $a2, 0x48($sp)
/* 9F74C 800AEF4C 21904000 */  addu       $s2, $v0, $zero
/* 9F750 800AEF50 02000224 */  addiu      $v0, $zero, 0x2
/* 9F754 800AEF54 02002216 */  bne        $s1, $v0, .L800AEF60
/* 9F758 800AEF58 04001324 */   addiu     $s3, $zero, 0x4
/* 9F75C 800AEF5C 06001324 */  addiu      $s3, $zero, 0x6
.L800AEF60:
/* 9F760 800AEF60 C0101100 */  sll        $v0, $s1, 3
/* 9F764 800AEF64 21105100 */  addu       $v0, $v0, $s1
/* 9F768 800AEF68 C0100200 */  sll        $v0, $v0, 3
/* 9F76C 800AEF6C 23105100 */  subu       $v0, $v0, $s1
/* 9F770 800AEF70 80B00200 */  sll        $s6, $v0, 2
/* 9F774 800AEF74 21A81602 */  addu       $s5, $s0, $s6
/* 9F778 800AEF78 02001424 */  addiu      $s4, $zero, 0x2
/* 9F77C 800AEF7C 0A80173C */  lui        $s7, %hi(StateHandlerAttack2)
/* 9F780 800AEF80 E4BDFE26 */  addiu      $fp, $s7, %lo(StateHandlerAttack2)
/* 9F784 800AEF84 2120D002 */  addu       $a0, $s6, $s0
.L800AEF88:
/* 9F788 800AEF88 39C3010C */  jal        PeekMessageQueue
/* 9F78C 800AEF8C 0C008424 */   addiu     $a0, $a0, 0xC
/* 9F790 800AEF90 21204000 */  addu       $a0, $v0, $zero
/* 9F794 800AEF94 90018010 */  beqz       $a0, .L800AF5D8
/* 9F798 800AEF98 1000023C */   lui       $v0, (0x100004 >> 16)
/* 9F79C 800AEF9C 0000838C */  lw         $v1, 0x0($a0)
/* 9F7A0 800AEFA0 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 9F7A4 800AEFA4 6D006210 */  beq        $v1, $v0, .L800AF15C
/* 9F7A8 800AEFA8 2A104300 */   slt       $v0, $v0, $v1
/* 9F7AC 800AEFAC 1B004014 */  bnez       $v0, .L800AF01C
/* 9F7B0 800AEFB0 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9F7B4 800AEFB4 0080023C */  lui        $v0, (0x80000002 >> 16)
/* 9F7B8 800AEFB8 02004234 */  ori        $v0, $v0, (0x80000002 & 0xFFFF)
/* 9F7BC 800AEFBC 2E016210 */  beq        $v1, $v0, .L800AF478
/* 9F7C0 800AEFC0 2A104300 */   slt       $v0, $v0, $v1
/* 9F7C4 800AEFC4 08004014 */  bnez       $v0, .L800AEFE8
/* 9F7C8 800AEFC8 1000023C */   lui       $v0, (0x100000 >> 16)
/* 9F7CC 800AEFCC 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9F7D0 800AEFD0 6D016210 */  beq        $v1, $v0, .L800AF588
/* 9F7D4 800AEFD4 01004234 */   ori       $v0, $v0, (0x80000001 & 0xFFFF)
/* 9F7D8 800AEFD8 7A016210 */  beq        $v1, $v0, .L800AF5C4
/* 9F7DC 800AEFDC 00000000 */   nop
/* 9F7E0 800AEFE0 6EBD0208 */  j          .L800AF5B8
/* 9F7E4 800AEFE4 21200002 */   addu      $a0, $s0, $zero
.L800AEFE8:
/* 9F7E8 800AEFE8 3E016210 */  beq        $v1, $v0, .L800AF4E4
/* 9F7EC 800AEFEC 2A104300 */   slt       $v0, $v0, $v1
/* 9F7F0 800AEFF0 05004014 */  bnez       $v0, .L800AF008
/* 9F7F4 800AEFF4 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9F7F8 800AEFF8 02016010 */  beqz       $v1, .L800AF404
/* 9F7FC 800AEFFC 21200002 */   addu      $a0, $s0, $zero
/* 9F800 800AF000 6EBD0208 */  j          .L800AF5B8
/* 9F804 800AF004 00000000 */   nop
.L800AF008:
/* 9F808 800AF008 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9F80C 800AF00C 26006210 */  beq        $v1, $v0, .L800AF0A8
/* 9F810 800AF010 21200002 */   addu      $a0, $s0, $zero
/* 9F814 800AF014 6EBD0208 */  j          .L800AF5B8
/* 9F818 800AF018 00000000 */   nop
.L800AF01C:
/* 9F81C 800AF01C 21016210 */  beq        $v1, $v0, .L800AF4A4
/* 9F820 800AF020 2A104300 */   slt       $v0, $v0, $v1
/* 9F824 800AF024 11004014 */  bnez       $v0, .L800AF06C
/* 9F828 800AF028 0010023C */   lui       $v0, (0x10000000 >> 16)
/* 9F82C 800AF02C 0002023C */  lui        $v0, (0x2000000 >> 16)
/* 9F830 800AF030 4A016210 */  beq        $v1, $v0, .L800AF55C
/* 9F834 800AF034 2A104300 */   slt       $v0, $v0, $v1
/* 9F838 800AF038 07004014 */  bnez       $v0, .L800AF058
/* 9F83C 800AF03C 0104023C */   lui       $v0, (0x4010080 >> 16)
/* 9F840 800AF040 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 9F844 800AF044 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 9F848 800AF048 5D006210 */  beq        $v1, $v0, .L800AF1C0
/* 9F84C 800AF04C 01000224 */   addiu     $v0, $zero, 0x1
/* 9F850 800AF050 6EBD0208 */  j          .L800AF5B8
/* 9F854 800AF054 21200002 */   addu      $a0, $s0, $zero
.L800AF058:
/* 9F858 800AF058 80004234 */  ori        $v0, $v0, (0x4010080 & 0xFFFF)
/* 9F85C 800AF05C 48006210 */  beq        $v1, $v0, .L800AF180
/* 9F860 800AF060 00000000 */   nop
/* 9F864 800AF064 6EBD0208 */  j          .L800AF5B8
/* 9F868 800AF068 21200002 */   addu      $a0, $s0, $zero
.L800AF06C:
/* 9F86C 800AF06C 29016210 */  beq        $v1, $v0, .L800AF514
/* 9F870 800AF070 2A104300 */   slt       $v0, $v0, $v1
/* 9F874 800AF074 07004014 */  bnez       $v0, .L800AF094
/* 9F878 800AF078 0020023C */   lui       $v0, (0x20000004 >> 16)
/* 9F87C 800AF07C 0008023C */  lui        $v0, (0x8000003 >> 16)
/* 9F880 800AF080 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* 9F884 800AF084 39006210 */  beq        $v1, $v0, .L800AF16C
/* 9F888 800AF088 21200002 */   addu      $a0, $s0, $zero
/* 9F88C 800AF08C 6EBD0208 */  j          .L800AF5B8
/* 9F890 800AF090 00000000 */   nop
.L800AF094:
/* 9F894 800AF094 04004234 */  ori        $v0, $v0, (0x20000004 & 0xFFFF)
/* 9F898 800AF098 EE006210 */  beq        $v1, $v0, .L800AF454
/* 9F89C 800AF09C 21200002 */   addu      $a0, $s0, $zero
/* 9F8A0 800AF0A0 6EBD0208 */  j          .L800AF5B8
/* 9F8A4 800AF0A4 00000000 */   nop
.L800AF0A8:
/* 9F8A8 800AF0A8 0100023C */  lui        $v0, (0x1210B >> 16)
/* 9F8AC 800AF0AC C4FC838F */  lw         $v1, %gp_rel(PadData)($gp)
/* 9F8B0 800AF0B0 0B214234 */  ori        $v0, $v0, (0x1210B & 0xFFFF)
/* 9F8B4 800AF0B4 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9F8B8 800AF0B8 0000628C */  lw         $v0, 0x0($v1)
/* 9F8BC 800AF0BC A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* 9F8C0 800AF0C0 00000000 */  nop
/* 9F8C4 800AF0C4 24104300 */  and        $v0, $v0, $v1
/* 9F8C8 800AF0C8 04004010 */  beqz       $v0, .L800AF0DC
/* 9F8CC 800AF0CC 0002033C */   lui       $v1, (0x2000001 >> 16)
/* 9F8D0 800AF0D0 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F8D4 800AF0D4 39BC0208 */  j          .L800AF0E4
/* 9F8D8 800AF0D8 02006334 */   ori       $v1, $v1, (0x2000002 & 0xFFFF)
.L800AF0DC:
/* 9F8DC 800AF0DC 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F8E0 800AF0E0 01006334 */  ori        $v1, $v1, (0x2000001 & 0xFFFF)
.L800AF0E4:
/* 9F8E4 800AF0E4 25104300 */  or         $v0, $v0, $v1
/* 9F8E8 800AF0E8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9F8EC 800AF0EC 03000224 */  addiu      $v0, $zero, 0x3
/* 9F8F0 800AF0F0 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9F8F4 800AF0F4 05002016 */  bnez       $s1, .L800AF10C
/* 9F8F8 800AF0F8 21282002 */   addu      $a1, $s1, $zero
/* 9F8FC 800AF0FC 0000048E */  lw         $a0, 0x0($s0)
/* 9F900 800AF100 938B020C */  jal        SteerSwitchMode
/* 9F904 800AF104 05000524 */   addiu     $a1, $zero, 0x5
/* 9F908 800AF108 21282002 */  addu       $a1, $s1, $zero
.L800AF10C:
/* 9F90C 800AF10C 54000624 */  addiu      $a2, $zero, 0x54
/* 9F910 800AF110 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9F914 800AF114 1C01A0AE */  sw         $zero, 0x11C($s5)
/* 9F918 800AF118 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F91C 800AF11C 0000048E */  lw         $a0, 0x0($s0)
/* 9F920 800AF120 5E9C020C */  jal        razSwitchVAnimGroup
/* 9F924 800AF124 21384000 */   addu      $a3, $v0, $zero
/* 9F928 800AF128 08004010 */  beqz       $v0, .L800AF14C
/* 9F92C 800AF12C 21200002 */   addu      $a0, $s0, $zero
/* 9F930 800AF130 21282002 */  addu       $a1, $s1, $zero
/* 9F934 800AF134 37000624 */  addiu      $a2, $zero, 0x37
/* 9F938 800AF138 21380000 */  addu       $a3, $zero, $zero
/* 9F93C 800AF13C 06000224 */  addiu      $v0, $zero, 0x6
/* 9F940 800AF140 1000A2AF */  sw         $v0, 0x10($sp)
/* 9F944 800AF144 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9F948 800AF148 1400B4AF */   sw        $s4, 0x14($sp)
.L800AF14C:
/* 9F94C 800AF14C C89E020C */  jal        razSetPlayerEventHistory
/* 9F950 800AF150 20000424 */   addiu     $a0, $zero, 0x20
/* 9F954 800AF154 72BD0208 */  j          .L800AF5C8
/* 9F958 800AF158 2120D002 */   addu      $a0, $s6, $s0
.L800AF15C:
/* 9F95C 800AF15C 1A012016 */  bnez       $s1, .L800AF5C8
/* 9F960 800AF160 2120D002 */   addu      $a0, $s6, $s0
/* 9F964 800AF164 66BC0208 */  j          .L800AF198
/* 9F968 800AF168 00000000 */   nop
.L800AF16C:
/* 9F96C 800AF16C 37000224 */  addiu      $v0, $zero, 0x37
/* 9F970 800AF170 14014216 */  bne        $s2, $v0, .L800AF5C4
/* 9F974 800AF174 01000224 */   addiu     $v0, $zero, 0x1
/* 9F978 800AF178 71BD0208 */  j          .L800AF5C4
/* 9F97C 800AF17C 1C01A2AE */   sw        $v0, 0x11C($s5)
.L800AF180:
/* 9F980 800AF180 10012016 */  bnez       $s1, .L800AF5C4
/* 9F984 800AF184 00000000 */   nop
/* 9F988 800AF188 0400828C */  lw         $v0, 0x4($a0)
/* 9F98C 800AF18C 00000000 */  nop
/* 9F990 800AF190 06004010 */  beqz       $v0, .L800AF1AC
/* 9F994 800AF194 00000000 */   nop
.L800AF198:
/* 9F998 800AF198 0000048E */  lw         $a0, 0x0($s0)
/* 9F99C 800AF19C FD98020C */  jal        razResetPauseTranslation
/* 9F9A0 800AF1A0 00000000 */   nop
/* 9F9A4 800AF1A4 72BD0208 */  j          .L800AF5C8
/* 9F9A8 800AF1A8 2120D002 */   addu      $a0, $s6, $s0
.L800AF1AC:
/* 9F9AC 800AF1AC 0000048E */  lw         $a0, 0x0($s0)
/* 9F9B0 800AF1B0 E098020C */  jal        razSetPauseTranslation
/* 9F9B4 800AF1B4 00000000 */   nop
/* 9F9B8 800AF1B8 72BD0208 */  j          .L800AF5C8
/* 9F9BC 800AF1BC 2120D002 */   addu      $a0, $s6, $s0
.L800AF1C0:
/* 9F9C0 800AF1C0 08002216 */  bne        $s1, $v0, .L800AF1E4
/* 9F9C4 800AF1C4 0010023C */   lui       $v0, (0x10001002 >> 16)
/* 9F9C8 800AF1C8 0000028E */  lw         $v0, 0x0($s0)
/* 9F9CC 800AF1CC 00000000 */  nop
/* 9F9D0 800AF1D0 4C01428C */  lw         $v0, 0x14C($v0)
/* 9F9D4 800AF1D4 00000000 */  nop
/* 9F9D8 800AF1D8 02004010 */  beqz       $v0, .L800AF1E4
/* 9F9DC 800AF1DC 0010023C */   lui       $v0, (0x10001002 >> 16)
/* 9F9E0 800AF1E0 040080AC */  sw         $zero, 0x4($a0)
.L800AF1E4:
/* 9F9E4 800AF1E4 0400838C */  lw         $v1, 0x4($a0)
/* 9F9E8 800AF1E8 02104234 */  ori        $v0, $v0, (0x10001002 & 0xFFFF)
/* 9F9EC 800AF1EC 65006210 */  beq        $v1, $v0, .L800AF384
/* 9F9F0 800AF1F0 2A104300 */   slt       $v0, $v0, $v1
/* 9F9F4 800AF1F4 06004014 */  bnez       $v0, .L800AF210
/* 9F9F8 800AF1F8 0010023C */   lui       $v0, (0x10001001 >> 16)
/* 9F9FC 800AF1FC 01104234 */  ori        $v0, $v0, (0x10001001 & 0xFFFF)
/* 9FA00 800AF200 0B006210 */  beq        $v1, $v0, .L800AF230
/* 9FA04 800AF204 2120D002 */   addu      $a0, $s6, $s0
/* 9FA08 800AF208 72BD0208 */  j          .L800AF5C8
/* 9FA0C 800AF20C 00000000 */   nop
.L800AF210:
/* 9FA10 800AF210 03104234 */  ori        $v0, $v0, (0x10001003 & 0xFFFF)
/* 9FA14 800AF214 27006210 */  beq        $v1, $v0, .L800AF2B4
/* 9FA18 800AF218 0010023C */   lui       $v0, (0x10001004 >> 16)
/* 9FA1C 800AF21C 04104234 */  ori        $v0, $v0, (0x10001004 & 0xFFFF)
/* 9FA20 800AF220 3E006210 */  beq        $v1, $v0, .L800AF31C
/* 9FA24 800AF224 2120D002 */   addu      $a0, $s6, $s0
/* 9FA28 800AF228 72BD0208 */  j          .L800AF5C8
/* 9FA2C 800AF22C 00000000 */   nop
.L800AF230:
/* 9FA30 800AF230 0C000224 */  addiu      $v0, $zero, 0xC
/* 9FA34 800AF234 06004212 */  beq        $s2, $v0, .L800AF250
/* 9FA38 800AF238 21200002 */   addu      $a0, $s0, $zero
/* 9FA3C 800AF23C 21282002 */  addu       $a1, $s1, $zero
/* 9FA40 800AF240 21304000 */  addu       $a2, $v0, $zero
/* 9FA44 800AF244 21380000 */  addu       $a3, $zero, $zero
/* 9FA48 800AF248 35BD0208 */  j          .L800AF4D4
/* 9FA4C 800AF24C 1000B3AF */   sw        $s3, 0x10($sp)
.L800AF250:
/* 9FA50 800AF250 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9FA54 800AF254 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9FA58 800AF258 0400428C */  lw         $v0, 0x4($v0)
/* 9FA5C 800AF25C 00000000 */  nop
/* 9FA60 800AF260 24104300 */  and        $v0, $v0, $v1
/* 9FA64 800AF264 D8004010 */  beqz       $v0, .L800AF5C8
/* 9FA68 800AF268 2120D002 */   addu      $a0, $s6, $s0
/* 9FA6C 800AF26C CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9FA70 800AF270 00000000 */  nop
/* 9FA74 800AF274 80004230 */  andi       $v0, $v0, 0x80
/* 9FA78 800AF278 D3004014 */  bnez       $v0, .L800AF5C8
/* 9FA7C 800AF27C 21282002 */   addu      $a1, $s1, $zero
/* 9FA80 800AF280 21200002 */  addu       $a0, $s0, $zero
/* 9FA84 800AF284 2130C003 */  addu       $a2, $fp, $zero
/* 9FA88 800AF288 C1CA010C */  jal        StateSwitchStateData
/* 9FA8C 800AF28C 05000724 */   addiu     $a3, $zero, 0x5
/* 9FA90 800AF290 CD003416 */  bne        $s1, $s4, .L800AF5C8
/* 9FA94 800AF294 2120D002 */   addu      $a0, $s6, $s0
/* 9FA98 800AF298 21200002 */  addu       $a0, $s0, $zero
/* 9FA9C 800AF29C 01000524 */  addiu      $a1, $zero, 0x1
/* 9FAA0 800AF2A0 2130C003 */  addu       $a2, $fp, $zero
/* 9FAA4 800AF2A4 C1CA010C */  jal        StateSwitchStateData
/* 9FAA8 800AF2A8 05000724 */   addiu     $a3, $zero, 0x5
/* 9FAAC 800AF2AC 72BD0208 */  j          .L800AF5C8
/* 9FAB0 800AF2B0 2120D002 */   addu      $a0, $s6, $s0
.L800AF2B4:
/* 9FAB4 800AF2B4 0D000224 */  addiu      $v0, $zero, 0xD
/* 9FAB8 800AF2B8 08004212 */  beq        $s2, $v0, .L800AF2DC
/* 9FABC 800AF2BC 5B000224 */   addiu     $v0, $zero, 0x5B
/* 9FAC0 800AF2C0 06004212 */  beq        $s2, $v0, .L800AF2DC
/* 9FAC4 800AF2C4 21200002 */   addu      $a0, $s0, $zero
/* 9FAC8 800AF2C8 21282002 */  addu       $a1, $s1, $zero
/* 9FACC 800AF2CC 0D000624 */  addiu      $a2, $zero, 0xD
/* 9FAD0 800AF2D0 21380000 */  addu       $a3, $zero, $zero
/* 9FAD4 800AF2D4 35BD0208 */  j          .L800AF4D4
/* 9FAD8 800AF2D8 1000B3AF */   sw        $s3, 0x10($sp)
.L800AF2DC:
/* 9FADC 800AF2DC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9FAE0 800AF2E0 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9FAE4 800AF2E4 0400428C */  lw         $v0, 0x4($v0)
/* 9FAE8 800AF2E8 00000000 */  nop
/* 9FAEC 800AF2EC 24104300 */  and        $v0, $v0, $v1
/* 9FAF0 800AF2F0 B4004010 */  beqz       $v0, .L800AF5C4
/* 9FAF4 800AF2F4 5B000224 */   addiu     $v0, $zero, 0x5B
/* 9FAF8 800AF2F8 B3004212 */  beq        $s2, $v0, .L800AF5C8
/* 9FAFC 800AF2FC 2120D002 */   addu      $a0, $s6, $s0
/* 9FB00 800AF300 0000048E */  lw         $a0, 0x0($s0)
/* 9FB04 800AF304 938B020C */  jal        SteerSwitchMode
/* 9FB08 800AF308 0E000524 */   addiu     $a1, $zero, 0xE
/* 9FB0C 800AF30C 21200002 */  addu       $a0, $s0, $zero
/* 9FB10 800AF310 21282002 */  addu       $a1, $s1, $zero
/* 9FB14 800AF314 FABC0208 */  j          .L800AF3E8
/* 9FB18 800AF318 5B000624 */   addiu     $a2, $zero, 0x5B
.L800AF31C:
/* 9FB1C 800AF31C 0E000224 */  addiu      $v0, $zero, 0xE
/* 9FB20 800AF320 08004212 */  beq        $s2, $v0, .L800AF344
/* 9FB24 800AF324 5C000224 */   addiu     $v0, $zero, 0x5C
/* 9FB28 800AF328 06004212 */  beq        $s2, $v0, .L800AF344
/* 9FB2C 800AF32C 21200002 */   addu      $a0, $s0, $zero
/* 9FB30 800AF330 21282002 */  addu       $a1, $s1, $zero
/* 9FB34 800AF334 0E000624 */  addiu      $a2, $zero, 0xE
/* 9FB38 800AF338 21380000 */  addu       $a3, $zero, $zero
/* 9FB3C 800AF33C 35BD0208 */  j          .L800AF4D4
/* 9FB40 800AF340 1000B3AF */   sw        $s3, 0x10($sp)
.L800AF344:
/* 9FB44 800AF344 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9FB48 800AF348 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9FB4C 800AF34C 0400428C */  lw         $v0, 0x4($v0)
/* 9FB50 800AF350 00000000 */  nop
/* 9FB54 800AF354 24104300 */  and        $v0, $v0, $v1
/* 9FB58 800AF358 9A004010 */  beqz       $v0, .L800AF5C4
/* 9FB5C 800AF35C 5C000224 */   addiu     $v0, $zero, 0x5C
/* 9FB60 800AF360 99004212 */  beq        $s2, $v0, .L800AF5C8
/* 9FB64 800AF364 2120D002 */   addu      $a0, $s6, $s0
/* 9FB68 800AF368 0000048E */  lw         $a0, 0x0($s0)
/* 9FB6C 800AF36C 938B020C */  jal        SteerSwitchMode
/* 9FB70 800AF370 0E000524 */   addiu     $a1, $zero, 0xE
/* 9FB74 800AF374 21200002 */  addu       $a0, $s0, $zero
/* 9FB78 800AF378 21282002 */  addu       $a1, $s1, $zero
/* 9FB7C 800AF37C FABC0208 */  j          .L800AF3E8
/* 9FB80 800AF380 5C000624 */   addiu     $a2, $zero, 0x5C
.L800AF384:
/* 9FB84 800AF384 0F000224 */  addiu      $v0, $zero, 0xF
/* 9FB88 800AF388 08004212 */  beq        $s2, $v0, .L800AF3AC
/* 9FB8C 800AF38C 5D000224 */   addiu     $v0, $zero, 0x5D
/* 9FB90 800AF390 06004212 */  beq        $s2, $v0, .L800AF3AC
/* 9FB94 800AF394 21200002 */   addu      $a0, $s0, $zero
/* 9FB98 800AF398 21282002 */  addu       $a1, $s1, $zero
/* 9FB9C 800AF39C 0F000624 */  addiu      $a2, $zero, 0xF
/* 9FBA0 800AF3A0 21380000 */  addu       $a3, $zero, $zero
/* 9FBA4 800AF3A4 35BD0208 */  j          .L800AF4D4
/* 9FBA8 800AF3A8 1000B3AF */   sw        $s3, 0x10($sp)
.L800AF3AC:
/* 9FBAC 800AF3AC C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9FBB0 800AF3B0 90A4838F */  lw         $v1, %gp_rel(RazielCommands + 0xC)($gp)
/* 9FBB4 800AF3B4 0400428C */  lw         $v0, 0x4($v0)
/* 9FBB8 800AF3B8 00000000 */  nop
/* 9FBBC 800AF3BC 24104300 */  and        $v0, $v0, $v1
/* 9FBC0 800AF3C0 80004010 */  beqz       $v0, .L800AF5C4
/* 9FBC4 800AF3C4 5D000224 */   addiu     $v0, $zero, 0x5D
/* 9FBC8 800AF3C8 7F004212 */  beq        $s2, $v0, .L800AF5C8
/* 9FBCC 800AF3CC 2120D002 */   addu      $a0, $s6, $s0
/* 9FBD0 800AF3D0 0000048E */  lw         $a0, 0x0($s0)
/* 9FBD4 800AF3D4 938B020C */  jal        SteerSwitchMode
/* 9FBD8 800AF3D8 0E000524 */   addiu     $a1, $zero, 0xE
/* 9FBDC 800AF3DC 21200002 */  addu       $a0, $s0, $zero
/* 9FBE0 800AF3E0 21282002 */  addu       $a1, $s1, $zero
/* 9FBE4 800AF3E4 5D000624 */  addiu      $a2, $zero, 0x5D
.L800AF3E8:
/* 9FBE8 800AF3E8 21380000 */  addu       $a3, $zero, $zero
/* 9FBEC 800AF3EC 01000224 */  addiu      $v0, $zero, 0x1
/* 9FBF0 800AF3F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 9FBF4 800AF3F4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9FBF8 800AF3F8 1400A2AF */   sw        $v0, 0x14($sp)
/* 9FBFC 800AF3FC 72BD0208 */  j          .L800AF5C8
/* 9FC00 800AF400 2120D002 */   addu      $a0, $s6, $s0
.L800AF404:
/* 9FC04 800AF404 A5FF4226 */  addiu      $v0, $s2, -0x5B
/* 9FC08 800AF408 0300422C */  sltiu      $v0, $v0, 0x3
/* 9FC0C 800AF40C 6E004014 */  bnez       $v0, .L800AF5C8
/* 9FC10 800AF410 2120D002 */   addu      $a0, $s6, $s0
/* 9FC14 800AF414 74FB828F */  lw         $v0, %gp_rel(Raziel + 0x544)($gp)
/* 9FC18 800AF418 00000000 */  nop
/* 9FC1C 800AF41C 06004228 */  slti       $v0, $v0, 0x6
/* 9FC20 800AF420 30004010 */  beqz       $v0, .L800AF4E4
/* 9FC24 800AF424 37000224 */   addiu     $v0, $zero, 0x37
/* 9FC28 800AF428 67004212 */  beq        $s2, $v0, .L800AF5C8
/* 9FC2C 800AF42C 21280000 */   addu      $a1, $zero, $zero
/* 9FC30 800AF430 01000424 */  addiu      $a0, $zero, 0x1
/* 9FC34 800AF434 4FC6010C */  jal        SetControlInitIdleData
/* 9FC38 800AF438 06000624 */   addiu     $a2, $zero, 0x6
/* 9FC3C 800AF43C 21200002 */  addu       $a0, $s0, $zero
/* 9FC40 800AF440 21282002 */  addu       $a1, $s1, $zero
/* 9FC44 800AF444 8FA0020C */  jal        StateInitIdle
/* 9FC48 800AF448 21304000 */   addu      $a2, $v0, $zero
/* 9FC4C 800AF44C 72BD0208 */  j          .L800AF5C8
/* 9FC50 800AF450 2120D002 */   addu      $a0, $s6, $s0
.L800AF454:
/* 9FC54 800AF454 5C002016 */  bnez       $s1, .L800AF5C8
/* 9FC58 800AF458 2120D002 */   addu      $a0, $s6, $s0
/* 9FC5C 800AF45C 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* 9FC60 800AF460 00000000 */  nop
/* 9FC64 800AF464 3000428C */  lw         $v0, 0x30($v0)
/* 9FC68 800AF468 00000000 */  nop
/* 9FC6C 800AF46C 00FA82AF */  sw         $v0, %gp_rel(Raziel + 0x3D0)($gp)
/* 9FC70 800AF470 72BD0208 */  j          .L800AF5C8
/* 9FC74 800AF474 00000000 */   nop
.L800AF478:
/* 9FC78 800AF478 1CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3EC)($gp)
/* 9FC7C 800AF47C 03000224 */  addiu      $v0, $zero, 0x3
/* 9FC80 800AF480 50006210 */  beq        $v1, $v0, .L800AF5C4
/* 9FC84 800AF484 21282002 */   addu      $a1, $s1, $zero
/* 9FC88 800AF488 0B80083C */  lui        $t0, %hi(StateHandlerIdle)
/* 9FC8C 800AF48C E0840825 */  addiu      $t0, $t0, %lo(StateHandlerIdle)
/* 9FC90 800AF490 38FB88AF */  sw         $t0, %gp_rel(Raziel + 0x508)($gp)
/* 9FC94 800AF494 21200002 */  addu       $a0, $s0, $zero
/* 9FC98 800AF498 0B80063C */  lui        $a2, %hi(StateHandlerSoulSuck)
/* 9FC9C 800AF49C 5EBD0208 */  j          .L800AF578
/* 9FCA0 800AF4A0 E09AC624 */   addiu     $a2, $a2, %lo(StateHandlerSoulSuck)
.L800AF4A4:
/* 9FCA4 800AF4A4 05002016 */  bnez       $s1, .L800AF4BC
/* 9FCA8 800AF4A8 21200002 */   addu      $a0, $s0, $zero
/* 9FCAC 800AF4AC 0000048E */  lw         $a0, 0x0($s0)
/* 9FCB0 800AF4B0 938B020C */  jal        SteerSwitchMode
/* 9FCB4 800AF4B4 05000524 */   addiu     $a1, $zero, 0x5
/* 9FCB8 800AF4B8 21200002 */  addu       $a0, $s0, $zero
.L800AF4BC:
/* 9FCBC 800AF4BC 21282002 */  addu       $a1, $s1, $zero
/* 9FCC0 800AF4C0 37000624 */  addiu      $a2, $zero, 0x37
/* 9FCC4 800AF4C4 21380000 */  addu       $a3, $zero, $zero
/* 9FCC8 800AF4C8 06000224 */  addiu      $v0, $zero, 0x6
/* 9FCCC 800AF4CC 1C01A0AE */  sw         $zero, 0x11C($s5)
/* 9FCD0 800AF4D0 1000A2AF */  sw         $v0, 0x10($sp)
.L800AF4D4:
/* 9FCD4 800AF4D4 20C8010C */  jal        G2EmulationSwitchAnimation
/* 9FCD8 800AF4D8 1400B4AF */   sw        $s4, 0x14($sp)
/* 9FCDC 800AF4DC 72BD0208 */  j          .L800AF5C8
/* 9FCE0 800AF4E0 2120D002 */   addu      $a0, $s6, $s0
.L800AF4E4:
/* 9FCE4 800AF4E4 21200000 */  addu       $a0, $zero, $zero
/* 9FCE8 800AF4E8 21288000 */  addu       $a1, $a0, $zero
/* 9FCEC 800AF4EC 4FC6010C */  jal        SetControlInitIdleData
/* 9FCF0 800AF4F0 03000624 */   addiu     $a2, $zero, 0x3
/* 9FCF4 800AF4F4 21200002 */  addu       $a0, $s0, $zero
/* 9FCF8 800AF4F8 21282002 */  addu       $a1, $s1, $zero
/* 9FCFC 800AF4FC 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 9FD00 800AF500 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 9FD04 800AF504 C1CA010C */  jal        StateSwitchStateData
/* 9FD08 800AF508 21384000 */   addu      $a3, $v0, $zero
/* 9FD0C 800AF50C 72BD0208 */  j          .L800AF5C8
/* 9FD10 800AF510 2120D002 */   addu      $a0, $s6, $s0
.L800AF514:
/* 9FD14 800AF514 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9FD18 800AF518 00000000 */  nop
/* 9FD1C 800AF51C 02004230 */  andi       $v0, $v0, 0x2
/* 9FD20 800AF520 29004014 */  bnez       $v0, .L800AF5C8
/* 9FD24 800AF524 2120D002 */   addu      $a0, $s6, $s0
/* 9FD28 800AF528 06002016 */  bnez       $s1, .L800AF544
/* 9FD2C 800AF52C 0C000426 */   addiu     $a0, $s0, 0xC
/* 9FD30 800AF530 21200002 */  addu       $a0, $s0, $zero
/* 9FD34 800AF534 21280000 */  addu       $a1, $zero, $zero
/* 9FD38 800AF538 0B80063C */  lui        $a2, %hi(StateHandlerStartMove)
/* 9FD3C 800AF53C 5EBD0208 */  j          .L800AF578
/* 9FD40 800AF540 C4A2C624 */   addiu     $a2, $a2, %lo(StateHandlerStartMove)
.L800AF544:
/* 9FD44 800AF544 1000053C */  lui        $a1, (0x100005 >> 16)
/* 9FD48 800AF548 0500A534 */  ori        $a1, $a1, (0x100005 & 0xFFFF)
/* 9FD4C 800AF54C 4EC3010C */  jal        EnMessageQueueData
/* 9FD50 800AF550 21302002 */   addu      $a2, $s1, $zero
/* 9FD54 800AF554 72BD0208 */  j          .L800AF5C8
/* 9FD58 800AF558 2120D002 */   addu      $a0, $s6, $s0
.L800AF55C:
/* 9FD5C 800AF55C 21200002 */  addu       $a0, $s0, $zero
/* 9FD60 800AF560 3A96020C */  jal        razPickupAndGrab
/* 9FD64 800AF564 21282002 */   addu      $a1, $s1, $zero
/* 9FD68 800AF568 16004010 */  beqz       $v0, .L800AF5C4
/* 9FD6C 800AF56C 21282002 */   addu      $a1, $s1, $zero
/* 9FD70 800AF570 21200002 */  addu       $a0, $s0, $zero
/* 9FD74 800AF574 E4BDE626 */  addiu      $a2, $s7, %lo(StateHandlerAttack2)
.L800AF578:
/* 9FD78 800AF578 C1CA010C */  jal        StateSwitchStateData
/* 9FD7C 800AF57C 21380000 */   addu      $a3, $zero, $zero
/* 9FD80 800AF580 72BD0208 */  j          .L800AF5C8
/* 9FD84 800AF584 2120D002 */   addu      $a0, $s6, $s0
.L800AF588:
/* 9FD88 800AF588 0F002016 */  bnez       $s1, .L800AF5C8
/* 9FD8C 800AF58C 2120D002 */   addu      $a0, $s6, $s0
/* 9FD90 800AF590 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 9FD94 800AF594 00000000 */  nop
/* 9FD98 800AF598 80004230 */  andi       $v0, $v0, 0x80
/* 9FD9C 800AF59C 0A004014 */  bnez       $v0, .L800AF5C8
/* 9FDA0 800AF5A0 E4BDE526 */   addiu     $a1, $s7, %lo(StateHandlerAttack2)
/* 9FDA4 800AF5A4 21200002 */  addu       $a0, $s0, $zero
/* 9FDA8 800AF5A8 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9FDAC 800AF5AC 21300000 */   addu      $a2, $zero, $zero
/* 9FDB0 800AF5B0 72BD0208 */  j          .L800AF5C8
/* 9FDB4 800AF5B4 2120D002 */   addu      $a0, $s6, $s0
.L800AF5B8:
/* 9FDB8 800AF5B8 4800A68F */  lw         $a2, 0x48($sp)
/* 9FDBC 800AF5BC B9BF020C */  jal        DefaultStateHandler
/* 9FDC0 800AF5C0 21282002 */   addu      $a1, $s1, $zero
.L800AF5C4:
/* 9FDC4 800AF5C4 2120D002 */  addu       $a0, $s6, $s0
.L800AF5C8:
/* 9FDC8 800AF5C8 27C3010C */  jal        DeMessageQueue
/* 9FDCC 800AF5CC 0C008424 */   addiu     $a0, $a0, 0xC
/* 9FDD0 800AF5D0 E2BB0208 */  j          .L800AEF88
/* 9FDD4 800AF5D4 2120D002 */   addu      $a0, $s6, $s0
.L800AF5D8:
/* 9FDD8 800AF5D8 74FB838F */  lw         $v1, %gp_rel(Raziel + 0x544)($gp)
/* 9FDDC 800AF5DC 06000224 */  addiu      $v0, $zero, 0x6
/* 9FDE0 800AF5E0 06006210 */  beq        $v1, $v0, .L800AF5FC
/* 9FDE4 800AF5E4 C0201100 */   sll       $a0, $s1, 3
/* 9FDE8 800AF5E8 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 9FDEC 800AF5EC 00000000 */  nop
/* 9FDF0 800AF5F0 40004230 */  andi       $v0, $v0, 0x40
/* 9FDF4 800AF5F4 0A004014 */  bnez       $v0, .L800AF620
/* 9FDF8 800AF5F8 00000000 */   nop
.L800AF5FC:
/* 9FDFC 800AF5FC 21209100 */  addu       $a0, $a0, $s1
/* 9FE00 800AF600 C0200400 */  sll        $a0, $a0, 3
/* 9FE04 800AF604 23209100 */  subu       $a0, $a0, $s1
/* 9FE08 800AF608 80200400 */  sll        $a0, $a0, 2
/* 9FE0C 800AF60C 21209000 */  addu       $a0, $a0, $s0
/* 9FE10 800AF610 0C008424 */  addiu      $a0, $a0, 0xC
/* 9FE14 800AF614 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9FE18 800AF618 4EC3010C */  jal        EnMessageQueueData
/* 9FE1C 800AF61C 21300000 */   addu      $a2, $zero, $zero
.L800AF620:
/* 9FE20 800AF620 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 9FE24 800AF624 3800BE8F */  lw         $fp, 0x38($sp)
/* 9FE28 800AF628 3400B78F */  lw         $s7, 0x34($sp)
/* 9FE2C 800AF62C 3000B68F */  lw         $s6, 0x30($sp)
/* 9FE30 800AF630 2C00B58F */  lw         $s5, 0x2C($sp)
/* 9FE34 800AF634 2800B48F */  lw         $s4, 0x28($sp)
/* 9FE38 800AF638 2400B38F */  lw         $s3, 0x24($sp)
/* 9FE3C 800AF63C 2000B28F */  lw         $s2, 0x20($sp)
/* 9FE40 800AF640 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9FE44 800AF644 1800B08F */  lw         $s0, 0x18($sp)
/* 9FE48 800AF648 0800E003 */  jr         $ra
/* 9FE4C 800AF64C 4000BD27 */   addiu     $sp, $sp, 0x40
.size StateHandlerAutoFace, . - StateHandlerAutoFace
