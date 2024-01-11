.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MEMPACK_RelocateG2AnimKeylistType
/* 41C5C 8005145C 0000838C */  lw         $v1, 0x0($a0)
/* 41C60 80051460 00000000 */  nop
/* 41C64 80051464 2B306600 */  sltu       $a2, $v1, $a2
/* 41C68 80051468 2200C014 */  bnez       $a2, .L800514F4
/* 41C6C 8005146C 2B106700 */   sltu      $v0, $v1, $a3
/* 41C70 80051470 20004010 */  beqz       $v0, .L800514F4
/* 41C74 80051474 00000000 */   nop
/* 41C78 80051478 02006010 */  beqz       $v1, .L80051484
/* 41C7C 8005147C 21100000 */   addu      $v0, $zero, $zero
/* 41C80 80051480 21106500 */  addu       $v0, $v1, $a1
.L80051484:
/* 41C84 80051484 AC0F033C */  lui        $v1, (0xFACE0FF >> 16)
/* 41C88 80051488 21384000 */  addu       $a3, $v0, $zero
/* 41C8C 8005148C 000082AC */  sw         $v0, 0x0($a0)
/* 41C90 80051490 0000E28C */  lw         $v0, 0x0($a3)
/* 41C94 80051494 FFE06334 */  ori        $v1, $v1, (0xFACE0FF & 0xFFFF)
/* 41C98 80051498 16004310 */  beq        $v0, $v1, .L800514F4
/* 41C9C 8005149C 00000000 */   nop
/* 41CA0 800514A0 1000E28C */  lw         $v0, 0x10($a3)
/* 41CA4 800514A4 00000000 */  nop
/* 41CA8 800514A8 02004010 */  beqz       $v0, .L800514B4
/* 41CAC 800514AC 21180000 */   addu      $v1, $zero, $zero
/* 41CB0 800514B0 21184500 */  addu       $v1, $v0, $a1
.L800514B4:
/* 41CB4 800514B4 0000E290 */  lbu        $v0, 0x0($a3)
/* 41CB8 800514B8 21300000 */  addu       $a2, $zero, $zero
/* 41CBC 800514BC 0D004010 */  beqz       $v0, .L800514F4
/* 41CC0 800514C0 1000E3AC */   sw        $v1, 0x10($a3)
/* 41CC4 800514C4 2120E000 */  addu       $a0, $a3, $zero
.L800514C8:
/* 41CC8 800514C8 1400838C */  lw         $v1, 0x14($a0)
/* 41CCC 800514CC 00000000 */  nop
/* 41CD0 800514D0 02006010 */  beqz       $v1, .L800514DC
/* 41CD4 800514D4 21100000 */   addu      $v0, $zero, $zero
/* 41CD8 800514D8 21106500 */  addu       $v0, $v1, $a1
.L800514DC:
/* 41CDC 800514DC 140082AC */  sw         $v0, 0x14($a0)
/* 41CE0 800514E0 0000E290 */  lbu        $v0, 0x0($a3)
/* 41CE4 800514E4 0100C624 */  addiu      $a2, $a2, 0x1
/* 41CE8 800514E8 2A10C200 */  slt        $v0, $a2, $v0
/* 41CEC 800514EC F6FF4014 */  bnez       $v0, .L800514C8
/* 41CF0 800514F0 04008424 */   addiu     $a0, $a0, 0x4
.L800514F4:
/* 41CF4 800514F4 0800E003 */  jr         $ra
/* 41CF8 800514F8 00000000 */   nop
.size MEMPACK_RelocateG2AnimKeylistType, . - MEMPACK_RelocateG2AnimKeylistType
