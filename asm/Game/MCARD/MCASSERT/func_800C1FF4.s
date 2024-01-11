.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1FF4
/* B27F4 800C1FF4 0D80023C */  lui        $v0, %hi(debug_cause + 0x88)
/* B27F8 800C1FF8 8CE84224 */  addiu      $v0, $v0, %lo(debug_cause + 0x88)
/* B27FC 800C1FFC 80200400 */  sll        $a0, $a0, 2
/* B2800 800C2000 21208200 */  addu       $a0, $a0, $v0
/* B2804 800C2004 0000828C */  lw         $v0, 0x0($a0)
/* B2808 800C2008 00000000 */  nop
/* B280C 800C200C 0200A210 */  beq        $a1, $v0, .L800C2018
/* B2810 800C2010 00000000 */   nop
/* B2814 800C2014 000085AC */  sw         $a1, 0x0($a0)
.L800C2018:
/* B2818 800C2018 0800E003 */  jr         $ra
/* B281C 800C201C 00000000 */   nop
.size func_800C1FF4, . - func_800C1FF4
