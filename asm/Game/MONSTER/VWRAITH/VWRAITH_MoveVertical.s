.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_MoveVertical
/* 7F234 8008EA34 60008784 */  lh         $a3, 0x60($a0)
/* 7F238 8008EA38 60008394 */  lhu        $v1, 0x60($a0)
/* 7F23C 8008EA3C 2A10E500 */  slt        $v0, $a3, $a1
/* 7F240 8008EA40 06004010 */  beqz       $v0, .L8008EA5C
/* 7F244 8008EA44 21106600 */   addu      $v0, $v1, $a2
/* 7F248 8008EA48 600082A4 */  sh         $v0, 0x60($a0)
/* 7F24C 8008EA4C 00140200 */  sll        $v0, $v0, 16
/* 7F250 8008EA50 03140200 */  sra        $v0, $v0, 16
/* 7F254 8008EA54 9E3A0208 */  j          .L8008EA78
/* 7F258 8008EA58 2A10A200 */   slt       $v0, $a1, $v0
.L8008EA5C:
/* 7F25C 8008EA5C 2A10A700 */  slt        $v0, $a1, $a3
/* 7F260 8008EA60 08004010 */  beqz       $v0, .L8008EA84
/* 7F264 8008EA64 23106600 */   subu      $v0, $v1, $a2
/* 7F268 8008EA68 600082A4 */  sh         $v0, 0x60($a0)
/* 7F26C 8008EA6C 00140200 */  sll        $v0, $v0, 16
/* 7F270 8008EA70 03140200 */  sra        $v0, $v0, 16
/* 7F274 8008EA74 2A104500 */  slt        $v0, $v0, $a1
.L8008EA78:
/* 7F278 8008EA78 02004010 */  beqz       $v0, .L8008EA84
/* 7F27C 8008EA7C 00000000 */   nop
/* 7F280 8008EA80 600085A4 */  sh         $a1, 0x60($a0)
.L8008EA84:
/* 7F284 8008EA84 0800E003 */  jr         $ra
/* 7F288 8008EA88 00000000 */   nop
.size VWRAITH_MoveVertical, . - VWRAITH_MoveVertical
