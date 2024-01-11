.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel putCdCommand
/* A73AC 800B6BAC A0008290 */  lbu        $v0, 0xA0($a0)
/* A73B0 800B6BB0 21400000 */  addu       $t0, $zero, $zero
/* A73B4 800B6BB4 C0100200 */  sll        $v0, $v0, 3
/* A73B8 800B6BB8 21108200 */  addu       $v0, $a0, $v0
/* A73BC 800B6BBC 0C00C018 */  blez       $a2, .L800B6BF0
/* A73C0 800B6BC0 1B0045A0 */   sb        $a1, 0x1B($v0)
/* A73C4 800B6BC4 2118E800 */  addu       $v1, $a3, $t0
.L800B6BC8:
/* A73C8 800B6BC8 A0008290 */  lbu        $v0, 0xA0($a0)
/* A73CC 800B6BCC 00006390 */  lbu        $v1, 0x0($v1)
/* A73D0 800B6BD0 C0100200 */  sll        $v0, $v0, 3
/* A73D4 800B6BD4 21100201 */  addu       $v0, $t0, $v0
/* A73D8 800B6BD8 01000825 */  addiu      $t0, $t0, 0x1
/* A73DC 800B6BDC 21108200 */  addu       $v0, $a0, $v0
/* A73E0 800B6BE0 1C0043A0 */  sb         $v1, 0x1C($v0)
/* A73E4 800B6BE4 2A100601 */  slt        $v0, $t0, $a2
/* A73E8 800B6BE8 F7FF4014 */  bnez       $v0, .L800B6BC8
/* A73EC 800B6BEC 2118E800 */   addu      $v1, $a3, $t0
.L800B6BF0:
/* A73F0 800B6BF0 A2008390 */  lbu        $v1, 0xA2($a0)
/* A73F4 800B6BF4 00000000 */  nop
/* A73F8 800B6BF8 0700622C */  sltiu      $v0, $v1, 0x7
/* A73FC 800B6BFC 0A004010 */  beqz       $v0, .L800B6C28
/* A7400 800B6C00 01006324 */   addiu     $v1, $v1, 0x1
/* A7404 800B6C04 A0008290 */  lbu        $v0, 0xA0($a0)
/* A7408 800B6C08 A20083A0 */  sb         $v1, 0xA2($a0)
/* A740C 800B6C0C 08000324 */  addiu      $v1, $zero, 0x8
/* A7410 800B6C10 01004224 */  addiu      $v0, $v0, 0x1
/* A7414 800B6C14 A00082A0 */  sb         $v0, 0xA0($a0)
/* A7418 800B6C18 FF004230 */  andi       $v0, $v0, 0xFF
/* A741C 800B6C1C 02004314 */  bne        $v0, $v1, .L800B6C28
/* A7420 800B6C20 00000000 */   nop
/* A7424 800B6C24 A00080A0 */  sb         $zero, 0xA0($a0)
.L800B6C28:
/* A7428 800B6C28 0800E003 */  jr         $ra
/* A742C 800B6C2C 00000000 */   nop
.size putCdCommand, . - putCdCommand
