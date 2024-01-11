.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdStopTone
/* 47D54 80057554 21180000 */  addu       $v1, $zero, $zero
/* 47D58 80057558 0400888C */  lw         $t0, 0x4($a0)
/* 47D5C 8005755C 21386000 */  addu       $a3, $v1, $zero
/* 47D60 80057560 D0000B24 */  addiu      $t3, $zero, 0xD0
/* 47D64 80057564 02000A24 */  addiu      $t2, $zero, 0x2
/* 47D68 80057568 FF000924 */  addiu      $t1, $zero, 0xFF
/* 47D6C 8005756C FFFFE530 */  andi       $a1, $a3, 0xFFFF
.L80057570:
/* 47D70 80057570 C0100500 */  sll        $v0, $a1, 3
/* 47D74 80057574 23104500 */  subu       $v0, $v0, $a1
/* 47D78 80057578 80100200 */  sll        $v0, $v0, 2
/* 47D7C 8005757C D89B868F */  lw         $a2, %gp_rel(aadMem)($gp)
/* 47D80 80057580 DC014224 */  addiu      $v0, $v0, 0x1DC
/* 47D84 80057584 2120C200 */  addu       $a0, $a2, $v0
/* 47D88 80057588 08008290 */  lbu        $v0, 0x8($a0)
/* 47D8C 8005758C 00000000 */  nop
/* 47D90 80057590 0E004B14 */  bne        $v0, $t3, .L800575CC
/* 47D94 80057594 00000000 */   nop
/* 47D98 80057598 0400828C */  lw         $v0, 0x4($a0)
/* 47D9C 8005759C 00000000 */  nop
/* 47DA0 800575A0 0A004814 */  bne        $v0, $t0, .L800575CC
/* 47DA4 800575A4 2110C500 */   addu      $v0, $a2, $a1
/* 47DA8 800575A8 7C044290 */  lbu        $v0, 0x47C($v0)
/* 47DAC 800575AC 00000000 */  nop
/* 47DB0 800575B0 06004010 */  beqz       $v0, .L800575CC
/* 47DB4 800575B4 00000000 */   nop
/* 47DB8 800575B8 04004A10 */  beq        $v0, $t2, .L800575CC
/* 47DBC 800575BC 00000000 */   nop
/* 47DC0 800575C0 0000828C */  lw         $v0, 0x0($a0)
/* 47DC4 800575C4 080089A0 */  sb         $t1, 0x8($a0)
/* 47DC8 800575C8 25186200 */  or         $v1, $v1, $v0
.L800575CC:
/* 47DCC 800575CC 0100E724 */  addiu      $a3, $a3, 0x1
/* 47DD0 800575D0 FFFFE230 */  andi       $v0, $a3, 0xFFFF
/* 47DD4 800575D4 1800422C */  sltiu      $v0, $v0, 0x18
/* 47DD8 800575D8 E5FF4014 */  bnez       $v0, .L80057570
/* 47DDC 800575DC FFFFE530 */   andi      $a1, $a3, 0xFFFF
/* 47DE0 800575E0 D89B848F */  lw         $a0, %gp_rel(aadMem)($gp)
/* 47DE4 800575E4 00000000 */  nop
/* 47DE8 800575E8 C404828C */  lw         $v0, 0x4C4($a0)
/* 47DEC 800575EC 00000000 */  nop
/* 47DF0 800575F0 25104300 */  or         $v0, $v0, $v1
/* 47DF4 800575F4 C40482AC */  sw         $v0, 0x4C4($a0)
/* 47DF8 800575F8 C804828C */  lw         $v0, 0x4C8($a0)
/* 47DFC 800575FC 27180300 */  nor        $v1, $zero, $v1
/* 47E00 80057600 24104300 */  and        $v0, $v0, $v1
/* 47E04 80057604 0800E003 */  jr         $ra
/* 47E08 80057608 C80482AC */   sw        $v0, 0x4C8($a0)
.size sfxCmdStopTone, . - sfxCmdStopTone
