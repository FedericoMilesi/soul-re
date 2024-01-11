.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1BA4
/* B23A4 800C1BA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B23A8 800C1BA8 1000B0AF */  sw         $s0, 0x10($sp)
/* B23AC 800C1BAC 21808000 */  addu       $s0, $a0, $zero
/* B23B0 800C1BB0 1400B1AF */  sw         $s1, 0x14($sp)
/* B23B4 800C1BB4 2188E000 */  addu       $s1, $a3, $zero
/* B23B8 800C1BB8 1800B2AF */  sw         $s2, 0x18($sp)
/* B23BC 800C1BBC 3000B28F */  lw         $s2, 0x30($sp)
/* B23C0 800C1BC0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* B23C4 800C1BC4 0D07030C */  jal        func_800C1C34
/* B23C8 800C1BC8 01000424 */   addiu     $a0, $zero, 0x1
/* B23CC 800C1BCC 01001032 */  andi       $s0, $s0, 0x1
/* B23D0 800C1BD0 0E80013C */  lui        $at, %hi(StEmu_Addr)
/* B23D4 800C1BD4 04FD20AC */  sw         $zero, %lo(StEmu_Addr)($at)
/* B23D8 800C1BD8 0E80013C */  lui        $at, %hi(StFunc1)
/* B23DC 800C1BDC FCFC31AC */  sw         $s1, %lo(StFunc1)($at)
/* B23E0 800C1BE0 0E80013C */  lui        $at, %hi(StRgb24)
/* B23E4 800C1BE4 14FD30AC */  sw         $s0, %lo(StRgb24)($at)
/* B23E8 800C1BE8 0E80013C */  lui        $at, %hi(CChannel)
/* B23EC 800C1BEC 08FD20AC */  sw         $zero, %lo(CChannel)($at)
/* B23F0 800C1BF0 0E80013C */  lui        $at, %hi(StCHANNEL)
/* B23F4 800C1BF4 0CFD20AC */  sw         $zero, %lo(StCHANNEL)($at)
/* B23F8 800C1BF8 0E80013C */  lui        $at, %hi(Stsector_offset)
/* B23FC 800C1BFC 24FD20A4 */  sh         $zero, %lo(Stsector_offset)($at)
/* B2400 800C1C00 0E80013C */  lui        $at, %hi(Stframe_no)
/* B2404 800C1C04 10FD20AC */  sw         $zero, %lo(Stframe_no)($at)
/* B2408 800C1C08 0E80013C */  lui        $at, %hi(StFunc2)
/* B240C 800C1C0C 00FD32AC */  sw         $s2, %lo(StFunc2)($at)
/* B2410 800C1C10 1C00BF8F */  lw         $ra, 0x1C($sp)
/* B2414 800C1C14 1800B28F */  lw         $s2, 0x18($sp)
/* B2418 800C1C18 1400B18F */  lw         $s1, 0x14($sp)
/* B241C 800C1C1C 1000B08F */  lw         $s0, 0x10($sp)
/* B2420 800C1C20 0800E003 */  jr         $ra
/* B2424 800C1C24 2000BD27 */   addiu     $sp, $sp, 0x20
/* B2428 800C1C28 00000000 */  nop
/* B242C 800C1C2C 00000000 */  nop
/* B2430 800C1C30 00000000 */  nop
.size func_800C1BA4, . - func_800C1BA4
