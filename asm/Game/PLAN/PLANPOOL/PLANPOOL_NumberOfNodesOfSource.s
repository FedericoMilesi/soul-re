.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_NumberOfNodesOfSource
/* 89B24 80099324 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89B28 80099328 21300000 */  addu       $a2, $zero, $zero
/* 89B2C 8009932C 01004290 */  lbu        $v0, 0x1($v0)
/* 89B30 80099330 00000000 */  nop
/* 89B34 80099334 0D004010 */  beqz       $v0, .L8009936C
/* 89B38 80099338 2118C000 */   addu      $v1, $a2, $zero
/* 89B3C 8009933C FF00A530 */  andi       $a1, $a1, 0xFF
/* 89B40 80099340 21384000 */  addu       $a3, $v0, $zero
.L80099344:
/* 89B44 80099344 14008294 */  lhu        $v0, 0x14($a0)
/* 89B48 80099348 00000000 */  nop
/* 89B4C 8009934C 07004230 */  andi       $v0, $v0, 0x7
/* 89B50 80099350 02004514 */  bne        $v0, $a1, .L8009935C
/* 89B54 80099354 00000000 */   nop
/* 89B58 80099358 01006324 */  addiu      $v1, $v1, 0x1
.L8009935C:
/* 89B5C 8009935C 0100C624 */  addiu      $a2, $a2, 0x1
/* 89B60 80099360 2A10C700 */  slt        $v0, $a2, $a3
/* 89B64 80099364 F7FF4014 */  bnez       $v0, .L80099344
/* 89B68 80099368 1C008424 */   addiu     $a0, $a0, 0x1C
.L8009936C:
/* 89B6C 8009936C 0800E003 */  jr         $ra
/* 89B70 80099370 21106000 */   addu      $v0, $v1, $zero
.size PLANPOOL_NumberOfNodesOfSource, . - PLANPOOL_NumberOfNodesOfSource
