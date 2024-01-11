.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel putVoiceCommand
/* A7544 800B6D44 A6008290 */  lbu        $v0, 0xA6($a0)
/* A7548 800B6D48 00000000 */  nop
/* A754C 800B6D4C 80100200 */  sll        $v0, $v0, 2
/* A7550 800B6D50 21108200 */  addu       $v0, $a0, $v0
/* A7554 800B6D54 600045A0 */  sb         $a1, 0x60($v0)
/* A7558 800B6D58 A6008290 */  lbu        $v0, 0xA6($a0)
/* A755C 800B6D5C 00000000 */  nop
/* A7560 800B6D60 80100200 */  sll        $v0, $v0, 2
/* A7564 800B6D64 21108200 */  addu       $v0, $a0, $v0
/* A7568 800B6D68 610046A0 */  sb         $a2, 0x61($v0)
/* A756C 800B6D6C A6008290 */  lbu        $v0, 0xA6($a0)
/* A7570 800B6D70 00000000 */  nop
/* A7574 800B6D74 80100200 */  sll        $v0, $v0, 2
/* A7578 800B6D78 21108200 */  addu       $v0, $a0, $v0
/* A757C 800B6D7C 620047A4 */  sh         $a3, 0x62($v0)
/* A7580 800B6D80 A8008390 */  lbu        $v1, 0xA8($a0)
/* A7584 800B6D84 00000000 */  nop
/* A7588 800B6D88 0F00622C */  sltiu      $v0, $v1, 0xF
/* A758C 800B6D8C 0A004010 */  beqz       $v0, .L800B6DB8
/* A7590 800B6D90 01006324 */   addiu     $v1, $v1, 0x1
/* A7594 800B6D94 A6008290 */  lbu        $v0, 0xA6($a0)
/* A7598 800B6D98 A80083A0 */  sb         $v1, 0xA8($a0)
/* A759C 800B6D9C 10000324 */  addiu      $v1, $zero, 0x10
/* A75A0 800B6DA0 01004224 */  addiu      $v0, $v0, 0x1
/* A75A4 800B6DA4 A60082A0 */  sb         $v0, 0xA6($a0)
/* A75A8 800B6DA8 FF004230 */  andi       $v0, $v0, 0xFF
/* A75AC 800B6DAC 02004314 */  bne        $v0, $v1, .L800B6DB8
/* A75B0 800B6DB0 00000000 */   nop
/* A75B4 800B6DB4 A60080A0 */  sb         $zero, 0xA6($a0)
.L800B6DB8:
/* A75B8 800B6DB8 0800E003 */  jr         $ra
/* A75BC 800B6DBC 00000000 */   nop
.size putVoiceCommand, . - putVoiceCommand
