.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1C54
/* B2454 800C1C54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2458 800C1C58 1000BFAF */  sw         $ra, 0x10($sp)
/* B245C 800C1C5C 0E80013C */  lui        $at, %hi(StRingAddr)
/* B2460 800C1C60 30FD24AC */  sw         $a0, %lo(StRingAddr)($at)
/* B2464 800C1C64 0E80013C */  lui        $at, %hi(StRingSize)
/* B2468 800C1C68 C105030C */  jal        func_800C1704
/* B246C 800C1C6C 40FD25AC */   sw        $a1, %lo(StRingSize)($at)
/* B2470 800C1C70 1000BF8F */  lw         $ra, 0x10($sp)
/* B2474 800C1C74 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2478 800C1C78 0800E003 */  jr         $ra
/* B247C 800C1C7C 00000000 */   nop
/* B2480 800C1C80 00000000 */  nop
.size func_800C1C54, . - func_800C1C54
