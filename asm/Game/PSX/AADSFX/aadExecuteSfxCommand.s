.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadExecuteSfxCommand
/* 47B9C 8005739C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47BA0 800573A0 1000BFAF */  sw         $ra, 0x10($sp)
/* 47BA4 800573A4 00008290 */  lbu        $v0, 0x0($a0)
/* 47BA8 800573A8 00000000 */  nop
/* 47BAC 800573AC 0900422C */  sltiu      $v0, $v0, 0x9
/* 47BB0 800573B0 09004010 */  beqz       $v0, .L800573D8
/* 47BB4 800573B4 00000000 */   nop
/* 47BB8 800573B8 00008290 */  lbu        $v0, 0x0($a0)
/* 47BBC 800573BC 249E8327 */  addiu      $v1, $gp, %gp_rel(sfxCmdFunction)
/* 47BC0 800573C0 80100200 */  sll        $v0, $v0, 2
/* 47BC4 800573C4 21104300 */  addu       $v0, $v0, $v1
/* 47BC8 800573C8 0000428C */  lw         $v0, 0x0($v0)
/* 47BCC 800573CC 00000000 */  nop
/* 47BD0 800573D0 09F84000 */  jalr       $v0
/* 47BD4 800573D4 00000000 */   nop
.L800573D8:
/* 47BD8 800573D8 1000BF8F */  lw         $ra, 0x10($sp)
/* 47BDC 800573DC 00000000 */  nop
/* 47BE0 800573E0 0800E003 */  jr         $ra
/* 47BE4 800573E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadExecuteSfxCommand, . - aadExecuteSfxCommand
