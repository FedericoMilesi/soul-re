.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD414
/* ADC14 800BD414 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* ADC18 800BD418 80200400 */  sll        $a0, $a0, 2
/* ADC1C 800BD41C 0D80053C */  lui        $a1, %hi(ratan_tbl + 0x810)
/* ADC20 800BD420 8CE3A58C */  lw         $a1, %lo(ratan_tbl + 0x810)($a1)
/* ADC24 800BD424 0D80023C */  lui        $v0, %hi(ratan_tbl + 0x818)
/* ADC28 800BD428 21104400 */  addu       $v0, $v0, $a0
/* ADC2C 800BD42C 94E3428C */  lw         $v0, %lo(ratan_tbl + 0x818)($v0)
/* ADC30 800BD430 0400A38C */  lw         $v1, 0x4($a1)
/* ADC34 800BD434 27100200 */  nor        $v0, $zero, $v0
/* ADC38 800BD438 24186200 */  and        $v1, $v1, $v0
/* ADC3C 800BD43C 01000224 */  addiu      $v0, $zero, 0x1
/* ADC40 800BD440 0800E003 */  jr         $ra
/* ADC44 800BD444 0400A3AC */   sw        $v1, 0x4($a1)
.size func_800BD414, . - func_800BD414
