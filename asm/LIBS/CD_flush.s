.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CD_flush
/* B5684 800C4E84 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B5688 800C4E88 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B568C 800C4E8C 01000224 */  addiu      $v0, $zero, 0x1
/* B5690 800C4E90 000062A0 */  sb         $v0, 0x0($v1)
/* B5694 800C4E94 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B5698 800C4E98 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B569C 800C4E9C 00000000 */  nop
/* B56A0 800C4EA0 00004290 */  lbu        $v0, 0x0($v0)
/* B56A4 800C4EA4 00000000 */  nop
/* B56A8 800C4EA8 07004230 */  andi       $v0, $v0, 0x7
/* B56AC 800C4EAC 16004010 */  beqz       $v0, .L800C4F08
/* B56B0 800C4EB0 01000424 */   addiu     $a0, $zero, 0x1
/* B56B4 800C4EB4 07000324 */  addiu      $v1, $zero, 0x7
.L800C4EB8:
/* B56B8 800C4EB8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B56BC 800C4EBC 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B56C0 800C4EC0 00000000 */  nop
/* B56C4 800C4EC4 000044A0 */  sb         $a0, 0x0($v0)
/* B56C8 800C4EC8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B56CC 800C4ECC 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B56D0 800C4ED0 00000000 */  nop
/* B56D4 800C4ED4 000043A0 */  sb         $v1, 0x0($v0)
/* B56D8 800C4ED8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x228)
/* B56DC 800C4EDC 50EC428C */  lw         $v0, %lo(CD_intstr + 0x228)($v0)
/* B56E0 800C4EE0 00000000 */  nop
/* B56E4 800C4EE4 000043A0 */  sb         $v1, 0x0($v0)
/* B56E8 800C4EE8 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B56EC 800C4EEC 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B56F0 800C4EF0 00000000 */  nop
/* B56F4 800C4EF4 00004290 */  lbu        $v0, 0x0($v0)
/* B56F8 800C4EF8 00000000 */  nop
/* B56FC 800C4EFC 07004230 */  andi       $v0, $v0, 0x7
/* B5700 800C4F00 EDFF4014 */  bnez       $v0, .L800C4EB8
/* B5704 800C4F04 00000000 */   nop
.L800C4F08:
/* B5708 800C4F08 0D80033C */  lui        $v1, %hi(CD_intstr + 0x238)
/* B570C 800C4F0C 60EC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x238)
/* B5710 800C4F10 020060A0 */  sb         $zero, 0x2($v1)
/* B5714 800C4F14 02006290 */  lbu        $v0, 0x2($v1)
/* B5718 800C4F18 00000000 */  nop
/* B571C 800C4F1C 010062A0 */  sb         $v0, 0x1($v1)
/* B5720 800C4F20 0D80043C */  lui        $a0, %hi(CD_intstr + 0x220)
/* B5724 800C4F24 48EC848C */  lw         $a0, %lo(CD_intstr + 0x220)($a0)
/* B5728 800C4F28 02000224 */  addiu      $v0, $zero, 0x2
/* B572C 800C4F2C 000062A0 */  sb         $v0, 0x0($v1)
/* B5730 800C4F30 000080A0 */  sb         $zero, 0x0($a0)
/* B5734 800C4F34 0D80023C */  lui        $v0, %hi(CD_intstr + 0x22C)
/* B5738 800C4F38 54EC428C */  lw         $v0, %lo(CD_intstr + 0x22C)($v0)
/* B573C 800C4F3C 00000000 */  nop
/* B5740 800C4F40 000040A0 */  sb         $zero, 0x0($v0)
/* B5744 800C4F44 0D80033C */  lui        $v1, %hi(CD_intstr + 0x230)
/* B5748 800C4F48 58EC638C */  lw         $v1, %lo(CD_intstr + 0x230)($v1)
/* B574C 800C4F4C 25130224 */  addiu      $v0, $zero, 0x1325
/* B5750 800C4F50 0800E003 */  jr         $ra
/* B5754 800C4F54 000062AC */   sw        $v0, 0x0($v1)
.size CD_flush, . - CD_flush
