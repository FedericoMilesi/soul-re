.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel pre_process_functions
/* 42EC 80013AEC 2C00838C */  lw         $v1, 0x2C($a0)
/* 42F0 80013AF0 00000000 */  nop
/* 42F4 80013AF4 05006010 */  beqz       $v1, .L80013B0C
/* 42F8 80013AF8 00000000 */   nop
/* 42FC 80013AFC 1400628C */  lw         $v0, 0x14($v1)
/* 4300 80013B00 00000000 */  nop
/* 4304 80013B04 00014234 */  ori        $v0, $v0, 0x100
/* 4308 80013B08 140062AC */  sw         $v0, 0x14($v1)
.L80013B0C:
/* 430C 80013B0C 0800E003 */  jr         $ra
/* 4310 80013B10 21100000 */   addu      $v0, $zero, $zero
.size pre_process_functions, . - pre_process_functions
