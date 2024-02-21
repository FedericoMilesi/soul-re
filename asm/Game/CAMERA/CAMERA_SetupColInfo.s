.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetupColInfo
/* DA44 8001D244 21388000 */  addu       $a3, $a0, $zero
/* DA48 8001D248 F000E384 */  lh         $v1, 0xF0($a3)
/* DA4C 8001D24C 06000224 */  addiu      $v0, $zero, 0x6
/* DA50 8001D250 04006214 */  bne        $v1, $v0, .L8001D264
/* DA54 8001D254 2140A000 */   addu      $t0, $a1, $zero
/* DA58 8001D258 AA01E394 */  lhu        $v1, 0x1AA($a3)
/* DA5C 8001D25C 9B740008 */  j          .L8001D26C
/* DA60 8001D260 AA01E224 */   addiu     $v0, $a3, 0x1AA
.L8001D264:
/* DA64 8001D264 A804E224 */  addiu      $v0, $a3, 0x4A8
/* DA68 8001D268 A804E394 */  lhu        $v1, 0x4A8($a3)
.L8001D26C:
/* DA6C 8001D26C 02004494 */  lhu        $a0, 0x2($v0)
/* DA70 8001D270 04004594 */  lhu        $a1, 0x4($v0)
/* DA74 8001D274 CC01E224 */  addiu      $v0, $a3, 0x1CC
/* DA78 8001D278 CC01E3A4 */  sh         $v1, 0x1CC($a3)
/* DA7C 8001D27C 020044A4 */  sh         $a0, 0x2($v0)
/* DA80 8001D280 040045A4 */  sh         $a1, 0x4($v0)
/* DA84 8001D284 0000C294 */  lhu        $v0, 0x0($a2)
/* DA88 8001D288 0200C494 */  lhu        $a0, 0x2($a2)
/* DA8C 8001D28C 0400C594 */  lhu        $a1, 0x4($a2)
/* DA90 8001D290 E401E324 */  addiu      $v1, $a3, 0x1E4
/* DA94 8001D294 E401E2A4 */  sh         $v0, 0x1E4($a3)
/* DA98 8001D298 CC01E224 */  addiu      $v0, $a3, 0x1CC
/* DA9C 8001D29C 020064A4 */  sh         $a0, 0x2($v1)
/* DAA0 8001D2A0 040065A4 */  sh         $a1, 0x4($v1)
/* DAA4 8001D2A4 500002AD */  sw         $v0, 0x50($t0)
/* DAA8 8001D2A8 540003AD */  sw         $v1, 0x54($t0)
/* DAAC 8001D2AC 7804E28C */  lw         $v0, 0x478($a3)
/* DAB0 8001D2B0 00000000 */  nop
/* DAB4 8001D2B4 08004014 */  bnez       $v0, .L8001D2D8
/* DAB8 8001D2B8 1E000224 */   addiu     $v0, $zero, 0x1E
/* DABC 8001D2BC 688E8387 */  lh         $v1, %gp_rel(D_800D0400)($gp)
/* DAC0 8001D2C0 06000224 */  addiu      $v0, $zero, 0x6
/* DAC4 8001D2C4 03006010 */  beqz       $v1, .L8001D2D4
/* DAC8 8001D2C8 580002AD */   sw        $v0, 0x58($t0)
/* DACC 8001D2CC B6740008 */  j          .L8001D2D8
/* DAD0 8001D2D0 0E000224 */   addiu     $v0, $zero, 0xE
.L8001D2D4:
/* DAD4 8001D2D4 16000224 */  addiu      $v0, $zero, 0x16
.L8001D2D8:
/* DAD8 8001D2D8 580002AD */  sw         $v0, 0x58($t0)
/* DADC 8001D2DC 688E8287 */  lh         $v0, %gp_rel(D_800D0400)($gp)
/* DAE0 8001D2E0 00000000 */  nop
/* DAE4 8001D2E4 04004010 */  beqz       $v0, .L8001D2F8
/* DAE8 8001D2E8 01000224 */   addiu     $v0, $zero, 0x1
/* DAEC 8001D2EC 688E80A7 */  sh         $zero, %gp_rel(D_800D0400)($gp)
/* DAF0 8001D2F0 0800E003 */  jr         $ra
/* DAF4 8001D2F4 00000000 */   nop
.L8001D2F8:
/* DAF8 8001D2F8 688E82A7 */  sh         $v0, %gp_rel(D_800D0400)($gp)
/* DAFC 8001D2FC 0800E003 */  jr         $ra
/* DB00 8001D300 00000000 */   nop
.size CAMERA_SetupColInfo, . - CAMERA_SetupColInfo
