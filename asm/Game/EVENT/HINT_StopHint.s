.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HINT_StopHint
/* 515A0 80060DA0 18CF8397 */  lhu        $v1, %gp_rel(gHintSystem)($gp)
/* 515A4 80060DA4 00000000 */  nop
/* 515A8 80060DA8 01006230 */  andi       $v0, $v1, 0x1
/* 515AC 80060DAC 13004010 */  beqz       $v0, .L80060DFC
/* 515B0 80060DB0 00000000 */   nop
/* 515B4 80060DB4 18CF828F */  lw         $v0, %gp_rel(gHintSystem)($gp)
/* 515B8 80060DB8 00000000 */  nop
/* 515BC 80060DBC 06004230 */  andi       $v0, $v0, 0x6
/* 515C0 80060DC0 0B004014 */  bnez       $v0, .L80060DF0
/* 515C4 80060DC4 04006334 */   ori       $v1, $v1, 0x4
/* 515C8 80060DC8 18CF83A7 */  sh         $v1, %gp_rel(gHintSystem)($gp)
/* 515CC 80060DCC 02006230 */  andi       $v0, $v1, 0x2
/* 515D0 80060DD0 09004010 */  beqz       $v0, .L80060DF8
/* 515D4 80060DD4 00F00234 */   ori       $v0, $zero, 0xF000
/* 515D8 80060DD8 FDFF6230 */  andi       $v0, $v1, 0xFFFD
/* 515DC 80060DDC 20CF838F */  lw         $v1, %gp_rel(gHintSystem + 0x8)($gp)
/* 515E0 80060DE0 18CF82A7 */  sh         $v0, %gp_rel(gHintSystem)($gp)
/* 515E4 80060DE4 00F00234 */  ori        $v0, $zero, 0xF000
/* 515E8 80060DE8 23104300 */  subu       $v0, $v0, $v1
/* 515EC 80060DEC 20CF82AF */  sw         $v0, %gp_rel(gHintSystem + 0x8)($gp)
.L80060DF0:
/* 515F0 80060DF0 0800E003 */  jr         $ra
/* 515F4 80060DF4 00000000 */   nop
.L80060DF8:
/* 515F8 80060DF8 20CF82AF */  sw         $v0, %gp_rel(gHintSystem + 0x8)($gp)
.L80060DFC:
/* 515FC 80060DFC 0800E003 */  jr         $ra
/* 51600 80060E00 00000000 */   nop
.size HINT_StopHint, . - HINT_StopHint
