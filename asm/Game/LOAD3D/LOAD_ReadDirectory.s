.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_ReadDirectory
/* 2826C 80037A6C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 28270 80037A70 1800B0AF */  sw         $s0, 0x18($sp)
/* 28274 80037A74 21808000 */  addu       $s0, $a0, $zero
/* 28278 80037A78 2400BFAF */  sw         $ra, 0x24($sp)
/* 2827C 80037A7C 2000B2AF */  sw         $s2, 0x20($sp)
/* 28280 80037A80 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 28284 80037A84 02001186 */  lh         $s1, 0x2($s0)
/* 28288 80037A88 2C000524 */  addiu      $a1, $zero, 0x2C
/* 2828C 80037A8C 00891100 */  sll        $s1, $s1, 4
/* 28290 80037A90 04003126 */  addiu      $s1, $s1, 0x4
/* 28294 80037A94 8140010C */  jal        MEMPACK_Malloc
/* 28298 80037A98 21202002 */   addu      $a0, $s1, $zero
/* 2829C 80037A9C 21904000 */  addu       $s2, $v0, $zero
/* 282A0 80037AA0 21284002 */  addu       $a1, $s2, $zero
/* 282A4 80037AA4 21302002 */  addu       $a2, $s1, $zero
/* 282A8 80037AA8 1000A0AF */  sw         $zero, 0x10($sp)
/* 282AC 80037AAC 0400048E */  lw         $a0, 0x4($s0)
/* 282B0 80037AB0 90DE000C */  jal        LOAD_CdReadFromBigFile
/* 282B4 80037AB4 21380000 */   addu      $a3, $zero, $zero
/* 282B8 80037AB8 21104002 */  addu       $v0, $s2, $zero
/* 282BC 80037ABC 2400BF8F */  lw         $ra, 0x24($sp)
/* 282C0 80037AC0 2000B28F */  lw         $s2, 0x20($sp)
/* 282C4 80037AC4 1C00B18F */  lw         $s1, 0x1C($sp)
/* 282C8 80037AC8 1800B08F */  lw         $s0, 0x18($sp)
/* 282CC 80037ACC 0800E003 */  jr         $ra
/* 282D0 80037AD0 2800BD27 */   addiu     $sp, $sp, 0x28
.size LOAD_ReadDirectory, . - LOAD_ReadDirectory
