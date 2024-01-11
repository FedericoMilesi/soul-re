.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel screen_to_vram
/* 28DB4 800385B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 28DB8 800385B8 00010224 */  addiu      $v0, $zero, 0x100
/* 28DBC 800385BC 00320500 */  sll        $a2, $a1, 8
/* 28DC0 800385C0 21280000 */  addu       $a1, $zero, $zero
/* 28DC4 800385C4 00020724 */  addiu      $a3, $zero, 0x200
/* 28DC8 800385C8 1800BFAF */  sw         $ra, 0x18($sp)
/* 28DCC 800385CC 54E0000C */  jal        LOAD_LoadTIM2
/* 28DD0 800385D0 1000A2AF */   sw        $v0, 0x10($sp)
/* 28DD4 800385D4 1800BF8F */  lw         $ra, 0x18($sp)
/* 28DD8 800385D8 00000000 */  nop
/* 28DDC 800385DC 0800E003 */  jr         $ra
/* 28DE0 800385E0 2000BD27 */   addiu     $sp, $sp, 0x20
.size screen_to_vram, . - screen_to_vram
