.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessEffects
/* A2ED4 800B26D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A2ED8 800B26D8 1000B0AF */  sw         $s0, 0x10($sp)
/* A2EDC 800B26DC 21808000 */  addu       $s0, $a0, $zero
/* A2EE0 800B26E0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A2EE4 800B26E4 1800B2AF */  sw         $s2, 0x18($sp)
/* A2EE8 800B26E8 2197020C */  jal        razGetHeldItem
/* A2EEC 800B26EC 1400B1AF */   sw        $s1, 0x14($sp)
/* A2EF0 800B26F0 21904000 */  addu       $s2, $v0, $zero
/* A2EF4 800B26F4 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2EF8 800B26F8 4CFB9127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x51C)
/* A2EFC 800B26FC 04004230 */  andi       $v0, $v0, 0x4
/* A2F00 800B2700 0E004010 */  beqz       $v0, .L800B273C
/* A2F04 800B2704 00000000 */   nop
/* A2F08 800B2708 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A2F0C 800B270C 0F9F020C */  jal        razUpdateSoundRamp
/* A2F10 800B2710 21200002 */   addu      $a0, $s0, $zero
/* A2F14 800B2714 09004014 */  bnez       $v0, .L800B273C
/* A2F18 800B2718 00000000 */   nop
/* A2F1C 800B271C 4800248E */  lw         $a0, 0x48($s1)
/* A2F20 800B2720 1C02010C */  jal        SndEndLoop
/* A2F24 800B2724 00000000 */   nop
/* A2F28 800B2728 480020AE */  sw         $zero, 0x48($s1)
/* A2F2C 800B272C 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2F30 800B2730 FBFF0324 */  addiu      $v1, $zero, -0x5
/* A2F34 800B2734 24104300 */  and        $v0, $v0, $v1
/* A2F38 800B2738 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
.L800B273C:
/* A2F3C 800B273C 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2F40 800B2740 4CFB9127 */  addiu      $s1, $gp, %gp_rel(Raziel + 0x51C)
/* A2F44 800B2744 08004230 */  andi       $v0, $v0, 0x8
/* A2F48 800B2748 0E004010 */  beqz       $v0, .L800B2784
/* A2F4C 800B274C 00000000 */   nop
/* A2F50 800B2750 ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A2F54 800B2754 0F9F020C */  jal        razUpdateSoundRamp
/* A2F58 800B2758 21200002 */   addu      $a0, $s0, $zero
/* A2F5C 800B275C 09004014 */  bnez       $v0, .L800B2784
/* A2F60 800B2760 00000000 */   nop
/* A2F64 800B2764 6000248E */  lw         $a0, 0x60($s1)
/* A2F68 800B2768 1C02010C */  jal        SndEndLoop
/* A2F6C 800B276C 00000000 */   nop
/* A2F70 800B2770 600020AE */  sw         $zero, 0x60($s1)
/* A2F74 800B2774 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2F78 800B2778 F7FF0324 */  addiu      $v1, $zero, -0x9
/* A2F7C 800B277C 24104300 */  and        $v0, $v0, $v1
/* A2F80 800B2780 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
.L800B2784:
/* A2F84 800B2784 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A2F88 800B2788 00000000 */  nop
/* A2F8C 800B278C 02006230 */  andi       $v0, $v1, 0x2
/* A2F90 800B2790 14004010 */  beqz       $v0, .L800B27E4
/* A2F94 800B2794 00000000 */   nop
/* A2F98 800B2798 A4FA828F */  lw         $v0, %gp_rel(Raziel + 0x474)($gp)
/* A2F9C 800B279C 00000000 */  nop
/* A2FA0 800B27A0 03004010 */  beqz       $v0, .L800B27B0
/* A2FA4 800B27A4 00000000 */   nop
/* A2FA8 800B27A8 F9C90208 */  j          .L800B27E4
/* A2FAC 800B27AC 21804000 */   addu      $s0, $v0, $zero
.L800B27B0:
/* A2FB0 800B27B0 0C004012 */  beqz       $s2, .L800B27E4
/* A2FB4 800B27B4 00000000 */   nop
/* A2FB8 800B27B8 1CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3EC)($gp)
/* A2FBC 800B27BC 00000000 */  nop
/* A2FC0 800B27C0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* A2FC4 800B27C4 0300422C */  sltiu      $v0, $v0, 0x3
/* A2FC8 800B27C8 03004010 */  beqz       $v0, .L800B27D8
/* A2FCC 800B27CC FDFF0224 */   addiu     $v0, $zero, -0x3
/* A2FD0 800B27D0 F9C90208 */  j          .L800B27E4
/* A2FD4 800B27D4 21804002 */   addu      $s0, $s2, $zero
.L800B27D8:
/* A2FD8 800B27D8 24106200 */  and        $v0, $v1, $v0
/* A2FDC 800B27DC 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2FE0 800B27E0 A4FA80AF */  sw         $zero, %gp_rel(Raziel + 0x474)($gp)
.L800B27E4:
/* A2FE4 800B27E4 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A2FE8 800B27E8 00000000 */  nop
/* A2FEC 800B27EC 01004230 */  andi       $v0, $v0, 0x1
/* A2FF0 800B27F0 37004010 */  beqz       $v0, .L800B28D0
/* A2FF4 800B27F4 00000000 */   nop
/* A2FF8 800B27F8 54FB838F */  lw         $v1, %gp_rel(Raziel + 0x524)($gp)
/* A2FFC 800B27FC 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* A3000 800B2800 00000000 */  nop
/* A3004 800B2804 18006200 */  mult       $v1, $v0
/* A3008 800B2808 58FB828F */  lw         $v0, %gp_rel(Raziel + 0x528)($gp)
/* A300C 800B280C 12300000 */  mflo       $a2
/* A3010 800B2810 21104600 */  addu       $v0, $v0, $a2
/* A3014 800B2814 21184000 */  addu       $v1, $v0, $zero
/* A3018 800B2818 58FB82AF */  sw         $v0, %gp_rel(Raziel + 0x528)($gp)
/* A301C 800B281C 02006104 */  bgez       $v1, .L800B2828
/* A3020 800B2820 00000000 */   nop
/* A3024 800B2824 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800B2828:
/* A3028 800B2828 04010296 */  lhu        $v0, 0x104($s0)
/* A302C 800B282C 031B0300 */  sra        $v1, $v1, 12
/* A3030 800B2830 21104300 */  addu       $v0, $v0, $v1
/* A3034 800B2834 14006018 */  blez       $v1, .L800B2888
/* A3038 800B2838 040102A6 */   sh        $v0, 0x104($s0)
/* A303C 800B283C 00140200 */  sll        $v0, $v0, 16
/* A3040 800B2840 52FB8387 */  lh         $v1, %gp_rel(Raziel + 0x522)($gp)
/* A3044 800B2844 03140200 */  sra        $v0, $v0, 16
/* A3048 800B2848 2A186200 */  slt        $v1, $v1, $v0
/* A304C 800B284C 52FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x522)($gp)
/* A3050 800B2850 1F006010 */  beqz       $v1, .L800B28D0
/* A3054 800B2854 00000000 */   nop
/* A3058 800B2858 040102A6 */  sh         $v0, 0x104($s0)
/* A305C 800B285C FEFF0224 */  addiu      $v0, $zero, -0x2
/* A3060 800B2860 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A3064 800B2864 A4FA848F */  lw         $a0, %gp_rel(Raziel + 0x474)($gp)
/* A3068 800B2868 24186200 */  and        $v1, $v1, $v0
/* A306C 800B286C 4CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A3070 800B2870 17000416 */  bne        $s0, $a0, .L800B28D0
/* A3074 800B2874 FDFF0224 */   addiu     $v0, $zero, -0x3
/* A3078 800B2878 24106200 */  and        $v0, $v1, $v0
/* A307C 800B287C 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A3080 800B2880 34CA0208 */  j          .L800B28D0
/* A3084 800B2884 00000000 */   nop
.L800B2888:
/* A3088 800B2888 11006104 */  bgez       $v1, .L800B28D0
/* A308C 800B288C 00140200 */   sll       $v0, $v0, 16
/* A3090 800B2890 52FB8387 */  lh         $v1, %gp_rel(Raziel + 0x522)($gp)
/* A3094 800B2894 03140200 */  sra        $v0, $v0, 16
/* A3098 800B2898 2A104300 */  slt        $v0, $v0, $v1
/* A309C 800B289C 52FB8397 */  lhu        $v1, %gp_rel(Raziel + 0x522)($gp)
/* A30A0 800B28A0 0B004010 */  beqz       $v0, .L800B28D0
/* A30A4 800B28A4 FEFF0224 */   addiu     $v0, $zero, -0x2
/* A30A8 800B28A8 040103A6 */  sh         $v1, 0x104($s0)
/* A30AC 800B28AC 4CFB838F */  lw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A30B0 800B28B0 A4FA848F */  lw         $a0, %gp_rel(Raziel + 0x474)($gp)
/* A30B4 800B28B4 24186200 */  and        $v1, $v1, $v0
/* A30B8 800B28B8 4CFB83AF */  sw         $v1, %gp_rel(Raziel + 0x51C)($gp)
/* A30BC 800B28BC 04000416 */  bne        $s0, $a0, .L800B28D0
/* A30C0 800B28C0 FDFF0224 */   addiu     $v0, $zero, -0x3
/* A30C4 800B28C4 24106200 */  and        $v0, $v1, $v0
/* A30C8 800B28C8 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A30CC 800B28CC A4FA80AF */  sw         $zero, %gp_rel(Raziel + 0x474)($gp)
.L800B28D0:
/* A30D0 800B28D0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A30D4 800B28D4 1800B28F */  lw         $s2, 0x18($sp)
/* A30D8 800B28D8 1400B18F */  lw         $s1, 0x14($sp)
/* A30DC 800B28DC 1000B08F */  lw         $s0, 0x10($sp)
/* A30E0 800B28E0 0800E003 */  jr         $ra
/* A30E4 800B28E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size ProcessEffects, . - ProcessEffects
