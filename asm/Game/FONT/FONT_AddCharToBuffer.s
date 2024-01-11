.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_AddCharToBuffer
/* 1DEA0 8002D6A0 21388000 */  addu       $a3, $a0, $zero
/* 1DEA4 8002D6A4 F4B9828F */  lw         $v0, %gp_rel(fontTracker + 0x608)($gp)
/* 1DEA8 8002D6A8 ECB38427 */  addiu      $a0, $gp, %gp_rel(fontTracker)
/* 1DEAC 8002D6AC 40180200 */  sll        $v1, $v0, 1
/* 1DEB0 8002D6B0 21186200 */  addu       $v1, $v1, $v0
/* 1DEB4 8002D6B4 40180300 */  sll        $v1, $v1, 1
/* 1DEB8 8002D6B8 FF004228 */  slti       $v0, $v0, 0xFF
/* 1DEBC 8002D6BC 11004010 */  beqz       $v0, .L8002D704
/* 1DEC0 8002D6C0 21206400 */   addu      $a0, $v1, $a0
/* 1DEC4 8002D6C4 FF00E330 */  andi       $v1, $a3, 0xFF
/* 1DEC8 8002D6C8 40000224 */  addiu      $v0, $zero, 0x40
/* 1DECC 8002D6CC 05006214 */  bne        $v1, $v0, .L8002D6E4
/* 1DED0 8002D6D0 FF00A230 */   andi      $v0, $a1, 0xFF
/* 1DED4 8002D6D4 000082A4 */  sh         $v0, 0x0($a0)
/* 1DED8 8002D6D8 FF00C230 */  andi       $v0, $a2, 0xFF
/* 1DEDC 8002D6DC BBB50008 */  j          .L8002D6EC
/* 1DEE0 8002D6E0 020082A4 */   sh        $v0, 0x2($a0)
.L8002D6E4:
/* 1DEE4 8002D6E4 000085A4 */  sh         $a1, 0x0($a0)
/* 1DEE8 8002D6E8 020086A4 */  sh         $a2, 0x2($a0)
.L8002D6EC:
/* 1DEEC 8002D6EC 040087A0 */  sb         $a3, 0x4($a0)
/* 1DEF0 8002D6F0 F4B9828F */  lw         $v0, %gp_rel(fontTracker + 0x608)($gp)
/* 1DEF4 8002D6F4 08BA8393 */  lbu        $v1, %gp_rel(fontTracker + 0x61C)($gp)
/* 1DEF8 8002D6F8 01004224 */  addiu      $v0, $v0, 0x1
/* 1DEFC 8002D6FC F4B982AF */  sw         $v0, %gp_rel(fontTracker + 0x608)($gp)
/* 1DF00 8002D700 050083A0 */  sb         $v1, 0x5($a0)
.L8002D704:
/* 1DF04 8002D704 0800E003 */  jr         $ra
/* 1DF08 8002D708 00000000 */   nop
.size FONT_AddCharToBuffer, . - FONT_AddCharToBuffer
