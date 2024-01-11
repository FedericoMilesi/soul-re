.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_Load
/* A7CE4 800B74E4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A7CE8 800B74E8 1000B0AF */  sw         $s0, 0x10($sp)
/* A7CEC 800B74EC 21800000 */  addu       $s0, $zero, $zero
/* A7CF0 800B74F0 0180043C */  lui        $a0, %hi(D_80012464)
/* A7CF4 800B74F4 64248424 */  addiu      $a0, $a0, %lo(D_80012464)
/* A7CF8 800B74F8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* A7CFC 800B74FC 1800B2AF */  sw         $s2, 0x18($sp)
/* A7D00 800B7500 5C64010C */  jal        STREAM_GetObjectTracker
/* A7D04 800B7504 1400B1AF */   sw        $s1, 0x14($sp)
/* A7D08 800B7508 21884000 */  addu       $s1, $v0, $zero
/* A7D0C 800B750C 02001224 */  addiu      $s2, $zero, 0x2
.L800B7510:
/* A7D10 800B7510 14002286 */  lh         $v0, 0x14($s1)
/* A7D14 800B7514 00000000 */  nop
/* A7D18 800B7518 08005210 */  beq        $v0, $s2, .L800B753C
/* A7D1C 800B751C 9001022A */   slti      $v0, $s0, 0x190
/* A7D20 800B7520 7580010C */  jal        STREAM_PollLoadQueue
/* A7D24 800B7524 01001026 */   addiu     $s0, $s0, 0x1
/* A7D28 800B7528 5EF2020C */  jal        VSync
/* A7D2C 800B752C 21200000 */   addu      $a0, $zero, $zero
/* A7D30 800B7530 9001022A */  slti       $v0, $s0, 0x190
/* A7D34 800B7534 F6FF4014 */  bnez       $v0, .L800B7510
/* A7D38 800B7538 00000000 */   nop
.L800B753C:
/* A7D3C 800B753C 08004010 */  beqz       $v0, .L800B7560
/* A7D40 800B7540 01000224 */   addiu     $v0, $zero, 0x1
/* A7D44 800B7544 1000248E */  lw         $a0, 0x10($s1)
/* A7D48 800B7548 0D80033C */  lui        $v1, %hi(the_cine_tracker)
/* A7D4C 800B754C 78C871AC */  sw         $s1, %lo(the_cine_tracker)($v1)
/* A7D50 800B7550 4000848C */  lw         $a0, 0x40($a0)
/* A7D54 800B7554 0D80033C */  lui        $v1, %hi(the_cine_table)
/* A7D58 800B7558 5CDD0208 */  j          .L800B7570
/* A7D5C 800B755C 74C864AC */   sw        $a0, %lo(the_cine_table)($v1)
.L800B7560:
/* A7D60 800B7560 0180043C */  lui        $a0, %hi(D_8001246C)
/* A7D64 800B7564 06D1010C */  jal        printf
/* A7D68 800B7568 6C248424 */   addiu     $a0, $a0, %lo(D_8001246C)
/* A7D6C 800B756C 21100000 */  addu       $v0, $zero, $zero
.L800B7570:
/* A7D70 800B7570 1C00BF8F */  lw         $ra, 0x1C($sp)
/* A7D74 800B7574 1800B28F */  lw         $s2, 0x18($sp)
/* A7D78 800B7578 1400B18F */  lw         $s1, 0x14($sp)
/* A7D7C 800B757C 1000B08F */  lw         $s0, 0x10($sp)
/* A7D80 800B7580 0800E003 */  jr         $ra
/* A7D84 800B7584 2000BD27 */   addiu     $sp, $sp, 0x20
.size CINE_Load, . - CINE_Load
