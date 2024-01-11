.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSelectChannel
/* 46710 80055F10 06008390 */  lbu        $v1, 0x6($a0)
/* 46714 80055F14 00000000 */  nop
/* 46718 80055F18 10006228 */  slti       $v0, $v1, 0x10
/* 4671C 80055F1C 02004010 */  beqz       $v0, .L80055F28
/* 46720 80055F20 00000000 */   nop
/* 46724 80055F24 3D05A3A0 */  sb         $v1, 0x53D($a1)
.L80055F28:
/* 46728 80055F28 0800E003 */  jr         $ra
/* 4672C 80055F2C 00000000 */   nop
.size metaCmdSelectChannel, . - metaCmdSelectChannel
