.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel main_menu
/* A9400 800B8C00 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9404 800B8C04 2000B0AF */  sw         $s0, 0x20($sp)
/* A9408 800B8C08 21808000 */  addu       $s0, $a0, $zero
/* A940C 800B8C0C 00AA868F */  lw         $a2, %gp_rel(MAIN_XPOS)($gp)
/* A9410 800B8C10 04AA828F */  lw         $v0, %gp_rel(MAIN_WIDTH)($gp)
/* A9414 800B8C14 10AA838F */  lw         $v1, %gp_rel(LINESKIP)($gp)
/* A9418 800B8C18 14AA848F */  lw         $a0, %gp_rel(ITEMSKIP)($gp)
/* A941C 800B8C1C F8A9878F */  lw         $a3, %gp_rel(MAIN_YPOS)($gp)
/* A9420 800B8C20 2400B1AF */  sw         $s1, 0x24($sp)
/* A9424 800B8C24 2188A000 */  addu       $s1, $a1, $zero
/* A9428 800B8C28 2800BFAF */  sw         $ra, 0x28($sp)
/* A942C 800B8C2C 1C00A0AF */  sw         $zero, 0x1C($sp)
/* A9430 800B8C30 1000A2AF */  sw         $v0, 0x10($sp)
/* A9434 800B8C34 1400A3AF */  sw         $v1, 0x14($sp)
/* A9438 800B8C38 1800A4AF */  sw         $a0, 0x18($sp)
/* A943C 800B8C3C 2000048E */  lw         $a0, 0x20($s0)
/* A9440 800B8C40 20AA80AF */  sw         $zero, %gp_rel(hack_attract)($gp)
/* A9444 800B8C44 D1DD020C */  jal        menu_format
/* A9448 800B8C48 01000524 */   addiu     $a1, $zero, 0x1
/* A944C 800B8C4C F4E4020C */  jal        MENUFACE_ChangeStateRandomly
/* A9450 800B8C50 21202002 */   addu      $a0, $s1, $zero
/* A9454 800B8C54 7CE1020C */  jal        do_check_controller
/* A9458 800B8C58 21200002 */   addu      $a0, $s0, $zero
/* A945C 800B8C5C B3DD020C */  jal        localstr_get
/* A9460 800B8C60 2D000424 */   addiu     $a0, $zero, 0x2D
/* A9464 800B8C64 0C80053C */  lui        $a1, %hi(do_start_game)
/* A9468 800B8C68 C886A524 */  addiu      $a1, $a1, %lo(do_start_game)
/* A946C 800B8C6C 21300000 */  addu       $a2, $zero, $zero
/* A9470 800B8C70 2000048E */  lw         $a0, 0x20($s0)
/* A9474 800B8C74 33DE020C */  jal        menu_item
/* A9478 800B8C78 21384000 */   addu      $a3, $v0, $zero
/* A947C 800B8C7C B3DD020C */  jal        localstr_get
/* A9480 800B8C80 1F000424 */   addiu     $a0, $zero, 0x1F
/* A9484 800B8C84 0C80053C */  lui        $a1, %hi(do_push_menu)
/* A9488 800B8C88 2486A524 */  addiu      $a1, $a1, %lo(do_push_menu)
/* A948C 800B8C8C 0C80063C */  lui        $a2, %hi(options_menu)
/* A9490 800B8C90 B88AC624 */  addiu      $a2, $a2, %lo(options_menu)
/* A9494 800B8C94 2000048E */  lw         $a0, 0x20($s0)
/* A9498 800B8C98 33DE020C */  jal        menu_item
/* A949C 800B8C9C 21384000 */   addu      $a3, $v0, $zero
/* A94A0 800B8CA0 21102002 */  addu       $v0, $s1, $zero
/* A94A4 800B8CA4 02004104 */  bgez       $v0, .L800B8CB0
/* A94A8 800B8CA8 00000000 */   nop
/* A94AC 800B8CAC 21100000 */  addu       $v0, $zero, $zero
.L800B8CB0:
/* A94B0 800B8CB0 2800BF8F */  lw         $ra, 0x28($sp)
/* A94B4 800B8CB4 2400B18F */  lw         $s1, 0x24($sp)
/* A94B8 800B8CB8 2000B08F */  lw         $s0, 0x20($sp)
/* A94BC 800B8CBC 0800E003 */  jr         $ra
/* A94C0 800B8CC0 3000BD27 */   addiu     $sp, $sp, 0x30
.size main_menu, . - main_menu
