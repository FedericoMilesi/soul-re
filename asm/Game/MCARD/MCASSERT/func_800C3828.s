.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3828
/* B4028 800C3828 E3008290 */  lbu        $v0, 0xE3($a0)
/* B402C 800C382C E9008590 */  lbu        $a1, 0xE9($a0)
/* B4030 800C3830 EC008494 */  lhu        $a0, 0xEC($a0)
/* B4034 800C3834 01004224 */  addiu      $v0, $v0, 0x1
/* B4038 800C3838 43100200 */  sra        $v0, $v0, 1
/* B403C 800C383C 80100200 */  sll        $v0, $v0, 2
/* B4040 800C3840 80180500 */  sll        $v1, $a1, 2
/* B4044 800C3844 21186500 */  addu       $v1, $v1, $a1
/* B4048 800C3848 03006324 */  addiu      $v1, $v1, 0x3
/* B404C 800C384C FC0F6330 */  andi       $v1, $v1, 0xFFC
/* B4050 800C3850 04006324 */  addiu      $v1, $v1, 0x4
/* B4054 800C3854 21104300 */  addu       $v0, $v0, $v1
/* B4058 800C3858 0800E003 */  jr         $ra
/* B405C 800C385C 21104400 */   addu      $v0, $v0, $a0
.size func_800C3828, . - func_800C3828
