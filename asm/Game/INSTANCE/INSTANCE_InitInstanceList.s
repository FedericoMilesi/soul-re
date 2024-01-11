.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_InitInstanceList
/* 22DC0 800325C0 3C000224 */  addiu      $v0, $zero, 0x3C
/* 22DC4 800325C4 0400A2AC */  sw         $v0, 0x4($a1)
/* 22DC8 800325C8 01000724 */  addiu      $a3, $zero, 0x1
/* 22DCC 800325CC 08000924 */  addiu      $t1, $zero, 0x8
/* 22DD0 800325D0 40050824 */  addiu      $t0, $zero, 0x540
/* 22DD4 800325D4 9C02A624 */  addiu      $a2, $a1, 0x29C
.L800325D8:
/* 22DD8 800325D8 2118A900 */  addu       $v1, $a1, $t1
/* 22DDC 800325DC 9C022925 */  addiu      $t1, $t1, 0x29C
/* 22DE0 800325E0 2110A800 */  addu       $v0, $a1, $t0
/* 22DE4 800325E4 9C020825 */  addiu      $t0, $t0, 0x29C
/* 22DE8 800325E8 1000C2AC */  sw         $v0, 0x10($a2)
/* 22DEC 800325EC 1400C3AC */  sw         $v1, 0x14($a2)
/* 22DF0 800325F0 0100E724 */  addiu      $a3, $a3, 0x1
/* 22DF4 800325F4 3B00E228 */  slti       $v0, $a3, 0x3B
/* 22DF8 800325F8 F7FF4014 */  bnez       $v0, .L800325D8
/* 22DFC 800325FC 9C02C624 */   addiu     $a2, $a2, 0x29C
/* 22E00 80032600 21380000 */  addu       $a3, $zero, $zero
/* 22E04 80032604 A402A224 */  addiu      $v0, $a1, 0x2A4
/* 22E08 80032608 00800334 */  ori        $v1, $zero, 0x8000
/* 22E0C 8003260C 2118A300 */  addu       $v1, $a1, $v1
/* 22E10 80032610 1000A2AC */  sw         $v0, 0x10($a1)
/* 22E14 80032614 60970234 */  ori        $v0, $zero, 0x9760
/* 22E18 80032618 2110A200 */  addu       $v0, $a1, $v0
/* 22E1C 8003261C 1400A0AC */  sw         $zero, 0x14($a1)
/* 22E20 80032620 081A62AC */  sw         $v0, 0x1A08($v1)
/* 22E24 80032624 0800A224 */  addiu      $v0, $a1, 0x8
/* 22E28 80032628 041A60AC */  sw         $zero, 0x1A04($v1)
/* 22E2C 8003262C 981C62AC */  sw         $v0, 0x1C98($v1)
/* 22E30 80032630 080085AC */  sw         $a1, 0x8($a0)
/* 22E34 80032634 000080AC */  sw         $zero, 0x0($a0)
/* 22E38 80032638 040080AC */  sw         $zero, 0x4($a0)
.L8003263C:
/* 22E3C 8003263C 100080AC */  sw         $zero, 0x10($a0)
/* 22E40 80032640 0C0080AC */  sw         $zero, 0xC($a0)
/* 22E44 80032644 0100E724 */  addiu      $a3, $a3, 0x1
/* 22E48 80032648 2000E228 */  slti       $v0, $a3, 0x20
/* 22E4C 8003264C FBFF4014 */  bnez       $v0, .L8003263C
/* 22E50 80032650 08008424 */   addiu     $a0, $a0, 0x8
/* 22E54 80032654 01000224 */  addiu      $v0, $zero, 0x1
/* 22E58 80032658 0800E003 */  jr         $ra
/* 22E5C 8003265C 0000A2AC */   sw        $v0, 0x0($a1)
.size INSTANCE_InitInstanceList, . - INSTANCE_InitInstanceList
