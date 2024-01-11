.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_main_menu
/* A94C4 800B8CC4 1CAA828F */  lw         $v0, %gp_rel(StartGameFading)($gp)
/* A94C8 800B8CC8 00000000 */  nop
/* A94CC 800B8CCC 10004014 */  bnez       $v0, .L800B8D10
/* A94D0 800B8CD0 07000224 */   addiu     $v0, $zero, 0x7
/* A94D4 800B8CD4 0300C210 */  beq        $a2, $v0, .L800B8CE4
/* A94D8 800B8CD8 05000224 */   addiu     $v0, $zero, 0x5
/* A94DC 800B8CDC 0C00C214 */  bne        $a2, $v0, .L800B8D10
/* A94E0 800B8CE0 00000000 */   nop
.L800B8CE4:
/* A94E4 800B8CE4 01000224 */  addiu      $v0, $zero, 0x1
/* A94E8 800B8CE8 0A000324 */  addiu      $v1, $zero, 0xA
/* A94EC 800B8CEC D00083A4 */  sh         $v1, 0xD0($a0)
/* A94F0 800B8CF0 ECFF0324 */  addiu      $v1, $zero, -0x14
/* A94F4 800B8CF4 CC0083A4 */  sh         $v1, 0xCC($a0)
/* A94F8 800B8CF8 14000324 */  addiu      $v1, $zero, 0x14
/* A94FC 800B8CFC CE0083A4 */  sh         $v1, 0xCE($a0)
/* A9500 800B8D00 21184000 */  addu       $v1, $v0, $zero
/* A9504 800B8D04 1CAA83AF */  sw         $v1, %gp_rel(StartGameFading)($gp)
/* A9508 800B8D08 0800E003 */  jr         $ra
/* A950C 800B8D0C 00000000 */   nop
.L800B8D10:
/* A9510 800B8D10 0800E003 */  jr         $ra
/* A9514 800B8D14 21100000 */   addu      $v0, $zero, $zero
.size do_main_menu, . - do_main_menu
