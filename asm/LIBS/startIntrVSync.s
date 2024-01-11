.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel startIntrVSync
/* B2730 800C1F30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2734 800C1F34 0D80043C */  lui        $a0, %hi(debug_cause + 0x88)
/* B2738 800C1F38 8CE88424 */  addiu      $a0, $a0, %lo(debug_cause + 0x88)
/* B273C 800C1F3C 0D80033C */  lui        $v1, %hi(Vcount + 0x4)
/* B2740 800C1F40 B0E8638C */  lw         $v1, %lo(Vcount + 0x4)($v1)
/* B2744 800C1F44 00010224 */  addiu      $v0, $zero, 0x100
/* B2748 800C1F48 1000BFAF */  sw         $ra, 0x10($sp)
/* B274C 800C1F4C 000062AC */  sw         $v0, 0x0($v1)
/* B2750 800C1F50 0D80013C */  lui        $at, %hi(Vcount)
/* B2754 800C1F54 ACE820AC */  sw         $zero, %lo(Vcount)($at)
/* B2758 800C1F58 0808030C */  jal        func_800C2020
/* B275C 800C1F5C 08000524 */   addiu     $a1, $zero, 0x8
/* B2760 800C1F60 0C80053C */  lui        $a1, %hi(func_800C1F88)
/* B2764 800C1F64 881FA524 */  addiu      $a1, $a1, %lo(func_800C1F88)
/* B2768 800C1F68 ABE6020C */  jal        InterruptCallback
/* B276C 800C1F6C 21200000 */   addu      $a0, $zero, $zero
/* B2770 800C1F70 0C80023C */  lui        $v0, %hi(func_800C1FF4)
/* B2774 800C1F74 F41F4224 */  addiu      $v0, $v0, %lo(func_800C1FF4)
/* B2778 800C1F78 1000BF8F */  lw         $ra, 0x10($sp)
/* B277C 800C1F7C 1800BD27 */  addiu      $sp, $sp, 0x18
/* B2780 800C1F80 0800E003 */  jr         $ra
/* B2784 800C1F84 00000000 */   nop
.size startIntrVSync, . - startIntrVSync
