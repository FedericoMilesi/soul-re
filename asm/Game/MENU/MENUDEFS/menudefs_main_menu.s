.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menudefs_main_menu
/* A971C 800B8F1C 18AA828F */  lw         $v0, %gp_rel(hack_reset_attract)($gp)
/* A9720 800B8F20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A9724 800B8F24 2000B0AF */  sw         $s0, 0x20($sp)
/* A9728 800B8F28 21808000 */  addu       $s0, $a0, $zero
/* A972C 800B8F2C 2400B1AF */  sw         $s1, 0x24($sp)
/* A9730 800B8F30 2188A000 */  addu       $s1, $a1, $zero
/* A9734 800B8F34 04004010 */  beqz       $v0, .L800B8F48
/* A9738 800B8F38 2800BFAF */   sw        $ra, 0x28($sp)
/* A973C 800B8F3C 00BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x138)($gp)
/* A9740 800B8F40 18AA80AF */  sw         $zero, %gp_rel(hack_reset_attract)($gp)
/* A9744 800B8F44 20AA82AF */  sw         $v0, %gp_rel(hack_attract)($gp)
.L800B8F48:
/* A9748 800B8F48 03E2020C */  jal        check_hack_attract
/* A974C 800B8F4C 00000000 */   nop
/* A9750 800B8F50 01000524 */  addiu      $a1, $zero, 0x1
/* A9754 800B8F54 6E010624 */  addiu      $a2, $zero, 0x16E
/* A9758 800B8F58 10AA838F */  lw         $v1, %gp_rel(LINESKIP)($gp)
/* A975C 800B8F5C 14AA848F */  lw         $a0, %gp_rel(ITEMSKIP)($gp)
/* A9760 800B8F60 64000224 */  addiu      $v0, $zero, 0x64
/* A9764 800B8F64 1000A2AF */  sw         $v0, 0x10($sp)
/* A9768 800B8F68 1C00A0AF */  sw         $zero, 0x1C($sp)
/* A976C 800B8F6C 1400A3AF */  sw         $v1, 0x14($sp)
/* A9770 800B8F70 1800A4AF */  sw         $a0, 0x18($sp)
/* A9774 800B8F74 2000048E */  lw         $a0, 0x20($s0)
/* A9778 800B8F78 D1DD020C */  jal        menu_format
/* A977C 800B8F7C 90000724 */   addiu     $a3, $zero, 0x90
/* A9780 800B8F80 46E3020C */  jal        flashStart
/* A9784 800B8F84 00000000 */   nop
/* A9788 800B8F88 0C80053C */  lui        $a1, %hi(do_main_menu)
/* A978C 800B8F8C C48CA524 */  addiu      $a1, $a1, %lo(do_main_menu)
/* A9790 800B8F90 21300000 */  addu       $a2, $zero, $zero
/* A9794 800B8F94 2000048E */  lw         $a0, 0x20($s0)
/* A9798 800B8F98 33DE020C */  jal        menu_item
/* A979C 800B8F9C 21384000 */   addu      $a3, $v0, $zero
/* A97A0 800B8FA0 21102002 */  addu       $v0, $s1, $zero
/* A97A4 800B8FA4 02004104 */  bgez       $v0, .L800B8FB0
/* A97A8 800B8FA8 00000000 */   nop
/* A97AC 800B8FAC 21100000 */  addu       $v0, $zero, $zero
.L800B8FB0:
/* A97B0 800B8FB0 2800BF8F */  lw         $ra, 0x28($sp)
/* A97B4 800B8FB4 2400B18F */  lw         $s1, 0x24($sp)
/* A97B8 800B8FB8 2000B08F */  lw         $s0, 0x20($sp)
/* A97BC 800B8FBC 0800E003 */  jr         $ra
/* A97C0 800B8FC0 3000BD27 */   addiu     $sp, $sp, 0x30
.size menudefs_main_menu, . - menudefs_main_menu
