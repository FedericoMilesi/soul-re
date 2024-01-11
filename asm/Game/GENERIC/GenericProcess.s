.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GenericProcess
/* 2F0E4 8003E8E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2F0E8 8003E8E8 1000BFAF */  sw         $ra, 0x10($sp)
/* 2F0EC 8003E8EC 1C00838C */  lw         $v1, 0x1C($a0)
/* 2F0F0 8003E8F0 00000000 */  nop
/* 2F0F4 8003E8F4 0C006010 */  beqz       $v1, .L8003E928
/* 2F0F8 8003E8F8 00000000 */   nop
/* 2F0FC 8003E8FC 0A006284 */  lh         $v0, 0xA($v1)
/* 2F100 8003E900 00000000 */  nop
/* 2F104 8003E904 08004010 */  beqz       $v0, .L8003E928
/* 2F108 8003E908 00000000 */   nop
/* 2F10C 8003E90C 2C00628C */  lw         $v0, 0x2C($v1)
/* 2F110 8003E910 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 2F114 8003E914 24104300 */  and        $v0, $v0, $v1
/* 2F118 8003E918 03004014 */  bnez       $v0, .L8003E928
/* 2F11C 8003E91C 00000000 */   nop
/* 2F120 8003E920 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 2F124 8003E924 00000000 */   nop
.L8003E928:
/* 2F128 8003E928 1000BF8F */  lw         $ra, 0x10($sp)
/* 2F12C 8003E92C 00000000 */  nop
/* 2F130 8003E930 0800E003 */  jr         $ra
/* 2F134 8003E934 1800BD27 */   addiu     $sp, $sp, 0x18
.size GenericProcess, . - GenericProcess
