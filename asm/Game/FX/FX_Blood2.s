.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Blood2
/* 39500 80048D00 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 39504 80048D04 3000A38F */  lw         $v1, 0x30($sp)
/* 39508 80048D08 04000224 */  addiu      $v0, $zero, 0x4
/* 3950C 80048D0C 1800BFAF */  sw         $ra, 0x18($sp)
/* 39510 80048D10 1400A2AF */  sw         $v0, 0x14($sp)
/* 39514 80048D14 F122010C */  jal        FX_Blood
/* 39518 80048D18 1000A3AF */   sw        $v1, 0x10($sp)
/* 3951C 80048D1C 1800BF8F */  lw         $ra, 0x18($sp)
/* 39520 80048D20 00000000 */  nop
/* 39524 80048D24 0800E003 */  jr         $ra
/* 39528 80048D28 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_Blood2, . - FX_Blood2
