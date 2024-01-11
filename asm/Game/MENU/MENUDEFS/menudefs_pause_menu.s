.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menudefs_pause_menu
/* A986C 800B906C D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9870 800B9070 2400B1AF */  sw         $s1, 0x24($sp)
/* A9874 800B9074 21888000 */  addu       $s1, $a0, $zero
/* A9878 800B9078 2800B2AF */  sw         $s2, 0x28($sp)
/* A987C 800B907C 2190A000 */  addu       $s2, $a1, $zero
/* A9880 800B9080 2C00BFAF */  sw         $ra, 0x2C($sp)
/* A9884 800B9084 7CE1020C */  jal        do_check_controller
/* A9888 800B9088 2000B0AF */   sw        $s0, 0x20($sp)
/* A988C 800B908C 01000524 */  addiu      $a1, $zero, 0x1
/* A9890 800B9090 2110A000 */  addu       $v0, $a1, $zero
/* A9894 800B9094 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A9898 800B9098 0CAA828F */  lw         $v0, %gp_rel(PAUSE_WIDTH)($gp)
/* A989C 800B909C 08AA868F */  lw         $a2, %gp_rel(PAUSE_XPOS)($gp)
/* A98A0 800B90A0 10AA838F */  lw         $v1, %gp_rel(LINESKIP)($gp)
/* A98A4 800B90A4 14AA848F */  lw         $a0, %gp_rel(ITEMSKIP)($gp)
/* A98A8 800B90A8 FCA9878F */  lw         $a3, %gp_rel(PAUSE_YPOS)($gp)
/* A98AC 800B90AC 1000A2AF */  sw         $v0, 0x10($sp)
/* A98B0 800B90B0 1400A3AF */  sw         $v1, 0x14($sp)
/* A98B4 800B90B4 1800A4AF */  sw         $a0, 0x18($sp)
/* A98B8 800B90B8 2000248E */  lw         $a0, 0x20($s1)
/* A98BC 800B90BC 20AA80AF */  sw         $zero, %gp_rel(hack_attract)($gp)
/* A98C0 800B90C0 D1DD020C */  jal        menu_format
/* A98C4 800B90C4 00000000 */   nop
/* A98C8 800B90C8 B3DD020C */  jal        localstr_get
/* A98CC 800B90CC 21000424 */   addiu     $a0, $zero, 0x21
/* A98D0 800B90D0 21280000 */  addu       $a1, $zero, $zero
/* A98D4 800B90D4 2130A000 */  addu       $a2, $a1, $zero
/* A98D8 800B90D8 1000A2AF */  sw         $v0, 0x10($sp)
/* A98DC 800B90DC 2000248E */  lw         $a0, 0x20($s1)
/* A98E0 800B90E0 0FDE020C */  jal        menu_item_flags
/* A98E4 800B90E4 04000724 */   addiu     $a3, $zero, 0x4
/* A98E8 800B90E8 B3DD020C */  jal        localstr_get
/* A98EC 800B90EC 27000424 */   addiu     $a0, $zero, 0x27
/* A98F0 800B90F0 0C80053C */  lui        $a1, %hi(do_function)
/* A98F4 800B90F4 9486A524 */  addiu      $a1, $a1, %lo(do_function)
/* A98F8 800B90F8 0180063C */  lui        $a2, %hi(DEBUG_ContinueGame)
/* A98FC 800B90FC 6844C624 */  addiu      $a2, $a2, %lo(DEBUG_ContinueGame)
/* A9900 800B9100 2000248E */  lw         $a0, 0x20($s1)
/* A9904 800B9104 33DE020C */  jal        menu_item
/* A9908 800B9108 21384000 */   addu      $a3, $v0, $zero
/* A990C 800B910C 0CBF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x144)($gp)
/* A9910 800B9110 00000000 */  nop
/* A9914 800B9114 04004230 */  andi       $v0, $v0, 0x4
/* A9918 800B9118 1C004014 */  bnez       $v0, .L800B918C
/* A991C 800B911C 21104002 */   addu      $v0, $s2, $zero
/* A9920 800B9120 B3DD020C */  jal        localstr_get
/* A9924 800B9124 29000424 */   addiu     $a0, $zero, 0x29
/* A9928 800B9128 0C80053C */  lui        $a1, %hi(do_save_menu)
/* A992C 800B912C 2C87A524 */  addiu      $a1, $a1, %lo(do_save_menu)
/* A9930 800B9130 21300000 */  addu       $a2, $zero, $zero
/* A9934 800B9134 2000248E */  lw         $a0, 0x20($s1)
/* A9938 800B9138 33DE020C */  jal        menu_item
/* A993C 800B913C 21384000 */   addu      $a3, $v0, $zero
/* A9940 800B9140 B3DD020C */  jal        localstr_get
/* A9944 800B9144 1F000424 */   addiu     $a0, $zero, 0x1F
/* A9948 800B9148 0C80103C */  lui        $s0, %hi(do_push_menu)
/* A994C 800B914C 24861026 */  addiu      $s0, $s0, %lo(do_push_menu)
/* A9950 800B9150 21280002 */  addu       $a1, $s0, $zero
/* A9954 800B9154 0C80063C */  lui        $a2, %hi(options_menu)
/* A9958 800B9158 B88AC624 */  addiu      $a2, $a2, %lo(options_menu)
/* A995C 800B915C 2000248E */  lw         $a0, 0x20($s1)
/* A9960 800B9160 33DE020C */  jal        menu_item
/* A9964 800B9164 21384000 */   addu      $a3, $v0, $zero
/* A9968 800B9168 B3DD020C */  jal        localstr_get
/* A996C 800B916C 26000424 */   addiu     $a0, $zero, 0x26
/* A9970 800B9170 21280002 */  addu       $a1, $s0, $zero
/* A9974 800B9174 0C80063C */  lui        $a2, %hi(menudefs_confirmexit_menu)
/* A9978 800B9178 C48FC624 */  addiu      $a2, $a2, %lo(menudefs_confirmexit_menu)
/* A997C 800B917C 2000248E */  lw         $a0, 0x20($s1)
/* A9980 800B9180 33DE020C */  jal        menu_item
/* A9984 800B9184 21384000 */   addu      $a3, $v0, $zero
/* A9988 800B9188 21104002 */  addu       $v0, $s2, $zero
.L800B918C:
/* A998C 800B918C 02004104 */  bgez       $v0, .L800B9198
/* A9990 800B9190 00000000 */   nop
/* A9994 800B9194 01000224 */  addiu      $v0, $zero, 0x1
.L800B9198:
/* A9998 800B9198 2C00BF8F */  lw         $ra, 0x2C($sp)
/* A999C 800B919C 2800B28F */  lw         $s2, 0x28($sp)
/* A99A0 800B91A0 2400B18F */  lw         $s1, 0x24($sp)
/* A99A4 800B91A4 2000B08F */  lw         $s0, 0x20($sp)
/* A99A8 800B91A8 0800E003 */  jr         $ra
/* A99AC 800B91AC 3000BD27 */   addiu     $sp, $sp, 0x30
.size menudefs_pause_menu, . - menudefs_pause_menu
