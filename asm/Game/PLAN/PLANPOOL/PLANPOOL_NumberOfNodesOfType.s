.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_NumberOfNodesOfType
/* 89AD8 800992D8 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89ADC 800992DC 21300000 */  addu       $a2, $zero, $zero
/* 89AE0 800992E0 01004290 */  lbu        $v0, 0x1($v0)
/* 89AE4 800992E4 00000000 */  nop
/* 89AE8 800992E8 0C004010 */  beqz       $v0, .L8009931C
/* 89AEC 800992EC 2118C000 */   addu      $v1, $a2, $zero
/* 89AF0 800992F0 FF00A530 */  andi       $a1, $a1, 0xFF
/* 89AF4 800992F4 21384000 */  addu       $a3, $v0, $zero
.L800992F8:
/* 89AF8 800992F8 14008294 */  lhu        $v0, 0x14($a0)
/* 89AFC 800992FC 00000000 */  nop
/* 89B00 80099300 02004514 */  bne        $v0, $a1, .L8009930C
/* 89B04 80099304 00000000 */   nop
/* 89B08 80099308 01006324 */  addiu      $v1, $v1, 0x1
.L8009930C:
/* 89B0C 8009930C 0100C624 */  addiu      $a2, $a2, 0x1
/* 89B10 80099310 2A10C700 */  slt        $v0, $a2, $a3
/* 89B14 80099314 F8FF4014 */  bnez       $v0, .L800992F8
/* 89B18 80099318 1C008424 */   addiu     $a0, $a0, 0x1C
.L8009931C:
/* 89B1C 8009931C 0800E003 */  jr         $ra
/* 89B20 80099320 21106000 */   addu      $v0, $v1, $zero
.size PLANPOOL_NumberOfNodesOfType, . - PLANPOOL_NumberOfNodesOfType
