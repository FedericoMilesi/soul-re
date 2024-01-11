.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StClearRing
/* B1F04 800C1704 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B1F08 800C1708 0E80053C */  lui        $a1, %hi(StRingSize)
/* B1F0C 800C170C 40FDA58C */  lw         $a1, %lo(StRingSize)($a1)
/* B1F10 800C1710 1000BFAF */  sw         $ra, 0x10($sp)
/* B1F14 800C1714 0E80013C */  lui        $at, %hi(StRingIdx3)
/* B1F18 800C1718 3CFD20AC */  sw         $zero, %lo(StRingIdx3)($at)
/* B1F1C 800C171C 0E80013C */  lui        $at, %hi(StRingIdx2)
/* B1F20 800C1720 38FD20AC */  sw         $zero, %lo(StRingIdx2)($at)
/* B1F24 800C1724 0E80013C */  lui        $at, %hi(StRingIdx1)
/* B1F28 800C1728 34FD20AC */  sw         $zero, %lo(StRingIdx1)($at)
/* B1F2C 800C172C 0E80013C */  lui        $at, %hi(StFinalSector)
/* B1F30 800C1730 28FD20AC */  sw         $zero, %lo(StFinalSector)($at)
/* B1F34 800C1734 361E030C */  jal        init_ring_status
/* B1F38 800C1738 21200000 */   addu      $a0, $zero, $zero
/* B1F3C 800C173C 0E80013C */  lui        $at, %hi(StCdIntrFlag)
/* B1F40 800C1740 04BB20AC */  sw         $zero, %lo(StCdIntrFlag)($at)
/* B1F44 800C1744 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B1F48 800C1748 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B1F4C 800C174C 0E80013C */  lui        $at, %hi(Stframe_no)
/* B1F50 800C1750 10FD20AC */  sw         $zero, %lo(Stframe_no)($at)
/* B1F54 800C1754 1000BF8F */  lw         $ra, 0x10($sp)
/* B1F58 800C1758 1800BD27 */  addiu      $sp, $sp, 0x18
/* B1F5C 800C175C 0800E003 */  jr         $ra
/* B1F60 800C1760 00000000 */   nop
.size StClearRing, . - StClearRing
