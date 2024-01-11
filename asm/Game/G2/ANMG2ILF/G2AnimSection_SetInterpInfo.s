.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimSection_SetInterpInfo
/* 80924 80090124 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80928 80090128 1000BFAF */  sw         $ra, 0x10($sp)
/* 8092C 8009012C 0500A010 */  beqz       $a1, .L80090144
/* 80930 80090130 2C0085AC */   sw        $a1, 0x2C($a0)
/* 80934 80090134 2120A000 */  addu       $a0, $a1, $zero
/* 80938 80090138 21280000 */  addu       $a1, $zero, $zero
/* 8093C 8009013C 2EF2020C */  jal        memset
/* 80940 80090140 0C000624 */   addiu     $a2, $zero, 0xC
.L80090144:
/* 80944 80090144 1000BF8F */  lw         $ra, 0x10($sp)
/* 80948 80090148 00000000 */  nop
/* 8094C 8009014C 0800E003 */  jr         $ra
/* 80950 80090150 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2AnimSection_SetInterpInfo, . - G2AnimSection_SetInterpInfo
