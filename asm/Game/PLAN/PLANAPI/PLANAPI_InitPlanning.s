.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_InitPlanning
/* 8899C 8009819C 21280000 */  addu       $a1, $zero, $zero
/* 889A0 800981A0 A0F58227 */  addiu      $v0, $gp, %gp_rel(poolManagementDataStorage)
/* 889A4 800981A4 21384000 */  addu       $a3, $v0, $zero
/* 889A8 800981A8 80038424 */  addiu      $a0, $a0, 0x380
/* 889AC 800981AC ECF587AF */  sw         $a3, %gp_rel(poolManagementData)($gp)
/* 889B0 800981B0 A0F580A3 */  sb         $zero, %gp_rel(poolManagementDataStorage)($gp)
/* 889B4 800981B4 0100E0A0 */  sb         $zero, 0x1($a3)
/* 889B8 800981B8 1000E4AC */  sw         $a0, 0x10($a3)
.L800981BC:
/* 889BC 800981BC 21200000 */  addu       $a0, $zero, $zero
/* 889C0 800981C0 80310500 */  sll        $a2, $a1, 6
/* 889C4 800981C4 40100400 */  sll        $v0, $a0, 1
.L800981C8:
/* 889C8 800981C8 1000E38C */  lw         $v1, 0x10($a3)
/* 889CC 800981CC 01008424 */  addiu      $a0, $a0, 0x1
/* 889D0 800981D0 2118C300 */  addu       $v1, $a2, $v1
/* 889D4 800981D4 21104300 */  addu       $v0, $v0, $v1
/* 889D8 800981D8 000040A4 */  sh         $zero, 0x0($v0)
/* 889DC 800981DC 20008228 */  slti       $v0, $a0, 0x20
/* 889E0 800981E0 F9FF4014 */  bnez       $v0, .L800981C8
/* 889E4 800981E4 40100400 */   sll       $v0, $a0, 1
/* 889E8 800981E8 0100A524 */  addiu      $a1, $a1, 0x1
/* 889EC 800981EC 2000A228 */  slti       $v0, $a1, 0x20
/* 889F0 800981F0 F2FF4014 */  bnez       $v0, .L800981BC
/* 889F4 800981F4 00000000 */   nop
/* 889F8 800981F8 09000524 */  addiu      $a1, $zero, 0x9
/* 889FC 800981FC E4F58227 */  addiu      $v0, $gp, %gp_rel(timerArray + 0x24)
.L80098200:
/* 88A00 80098200 000040AC */  sw         $zero, 0x0($v0)
/* 88A04 80098204 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 88A08 80098208 FDFFA104 */  bgez       $a1, .L80098200
/* 88A0C 8009820C FCFF4224 */   addiu     $v0, $v0, -0x4
/* 88A10 80098210 E8F580AF */  sw         $zero, %gp_rel(timerIndex)($gp)
/* 88A14 80098214 0800E003 */  jr         $ra
/* 88A18 80098218 00000000 */   nop
.size PLANAPI_InitPlanning, . - PLANAPI_InitPlanning
