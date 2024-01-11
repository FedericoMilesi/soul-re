.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VWRAITH_Embrace
/* 7F71C 8008EF1C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7F720 8008EF20 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F724 8008EF24 1400BFAF */  sw         $ra, 0x14($sp)
/* 7F728 8008EF28 0E2F020C */  jal        MON_Embrace
/* 7F72C 8008EF2C 21808000 */   addu      $s0, $a0, $zero
/* 7F730 8008EF30 8B3B020C */  jal        VWRAITH_VerticalMove
/* 7F734 8008EF34 21200002 */   addu      $a0, $s0, $zero
/* 7F738 8008EF38 1400BF8F */  lw         $ra, 0x14($sp)
/* 7F73C 8008EF3C 1000B08F */  lw         $s0, 0x10($sp)
/* 7F740 8008EF40 0800E003 */  jr         $ra
/* 7F744 8008EF44 1800BD27 */   addiu     $sp, $sp, 0x18
.size VWRAITH_Embrace, . - VWRAITH_Embrace
