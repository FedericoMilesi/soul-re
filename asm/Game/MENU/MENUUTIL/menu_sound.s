.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menu_sound
/* A8DBC 800B85BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8DC0 800B85C0 C0200400 */  sll        $a0, $a0, 3
/* A8DC4 800B85C4 0D80023C */  lui        $v0, %hi(the_menu_sounds)
/* A8DC8 800B85C8 7CC84224 */  addiu      $v0, $v0, %lo(the_menu_sounds)
/* A8DCC 800B85CC 21208200 */  addu       $a0, $a0, $v0
/* A8DD0 800B85D0 1000BFAF */  sw         $ra, 0x10($sp)
/* A8DD4 800B85D4 0400848C */  lw         $a0, 0x4($a0)
/* A8DD8 800B85D8 0E02010C */  jal        SndPlay
/* A8DDC 800B85DC 00000000 */   nop
/* A8DE0 800B85E0 1000BF8F */  lw         $ra, 0x10($sp)
/* A8DE4 800B85E4 00000000 */  nop
/* A8DE8 800B85E8 0800E003 */  jr         $ra
/* A8DEC 800B85EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size menu_sound, . - menu_sound
