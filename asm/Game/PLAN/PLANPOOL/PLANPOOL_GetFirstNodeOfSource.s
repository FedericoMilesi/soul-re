.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_GetFirstNodeOfSource
/* 89A88 80099288 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89A8C 8009928C 00000000 */  nop
/* 89A90 80099290 01004290 */  lbu        $v0, 0x1($v0)
/* 89A94 80099294 00000000 */  nop
/* 89A98 80099298 0D004010 */  beqz       $v0, .L800992D0
/* 89A9C 8009929C 21180000 */   addu      $v1, $zero, $zero
/* 89AA0 800992A0 FF00A530 */  andi       $a1, $a1, 0xFF
/* 89AA4 800992A4 21304000 */  addu       $a2, $v0, $zero
.L800992A8:
/* 89AA8 800992A8 14008294 */  lhu        $v0, 0x14($a0)
/* 89AAC 800992AC 00000000 */  nop
/* 89AB0 800992B0 07004230 */  andi       $v0, $v0, 0x7
/* 89AB4 800992B4 03004514 */  bne        $v0, $a1, .L800992C4
/* 89AB8 800992B8 01006324 */   addiu     $v1, $v1, 0x1
/* 89ABC 800992BC 0800E003 */  jr         $ra
/* 89AC0 800992C0 21108000 */   addu      $v0, $a0, $zero
.L800992C4:
/* 89AC4 800992C4 2A106600 */  slt        $v0, $v1, $a2
/* 89AC8 800992C8 F7FF4014 */  bnez       $v0, .L800992A8
/* 89ACC 800992CC 1C008424 */   addiu     $a0, $a0, 0x1C
.L800992D0:
/* 89AD0 800992D0 0800E003 */  jr         $ra
/* 89AD4 800992D4 21100000 */   addu      $v0, $zero, $zero
.size PLANPOOL_GetFirstNodeOfSource, . - PLANPOOL_GetFirstNodeOfSource
