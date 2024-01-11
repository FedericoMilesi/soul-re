.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_DecompressChannel_Linear
/* 80B60 80090360 0400868C */  lw         $a2, 0x4($a0)
/* 80B64 80090364 00000000 */  nop
/* 80B68 80090368 0000C294 */  lhu        $v0, 0x0($a2)
/* 80B6C 8009036C 0C00878C */  lw         $a3, 0xC($a0)
/* 80B70 80090370 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 80B74 80090374 40100200 */  sll        $v0, $v0, 1
/* 80B78 80090378 02004224 */  addiu      $v0, $v0, 0x2
/* 80B7C 8009037C 2110C200 */  addu       $v0, $a2, $v0
/* 80B80 80090380 040082AC */  sw         $v0, 0x4($a0)
/* 80B84 80090384 0200C894 */  lhu        $t0, 0x2($a2)
/* 80B88 80090388 0400C294 */  lhu        $v0, 0x4($a2)
/* 80B8C 8009038C E9400208 */  j          .L800903A4
/* 80B90 80090390 0200C624 */   addiu     $a2, $a2, 0x2
.L80090394:
/* 80B94 80090394 0400C294 */  lhu        $v0, 0x4($a2)
/* 80B98 80090398 2338E300 */  subu       $a3, $a3, $v1
/* 80B9C 8009039C 21400401 */  addu       $t0, $t0, $a0
/* 80BA0 800903A0 0200C624 */  addiu      $a2, $a2, 0x2
.L800903A4:
/* 80BA4 800903A4 00140200 */  sll        $v0, $v0, 16
/* 80BA8 800903A8 03140200 */  sra        $v0, $v0, 16
/* 80BAC 800903AC 00F84330 */  andi       $v1, $v0, 0xF800
/* 80BB0 800903B0 C31A0300 */  sra        $v1, $v1, 11
/* 80BB4 800903B4 40150200 */  sll        $v0, $v0, 21
/* 80BB8 800903B8 43250200 */  sra        $a0, $v0, 21
/* 80BBC 800903BC 2A106700 */  slt        $v0, $v1, $a3
/* 80BC0 800903C0 F4FF4014 */  bnez       $v0, .L80090394
/* 80BC4 800903C4 18008700 */   mult      $a0, $a3
/* 80BC8 800903C8 12100000 */  mflo       $v0
/* 80BCC 800903CC 00000000 */  nop
/* 80BD0 800903D0 00000000 */  nop
/* 80BD4 800903D4 1A004300 */  div        $zero, $v0, $v1
/* 80BD8 800903D8 12100000 */  mflo       $v0
/* 80BDC 800903DC 00000000 */  nop
/* 80BE0 800903E0 00140200 */  sll        $v0, $v0, 16
/* 80BE4 800903E4 03240200 */  sra        $a0, $v0, 16
/* 80BE8 800903E8 21100401 */  addu       $v0, $t0, $a0
/* 80BEC 800903EC 0800E003 */  jr         $ra
/* 80BF0 800903F0 0000A2A4 */   sh        $v0, 0x0($a1)
.size _G2Anim_DecompressChannel_Linear, . - _G2Anim_DecompressChannel_Linear
