.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_LoadTIM2
/* 28950 80038150 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28954 80038154 1000A5A7 */  sh         $a1, 0x10($sp)
/* 28958 80038158 08008524 */  addiu      $a1, $a0, 0x8
/* 2895C 8003815C 1800BFAF */  sw         $ra, 0x18($sp)
/* 28960 80038160 1200A6A7 */  sh         $a2, 0x12($sp)
/* 28964 80038164 0800A294 */  lhu        $v0, 0x8($a1)
/* 28968 80038168 1000A427 */  addiu      $a0, $sp, 0x10
/* 2896C 8003816C 1400A2A7 */  sh         $v0, 0x14($sp)
/* 28970 80038170 0A00A294 */  lhu        $v0, 0xA($a1)
/* 28974 80038174 0C00A524 */  addiu      $a1, $a1, 0xC
/* 28978 80038178 94E9020C */  jal        LoadImage
/* 2897C 8003817C 1600A2A7 */   sh        $v0, 0x16($sp)
/* 28980 80038180 0FE9020C */  jal        DrawSync
/* 28984 80038184 21200000 */   addu      $a0, $zero, $zero
/* 28988 80038188 1800BF8F */  lw         $ra, 0x18($sp)
/* 2898C 8003818C 00000000 */  nop
/* 28990 80038190 0800E003 */  jr         $ra
/* 28994 80038194 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_LoadTIM2, . - LOAD_LoadTIM2
