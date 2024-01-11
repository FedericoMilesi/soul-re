.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_IsXAInQueue
/* 51068 80060868 44CB838F */  lw         $v1, %gp_rel(loadHead)($gp)
/* 5106C 8006086C 00000000 */  nop
/* 51070 80060870 0B006010 */  beqz       $v1, .L800608A0
/* 51074 80060874 00000000 */   nop
.L80060878:
/* 51078 80060878 04006294 */  lhu        $v0, 0x4($v1)
/* 5107C 8006087C 00000000 */  nop
/* 51080 80060880 F8FF4224 */  addiu      $v0, $v0, -0x8
/* 51084 80060884 0200422C */  sltiu      $v0, $v0, 0x2
/* 51088 80060888 07004014 */  bnez       $v0, .L800608A8
/* 5108C 8006088C 01000224 */   addiu     $v0, $zero, 0x1
/* 51090 80060890 0000638C */  lw         $v1, 0x0($v1)
/* 51094 80060894 00000000 */  nop
/* 51098 80060898 F7FF6014 */  bnez       $v1, .L80060878
/* 5109C 8006089C 00000000 */   nop
.L800608A0:
/* 510A0 800608A0 0800E003 */  jr         $ra
/* 510A4 800608A4 21100000 */   addu      $v0, $zero, $zero
.L800608A8:
/* 510A8 800608A8 0800E003 */  jr         $ra
/* 510AC 800608AC 00000000 */   nop
.size LOAD_IsXAInQueue, . - LOAD_IsXAInQueue
