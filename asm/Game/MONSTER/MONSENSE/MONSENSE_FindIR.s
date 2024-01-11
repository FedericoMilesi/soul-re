.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_FindIR
/* 76470 80085C70 9000838C */  lw         $v1, 0x90($a0)
/* 76474 80085C74 00000000 */  nop
/* 76478 80085C78 09006010 */  beqz       $v1, .L80085CA0
/* 7647C 80085C7C 00000000 */   nop
.L80085C80:
/* 76480 80085C80 0400628C */  lw         $v0, 0x4($v1)
/* 76484 80085C84 00000000 */  nop
/* 76488 80085C88 05004510 */  beq        $v0, $a1, .L80085CA0
/* 7648C 80085C8C 00000000 */   nop
/* 76490 80085C90 0000638C */  lw         $v1, 0x0($v1)
/* 76494 80085C94 00000000 */  nop
/* 76498 80085C98 F9FF6014 */  bnez       $v1, .L80085C80
/* 7649C 80085C9C 00000000 */   nop
.L80085CA0:
/* 764A0 80085CA0 0800E003 */  jr         $ra
/* 764A4 80085CA4 21106000 */   addu      $v0, $v1, $zero
.size MONSENSE_FindIR, . - MONSENSE_FindIR
