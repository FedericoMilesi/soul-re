.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateSavedCameras
/* 4C4C8 8005BCC8 21788000 */  addu       $t7, $a0, $zero
/* 4C4CC 8005BCCC 21C0A000 */  addu       $t8, $a1, $zero
/* 4C4D0 8005BCD0 2150C000 */  addu       $t2, $a2, $zero
/* 4C4D4 8005BCD4 7802E285 */  lh         $v0, 0x278($t7)
/* 4C4D8 8005BCD8 00000000 */  nop
/* 4C4DC 8005BCDC 46004004 */  bltz       $v0, .L8005BDF8
/* 4C4E0 8005BCE0 21700000 */   addu      $t6, $zero, $zero
/* 4C4E4 8005BCE4 A0020D24 */  addiu      $t5, $zero, 0x2A0
/* 4C4E8 8005BCE8 2160E001 */  addu       $t4, $t7, $zero
/* 4C4EC 8005BCEC 2158E001 */  addu       $t3, $t7, $zero
.L8005BCF0:
/* 4C4F0 8005BCF0 7C02638D */  lw         $v1, 0x27C($t3)
/* 4C4F4 8005BCF4 05000224 */  addiu      $v0, $zero, 0x5
/* 4C4F8 8005BCF8 38006214 */  bne        $v1, $v0, .L8005BDDC
/* 4C4FC 8005BCFC 00000000 */   nop
/* 4C500 8005BD00 0C03828D */  lw         $v0, 0x30C($t4)
/* 4C504 8005BD04 00000000 */  nop
/* 4C508 8005BD08 34005814 */  bne        $v0, $t8, .L8005BDDC
/* 4C50C 8005BD0C 2120ED01 */   addu      $a0, $t7, $t5
/* 4C510 8005BD10 06008724 */  addiu      $a3, $a0, 0x6
/* 4C514 8005BD14 00008294 */  lhu        $v0, 0x0($a0)
/* 4C518 8005BD18 00004395 */  lhu        $v1, 0x0($t2)
/* 4C51C 8005BD1C 02004595 */  lhu        $a1, 0x2($t2)
/* 4C520 8005BD20 04004695 */  lhu        $a2, 0x4($t2)
/* 4C524 8005BD24 21104300 */  addu       $v0, $v0, $v1
/* 4C528 8005BD28 000082A4 */  sh         $v0, 0x0($a0)
/* 4C52C 8005BD2C 02008294 */  lhu        $v0, 0x2($a0)
/* 4C530 8005BD30 04008394 */  lhu        $v1, 0x4($a0)
/* 4C534 8005BD34 21104500 */  addu       $v0, $v0, $a1
/* 4C538 8005BD38 020082A4 */  sh         $v0, 0x2($a0)
/* 4C53C 8005BD3C 06008294 */  lhu        $v0, 0x6($a0)
/* 4C540 8005BD40 21186600 */  addu       $v1, $v1, $a2
/* 4C544 8005BD44 040083A4 */  sh         $v1, 0x4($a0)
/* 4C548 8005BD48 0200E394 */  lhu        $v1, 0x2($a3)
/* 4C54C 8005BD4C 0400E594 */  lhu        $a1, 0x4($a3)
/* 4C550 8005BD50 00004695 */  lhu        $a2, 0x0($t2)
/* 4C554 8005BD54 02004895 */  lhu        $t0, 0x2($t2)
/* 4C558 8005BD58 04004995 */  lhu        $t1, 0x4($t2)
/* 4C55C 8005BD5C 21104600 */  addu       $v0, $v0, $a2
/* 4C560 8005BD60 21186800 */  addu       $v1, $v1, $t0
/* 4C564 8005BD64 2128A900 */  addu       $a1, $a1, $t1
/* 4C568 8005BD68 060082A4 */  sh         $v0, 0x6($a0)
/* 4C56C 8005BD6C 0200E3A4 */  sh         $v1, 0x2($a3)
/* 4C570 8005BD70 0400E5A4 */  sh         $a1, 0x4($a3)
/* 4C574 8005BD74 12008724 */  addiu      $a3, $a0, 0x12
/* 4C578 8005BD78 12008294 */  lhu        $v0, 0x12($a0)
/* 4C57C 8005BD7C 0200E394 */  lhu        $v1, 0x2($a3)
/* 4C580 8005BD80 0400E594 */  lhu        $a1, 0x4($a3)
/* 4C584 8005BD84 00004695 */  lhu        $a2, 0x0($t2)
/* 4C588 8005BD88 02004895 */  lhu        $t0, 0x2($t2)
/* 4C58C 8005BD8C 04004995 */  lhu        $t1, 0x4($t2)
/* 4C590 8005BD90 21104600 */  addu       $v0, $v0, $a2
/* 4C594 8005BD94 21186800 */  addu       $v1, $v1, $t0
/* 4C598 8005BD98 2128A900 */  addu       $a1, $a1, $t1
/* 4C59C 8005BD9C 120082A4 */  sh         $v0, 0x12($a0)
/* 4C5A0 8005BDA0 0200E3A4 */  sh         $v1, 0x2($a3)
/* 4C5A4 8005BDA4 0400E5A4 */  sh         $a1, 0x4($a3)
/* 4C5A8 8005BDA8 18008724 */  addiu      $a3, $a0, 0x18
/* 4C5AC 8005BDAC 18008294 */  lhu        $v0, 0x18($a0)
/* 4C5B0 8005BDB0 0200E394 */  lhu        $v1, 0x2($a3)
/* 4C5B4 8005BDB4 0400E594 */  lhu        $a1, 0x4($a3)
/* 4C5B8 8005BDB8 00004695 */  lhu        $a2, 0x0($t2)
/* 4C5BC 8005BDBC 02004895 */  lhu        $t0, 0x2($t2)
/* 4C5C0 8005BDC0 04004995 */  lhu        $t1, 0x4($t2)
/* 4C5C4 8005BDC4 21104600 */  addu       $v0, $v0, $a2
/* 4C5C8 8005BDC8 21186800 */  addu       $v1, $v1, $t0
/* 4C5CC 8005BDCC 2128A900 */  addu       $a1, $a1, $t1
/* 4C5D0 8005BDD0 180082A4 */  sh         $v0, 0x18($a0)
/* 4C5D4 8005BDD4 0200E3A4 */  sh         $v1, 0x2($a3)
/* 4C5D8 8005BDD8 0400E5A4 */  sh         $a1, 0x4($a3)
.L8005BDDC:
/* 4C5DC 8005BDDC 7000AD25 */  addiu      $t5, $t5, 0x70
/* 4C5E0 8005BDE0 70008C25 */  addiu      $t4, $t4, 0x70
/* 4C5E4 8005BDE4 7802E285 */  lh         $v0, 0x278($t7)
/* 4C5E8 8005BDE8 0100CE25 */  addiu      $t6, $t6, 0x1
/* 4C5EC 8005BDEC 2A104E00 */  slt        $v0, $v0, $t6
/* 4C5F0 8005BDF0 BFFF4010 */  beqz       $v0, .L8005BCF0
/* 4C5F4 8005BDF4 04006B25 */   addiu     $t3, $t3, 0x4
.L8005BDF8:
/* 4C5F8 8005BDF8 0800E003 */  jr         $ra
/* 4C5FC 8005BDFC 00000000 */   nop
.size RelocateSavedCameras, . - RelocateSavedCameras
