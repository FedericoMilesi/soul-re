.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razReaverImbue
/* 967B4 800A5FB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 967B8 800A5FB8 21308000 */  addu       $a2, $a0, $zero
/* 967BC 800A5FBC 8000053C */  lui        $a1, (0x800103 >> 16)
/* 967C0 800A5FC0 0900C324 */  addiu      $v1, $a2, 0x9
/* 967C4 800A5FC4 01000224 */  addiu      $v0, $zero, 0x1
/* 967C8 800A5FC8 60FA848F */  lw         $a0, %gp_rel(Raziel + 0x430)($gp)
/* 967CC 800A5FCC 04106200 */  sllv       $v0, $v0, $v1
/* 967D0 800A5FD0 1000BFAF */  sw         $ra, 0x10($sp)
/* 967D4 800A5FD4 64FA86AF */  sw         $a2, %gp_rel(Raziel + 0x434)($gp)
/* 967D8 800A5FD8 5CAB82AF */  sw         $v0, %gp_rel(debugRazielFlags2)($gp)
/* 967DC 800A5FDC A1D1000C */  jal        INSTANCE_Post
/* 967E0 800A5FE0 0301A534 */   ori       $a1, $a1, (0x800103 & 0xFFFF)
/* 967E4 800A5FE4 1000BF8F */  lw         $ra, 0x10($sp)
/* 967E8 800A5FE8 00000000 */  nop
/* 967EC 800A5FEC 0800E003 */  jr         $ra
/* 967F0 800A5FF0 1800BD27 */   addiu     $sp, $sp, 0x18
.size razReaverImbue, . - razReaverImbue
