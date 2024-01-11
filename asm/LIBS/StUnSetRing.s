.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StUnSetRing
/* B1F64 800C1764 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B1F68 800C1768 1000BFAF */  sw         $ra, 0x10($sp)
/* B1F6C 800C176C A5FC020C */  jal        EnterCriticalSection
/* B1F70 800C1770 00000000 */   nop
/* B1F74 800C1774 0D80033C */  lui        $v1, %hi(DS_active)
/* B1F78 800C1778 A4E9638C */  lw         $v1, %lo(DS_active)($v1)
/* B1F7C 800C177C 01000224 */  addiu      $v0, $zero, 0x1
/* B1F80 800C1780 07006214 */  bne        $v1, $v0, .L800C17A0
/* B1F84 800C1784 00000000 */   nop
/* B1F88 800C1788 4B1E030C */  jal        DsDataCallback
/* B1F8C 800C178C 21200000 */   addu      $a0, $zero, $zero
/* B1F90 800C1790 461E030C */  jal        DsReadyCallback
/* B1F94 800C1794 21200000 */   addu      $a0, $zero, $zero
/* B1F98 800C1798 EC050308 */  j          .L800C17B0
/* B1F9C 800C179C 00000000 */   nop
.L800C17A0:
/* B1FA0 800C17A0 4FF9020C */  jal        CdDataCallback
/* B1FA4 800C17A4 21200000 */   addu      $a0, $zero, $zero
/* B1FA8 800C17A8 4BF8020C */  jal        CdReadyCallback
/* B1FAC 800C17AC 21200000 */   addu      $a0, $zero, $zero
.L800C17B0:
/* B1FB0 800C17B0 0D80023C */  lui        $v0, %hi(debug_cause + 0x18)
/* B1FB4 800C17B4 1CE8428C */  lw         $v0, %lo(debug_cause + 0x18)($v0)
/* B1FB8 800C17B8 00000000 */  nop
/* B1FBC 800C17BC 000040A0 */  sb         $zero, 0x0($v0)
/* B1FC0 800C17C0 0D80023C */  lui        $v0, %hi(debug_cause + 0x24)
/* B1FC4 800C17C4 28E8428C */  lw         $v0, %lo(debug_cause + 0x24)($v0)
/* B1FC8 800C17C8 00000000 */  nop
/* B1FCC 800C17CC 11FC020C */  jal        ExitCriticalSection
/* B1FD0 800C17D0 000040A0 */   sb        $zero, 0x0($v0)
/* B1FD4 800C17D4 1000BF8F */  lw         $ra, 0x10($sp)
/* B1FD8 800C17D8 1800BD27 */  addiu      $sp, $sp, 0x18
/* B1FDC 800C17DC 0800E003 */  jr         $ra
/* B1FE0 800C17E0 00000000 */   nop
.size StUnSetRing, . - StUnSetRing
