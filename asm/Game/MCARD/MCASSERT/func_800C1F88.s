.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1F88
/* B2788 800C1F88 0D80023C */  lui        $v0, %hi(Vcount)
/* B278C 800C1F8C ACE8428C */  lw         $v0, %lo(Vcount)($v0)
/* B2790 800C1F90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B2794 800C1F94 1400B1AF */  sw         $s1, 0x14($sp)
/* B2798 800C1F98 21880000 */  addu       $s1, $zero, $zero
/* B279C 800C1F9C 1000B0AF */  sw         $s0, 0x10($sp)
/* B27A0 800C1FA0 0D80103C */  lui        $s0, %hi(debug_cause + 0x88)
/* B27A4 800C1FA4 8CE81026 */  addiu      $s0, $s0, %lo(debug_cause + 0x88)
/* B27A8 800C1FA8 1800BFAF */  sw         $ra, 0x18($sp)
/* B27AC 800C1FAC 01004224 */  addiu      $v0, $v0, 0x1
/* B27B0 800C1FB0 0D80013C */  lui        $at, %hi(Vcount)
/* B27B4 800C1FB4 ACE822AC */  sw         $v0, %lo(Vcount)($at)
.L800C1FB8:
/* B27B8 800C1FB8 0000028E */  lw         $v0, 0x0($s0)
/* B27BC 800C1FBC 00000000 */  nop
/* B27C0 800C1FC0 03004010 */  beqz       $v0, .L800C1FD0
/* B27C4 800C1FC4 00000000 */   nop
/* B27C8 800C1FC8 09F84000 */  jalr       $v0
/* B27CC 800C1FCC 00000000 */   nop
.L800C1FD0:
/* B27D0 800C1FD0 01003126 */  addiu      $s1, $s1, 0x1
/* B27D4 800C1FD4 0800222A */  slti       $v0, $s1, 0x8
/* B27D8 800C1FD8 F7FF4014 */  bnez       $v0, .L800C1FB8
/* B27DC 800C1FDC 04001026 */   addiu     $s0, $s0, 0x4
/* B27E0 800C1FE0 1800BF8F */  lw         $ra, 0x18($sp)
/* B27E4 800C1FE4 1400B18F */  lw         $s1, 0x14($sp)
/* B27E8 800C1FE8 1000B08F */  lw         $s0, 0x10($sp)
/* B27EC 800C1FEC 0800E003 */  jr         $ra
/* B27F0 800C1FF0 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800C1F88, . - func_800C1F88
