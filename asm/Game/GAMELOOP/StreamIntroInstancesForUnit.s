.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StreamIntroInstancesForUnit
/* 1F91C 8002F11C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1F920 8002F120 21288000 */  addu       $a1, $a0, $zero
/* 1F924 8002F124 1000BFAF */  sw         $ra, 0x10($sp)
/* 1F928 8002F128 0400A384 */  lh         $v1, 0x4($a1)
/* 1F92C 8002F12C 02000224 */  addiu      $v0, $zero, 0x2
/* 1F930 8002F130 06006214 */  bne        $v1, $v0, .L8002F14C
/* 1F934 8002F134 00000000 */   nop
/* 1F938 8002F138 0800A28C */  lw         $v0, 0x8($a1)
/* 1F93C 8002F13C 0000A58C */  lw         $a1, 0x0($a1)
/* 1F940 8002F140 0000448C */  lw         $a0, 0x0($v0)
/* 1F944 8002F144 CDF7000C */  jal        SBSP_IntroduceInstances
/* 1F948 8002F148 00000000 */   nop
.L8002F14C:
/* 1F94C 8002F14C 1000BF8F */  lw         $ra, 0x10($sp)
/* 1F950 8002F150 00000000 */  nop
/* 1F954 8002F154 0800E003 */  jr         $ra
/* 1F958 8002F158 1800BD27 */   addiu     $sp, $sp, 0x18
.size StreamIntroInstancesForUnit, . - StreamIntroInstancesForUnit
