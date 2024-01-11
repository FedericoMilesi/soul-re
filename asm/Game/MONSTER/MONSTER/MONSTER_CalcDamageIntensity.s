.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSTER_CalcDamageIntensity
/* 7C700 8008BF00 2310A400 */  subu       $v0, $a1, $a0
/* 7C704 8008BF04 00120200 */  sll        $v0, $v0, 8
/* 7C708 8008BF08 1A004500 */  div        $zero, $v0, $a1
/* 7C70C 8008BF0C 12100000 */  mflo       $v0
/* 7C710 8008BF10 0800E003 */  jr         $ra
/* 7C714 8008BF14 00000000 */   nop
.size MONSTER_CalcDamageIntensity, . - MONSTER_CalcDamageIntensity
