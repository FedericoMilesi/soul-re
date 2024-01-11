.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel musicEndCallbackFunc
/* 3113C 8004093C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31140 80040940 1400BFAF */  sw         $ra, 0x14($sp)
/* 31144 80040944 1100A014 */  bnez       $a1, .L8004098C
/* 31148 80040948 1000B0AF */   sw        $s0, 0x10($sp)
/* 3114C 8004094C 21200000 */  addu       $a0, $zero, $zero
/* 31150 80040950 1B53010C */  jal        aadInstallEndSequenceCallback
/* 31154 80040954 21288000 */   addu      $a1, $a0, $zero
/* 31158 80040958 38C3848F */  lw         $a0, %gp_rel(musicInfo + 0xC)($gp)
/* 3115C 8004095C 21280000 */  addu       $a1, $zero, $zero
/* 31160 80040960 38C39027 */  addiu      $s0, $gp, %gp_rel(musicInfo + 0xC)
/* 31164 80040964 7C51010C */  jal        aadAssignDynamicSequence
/* 31168 80040968 2130A000 */   addu      $a2, $a1, $zero
/* 3116C 8004096C 06004014 */  bnez       $v0, .L80040988
/* 31170 80040970 00000000 */   nop
/* 31174 80040974 F451010C */  jal        aadStartSlot
/* 31178 80040978 21200000 */   addu      $a0, $zero, $zero
/* 3117C 8004097C 30C3828F */  lw         $v0, %gp_rel(musicInfo + 0x4)($gp)
/* 31180 80040980 63020108 */  j          .L8004098C
/* 31184 80040984 F4FF02AE */   sw        $v0, -0xC($s0)
.L80040988:
/* 31188 80040988 F4FF00AE */  sw         $zero, -0xC($s0)
.L8004098C:
/* 3118C 8004098C 1400BF8F */  lw         $ra, 0x14($sp)
/* 31190 80040990 1000B08F */  lw         $s0, 0x10($sp)
/* 31194 80040994 0800E003 */  jr         $ra
/* 31198 80040998 1800BD27 */   addiu     $sp, $sp, 0x18
.size musicEndCallbackFunc, . - musicEndCallbackFunc
