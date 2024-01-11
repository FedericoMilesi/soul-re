.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_start_game
/* A8EC8 800B86C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8ECC 800B86CC 1000B0AF */  sw         $s0, 0x10($sp)
/* A8ED0 800B86D0 21808000 */  addu       $s0, $a0, $zero
/* A8ED4 800B86D4 05000224 */  addiu      $v0, $zero, 0x5
/* A8ED8 800B86D8 0F00C214 */  bne        $a2, $v0, .L800B8718
/* A8EDC 800B86DC 1400BFAF */   sw        $ra, 0x14($sp)
/* A8EE0 800B86E0 2400048E */  lw         $a0, 0x24($s0)
/* A8EE4 800B86E4 67E5020C */  jal        MEMCARD_IsWrongVersion
/* A8EE8 800B86E8 00000000 */   nop
/* A8EEC 800B86EC 06004014 */  bnez       $v0, .L800B8708
/* A8EF0 800B86F0 0C80053C */   lui       $a1, %hi(memcard_main_menu)
/* A8EF4 800B86F4 2000048E */  lw         $a0, 0x20($s0)
/* A8EF8 800B86F8 EEDD020C */  jal        menu_push
/* A8EFC 800B86FC 4898A524 */   addiu     $a1, $a1, %lo(memcard_main_menu)
/* A8F00 800B8700 C7E10208 */  j          .L800B871C
/* A8F04 800B8704 01000224 */   addiu     $v0, $zero, 0x1
.L800B8708:
/* A8F08 800B8708 AFE4000C */  jal        MAIN_StartGame
/* A8F0C 800B870C 00000000 */   nop
/* A8F10 800B8710 C7E10208 */  j          .L800B871C
/* A8F14 800B8714 01000224 */   addiu     $v0, $zero, 0x1
.L800B8718:
/* A8F18 800B8718 21100000 */  addu       $v0, $zero, $zero
.L800B871C:
/* A8F1C 800B871C 1400BF8F */  lw         $ra, 0x14($sp)
/* A8F20 800B8720 1000B08F */  lw         $s0, 0x10($sp)
/* A8F24 800B8724 0800E003 */  jr         $ra
/* A8F28 800B8728 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_start_game, . - do_start_game
