.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padInitSioMode
/* B2EC8 800C26C8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B2ECC 800C26CC 1000B0AF */  sw         $s0, 0x10($sp)
/* B2ED0 800C26D0 21808000 */  addu       $s0, $a0, $zero
/* B2ED4 800C26D4 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B2ED8 800C26D8 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B2EDC 800C26DC 40000224 */  addiu      $v0, $zero, 0x40
/* B2EE0 800C26E0 1800BFAF */  sw         $ra, 0x18($sp)
/* B2EE4 800C26E4 1400B1AF */  sw         $s1, 0x14($sp)
/* B2EE8 800C26E8 0A0062A4 */  sh         $v0, 0xA($v1)
/* B2EEC 800C26EC 0D000224 */  addiu      $v0, $zero, 0xD
/* B2EF0 800C26F0 0A0060A4 */  sh         $zero, 0xA($v1)
/* B2EF4 800C26F4 080062A4 */  sh         $v0, 0x8($v1)
/* B2EF8 800C26F8 88000224 */  addiu      $v0, $zero, 0x88
/* B2EFC 800C26FC 0E0062A4 */  sh         $v0, 0xE($v1)
/* B2F00 800C2700 E8000392 */  lbu        $v1, 0xE8($s0)
/* B2F04 800C2704 08000224 */  addiu      $v0, $zero, 0x8
/* B2F08 800C2708 02006214 */  bne        $v1, $v0, .L800C2714
/* B2F0C 800C270C 91000424 */   addiu     $a0, $zero, 0x91
/* B2F10 800C2710 50000424 */  addiu      $a0, $zero, 0x50
.L800C2714:
/* B2F14 800C2714 5C1E030C */  jal        setRC2wait
/* B2F18 800C2718 00000000 */   nop
/* B2F1C 800C271C 0D80023C */  lui        $v0, %hi(_padSioChan)
/* B2F20 800C2720 44E9428C */  lw         $v0, %lo(_padSioChan)($v0)
/* B2F24 800C2724 0D80043C */  lui        $a0, %hi(_padFixResult + 0xC)
/* B2F28 800C2728 68E9848C */  lw         $a0, %lo(_padFixResult + 0xC)($a0)
/* B2F2C 800C272C 02004010 */  beqz       $v0, .L800C2738
/* B2F30 800C2730 03100324 */   addiu     $v1, $zero, 0x1003
/* B2F34 800C2734 03300324 */  addiu      $v1, $zero, 0x3003
.L800C2738:
/* B2F38 800C2738 80100200 */  sll        $v0, $v0, 2
/* B2F3C 800C273C 0A0083A4 */  sh         $v1, 0xA($a0)
/* B2F40 800C2740 0D80013C */  lui        $at, %hi(_padFixResult)
/* B2F44 800C2744 21082200 */  addu       $at, $at, $v0
/* B2F48 800C2748 5CE9228C */  lw         $v0, %lo(_padFixResult)($at)
/* B2F4C 800C274C 0D80033C */  lui        $v1, %hi(_padFixResult)
/* B2F50 800C2750 34004004 */  bltz       $v0, .L800C2824
/* B2F54 800C2754 5CE96324 */   addiu     $v1, $v1, %lo(_padFixResult)
/* B2F58 800C2758 1D004018 */  blez       $v0, .L800C27D0
/* B2F5C 800C275C 00000000 */   nop
/* B2F60 800C2760 21886000 */  addu       $s1, $v1, $zero
.L800C2764:
/* B2F64 800C2764 0D80033C */  lui        $v1, %hi(_padSioChan)
/* B2F68 800C2768 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* B2F6C 800C276C 00000000 */  nop
/* B2F70 800C2770 80180300 */  sll        $v1, $v1, 2
/* B2F74 800C2774 21187100 */  addu       $v1, $v1, $s1
/* B2F78 800C2778 0000628C */  lw         $v0, 0x0($v1)
/* B2F7C 800C277C 00000000 */  nop
/* B2F80 800C2780 FFFF4224 */  addiu      $v0, $v0, -0x1
/* B2F84 800C2784 00210200 */  sll        $a0, $v0, 4
/* B2F88 800C2788 23208200 */  subu       $a0, $a0, $v0
/* B2F8C 800C278C 00210400 */  sll        $a0, $a0, 4
/* B2F90 800C2790 000062AC */  sw         $v0, 0x0($v1)
/* B2F94 800C2794 0C00028E */  lw         $v0, 0xC($s0)
/* B2F98 800C2798 0D80033C */  lui        $v1, %hi(_padFuncRecvAuto)
/* B2F9C 800C279C 24E9638C */  lw         $v1, %lo(_padFuncRecvAuto)($v1)
/* B2FA0 800C27A0 00000000 */  nop
/* B2FA4 800C27A4 09F86000 */  jalr       $v1
/* B2FA8 800C27A8 21204400 */   addu      $a0, $v0, $a0
/* B2FAC 800C27AC 0D80023C */  lui        $v0, %hi(_padSioChan)
/* B2FB0 800C27B0 44E9428C */  lw         $v0, %lo(_padSioChan)($v0)
/* B2FB4 800C27B4 00000000 */  nop
/* B2FB8 800C27B8 80100200 */  sll        $v0, $v0, 2
/* B2FBC 800C27BC 21105100 */  addu       $v0, $v0, $s1
/* B2FC0 800C27C0 0000428C */  lw         $v0, 0x0($v0)
/* B2FC4 800C27C4 00000000 */  nop
/* B2FC8 800C27C8 E6FF401C */  bgtz       $v0, .L800C2764
/* B2FCC 800C27CC 00000000 */   nop
.L800C27D0:
/* B2FD0 800C27D0 0D80023C */  lui        $v0, %hi(_padSioChan)
/* B2FD4 800C27D4 44E9428C */  lw         $v0, %lo(_padSioChan)($v0)
/* B2FD8 800C27D8 0D80033C */  lui        $v1, %hi(_padFixResult)
/* B2FDC 800C27DC 5CE96324 */  addiu      $v1, $v1, %lo(_padFixResult)
/* B2FE0 800C27E0 80100200 */  sll        $v0, $v0, 2
/* B2FE4 800C27E4 21284300 */  addu       $a1, $v0, $v1
/* B2FE8 800C27E8 0000A28C */  lw         $v0, 0x0($a1)
/* B2FEC 800C27EC 00000000 */  nop
/* B2FF0 800C27F0 0C004014 */  bnez       $v0, .L800C2824
/* B2FF4 800C27F4 FFFF0324 */   addiu     $v1, $zero, -0x1
/* B2FF8 800C27F8 21200002 */  addu       $a0, $s0, $zero
/* B2FFC 800C27FC 0D80023C */  lui        $v0, %hi(_padFuncRecvAuto)
/* B3000 800C2800 24E9428C */  lw         $v0, %lo(_padFuncRecvAuto)($v0)
/* B3004 800C2804 00000000 */  nop
/* B3008 800C2808 09F84000 */  jalr       $v0
/* B300C 800C280C 0000A3AC */   sw        $v1, 0x0($a1)
/* B3010 800C2810 0D80023C */  lui        $v0, %hi(_padFuncClrCmdNo)
/* B3014 800C2814 28E9428C */  lw         $v0, %lo(_padFuncClrCmdNo)($v0)
/* B3018 800C2818 00000000 */  nop
/* B301C 800C281C 09F84000 */  jalr       $v0
/* B3020 800C2820 21200002 */   addu      $a0, $s0, $zero
.L800C2824:
/* B3024 800C2824 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B3028 800C2828 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B302C 800C282C 00000000 */  nop
/* B3030 800C2830 04006294 */  lhu        $v0, 0x4($v1)
/* B3034 800C2834 00000000 */  nop
/* B3038 800C2838 00024230 */  andi       $v0, $v0, 0x200
/* B303C 800C283C 61004010 */  beqz       $v0, .L800C29C4
/* B3040 800C2840 00000000 */   nop
/* B3044 800C2844 0A006294 */  lhu        $v0, 0xA($v1)
/* B3048 800C2848 00000000 */  nop
/* B304C 800C284C 10004234 */  ori        $v0, $v0, 0x10
/* B3050 800C2850 0A0062A4 */  sh         $v0, 0xA($v1)
/* B3054 800C2854 04006294 */  lhu        $v0, 0x4($v1)
/* B3058 800C2858 00000000 */  nop
/* B305C 800C285C 00024230 */  andi       $v0, $v0, 0x200
/* B3060 800C2860 54004010 */  beqz       $v0, .L800C29B4
/* B3064 800C2864 7FFF0224 */   addiu     $v0, $zero, -0x81
.L800C2868:
/* B3068 800C2868 641E030C */  jal        chkRC2wait
/* B306C 800C286C 00000000 */   nop
/* B3070 800C2870 FDFF4010 */  beqz       $v0, .L800C2868
/* B3074 800C2874 D0070424 */   addiu     $a0, $zero, 0x7D0
/* B3078 800C2878 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B307C 800C287C 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B3080 800C2880 01000224 */  addiu      $v0, $zero, 0x1
/* B3084 800C2884 5C1E030C */  jal        setRC2wait
/* B3088 800C2888 000062A0 */   sb        $v0, 0x0($v1)
/* B308C 800C288C DD0B030C */  jal        _padClrIntSio0
/* B3090 800C2890 00000000 */   nop
/* B3094 800C2894 54004010 */  beqz       $v0, .L800C29E8
/* B3098 800C2898 21100000 */   addu      $v0, $zero, $zero
/* B309C 800C289C 010C030C */  jal        _padWaitRXready
/* B30A0 800C28A0 00000000 */   nop
/* B30A4 800C28A4 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B30A8 800C28A8 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B30AC 800C28AC AE010424 */  addiu      $a0, $zero, 0x1AE
/* B30B0 800C28B0 00004290 */  lbu        $v0, 0x0($v0)
/* B30B4 800C28B4 5C1E030C */  jal        setRC2wait
/* B30B8 800C28B8 00000000 */   nop
/* B30BC 800C28BC 350A0308 */  j          .L800C28D4
/* B30C0 800C28C0 00000000 */   nop
.L800C28C4:
/* B30C4 800C28C4 641E030C */  jal        chkRC2wait
/* B30C8 800C28C8 00000000 */   nop
/* B30CC 800C28CC 46004014 */  bnez       $v0, .L800C29E8
/* B30D0 800C28D0 21100000 */   addu      $v0, $zero, $zero
.L800C28D4:
/* B30D4 800C28D4 0D80023C */  lui        $v0, %hi(_padFixResult + 0x8)
/* B30D8 800C28D8 64E9428C */  lw         $v0, %lo(_padFixResult + 0x8)($v0)
/* B30DC 800C28DC 00000000 */  nop
/* B30E0 800C28E0 0000428C */  lw         $v0, 0x0($v0)
/* B30E4 800C28E4 00000000 */  nop
/* B30E8 800C28E8 80004230 */  andi       $v0, $v0, 0x80
/* B30EC 800C28EC F5FF4010 */  beqz       $v0, .L800C28C4
/* B30F0 800C28F0 3C000424 */   addiu     $a0, $zero, 0x3C
/* B30F4 800C28F4 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B30F8 800C28F8 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B30FC 800C28FC 42000224 */  addiu      $v0, $zero, 0x42
/* B3100 800C2900 5C1E030C */  jal        setRC2wait
/* B3104 800C2904 000062A0 */   sb        $v0, 0x0($v1)
/* B3108 800C2908 DD0B030C */  jal        _padClrIntSio0
/* B310C 800C290C 00000000 */   nop
/* B3110 800C2910 35004010 */  beqz       $v0, .L800C29E8
/* B3114 800C2914 21100000 */   addu      $v0, $zero, $zero
/* B3118 800C2918 010C030C */  jal        _padWaitRXready
/* B311C 800C291C 00000000 */   nop
/* B3120 800C2920 0D80023C */  lui        $v0, %hi(_padFixResult + 0xC)
/* B3124 800C2924 68E9428C */  lw         $v0, %lo(_padFixResult + 0xC)($v0)
/* B3128 800C2928 AE010424 */  addiu      $a0, $zero, 0x1AE
/* B312C 800C292C 00004290 */  lbu        $v0, 0x0($v0)
/* B3130 800C2930 5C1E030C */  jal        setRC2wait
/* B3134 800C2934 00000000 */   nop
/* B3138 800C2938 540A0308 */  j          .L800C2950
/* B313C 800C293C 00000000 */   nop
.L800C2940:
/* B3140 800C2940 641E030C */  jal        chkRC2wait
/* B3144 800C2944 00000000 */   nop
/* B3148 800C2948 27004014 */  bnez       $v0, .L800C29E8
/* B314C 800C294C 21100000 */   addu      $v0, $zero, $zero
.L800C2950:
/* B3150 800C2950 0D80023C */  lui        $v0, %hi(_padFixResult + 0x8)
/* B3154 800C2954 64E9428C */  lw         $v0, %lo(_padFixResult + 0x8)($v0)
/* B3158 800C2958 00000000 */  nop
/* B315C 800C295C 0000428C */  lw         $v0, 0x0($v0)
/* B3160 800C2960 00000000 */  nop
/* B3164 800C2964 80004230 */  andi       $v0, $v0, 0x80
/* B3168 800C2968 F5FF4010 */  beqz       $v0, .L800C2940
/* B316C 800C296C 3C000424 */   addiu     $a0, $zero, 0x3C
/* B3170 800C2970 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B3174 800C2974 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B3178 800C2978 01000224 */  addiu      $v0, $zero, 0x1
/* B317C 800C297C 5C1E030C */  jal        setRC2wait
/* B3180 800C2980 000062A0 */   sb        $v0, 0x0($v1)
/* B3184 800C2984 DD0B030C */  jal        _padClrIntSio0
/* B3188 800C2988 00000000 */   nop
/* B318C 800C298C 16004010 */  beqz       $v0, .L800C29E8
/* B3190 800C2990 21100000 */   addu      $v0, $zero, $zero
/* B3194 800C2994 010C030C */  jal        _padWaitRXready
/* B3198 800C2998 00000000 */   nop
/* B319C 800C299C 0D80033C */  lui        $v1, %hi(_padFixResult + 0xC)
/* B31A0 800C29A0 68E9638C */  lw         $v1, %lo(_padFixResult + 0xC)($v1)
/* B31A4 800C29A4 21100000 */  addu       $v0, $zero, $zero
/* B31A8 800C29A8 00006390 */  lbu        $v1, 0x0($v1)
/* B31AC 800C29AC 7A0A0308 */  j          .L800C29E8
/* B31B0 800C29B0 00000000 */   nop
.L800C29B4:
/* B31B4 800C29B4 0D80033C */  lui        $v1, %hi(_padFixResult + 0x8)
/* B31B8 800C29B8 64E9638C */  lw         $v1, %lo(_padFixResult + 0x8)($v1)
/* B31BC 800C29BC 00000000 */  nop
/* B31C0 800C29C0 000062AC */  sw         $v0, 0x0($v1)
.L800C29C4:
/* B31C4 800C29C4 50000292 */  lbu        $v0, 0x50($s0)
/* B31C8 800C29C8 00000000 */  nop
/* B31CC 800C29CC 06004010 */  beqz       $v0, .L800C29E8
/* B31D0 800C29D0 01000224 */   addiu     $v0, $zero, 0x1
/* B31D4 800C29D4 37000392 */  lbu        $v1, 0x37($s0)
/* B31D8 800C29D8 00000000 */  nop
/* B31DC 800C29DC 02006014 */  bnez       $v1, .L800C29E8
/* B31E0 800C29E0 21100000 */   addu      $v0, $zero, $zero
/* B31E4 800C29E4 01000224 */  addiu      $v0, $zero, 0x1
.L800C29E8:
/* B31E8 800C29E8 1800BF8F */  lw         $ra, 0x18($sp)
/* B31EC 800C29EC 1400B18F */  lw         $s1, 0x14($sp)
/* B31F0 800C29F0 1000B08F */  lw         $s0, 0x10($sp)
/* B31F4 800C29F4 0800E003 */  jr         $ra
/* B31F8 800C29F8 2000BD27 */   addiu     $sp, $sp, 0x20
.size _padInitSioMode, . - _padInitSioMode
