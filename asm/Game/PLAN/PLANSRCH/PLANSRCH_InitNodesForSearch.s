.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANSRCH_InitNodesForSearch
/* 8A7B4 80099FB4 ECF5858F */  lw         $a1, %gp_rel(poolManagementData)($gp)
/* 8A7B8 80099FB8 00000000 */  nop
/* 8A7BC 80099FBC 0100A290 */  lbu        $v0, 0x1($a1)
/* 8A7C0 80099FC0 00000000 */  nop
/* 8A7C4 80099FC4 0C004010 */  beqz       $v0, .L80099FF8
/* 8A7C8 80099FC8 21180000 */   addu      $v1, $zero, $zero
.L80099FCC:
/* 8A7CC 80099FCC 06008294 */  lhu        $v0, 0x6($a0)
/* 8A7D0 80099FD0 01006324 */  addiu      $v1, $v1, 0x1
/* 8A7D4 80099FD4 100080A4 */  sh         $zero, 0x10($a0)
/* 8A7D8 80099FD8 120080A4 */  sh         $zero, 0x12($a0)
/* 8A7DC 80099FDC FCFF4230 */  andi       $v0, $v0, 0xFFFC
/* 8A7E0 80099FE0 060082A4 */  sh         $v0, 0x6($a0)
/* 8A7E4 80099FE4 0100A290 */  lbu        $v0, 0x1($a1)
/* 8A7E8 80099FE8 00000000 */  nop
/* 8A7EC 80099FEC 2A106200 */  slt        $v0, $v1, $v0
/* 8A7F0 80099FF0 F6FF4014 */  bnez       $v0, .L80099FCC
/* 8A7F4 80099FF4 1C008424 */   addiu     $a0, $a0, 0x1C
.L80099FF8:
/* 8A7F8 80099FF8 0800E003 */  jr         $ra
/* 8A7FC 80099FFC 00000000 */   nop
.size PLANSRCH_InitNodesForSearch, . - PLANSRCH_InitNodesForSearch
