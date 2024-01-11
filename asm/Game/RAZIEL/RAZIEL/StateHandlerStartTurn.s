.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerStartTurn
/* 9A818 800AA018 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9A81C 800AA01C 1800B0AF */  sw         $s0, 0x18($sp)
/* 9A820 800AA020 21808000 */  addu       $s0, $a0, $zero
/* 9A824 800AA024 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9A828 800AA028 2188A000 */  addu       $s1, $a1, $zero
/* 9A82C 800AA02C 2400B3AF */  sw         $s3, 0x24($sp)
/* 9A830 800AA030 2198C000 */  addu       $s3, $a2, $zero
/* 9A834 800AA034 2800BFAF */  sw         $ra, 0x28($sp)
/* 9A838 800AA038 F6C9010C */  jal        G2EmulationQueryFrame
/* 9A83C 800AA03C 2000B2AF */   sw        $s2, 0x20($sp)
/* 9A840 800AA040 B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 9A844 800AA044 00000000 */  nop
/* 9A848 800AA048 0C004014 */  bnez       $v0, .L800AA07C
/* 9A84C 800AA04C C0101100 */   sll       $v0, $s1, 3
/* 9A850 800AA050 C0201100 */  sll        $a0, $s1, 3
/* 9A854 800AA054 21209100 */  addu       $a0, $a0, $s1
/* 9A858 800AA058 C0200400 */  sll        $a0, $a0, 3
/* 9A85C 800AA05C 23209100 */  subu       $a0, $a0, $s1
/* 9A860 800AA060 80200400 */  sll        $a0, $a0, 2
/* 9A864 800AA064 21209000 */  addu       $a0, $a0, $s0
/* 9A868 800AA068 94008424 */  addiu      $a0, $a0, 0x94
/* 9A86C 800AA06C 1000053C */  lui        $a1, (0x100000 >> 16)
/* 9A870 800AA070 4EC3010C */  jal        EnMessageQueueData
/* 9A874 800AA074 21300000 */   addu      $a2, $zero, $zero
/* 9A878 800AA078 C0101100 */  sll        $v0, $s1, 3
.L800AA07C:
/* 9A87C 800AA07C 21105100 */  addu       $v0, $v0, $s1
/* 9A880 800AA080 C0100200 */  sll        $v0, $v0, 3
/* 9A884 800AA084 23105100 */  subu       $v0, $v0, $s1
/* 9A888 800AA088 80100200 */  sll        $v0, $v0, 2
/* 9A88C 800AA08C 08004224 */  addiu      $v0, $v0, 0x8
/* 9A890 800AA090 21900202 */  addu       $s2, $s0, $v0
.L800AA094:
/* 9A894 800AA094 39C3010C */  jal        PeekMessageQueue
/* 9A898 800AA098 04004426 */   addiu     $a0, $s2, 0x4
/* 9A89C 800AA09C 57004010 */  beqz       $v0, .L800AA1FC
/* 9A8A0 800AA0A0 00000000 */   nop
/* 9A8A4 800AA0A4 0000438C */  lw         $v1, 0x0($v0)
/* 9A8A8 800AA0A8 1000023C */  lui        $v0, (0x100000 >> 16)
/* 9A8AC 800AA0AC 1F006210 */  beq        $v1, $v0, .L800AA12C
/* 9A8B0 800AA0B0 2A104300 */   slt       $v0, $v0, $v1
/* 9A8B4 800AA0B4 09004014 */  bnez       $v0, .L800AA0DC
/* 9A8B8 800AA0B8 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9A8BC 800AA0BC 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9A8C0 800AA0C0 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9A8C4 800AA0C4 30006210 */  beq        $v1, $v0, .L800AA188
/* 9A8C8 800AA0C8 00000000 */   nop
/* 9A8CC 800AA0CC 17006010 */  beqz       $v1, .L800AA12C
/* 9A8D0 800AA0D0 21200002 */   addu      $a0, $s0, $zero
/* 9A8D4 800AA0D4 79A80208 */  j          .L800AA1E4
/* 9A8D8 800AA0D8 21282002 */   addu      $a1, $s1, $zero
.L800AA0DC:
/* 9A8DC 800AA0DC 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9A8E0 800AA0E0 05006210 */  beq        $v1, $v0, .L800AA0F8
/* 9A8E4 800AA0E4 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9A8E8 800AA0E8 10006210 */  beq        $v1, $v0, .L800AA12C
/* 9A8EC 800AA0EC 21200002 */   addu      $a0, $s0, $zero
/* 9A8F0 800AA0F0 79A80208 */  j          .L800AA1E4
/* 9A8F4 800AA0F4 21282002 */   addu      $a1, $s1, $zero
.L800AA0F8:
/* 9A8F8 800AA0F8 3C002016 */  bnez       $s1, .L800AA1EC
/* 9A8FC 800AA0FC 0200023C */   lui       $v0, (0x20109 >> 16)
/* 9A900 800AA100 09014234 */  ori        $v0, $v0, (0x20109 & 0xFFFF)
/* 9A904 800AA104 00400324 */  addiu      $v1, $zero, 0x4000
/* 9A908 800AA108 90F983AF */  sw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9A90C 800AA10C 0000048E */  lw         $a0, 0x0($s0)
/* 9A910 800AA110 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9A914 800AA114 03000224 */  addiu      $v0, $zero, 0x3
/* 9A918 800AA118 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9A91C 800AA11C 938B020C */  jal        SteerSwitchMode
/* 9A920 800AA120 01000524 */   addiu     $a1, $zero, 0x1
/* 9A924 800AA124 7BA80208 */  j          .L800AA1EC
/* 9A928 800AA128 00000000 */   nop
.L800AA12C:
/* 9A92C 800AA12C 2F002016 */  bnez       $s1, .L800AA1EC
/* 9A930 800AA130 0080033C */   lui       $v1, (0x8000000F >> 16)
/* 9A934 800AA134 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9A938 800AA138 00000000 */  nop
/* 9A93C 800AA13C 0000428C */  lw         $v0, 0x0($v0)
/* 9A940 800AA140 0F006334 */  ori        $v1, $v1, (0x8000000F & 0xFFFF)
/* 9A944 800AA144 24104300 */  and        $v0, $v0, $v1
/* 9A948 800AA148 0C004014 */  bnez       $v0, .L800AA17C
/* 9A94C 800AA14C 21200002 */   addu      $a0, $s0, $zero
/* 9A950 800AA150 21200000 */  addu       $a0, $zero, $zero
/* 9A954 800AA154 21288000 */  addu       $a1, $a0, $zero
/* 9A958 800AA158 4FC6010C */  jal        SetControlInitIdleData
/* 9A95C 800AA15C 03000624 */   addiu     $a2, $zero, 0x3
/* 9A960 800AA160 21200002 */  addu       $a0, $s0, $zero
/* 9A964 800AA164 0B80053C */  lui        $a1, %hi(StateHandlerIdle)
/* 9A968 800AA168 E084A524 */  addiu      $a1, $a1, %lo(StateHandlerIdle)
/* 9A96C 800AA16C F4CA010C */  jal        StateSwitchStateCharacterData
/* 9A970 800AA170 21304000 */   addu      $a2, $v0, $zero
/* 9A974 800AA174 7BA80208 */  j          .L800AA1EC
/* 9A978 800AA178 00000000 */   nop
.L800AA17C:
/* 9A97C 800AA17C 0B80053C */  lui        $a1, %hi(StateHandlerStartMove)
/* 9A980 800AA180 75A80208 */  j          .L800AA1D4
/* 9A984 800AA184 C4A2A524 */   addiu     $a1, $a1, %lo(StateHandlerStartMove)
.L800AA188:
/* 9A988 800AA188 18002016 */  bnez       $s1, .L800AA1EC
/* 9A98C 800AA18C 21280000 */   addu      $a1, $zero, $zero
/* 9A990 800AA190 2130A000 */  addu       $a2, $a1, $zero
/* 9A994 800AA194 08000224 */  addiu      $v0, $zero, 0x8
/* 9A998 800AA198 90F982AF */  sw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* 9A99C 800AA19C 0000048E */  lw         $a0, 0x0($s0)
/* 9A9A0 800AA1A0 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9A9A4 800AA1A4 2138A000 */   addu      $a3, $a1, $zero
/* 9A9A8 800AA1A8 07004010 */  beqz       $v0, .L800AA1C8
/* 9A9AC 800AA1AC 01000224 */   addiu     $v0, $zero, 0x1
/* 9A9B0 800AA1B0 1000A2AF */  sw         $v0, 0x10($sp)
/* 9A9B4 800AA1B4 21200002 */  addu       $a0, $s0, $zero
/* 9A9B8 800AA1B8 1A000524 */  addiu      $a1, $zero, 0x1A
/* 9A9BC 800AA1BC 21300000 */  addu       $a2, $zero, $zero
/* 9A9C0 800AA1C0 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9A9C4 800AA1C4 2138C000 */   addu      $a3, $a2, $zero
.L800AA1C8:
/* 9A9C8 800AA1C8 21200002 */  addu       $a0, $s0, $zero
/* 9A9CC 800AA1CC 0B80053C */  lui        $a1, %hi(StateHandlerCompression)
/* 9A9D0 800AA1D0 ACB5A524 */  addiu      $a1, $a1, %lo(StateHandlerCompression)
.L800AA1D4:
/* 9A9D4 800AA1D4 F4CA010C */  jal        StateSwitchStateCharacterData
/* 9A9D8 800AA1D8 21300000 */   addu      $a2, $zero, $zero
/* 9A9DC 800AA1DC 7BA80208 */  j          .L800AA1EC
/* 9A9E0 800AA1E0 00000000 */   nop
.L800AA1E4:
/* 9A9E4 800AA1E4 B9BF020C */  jal        DefaultStateHandler
/* 9A9E8 800AA1E8 21306002 */   addu      $a2, $s3, $zero
.L800AA1EC:
/* 9A9EC 800AA1EC 27C3010C */  jal        DeMessageQueue
/* 9A9F0 800AA1F0 04004426 */   addiu     $a0, $s2, 0x4
/* 9A9F4 800AA1F4 25A80208 */  j          .L800AA094
/* 9A9F8 800AA1F8 00000000 */   nop
.L800AA1FC:
/* 9A9FC 800AA1FC 2800BF8F */  lw         $ra, 0x28($sp)
/* 9AA00 800AA200 2400B38F */  lw         $s3, 0x24($sp)
/* 9AA04 800AA204 2000B28F */  lw         $s2, 0x20($sp)
/* 9AA08 800AA208 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9AA0C 800AA20C 1800B08F */  lw         $s0, 0x18($sp)
/* 9AA10 800AA210 0800E003 */  jr         $ra
/* 9AA14 800AA214 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerStartTurn, . - StateHandlerStartTurn
