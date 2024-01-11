.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel processCdCommands
/* A749C 800B6C9C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A74A0 800B6CA0 1400B1AF */  sw         $s1, 0x14($sp)
/* A74A4 800B6CA4 21888000 */  addu       $s1, $a0, $zero
/* A74A8 800B6CA8 1800BFAF */  sw         $ra, 0x18($sp)
/* A74AC 800B6CAC 1000B0AF */  sw         $s0, 0x10($sp)
/* A74B0 800B6CB0 AB002392 */  lbu        $v1, 0xAB($s1)
/* A74B4 800B6CB4 02000224 */  addiu      $v0, $zero, 0x2
/* A74B8 800B6CB8 0A006214 */  bne        $v1, $v0, .L800B6CE4
/* A74BC 800B6CBC 10002626 */   addiu     $a2, $s1, 0x10
/* A74C0 800B6CC0 A1002292 */  lbu        $v0, 0xA1($s1)
/* A74C4 800B6CC4 01000324 */  addiu      $v1, $zero, 0x1
/* A74C8 800B6CC8 AB0023A2 */  sb         $v1, 0xAB($s1)
/* A74CC 800B6CCC C0100200 */  sll        $v0, $v0, 3
/* A74D0 800B6CD0 18004224 */  addiu      $v0, $v0, 0x18
/* A74D4 800B6CD4 21802202 */  addu       $s0, $s1, $v0
/* A74D8 800B6CD8 03000492 */  lbu        $a0, 0x3($s0)
/* A74DC 800B6CDC 4ADB0208 */  j          .L800B6D28
/* A74E0 800B6CE0 04000526 */   addiu     $a1, $s0, 0x4
.L800B6CE4:
/* A74E4 800B6CE4 A2002292 */  lbu        $v0, 0xA2($s1)
/* A74E8 800B6CE8 00000000 */  nop
/* A74EC 800B6CEC 10004010 */  beqz       $v0, .L800B6D30
/* A74F0 800B6CF0 01000524 */   addiu     $a1, $zero, 0x1
/* A74F4 800B6CF4 0E006510 */  beq        $v1, $a1, .L800B6D30
/* A74F8 800B6CF8 0B80043C */   lui       $a0, %hi(VOICEXA_CdSyncCallback)
/* A74FC 800B6CFC A1002292 */  lbu        $v0, 0xA1($s1)
/* A7500 800B6D00 306C8424 */  addiu      $a0, $a0, %lo(VOICEXA_CdSyncCallback)
/* A7504 800B6D04 AB0025A2 */  sb         $a1, 0xAB($s1)
/* A7508 800B6D08 C0100200 */  sll        $v0, $v0, 3
/* A750C 800B6D0C 18004224 */  addiu      $v0, $v0, 0x18
/* A7510 800B6D10 46F8020C */  jal        CdSyncCallback
/* A7514 800B6D14 21802202 */   addu      $s0, $s1, $v0
/* A7518 800B6D18 04000526 */  addiu      $a1, $s0, 0x4
/* A751C 800B6D1C 0C0022AE */  sw         $v0, 0xC($s1)
/* A7520 800B6D20 03000492 */  lbu        $a0, 0x3($s0)
/* A7524 800B6D24 10002626 */  addiu      $a2, $s1, 0x10
.L800B6D28:
/* A7528 800B6D28 50F8020C */  jal        CdControl
/* A752C 800B6D2C 00000000 */   nop
.L800B6D30:
/* A7530 800B6D30 1800BF8F */  lw         $ra, 0x18($sp)
/* A7534 800B6D34 1400B18F */  lw         $s1, 0x14($sp)
/* A7538 800B6D38 1000B08F */  lw         $s0, 0x10($sp)
/* A753C 800B6D3C 0800E003 */  jr         $ra
/* A7540 800B6D40 2000BD27 */   addiu     $sp, $sp, 0x20
.size processCdCommands, . - processCdCommands
