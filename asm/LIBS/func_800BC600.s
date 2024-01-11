.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC600
/* ACE00 800BC600 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* ACE04 800BC604 1000BFAF */  sw         $ra, 0x10($sp)
/* ACE08 800BC608 5EF2020C */  jal        VSync
/* ACE0C 800BC60C FFFF0424 */   addiu     $a0, $zero, -0x1
/* ACE10 800BC610 F0004224 */  addiu      $v0, $v0, 0xF0
/* ACE14 800BC614 0D80013C */  lui        $at, %hi(_qout + 0x10)
/* ACE18 800BC618 48DB22AC */  sw         $v0, %lo(_qout + 0x10)($at)
/* ACE1C 800BC61C 0D80013C */  lui        $at, %hi(_qout + 0x14)
/* ACE20 800BC620 4CDB20AC */  sw         $zero, %lo(_qout + 0x14)($at)
/* ACE24 800BC624 1000BF8F */  lw         $ra, 0x10($sp)
/* ACE28 800BC628 1800BD27 */  addiu      $sp, $sp, 0x18
/* ACE2C 800BC62C 0800E003 */  jr         $ra
/* ACE30 800BC630 00000000 */   nop
.size func_800BC600, . - func_800BC600
