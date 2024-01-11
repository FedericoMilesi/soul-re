.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_RemoveSenses
/* 774C8 80086CC8 2400838C */  lw         $v1, 0x24($a0)
/* 774CC 80086CCC 50A5828F */  lw         $v0, %gp_rel(gNumMonsters)($gp)
/* 774D0 80086CD0 6C01848C */  lw         $a0, 0x16C($a0)
/* 774D4 80086CD4 1000638C */  lw         $v1, 0x10($v1)
/* 774D8 80086CD8 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 774DC 80086CDC 50A582AF */  sw         $v0, %gp_rel(gNumMonsters)($gp)
/* 774E0 80086CE0 04186330 */  andi       $v1, $v1, 0x1804
/* 774E4 80086CE4 07006010 */  beqz       $v1, .L80086D04
/* 774E8 80086CE8 00000000 */   nop
/* 774EC 80086CEC 54A5828F */  lw         $v0, %gp_rel(gNumSpectralMonsters)($gp)
/* 774F0 80086CF0 00000000 */  nop
/* 774F4 80086CF4 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 774F8 80086CF8 54A582AF */  sw         $v0, %gp_rel(gNumSpectralMonsters)($gp)
/* 774FC 80086CFC 451B0208 */  j          .L80086D14
/* 77500 80086D00 00000000 */   nop
.L80086D04:
/* 77504 80086D04 58A5828F */  lw         $v0, %gp_rel(gNumMaterialMonsters)($gp)
/* 77508 80086D08 00000000 */  nop
/* 7750C 80086D0C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 77510 80086D10 58A582AF */  sw         $v0, %gp_rel(gNumMaterialMonsters)($gp)
.L80086D14:
/* 77514 80086D14 63018580 */  lb         $a1, 0x163($a0)
/* 77518 80086D18 50A5828F */  lw         $v0, %gp_rel(gNumMonsters)($gp)
/* 7751C 80086D1C 00000000 */  nop
/* 77520 80086D20 2A10A200 */  slt        $v0, $a1, $v0
/* 77524 80086D24 0E004010 */  beqz       $v0, .L80086D60
/* 77528 80086D28 80180500 */   sll       $v1, $a1, 2
/* 7752C 80086D2C 1CED8627 */  addiu      $a2, $gp, %gp_rel(monsterSenseArray)
.L80086D30:
/* 77530 80086D30 0100A424 */  addiu      $a0, $a1, 0x1
/* 77534 80086D34 80100400 */  sll        $v0, $a0, 2
/* 77538 80086D38 21104600 */  addu       $v0, $v0, $a2
/* 7753C 80086D3C 0000428C */  lw         $v0, 0x0($v0)
/* 77540 80086D40 21186600 */  addu       $v1, $v1, $a2
/* 77544 80086D44 000062AC */  sw         $v0, 0x0($v1)
/* 77548 80086D48 630145A0 */  sb         $a1, 0x163($v0)
/* 7754C 80086D4C 50A5828F */  lw         $v0, %gp_rel(gNumMonsters)($gp)
/* 77550 80086D50 21288000 */  addu       $a1, $a0, $zero
/* 77554 80086D54 2A10A200 */  slt        $v0, $a1, $v0
/* 77558 80086D58 F5FF4014 */  bnez       $v0, .L80086D30
/* 7755C 80086D5C 80180500 */   sll       $v1, $a1, 2
.L80086D60:
/* 77560 80086D60 0800E003 */  jr         $ra
/* 77564 80086D64 00000000 */   nop
.size MONSENSE_RemoveSenses, . - MONSENSE_RemoveSenses
