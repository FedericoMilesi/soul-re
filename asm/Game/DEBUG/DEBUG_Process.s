.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_Process
/* 3C44 80013444 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3C48 80013448 1000B0AF */  sw         $s0, 0x10($sp)
/* 3C4C 8001344C 21808000 */  addu       $s0, $a0, $zero
/* 3C50 80013450 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3C54 80013454 2000BFAF */  sw         $ra, 0x20($sp)
/* 3C58 80013458 1800B2AF */  sw         $s2, 0x18($sp)
/* 3C5C 8001345C 1400B1AF */  sw         $s1, 0x14($sp)
/* 3C60 80013460 C000128E */  lw         $s2, 0xC0($s0)
/* 3C64 80013464 72010386 */  lh         $v1, 0x172($s0)
/* 3C68 80013468 C400118E */  lw         $s1, 0xC4($s0)
/* 3C6C 8001346C 0E006014 */  bnez       $v1, .L800134A8
/* 3C70 80013470 48001326 */   addiu     $s3, $s0, 0x48
/* 3C74 80013474 08004232 */  andi       $v0, $s2, 0x8
/* 3C78 80013478 03004010 */  beqz       $v0, .L80013488
/* 3C7C 8001347C 00000000 */   nop
/* 3C80 80013480 4052000C */  jal        DEBUG_ProcessSecondController
/* 3C84 80013484 00000000 */   nop
.L80013488:
/* 3C88 80013488 C7010392 */  lbu        $v1, 0x1C7($s0)
/* 3C8C 8001348C 01000224 */  addiu      $v0, $zero, 0x1
/* 3C90 80013490 44006214 */  bne        $v1, $v0, .L800135A4
/* 3C94 80013494 00000000 */   nop
/* 3C98 80013498 4252000C */  jal        DEBUG_ProcessCheat
/* 3C9C 8001349C 21200002 */   addu      $a0, $s0, $zero
/* 3CA0 800134A0 694D0008 */  j          .L800135A4
/* 3CA4 800134A4 00000000 */   nop
.L800134A8:
/* 3CA8 800134A8 04000224 */  addiu      $v0, $zero, 0x4
/* 3CAC 800134AC 30006214 */  bne        $v1, $v0, .L80013570
/* 3CB0 800134B0 06000224 */   addiu     $v0, $zero, 0x6
/* 3CB4 800134B4 3950000C */  jal        DEBUG_Menu
/* 3CB8 800134B8 21200002 */   addu      $a0, $s0, $zero
/* 3CBC 800134BC C400028E */  lw         $v0, 0xC4($s0)
/* 3CC0 800134C0 0400033C */  lui        $v1, (0x40000 >> 16)
/* 3CC4 800134C4 24104300 */  and        $v0, $v0, $v1
/* 3CC8 800134C8 0C004010 */  beqz       $v0, .L800134FC
/* 3CCC 800134CC 24102302 */   and       $v0, $s1, $v1
/* 3CD0 800134D0 05004014 */  bnez       $v0, .L800134E8
/* 3CD4 800134D4 00000000 */   nop
/* 3CD8 800134D8 C000028E */  lw         $v0, 0xC0($s0)
/* 3CDC 800134DC 00000000 */  nop
/* 3CE0 800134E0 08004234 */  ori        $v0, $v0, 0x8
/* 3CE4 800134E4 C00002AE */  sw         $v0, 0xC0($s0)
.L800134E8:
/* 3CE8 800134E8 C400028E */  lw         $v0, 0xC4($s0)
/* 3CEC 800134EC 00000000 */  nop
/* 3CF0 800134F0 24104300 */  and        $v0, $v0, $v1
/* 3CF4 800134F4 09004014 */  bnez       $v0, .L8001351C
/* 3CF8 800134F8 00000000 */   nop
.L800134FC:
/* 3CFC 800134FC 0400023C */  lui        $v0, (0x40000 >> 16)
/* 3D00 80013500 24102202 */  and        $v0, $s1, $v0
/* 3D04 80013504 05004010 */  beqz       $v0, .L8001351C
/* 3D08 80013508 F7FF0324 */   addiu     $v1, $zero, -0x9
/* 3D0C 8001350C C000028E */  lw         $v0, 0xC0($s0)
/* 3D10 80013510 00000000 */  nop
/* 3D14 80013514 24104300 */  and        $v0, $v0, $v1
/* 3D18 80013518 C00002AE */  sw         $v0, 0xC0($s0)
.L8001351C:
/* 3D1C 8001351C C000028E */  lw         $v0, 0xC0($s0)
/* 3D20 80013520 00000000 */  nop
/* 3D24 80013524 08004230 */  andi       $v0, $v0, 0x8
/* 3D28 80013528 1E004010 */  beqz       $v0, .L800135A4
/* 3D2C 8001352C 08004232 */   andi      $v0, $s2, 0x8
/* 3D30 80013530 1C004014 */  bnez       $v0, .L800135A4
/* 3D34 80013534 00000000 */   nop
/* 3D38 80013538 90AC8297 */  lhu        $v0, %gp_rel(theCamera)($gp)
/* 3D3C 8001353C 92AC8397 */  lhu        $v1, %gp_rel(theCamera + 0x2)($gp)
/* 3D40 80013540 94AC8497 */  lhu        $a0, %gp_rel(theCamera + 0x4)($gp)
/* 3D44 80013544 40AD8597 */  lhu        $a1, %gp_rel(theCamera + 0xB0)($gp)
/* 3D48 80013548 42AD8697 */  lhu        $a2, %gp_rel(theCamera + 0xB2)($gp)
/* 3D4C 8001354C 44AD8797 */  lhu        $a3, %gp_rel(theCamera + 0xB4)($gp)
/* 3D50 80013550 54AD82A7 */  sh         $v0, %gp_rel(theCamera + 0xC4)($gp)
/* 3D54 80013554 56AD83A7 */  sh         $v1, %gp_rel(theCamera + 0xC6)($gp)
/* 3D58 80013558 58AD84A7 */  sh         $a0, %gp_rel(theCamera + 0xC8)($gp)
/* 3D5C 8001355C 5CAD85A7 */  sh         $a1, %gp_rel(theCamera + 0xCC)($gp)
/* 3D60 80013560 5EAD86A7 */  sh         $a2, %gp_rel(theCamera + 0xCE)($gp)
/* 3D64 80013564 60AD87A7 */  sh         $a3, %gp_rel(theCamera + 0xD0)($gp)
/* 3D68 80013568 694D0008 */  j          .L800135A4
/* 3D6C 8001356C 00000000 */   nop
.L80013570:
/* 3D70 80013570 08006214 */  bne        $v1, $v0, .L80013594
/* 3D74 80013574 07000224 */   addiu     $v0, $zero, 0x7
/* 3D78 80013578 21200002 */  addu       $a0, $s0, $zero
/* 3D7C 8001357C 5F4C000C */  jal        process_cheat_codes
/* 3D80 80013580 21286002 */   addu      $a1, $s3, $zero
/* 3D84 80013584 3950000C */  jal        DEBUG_Menu
/* 3D88 80013588 21200002 */   addu      $a0, $s0, $zero
/* 3D8C 8001358C 694D0008 */  j          .L800135A4
/* 3D90 80013590 00000000 */   nop
.L80013594:
/* 3D94 80013594 03006214 */  bne        $v1, $v0, .L800135A4
/* 3D98 80013598 00000000 */   nop
/* 3D9C 8001359C 9F51000C */  jal        DEBUG_ViewVram
/* 3DA0 800135A0 21200002 */   addu      $a0, $s0, $zero
.L800135A4:
/* 3DA4 800135A4 C000028E */  lw         $v0, 0xC0($s0)
/* 3DA8 800135A8 00000000 */  nop
/* 3DAC 800135AC 00404230 */  andi       $v0, $v0, 0x4000
/* 3DB0 800135B0 08004010 */  beqz       $v0, .L800135D4
/* 3DB4 800135B4 00000000 */   nop
/* 3DB8 800135B8 0400628E */  lw         $v0, 0x4($s3)
/* 3DBC 800135BC 00000000 */  nop
/* 3DC0 800135C0 00044230 */  andi       $v0, $v0, 0x400
/* 3DC4 800135C4 03004010 */  beqz       $v0, .L800135D4
/* 3DC8 800135C8 00000000 */   nop
/* 3DCC 800135CC E751000C */  jal        DEBUG_CaptureScreen
/* 3DD0 800135D0 21200002 */   addu      $a0, $s0, $zero
.L800135D4:
/* 3DD4 800135D4 2000BF8F */  lw         $ra, 0x20($sp)
/* 3DD8 800135D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 3DDC 800135DC 1800B28F */  lw         $s2, 0x18($sp)
/* 3DE0 800135E0 1400B18F */  lw         $s1, 0x14($sp)
/* 3DE4 800135E4 1000B08F */  lw         $s0, 0x10($sp)
/* 3DE8 800135E8 0800E003 */  jr         $ra
/* 3DEC 800135EC 2800BD27 */   addiu     $sp, $sp, 0x28
.size DEBUG_Process, . - DEBUG_Process
