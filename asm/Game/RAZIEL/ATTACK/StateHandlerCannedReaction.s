.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerCannedReaction
/* 8D6B4 8009CEB4 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8D6B8 8009CEB8 1400B1AF */  sw         $s1, 0x14($sp)
/* 8D6BC 8009CEBC 21888000 */  addu       $s1, $a0, $zero
/* 8D6C0 8009CEC0 1800B2AF */  sw         $s2, 0x18($sp)
/* 8D6C4 8009CEC4 2190A000 */  addu       $s2, $a1, $zero
/* 8D6C8 8009CEC8 2000B4AF */  sw         $s4, 0x20($sp)
/* 8D6CC 8009CECC 21A0C000 */  addu       $s4, $a2, $zero
/* 8D6D0 8009CED0 C0101200 */  sll        $v0, $s2, 3
/* 8D6D4 8009CED4 21105200 */  addu       $v0, $v0, $s2
/* 8D6D8 8009CED8 C0100200 */  sll        $v0, $v0, 3
/* 8D6DC 8009CEDC 23105200 */  subu       $v0, $v0, $s2
/* 8D6E0 8009CEE0 80100200 */  sll        $v0, $v0, 2
/* 8D6E4 8009CEE4 08004224 */  addiu      $v0, $v0, 0x8
/* 8D6E8 8009CEE8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8D6EC 8009CEEC 21982202 */  addu       $s3, $s1, $v0
/* 8D6F0 8009CEF0 2400BFAF */  sw         $ra, 0x24($sp)
/* 8D6F4 8009CEF4 1000B0AF */  sw         $s0, 0x10($sp)
.L8009CEF8:
/* 8D6F8 8009CEF8 39C3010C */  jal        PeekMessageQueue
/* 8D6FC 8009CEFC 04006426 */   addiu     $a0, $s3, 0x4
/* 8D700 8009CF00 88004010 */  beqz       $v0, .L8009D124
/* 8D704 8009CF04 1000043C */   lui       $a0, (0x100014 >> 16)
/* 8D708 8009CF08 0000438C */  lw         $v1, 0x0($v0)
/* 8D70C 8009CF0C 14008434 */  ori        $a0, $a0, (0x100014 & 0xFFFF)
/* 8D710 8009CF10 48006410 */  beq        $v1, $a0, .L8009D034
/* 8D714 8009CF14 2A108300 */   slt       $v0, $a0, $v1
/* 8D718 8009CF18 16004014 */  bnez       $v0, .L8009CF74
/* 8D71C 8009CF1C 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 8D720 8009CF20 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 8D724 8009CF24 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8D728 8009CF28 7A006210 */  beq        $v1, $v0, .L8009D114
/* 8D72C 8009CF2C 2A104300 */   slt       $v0, $v0, $v1
/* 8D730 8009CF30 08004014 */  bnez       $v0, .L8009CF54
/* 8D734 8009CF34 1000023C */   lui       $v0, (0x100001 >> 16)
/* 8D738 8009CF38 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8D73C 8009CF3C 75006210 */  beq        $v1, $v0, .L8009D114
/* 8D740 8009CF40 08004234 */   ori       $v0, $v0, (0x80000008 & 0xFFFF)
/* 8D744 8009CF44 73006210 */  beq        $v1, $v0, .L8009D114
/* 8D748 8009CF48 21202002 */   addu      $a0, $s1, $zero
/* 8D74C 8009CF4C 43740208 */  j          .L8009D10C
/* 8D750 8009CF50 21284002 */   addu      $a1, $s2, $zero
.L8009CF54:
/* 8D754 8009CF54 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 8D758 8009CF58 1D006210 */  beq        $v1, $v0, .L8009CFD0
/* 8D75C 8009CF5C 1000023C */   lui       $v0, (0x100004 >> 16)
/* 8D760 8009CF60 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8D764 8009CF64 2B006210 */  beq        $v1, $v0, .L8009D014
/* 8D768 8009CF68 21202002 */   addu      $a0, $s1, $zero
/* 8D76C 8009CF6C 43740208 */  j          .L8009D10C
/* 8D770 8009CF70 21284002 */   addu      $a1, $s2, $zero
.L8009CF74:
/* 8D774 8009CF74 2F006210 */  beq        $v1, $v0, .L8009D034
/* 8D778 8009CF78 2A104300 */   slt       $v0, $v0, $v1
/* 8D77C 8009CF7C 0C004014 */  bnez       $v0, .L8009CFB0
/* 8D780 8009CF80 0008023C */   lui       $v0, (0x8000003 >> 16)
/* 8D784 8009CF84 0001023C */  lui        $v0, (0x1000001 >> 16)
/* 8D788 8009CF88 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8D78C 8009CF8C 2A104300 */  slt        $v0, $v0, $v1
/* 8D790 8009CF90 5D004014 */  bnez       $v0, .L8009D108
/* 8D794 8009CF94 21202002 */   addu      $a0, $s1, $zero
/* 8D798 8009CF98 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 8D79C 8009CF9C 2A106200 */  slt        $v0, $v1, $v0
/* 8D7A0 8009CFA0 5A004014 */  bnez       $v0, .L8009D10C
/* 8D7A4 8009CFA4 21284002 */   addu      $a1, $s2, $zero
/* 8D7A8 8009CFA8 45740208 */  j          .L8009D114
/* 8D7AC 8009CFAC 00000000 */   nop
.L8009CFB0:
/* 8D7B0 8009CFB0 03004234 */  ori        $v0, $v0, (0x8000003 & 0xFFFF)
/* 8D7B4 8009CFB4 2D006210 */  beq        $v1, $v0, .L8009D06C
/* 8D7B8 8009CFB8 0008023C */   lui       $v0, (0x8000004 >> 16)
/* 8D7BC 8009CFBC 04004234 */  ori        $v0, $v0, (0x8000004 & 0xFFFF)
/* 8D7C0 8009CFC0 35006210 */  beq        $v1, $v0, .L8009D098
/* 8D7C4 8009CFC4 21202002 */   addu      $a0, $s1, $zero
/* 8D7C8 8009CFC8 43740208 */  j          .L8009D10C
/* 8D7CC 8009CFCC 21284002 */   addu      $a1, $s2, $zero
.L8009CFD0:
/* 8D7D0 8009CFD0 50004016 */  bnez       $s2, .L8009D114
/* 8D7D4 8009CFD4 0401033C */   lui       $v1, (0x1041009 >> 16)
/* 8D7D8 8009CFD8 09106334 */  ori        $v1, $v1, (0x1041009 & 0xFFFF)
/* 8D7DC 8009CFDC 94110224 */  addiu      $v0, $zero, 0x1194
/* 8D7E0 8009CFE0 8CFB82A7 */  sh         $v0, %gp_rel(Raziel + 0x55C)($gp)
/* 8D7E4 8009CFE4 0100023C */  lui        $v0, (0x10000 >> 16)
/* 8D7E8 8009CFE8 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8D7EC 8009CFEC 0000248E */  lw         $a0, 0x0($s1)
/* 8D7F0 8009CFF0 03000224 */  addiu      $v0, $zero, 0x3
/* 8D7F4 8009CFF4 C8FD83AF */  sw         $v1, %gp_rel(ControlFlag)($gp)
/* 8D7F8 8009CFF8 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 8D7FC 8009CFFC 938B020C */  jal        SteerSwitchMode
/* 8D800 8009D000 21280000 */   addu      $a1, $zero, $zero
/* 8D804 8009D004 0000238E */  lw         $v1, 0x0($s1)
/* 8D808 8009D008 8CFB8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x55C)
/* 8D80C 8009D00C 45740208 */  j          .L8009D114
/* 8D810 8009D010 F80162AC */   sw        $v0, 0x1F8($v1)
.L8009D014:
/* 8D814 8009D014 01000224 */  addiu      $v0, $zero, 0x1
/* 8D818 8009D018 3E004216 */  bne        $s2, $v0, .L8009D114
/* 8D81C 8009D01C 02000524 */   addiu     $a1, $zero, 0x2
/* 8D820 8009D020 21304000 */  addu       $a2, $v0, $zero
/* 8D824 8009D024 4EC8010C */  jal        G2EmulationSwitchAnimationSync
/* 8D828 8009D028 04000724 */   addiu     $a3, $zero, 0x4
/* 8D82C 8009D02C 45740208 */  j          .L8009D114
/* 8D830 8009D030 00000000 */   nop
.L8009D034:
/* 8D834 8009D034 21200000 */  addu       $a0, $zero, $zero
/* 8D838 8009D038 21288000 */  addu       $a1, $a0, $zero
/* 8D83C 8009D03C 4FC6010C */  jal        SetControlInitIdleData
/* 8D840 8009D040 03000624 */   addiu     $a2, $zero, 0x3
/* 8D844 8009D044 21202002 */  addu       $a0, $s1, $zero
/* 8D848 8009D048 21284002 */  addu       $a1, $s2, $zero
/* 8D84C 8009D04C 0B80063C */  lui        $a2, %hi(StateHandlerIdle)
/* 8D850 8009D050 E084C624 */  addiu      $a2, $a2, %lo(StateHandlerIdle)
/* 8D854 8009D054 C1CA010C */  jal        StateSwitchStateData
/* 8D858 8009D058 21384000 */   addu      $a3, $v0, $zero
/* 8D85C 8009D05C 01000224 */  addiu      $v0, $zero, 0x1
/* 8D860 8009D060 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 8D864 8009D064 45740208 */  j          .L8009D114
/* 8D868 8009D068 00000000 */   nop
.L8009D06C:
/* 8D86C 8009D06C 29004016 */  bnez       $s2, .L8009D114
/* 8D870 8009D070 00000000 */   nop
/* 8D874 8009D074 2197020C */  jal        razGetHeldItem
/* 8D878 8009D078 00000000 */   nop
/* 8D87C 8009D07C 0CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D880 8009D080 00000000 */  nop
/* 8D884 8009D084 00026330 */  andi       $v1, $v1, 0x200
/* 8D888 8009D088 22006010 */  beqz       $v1, .L8009D114
/* 8D88C 8009D08C 21204000 */   addu      $a0, $v0, $zero
/* 8D890 8009D090 35740208 */  j          .L8009D0D4
/* 8D894 8009D094 00000000 */   nop
.L8009D098:
/* 8D898 8009D098 2197020C */  jal        razGetHeldItem
/* 8D89C 8009D09C 00000000 */   nop
/* 8D8A0 8009D0A0 21804000 */  addu       $s0, $v0, $zero
/* 8D8A4 8009D0A4 21200002 */  addu       $a0, $s0, $zero
/* 8D8A8 8009D0A8 8000053C */  lui        $a1, (0x800008 >> 16)
/* 8D8AC 8009D0AC 0800A534 */  ori        $a1, $a1, (0x800008 & 0xFFFF)
/* 8D8B0 8009D0B0 A1D1000C */  jal        INSTANCE_Post
/* 8D8B4 8009D0B4 02000624 */   addiu     $a2, $zero, 0x2
/* 8D8B8 8009D0B8 8597020C */  jal        razReaverOn
/* 8D8BC 8009D0BC 00000000 */   nop
/* 8D8C0 8009D0C0 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* 8D8C4 8009D0C4 00000000 */  nop
/* 8D8C8 8009D0C8 00024230 */  andi       $v0, $v0, 0x200
/* 8D8CC 8009D0CC 11004010 */  beqz       $v0, .L8009D114
/* 8D8D0 8009D0D0 21200002 */   addu      $a0, $s0, $zero
.L8009D0D4:
/* 8D8D4 8009D0D4 0000268E */  lw         $a2, 0x0($s1)
/* 8D8D8 8009D0D8 08020724 */  addiu      $a3, $zero, 0x208
/* 8D8DC 8009D0DC 7400C524 */  addiu      $a1, $a2, 0x74
/* 8D8E0 8009D0E0 FBC3010C */  jal        SetMonsterImpaleData
/* 8D8E4 8009D0E4 5C00C624 */   addiu     $a2, $a2, 0x5C
/* 8D8E8 8009D0E8 0001053C */  lui        $a1, (0x100000A >> 16)
/* 8D8EC 8009D0EC 08FA838F */  lw         $v1, %gp_rel(Raziel + 0x3D8)($gp)
/* 8D8F0 8009D0F0 0A00A534 */  ori        $a1, $a1, (0x100000A & 0xFFFF)
/* 8D8F4 8009D0F4 4800648C */  lw         $a0, 0x48($v1)
/* 8D8F8 8009D0F8 A1D1000C */  jal        INSTANCE_Post
/* 8D8FC 8009D0FC 21304000 */   addu      $a2, $v0, $zero
/* 8D900 8009D100 45740208 */  j          .L8009D114
/* 8D904 8009D104 00000000 */   nop
.L8009D108:
/* 8D908 8009D108 21284002 */  addu       $a1, $s2, $zero
.L8009D10C:
/* 8D90C 8009D10C B9BF020C */  jal        DefaultStateHandler
/* 8D910 8009D110 21308002 */   addu      $a2, $s4, $zero
.L8009D114:
/* 8D914 8009D114 27C3010C */  jal        DeMessageQueue
/* 8D918 8009D118 04006426 */   addiu     $a0, $s3, 0x4
/* 8D91C 8009D11C BE730208 */  j          .L8009CEF8
/* 8D920 8009D120 00000000 */   nop
.L8009D124:
/* 8D924 8009D124 2400BF8F */  lw         $ra, 0x24($sp)
/* 8D928 8009D128 2000B48F */  lw         $s4, 0x20($sp)
/* 8D92C 8009D12C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8D930 8009D130 1800B28F */  lw         $s2, 0x18($sp)
/* 8D934 8009D134 1400B18F */  lw         $s1, 0x14($sp)
/* 8D938 8009D138 1000B08F */  lw         $s0, 0x10($sp)
/* 8D93C 8009D13C 0800E003 */  jr         $ra
/* 8D940 8009D140 2800BD27 */   addiu     $sp, $sp, 0x28
.size StateHandlerCannedReaction, . - StateHandlerCannedReaction
