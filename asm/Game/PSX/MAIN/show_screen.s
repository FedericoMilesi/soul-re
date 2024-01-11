.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel show_screen
/* 28DE4 800385E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 28DE8 800385E8 0B000524 */  addiu      $a1, $zero, 0xB
/* 28DEC 800385EC 1400BFAF */  sw         $ra, 0x14($sp)
/* 28DF0 800385F0 3E82010C */  jal        LOAD_ReadFile
/* 28DF4 800385F4 1000B0AF */   sw        $s0, 0x10($sp)
/* 28DF8 800385F8 21804000 */  addu       $s0, $v0, $zero
/* 28DFC 800385FC 06000012 */  beqz       $s0, .L80038618
/* 28E00 80038600 00000000 */   nop
/* 28E04 80038604 CCBD858F */  lw         $a1, %gp_rel(gameTrackerX + 0x4)($gp)
/* 28E08 80038608 6DE1000C */  jal        screen_to_vram
/* 28E0C 8003860C 21200002 */   addu      $a0, $s0, $zero
/* 28E10 80038610 2641010C */  jal        MEMPACK_Free
/* 28E14 80038614 21200002 */   addu      $a0, $s0, $zero
.L80038618:
/* 28E18 80038618 1400BF8F */  lw         $ra, 0x14($sp)
/* 28E1C 8003861C 1000B08F */  lw         $s0, 0x10($sp)
/* 28E20 80038620 0800E003 */  jr         $ra
/* 28E24 80038624 1800BD27 */   addiu     $sp, $sp, 0x18
.size show_screen, . - show_screen
