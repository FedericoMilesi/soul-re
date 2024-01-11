.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadDisableSlot
/* 45148 80054948 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 4514C 8005494C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 45150 80054950 1000BFAF */  sw         $ra, 0x10($sp)
/* 45154 80054954 0400628C */  lw         $v0, 0x4($v1)
/* 45158 80054958 00000000 */  nop
/* 4515C 8005495C 2A108200 */  slt        $v0, $a0, $v0
/* 45160 80054960 09004010 */  beqz       $v0, .L80054988
/* 45164 80054964 80100400 */   sll       $v0, $a0, 2
/* 45168 80054968 21106200 */  addu       $v0, $v1, $v0
/* 4516C 8005496C 3400438C */  lw         $v1, 0x34($v0)
/* 45170 80054970 00000000 */  nop
/* 45174 80054974 50056290 */  lbu        $v0, 0x550($v1)
/* 45178 80054978 00000000 */  nop
/* 4517C 8005497C 01004234 */  ori        $v0, $v0, 0x1
/* 45180 80054980 AE52010C */  jal        aadAllNotesOff
/* 45184 80054984 500562A0 */   sb        $v0, 0x550($v1)
.L80054988:
/* 45188 80054988 1000BF8F */  lw         $ra, 0x10($sp)
/* 4518C 8005498C 00000000 */  nop
/* 45190 80054990 0800E003 */  jr         $ra
/* 45194 80054994 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadDisableSlot, . - aadDisableSlot
