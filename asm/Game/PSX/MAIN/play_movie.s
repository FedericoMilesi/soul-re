.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel play_movie
/* 28E28 80038628 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28E2C 8003862C 1000B0AF */  sw         $s0, 0x10($sp)
/* 28E30 80038630 1400BFAF */  sw         $ra, 0x14($sp)
/* 28E34 80038634 39DD020C */  jal        CINE_Load
/* 28E38 80038638 21808000 */   addu      $s0, $a0, $zero
/* 28E3C 8003863C 08004010 */  beqz       $v0, .L80038660
/* 28E40 80038640 21200002 */   addu      $a0, $s0, $zero
/* 28E44 80038644 FFFF0534 */  ori        $a1, $zero, 0xFFFF
/* 28E48 80038648 20DD020C */  jal        CINE_Play
/* 28E4C 8003864C 02000624 */   addiu     $a2, $zero, 0x2
/* 28E50 80038650 3EE1000C */  jal        ClearDisplay
/* 28E54 80038654 00000000 */   nop
/* 28E58 80038658 66DD020C */  jal        CINE_Unload
/* 28E5C 8003865C 00000000 */   nop
.L80038660:
/* 28E60 80038660 1400BF8F */  lw         $ra, 0x14($sp)
/* 28E64 80038664 1000B08F */  lw         $s0, 0x10($sp)
/* 28E68 80038668 0800E003 */  jr         $ra
/* 28E6C 8003866C 1800BD27 */   addiu     $sp, $sp, 0x18
.size play_movie, . - play_movie
