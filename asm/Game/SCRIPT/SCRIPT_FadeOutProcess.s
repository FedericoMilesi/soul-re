.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SCRIPT_FadeOutProcess
/* 2E394 8003DB94 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 2E398 8003DB98 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2E39C 8003DB9C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2E3A0 8003DBA0 04018294 */  lhu        $v0, 0x104($a0)
/* 2E3A4 8003DBA4 42190300 */  srl        $v1, $v1, 5
/* 2E3A8 8003DBA8 21104300 */  addu       $v0, $v0, $v1
/* 2E3AC 8003DBAC 040182A4 */  sh         $v0, 0x104($a0)
/* 2E3B0 8003DBB0 00140200 */  sll        $v0, $v0, 16
/* 2E3B4 8003DBB4 03140200 */  sra        $v0, $v0, 16
/* 2E3B8 8003DBB8 00104228 */  slti       $v0, $v0, 0x1000
/* 2E3BC 8003DBBC 03004014 */  bnez       $v0, .L8003DBCC
/* 2E3C0 8003DBC0 00000000 */   nop
/* 2E3C4 8003DBC4 39D1000C */  jal        INSTANCE_PlainDeath
/* 2E3C8 8003DBC8 00000000 */   nop
.L8003DBCC:
/* 2E3CC 8003DBCC 1000BF8F */  lw         $ra, 0x10($sp)
/* 2E3D0 8003DBD0 00000000 */  nop
/* 2E3D4 8003DBD4 0800E003 */  jr         $ra
/* 2E3D8 8003DBD8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SCRIPT_FadeOutProcess, . - SCRIPT_FadeOutProcess
