.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_menus
/* 29704 80038F04 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 29708 80038F08 1400B1AF */  sw         $s1, 0x14($sp)
/* 2970C 80038F0C 21888000 */  addu       $s1, $a0, $zero
/* 29710 80038F10 1800BFAF */  sw         $ra, 0x18($sp)
/* 29714 80038F14 BEDD020C */  jal        menu_data_size
/* 29718 80038F18 1000B0AF */   sw        $s0, 0x10($sp)
/* 2971C 80038F1C 21204000 */  addu       $a0, $v0, $zero
/* 29720 80038F20 8140010C */  jal        MEMPACK_Malloc
/* 29724 80038F24 2D000524 */   addiu     $a1, $zero, 0x2D
/* 29728 80038F28 21804000 */  addu       $s0, $v0, $zero
/* 2972C 80038F2C 21200002 */  addu       $a0, $s0, $zero
/* 29730 80038F30 C0DD020C */  jal        menu_initialize
/* 29734 80038F34 21282002 */   addu      $a1, $s1, $zero
/* 29738 80038F38 200030AE */  sw         $s0, 0x20($s1)
/* 2973C 80038F3C 1800BF8F */  lw         $ra, 0x18($sp)
/* 29740 80038F40 1400B18F */  lw         $s1, 0x14($sp)
/* 29744 80038F44 1000B08F */  lw         $s0, 0x10($sp)
/* 29748 80038F48 0800E003 */  jr         $ra
/* 2974C 80038F4C 2000BD27 */   addiu     $sp, $sp, 0x20
.size init_menus, . - init_menus
