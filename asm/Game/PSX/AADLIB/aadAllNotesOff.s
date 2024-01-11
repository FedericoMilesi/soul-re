.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadAllNotesOff
/* 452B8 80054AB8 21280000 */  addu       $a1, $zero, $zero
/* 452BC 80054ABC 2138A000 */  addu       $a3, $a1, $zero
/* 452C0 80054AC0 FF000924 */  addiu      $t1, $zero, 0xFF
/* 452C4 80054AC4 DC010624 */  addiu      $a2, $zero, 0x1DC
/* 452C8 80054AC8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 452CC 80054ACC 80200400 */  sll        $a0, $a0, 2
/* 452D0 80054AD0 21104400 */  addu       $v0, $v0, $a0
/* 452D4 80054AD4 3400488C */  lw         $t0, 0x34($v0)
.L80054AD8:
/* 452D8 80054AD8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 452DC 80054ADC 00000000 */  nop
/* 452E0 80054AE0 21204600 */  addu       $a0, $v0, $a2
/* 452E4 80054AE4 08008290 */  lbu        $v0, 0x8($a0)
/* 452E8 80054AE8 51050391 */  lbu        $v1, 0x551($t0)
/* 452EC 80054AEC F0004230 */  andi       $v0, $v0, 0xF0
/* 452F0 80054AF0 07004314 */  bne        $v0, $v1, .L80054B10
/* 452F4 80054AF4 00000000 */   nop
/* 452F8 80054AF8 0000838C */  lw         $v1, 0x0($a0)
/* 452FC 80054AFC 12008294 */  lhu        $v0, 0x12($a0)
/* 45300 80054B00 080089A0 */  sb         $t1, 0x8($a0)
/* 45304 80054B04 2528A300 */  or         $a1, $a1, $v1
/* 45308 80054B08 02004234 */  ori        $v0, $v0, 0x2
/* 4530C 80054B0C 120082A4 */  sh         $v0, 0x12($a0)
.L80054B10:
/* 45310 80054B10 0100E724 */  addiu      $a3, $a3, 0x1
/* 45314 80054B14 1800E228 */  slti       $v0, $a3, 0x18
/* 45318 80054B18 EFFF4014 */  bnez       $v0, .L80054AD8
/* 4531C 80054B1C 1C00C624 */   addiu     $a2, $a2, 0x1C
/* 45320 80054B20 0B00A010 */  beqz       $a1, .L80054B50
/* 45324 80054B24 27180500 */   nor       $v1, $zero, $a1
/* 45328 80054B28 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 4532C 80054B2C 00000000 */  nop
/* 45330 80054B30 C404828C */  lw         $v0, 0x4C4($a0)
/* 45334 80054B34 00000000 */  nop
/* 45338 80054B38 25104500 */  or         $v0, $v0, $a1
/* 4533C 80054B3C C40482AC */  sw         $v0, 0x4C4($a0)
/* 45340 80054B40 C804828C */  lw         $v0, 0x4C8($a0)
/* 45344 80054B44 00000000 */  nop
/* 45348 80054B48 24104300 */  and        $v0, $v0, $v1
/* 4534C 80054B4C C80482AC */  sw         $v0, 0x4C8($a0)
.L80054B50:
/* 45350 80054B50 0800E003 */  jr         $ra
/* 45354 80054B54 00000000 */   nop
.size aadAllNotesOff, . - aadAllNotesOff
