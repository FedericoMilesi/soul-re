.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel play_movie_dup1
/* A8FA0 800B87A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8FA4 800B87A4 1000B0AF */  sw         $s0, 0x10($sp)
/* A8FA8 800B87A8 1400BFAF */  sw         $ra, 0x14($sp)
/* A8FAC 800B87AC 39DD020C */  jal        CINE_Load
/* A8FB0 800B87B0 21808000 */   addu      $s0, $a0, $zero
/* A8FB4 800B87B4 08004010 */  beqz       $v0, .L800B87D8
/* A8FB8 800B87B8 21200002 */   addu      $a0, $s0, $zero
/* A8FBC 800B87BC FFFF0534 */  ori        $a1, $zero, 0xFFFF
/* A8FC0 800B87C0 20DD020C */  jal        CINE_Play
/* A8FC4 800B87C4 02000624 */   addiu     $a2, $zero, 0x2
/* A8FC8 800B87C8 66DD020C */  jal        CINE_Unload
/* A8FCC 800B87CC 00000000 */   nop
/* A8FD0 800B87D0 11E4000C */  jal        MAIN_InitVolume
/* A8FD4 800B87D4 00000000 */   nop
.L800B87D8:
/* A8FD8 800B87D8 1400BF8F */  lw         $ra, 0x14($sp)
/* A8FDC 800B87DC 1000B08F */  lw         $s0, 0x10($sp)
/* A8FE0 800B87E0 0800E003 */  jr         $ra
/* A8FE4 800B87E4 1800BD27 */   addiu     $sp, $sp, 0x18
.size play_movie_dup1, . - play_movie_dup1
