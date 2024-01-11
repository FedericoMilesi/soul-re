.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1D44
/* B2544 800C1D44 0E80023C */  lui        $v0, %hi(StRingIdx2)
/* B2548 800C1D48 38FD428C */  lw         $v0, %lo(StRingIdx2)($v0)
/* B254C 800C1D4C 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B2550 800C1D50 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B2554 800C1D54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2558 800C1D58 1000BFAF */  sw         $ra, 0x10($sp)
/* B255C 800C1D5C 40110200 */  sll        $v0, $v0, 5
/* B2560 800C1D60 21186200 */  addu       $v1, $v1, $v0
/* B2564 800C1D64 02000224 */  addiu      $v0, $zero, 0x2
/* B2568 800C1D68 000062A4 */  sh         $v0, 0x0($v1)
/* B256C 800C1D6C 0E80063C */  lui        $a2, %hi(StStartFrame + 0x4)
/* B2570 800C1D70 48FDC624 */  addiu      $a2, $a2, %lo(StStartFrame + 0x4)
/* B2574 800C1D74 1F006288 */  lwl        $v0, 0x1F($v1)
/* B2578 800C1D78 1C006298 */  lwr        $v0, 0x1C($v1)
/* B257C 800C1D7C 00000000 */  nop
/* B2580 800C1D80 0300C2A8 */  swl        $v0, 0x3($a2)
/* B2584 800C1D84 0000C2B8 */  swr        $v0, 0x0($a2)
/* B2588 800C1D88 0800628C */  lw         $v0, 0x8($v1)
/* B258C 800C1D8C 0E80033C */  lui        $v1, %hi(StRingIdx1)
/* B2590 800C1D90 34FD638C */  lw         $v1, %lo(StRingIdx1)($v1)
/* B2594 800C1D94 0E80043C */  lui        $a0, %hi(StFunc1)
/* B2598 800C1D98 FCFC848C */  lw         $a0, %lo(StFunc1)($a0)
/* B259C 800C1D9C 0E80013C */  lui        $at, %hi(StStartFrame + 0x8)
/* B25A0 800C1DA0 4CFD22AC */  sw         $v0, %lo(StStartFrame + 0x8)($at)
/* B25A4 800C1DA4 0E80013C */  lui        $at, %hi(StRingIdx2)
/* B25A8 800C1DA8 03008010 */  beqz       $a0, .L800C1DB8
/* B25AC 800C1DAC 38FD23AC */   sw        $v1, %lo(StRingIdx2)($at)
/* B25B0 800C1DB0 09F88000 */  jalr       $a0
/* B25B4 800C1DB4 00000000 */   nop
.L800C1DB8:
/* B25B8 800C1DB8 0E80013C */  lui        $at, %hi(StFinalSector)
/* B25BC 800C1DBC 28FD20AC */  sw         $zero, %lo(StFinalSector)($at)
/* B25C0 800C1DC0 1000BF8F */  lw         $ra, 0x10($sp)
/* B25C4 800C1DC4 1800BD27 */  addiu      $sp, $sp, 0x18
/* B25C8 800C1DC8 0800E003 */  jr         $ra
/* B25CC 800C1DCC 00000000 */   nop
.size func_800C1D44, . - func_800C1D44
