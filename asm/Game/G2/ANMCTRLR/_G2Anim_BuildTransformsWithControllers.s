.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_BuildTransformsWithControllers
/* 8147C 80090C7C B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 81480 80090C80 4000B6AF */  sw         $s6, 0x40($sp)
/* 81484 80090C84 21B08000 */  addu       $s6, $a0, $zero
/* 81488 80090C88 3400B3AF */  sw         $s3, 0x34($sp)
/* 8148C 80090C8C 01001324 */  addiu      $s3, $zero, 0x1
/* 81490 80090C90 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 81494 80090C94 21880000 */  addu       $s1, $zero, $zero
/* 81498 80090C98 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 8149C 80090C9C 4800BEAF */  sw         $fp, 0x48($sp)
/* 814A0 80090CA0 4400B7AF */  sw         $s7, 0x44($sp)
/* 814A4 80090CA4 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 814A8 80090CA8 3800B4AF */  sw         $s4, 0x38($sp)
/* 814AC 80090CAC 3000B2AF */  sw         $s2, 0x30($sp)
/* 814B0 80090CB0 2800B0AF */  sw         $s0, 0x28($sp)
/* 814B4 80090CB4 1400D58E */  lw         $s5, 0x14($s6)
/* 814B8 80090CB8 1000C28E */  lw         $v0, 0x10($s6)
/* 814BC 80090CBC 2400C392 */  lbu        $v1, 0x24($s6)
/* 814C0 80090CC0 0200C496 */  lhu        $a0, 0x2($s6)
/* 814C4 80090CC4 1C00458C */  lw         $a1, 0x1C($v0)
/* 814C8 80090CC8 1800C28E */  lw         $v0, 0x18($s6)
/* 814CC 80090CCC 88006330 */  andi       $v1, $v1, 0x88
/* 814D0 80090CD0 1800A2AF */  sw         $v0, 0x18($sp)
/* 814D4 80090CD4 1C00C28E */  lw         $v0, 0x1C($s6)
/* 814D8 80090CD8 80006338 */  xori       $v1, $v1, 0x80
/* 814DC 80090CDC 1C00A2AF */  sw         $v0, 0x1C($sp)
/* 814E0 80090CE0 2000C28E */  lw         $v0, 0x20($s6)
/* 814E4 80090CE4 2B387300 */  sltu       $a3, $v1, $s3
/* 814E8 80090CE8 2000A2AF */  sw         $v0, 0x20($sp)
/* 814EC 80090CEC C0100400 */  sll        $v0, $a0, 3
/* 814F0 80090CF0 21104400 */  addu       $v0, $v0, $a0
/* 814F4 80090CF4 80100200 */  sll        $v0, $v0, 2
/* 814F8 80090CF8 1000C38E */  lw         $v1, 0x10($s6)
/* 814FC 80090CFC 84F5848F */  lw         $a0, %gp_rel(_controllerPool + 0xC)($gp)
/* 81500 80090D00 1800778C */  lw         $s7, 0x18($v1)
/* 81504 80090D04 00000000 */  nop
/* 81508 80090D08 4600E01A */  blez       $s7, .L80090E24
/* 8150C 80090D0C 21808200 */   addu      $s0, $a0, $v0
/* 81510 80090D10 1800B227 */  addiu      $s2, $sp, 0x18
/* 81514 80090D14 21F04002 */  addu       $fp, $s2, $zero
/* 81518 80090D18 1200B424 */  addiu      $s4, $a1, 0x12
.L80090D1C:
/* 8151C 80090D1C 00008496 */  lhu        $a0, 0x0($s4)
/* 81520 80090D20 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 81524 80090D24 002C0400 */  sll        $a1, $a0, 16
/* 81528 80090D28 031C0500 */  sra        $v1, $a1, 16
/* 8152C 80090D2C 0E006210 */  beq        $v1, $v0, .L80090D68
/* 81530 80090D30 1F008430 */   andi      $a0, $a0, 0x1F
/* 81534 80090D34 01000324 */  addiu      $v1, $zero, 0x1
/* 81538 80090D38 43150500 */  sra        $v0, $a1, 21
/* 8153C 80090D3C 80100200 */  sll        $v0, $v0, 2
/* 81540 80090D40 2110C203 */  addu       $v0, $fp, $v0
/* 81544 80090D44 0000428C */  lw         $v0, 0x0($v0)
/* 81548 80090D48 04188300 */  sllv       $v1, $v1, $a0
/* 8154C 80090D4C 24104300 */  and        $v0, $v0, $v1
/* 81550 80090D50 05004010 */  beqz       $v0, .L80090D68
/* 81554 80090D54 00000000 */   nop
/* 81558 80090D58 0000428E */  lw         $v0, 0x0($s2)
/* 8155C 80090D5C 00000000 */  nop
/* 81560 80090D60 25105300 */  or         $v0, $v0, $s3
/* 81564 80090D64 000042AE */  sw         $v0, 0x0($s2)
.L80090D68:
/* 81568 80090D68 0000428E */  lw         $v0, 0x0($s2)
/* 8156C 80090D6C 00000000 */  nop
/* 81570 80090D70 24105300 */  and        $v0, $v0, $s3
/* 81574 80090D74 20004014 */  bnez       $v0, .L80090DF8
/* 81578 80090D78 00000000 */   nop
/* 8157C 80090D7C 00008286 */  lh         $v0, 0x0($s4)
/* 81580 80090D80 1400C38E */  lw         $v1, 0x14($s6)
/* 81584 80090D84 03000492 */  lbu        $a0, 0x3($s0)
/* 81588 80090D88 40110200 */  sll        $v0, $v0, 5
/* 8158C 80090D8C 16009114 */  bne        $a0, $s1, .L80090DE8
/* 81590 80090D90 21286200 */   addu      $a1, $v1, $v0
/* 81594 80090D94 2120A002 */  addu       $a0, $s5, $zero
/* 81598 80090D98 21300002 */  addu       $a2, $s0, $zero
/* 8159C 80090D9C 9743020C */  jal        _G2Anim_BuildSegTransformWithControllers
/* 815A0 80090DA0 1000B1AF */   sw        $s1, 0x10($sp)
/* 815A4 80090DA4 03000292 */  lbu        $v0, 0x3($s0)
/* 815A8 80090DA8 00000000 */  nop
/* 815AC 80090DAC 13005114 */  bne        $v0, $s1, .L80090DFC
/* 815B0 80090DB0 21380000 */   addu      $a3, $zero, $zero
/* 815B4 80090DB4 84F5848F */  lw         $a0, %gp_rel(_controllerPool + 0xC)($gp)
.L80090DB8:
/* 815B8 80090DB8 00000296 */  lhu        $v0, 0x0($s0)
/* 815BC 80090DBC 00000000 */  nop
/* 815C0 80090DC0 C0180200 */  sll        $v1, $v0, 3
/* 815C4 80090DC4 21186200 */  addu       $v1, $v1, $v0
/* 815C8 80090DC8 80180300 */  sll        $v1, $v1, 2
/* 815CC 80090DCC 21808300 */  addu       $s0, $a0, $v1
/* 815D0 80090DD0 03000292 */  lbu        $v0, 0x3($s0)
/* 815D4 80090DD4 00000000 */  nop
/* 815D8 80090DD8 F7FF5110 */  beq        $v0, $s1, .L80090DB8
/* 815DC 80090DDC 21380000 */   addu      $a3, $zero, $zero
/* 815E0 80090DE0 80430208 */  j          .L80090E00
/* 815E4 80090DE4 18009426 */   addiu     $s4, $s4, 0x18
.L80090DE8:
/* 815E8 80090DE8 2120A002 */  addu       $a0, $s5, $zero
/* 815EC 80090DEC 2130E000 */  addu       $a2, $a3, $zero
/* 815F0 80090DF0 5050020C */  jal        _G2Anim_BuildSegTransformNoControllers
/* 815F4 80090DF4 21382002 */   addu      $a3, $s1, $zero
.L80090DF8:
/* 815F8 80090DF8 21380000 */  addu       $a3, $zero, $zero
.L80090DFC:
/* 815FC 80090DFC 18009426 */  addiu      $s4, $s4, 0x18
.L80090E00:
/* 81600 80090E00 2000B526 */  addiu      $s5, $s5, 0x20
/* 81604 80090E04 40981300 */  sll        $s3, $s3, 1
/* 81608 80090E08 03006016 */  bnez       $s3, .L80090E18
/* 8160C 80090E0C 01003126 */   addiu     $s1, $s1, 0x1
/* 81610 80090E10 04005226 */  addiu      $s2, $s2, 0x4
/* 81614 80090E14 01001324 */  addiu      $s3, $zero, 0x1
.L80090E18:
/* 81618 80090E18 2A103702 */  slt        $v0, $s1, $s7
/* 8161C 80090E1C BFFF4014 */  bnez       $v0, .L80090D1C
/* 81620 80090E20 00000000 */   nop
.L80090E24:
/* 81624 80090E24 4445020C */  jal        _G2Anim_UpdateControllers
/* 81628 80090E28 2120C002 */   addu      $a0, $s6, $zero
/* 8162C 80090E2C 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 81630 80090E30 4800BE8F */  lw         $fp, 0x48($sp)
/* 81634 80090E34 4400B78F */  lw         $s7, 0x44($sp)
/* 81638 80090E38 4000B68F */  lw         $s6, 0x40($sp)
/* 8163C 80090E3C 3C00B58F */  lw         $s5, 0x3C($sp)
/* 81640 80090E40 3800B48F */  lw         $s4, 0x38($sp)
/* 81644 80090E44 3400B38F */  lw         $s3, 0x34($sp)
/* 81648 80090E48 3000B28F */  lw         $s2, 0x30($sp)
/* 8164C 80090E4C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 81650 80090E50 2800B08F */  lw         $s0, 0x28($sp)
/* 81654 80090E54 0800E003 */  jr         $ra
/* 81658 80090E58 5000BD27 */   addiu     $sp, $sp, 0x50
.size _G2Anim_BuildTransformsWithControllers, . - _G2Anim_BuildTransformsWithControllers
