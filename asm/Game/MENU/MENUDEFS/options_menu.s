.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel options_menu
/* A92B8 800B8AB8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A92BC 800B8ABC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A92C0 800B8AC0 21888000 */  addu       $s1, $a0, $zero
/* A92C4 800B8AC4 2000B2AF */  sw         $s2, 0x20($sp)
/* A92C8 800B8AC8 2190A000 */  addu       $s2, $a1, $zero
/* A92CC 800B8ACC 2400BFAF */  sw         $ra, 0x24($sp)
/* A92D0 800B8AD0 1800B0AF */  sw         $s0, 0x18($sp)
/* A92D4 800B8AD4 20AA80AF */  sw         $zero, %gp_rel(hack_attract)($gp)
/* A92D8 800B8AD8 F4E4020C */  jal        MENUFACE_ChangeStateRandomly
/* A92DC 800B8ADC 21204002 */   addu      $a0, $s2, $zero
/* A92E0 800B8AE0 7CE1020C */  jal        do_check_controller
/* A92E4 800B8AE4 21202002 */   addu      $a0, $s1, $zero
/* A92E8 800B8AE8 B3DD020C */  jal        localstr_get
/* A92EC 800B8AEC 1F000424 */   addiu     $a0, $zero, 0x1F
/* A92F0 800B8AF0 21280000 */  addu       $a1, $zero, $zero
/* A92F4 800B8AF4 2130A000 */  addu       $a2, $a1, $zero
/* A92F8 800B8AF8 1000A2AF */  sw         $v0, 0x10($sp)
/* A92FC 800B8AFC 2000248E */  lw         $a0, 0x20($s1)
/* A9300 800B8B00 0FDE020C */  jal        menu_item_flags
/* A9304 800B8B04 04000724 */   addiu     $a3, $zero, 0x4
/* A9308 800B8B08 B3DD020C */  jal        localstr_get
/* A930C 800B8B0C 2C000424 */   addiu     $a0, $zero, 0x2C
/* A9310 800B8B10 21202002 */  addu       $a0, $s1, $zero
/* A9314 800B8B14 21284000 */  addu       $a1, $v0, $zero
/* A9318 800B8B18 7CE2020C */  jal        sound_item
/* A931C 800B8B1C 21300000 */   addu      $a2, $zero, $zero
/* A9320 800B8B20 B3DD020C */  jal        localstr_get
/* A9324 800B8B24 18000424 */   addiu     $a0, $zero, 0x18
/* A9328 800B8B28 21202002 */  addu       $a0, $s1, $zero
/* A932C 800B8B2C 21284000 */  addu       $a1, $v0, $zero
/* A9330 800B8B30 7CE2020C */  jal        sound_item
/* A9334 800B8B34 01000624 */   addiu     $a2, $zero, 0x1
/* A9338 800B8B38 B3DD020C */  jal        localstr_get
/* A933C 800B8B3C 33000424 */   addiu     $a0, $zero, 0x33
/* A9340 800B8B40 21202002 */  addu       $a0, $s1, $zero
/* A9344 800B8B44 21284000 */  addu       $a1, $v0, $zero
/* A9348 800B8B48 7CE2020C */  jal        sound_item
/* A934C 800B8B4C 02000624 */   addiu     $a2, $zero, 0x2
/* A9350 800B8B50 80C5000C */  jal        GAMEPAD_ControllerIsDualShock
/* A9354 800B8B54 00000000 */   nop
/* A9358 800B8B58 21804000 */  addu       $s0, $v0, $zero
/* A935C 800B8B5C 0E000012 */  beqz       $s0, .L800B8B98
/* A9360 800B8B60 00000000 */   nop
/* A9364 800B8B64 83C5000C */  jal        GAMEPAD_DualShockEnabled
/* A9368 800B8B68 00000000 */   nop
/* A936C 800B8B6C 02004010 */  beqz       $v0, .L800B8B78
/* A9370 800B8B70 31000424 */   addiu     $a0, $zero, 0x31
/* A9374 800B8B74 32000424 */  addiu      $a0, $zero, 0x32
.L800B8B78:
/* A9378 800B8B78 B3DD020C */  jal        localstr_get
/* A937C 800B8B7C 00000000 */   nop
/* A9380 800B8B80 2000248E */  lw         $a0, 0x20($s1)
/* A9384 800B8B84 0C80053C */  lui        $a1, %hi(menudefs_toggle_dualshock)
/* A9388 800B8B88 548AA524 */  addiu      $a1, $a1, %lo(menudefs_toggle_dualshock)
/* A938C 800B8B8C 21300000 */  addu       $a2, $zero, $zero
/* A9390 800B8B90 33DE020C */  jal        menu_item
/* A9394 800B8B94 21384000 */   addu      $a3, $v0, $zero
.L800B8B98:
/* A9398 800B8B98 B3DD020C */  jal        localstr_get
/* A939C 800B8B9C 0E000424 */   addiu     $a0, $zero, 0xE
/* A93A0 800B8BA0 0C80053C */  lui        $a1, %hi(do_pop_menu)
/* A93A4 800B8BA4 5C86A524 */  addiu      $a1, $a1, %lo(do_pop_menu)
/* A93A8 800B8BA8 21300000 */  addu       $a2, $zero, $zero
/* A93AC 800B8BAC 2000248E */  lw         $a0, 0x20($s1)
/* A93B0 800B8BB0 33DE020C */  jal        menu_item
/* A93B4 800B8BB4 21384000 */   addu      $a3, $v0, $zero
/* A93B8 800B8BB8 1C00828F */  lw         $v0, %gp_rel(wasDualShock.54)($gp)
/* A93BC 800B8BBC 00000000 */  nop
/* A93C0 800B8BC0 04000212 */  beq        $s0, $v0, .L800B8BD4
/* A93C4 800B8BC4 0400422A */   slti      $v0, $s2, 0x4
/* A93C8 800B8BC8 02004014 */  bnez       $v0, .L800B8BD4
/* A93CC 800B8BCC 00000000 */   nop
/* A93D0 800B8BD0 04001226 */  addiu      $s2, $s0, 0x4
.L800B8BD4:
/* A93D4 800B8BD4 1C0090AF */  sw         $s0, %gp_rel(wasDualShock.54)($gp)
/* A93D8 800B8BD8 21104002 */  addu       $v0, $s2, $zero
/* A93DC 800B8BDC 02004104 */  bgez       $v0, .L800B8BE8
/* A93E0 800B8BE0 00000000 */   nop
/* A93E4 800B8BE4 01000224 */  addiu      $v0, $zero, 0x1
.L800B8BE8:
/* A93E8 800B8BE8 2400BF8F */  lw         $ra, 0x24($sp)
/* A93EC 800B8BEC 2000B28F */  lw         $s2, 0x20($sp)
/* A93F0 800B8BF0 1C00B18F */  lw         $s1, 0x1C($sp)
/* A93F4 800B8BF4 1800B08F */  lw         $s0, 0x18($sp)
/* A93F8 800B8BF8 0800E003 */  jr         $ra
/* A93FC 800B8BFC 2800BD27 */   addiu     $sp, $sp, 0x28
.size options_menu, . - options_menu
