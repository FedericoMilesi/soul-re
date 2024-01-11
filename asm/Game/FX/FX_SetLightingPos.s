.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_SetLightingPos
/* 3D394 8004CB94 1000A38F */  lw         $v1, 0x10($sp)
/* 3D398 8004CB98 1800A88F */  lw         $t0, 0x18($sp)
/* 3D39C 8004CB9C 27008010 */  beqz       $a0, .L8004CC3C
/* 3D3A0 8004CBA0 00000000 */   nop
/* 3D3A4 8004CBA4 0B00A010 */  beqz       $a1, .L8004CBD4
/* 3D3A8 8004CBA8 00000000 */   nop
/* 3D3AC 8004CBAC 05006010 */  beqz       $v1, .L8004CBC4
/* 3D3B0 8004CBB0 01000224 */   addiu     $v0, $zero, 0x1
/* 3D3B4 8004CBB4 0D0080A0 */  sb         $zero, 0xD($a0)
/* 3D3B8 8004CBB8 080085AC */  sw         $a1, 0x8($a0)
/* 3D3BC 8004CBBC F3320108 */  j          .L8004CBCC
/* 3D3C0 8004CBC0 1C0083AC */   sw        $v1, 0x1C($a0)
.L8004CBC4:
/* 3D3C4 8004CBC4 0D0082A0 */  sb         $v0, 0xD($a0)
/* 3D3C8 8004CBC8 080085AC */  sw         $a1, 0x8($a0)
.L8004CBCC:
/* 3D3CC 8004CBCC 0400A014 */  bnez       $a1, .L8004CBE0
/* 3D3D0 8004CBD0 00000000 */   nop
.L8004CBD4:
/* 3D3D4 8004CBD4 02006014 */  bnez       $v1, .L8004CBE0
/* 3D3D8 8004CBD8 02000224 */   addiu     $v0, $zero, 0x2
/* 3D3DC 8004CBDC 0D0082A0 */  sb         $v0, 0xD($a0)
.L8004CBE0:
/* 3D3E0 8004CBE0 0700E010 */  beqz       $a3, .L8004CC00
/* 3D3E4 8004CBE4 00000000 */   nop
/* 3D3E8 8004CBE8 0300E988 */  lwl        $t1, 0x3($a3)
/* 3D3EC 8004CBEC 0000E998 */  lwr        $t1, 0x0($a3)
/* 3D3F0 8004CBF0 0400EA84 */  lh         $t2, 0x4($a3)
/* 3D3F4 8004CBF4 170089A8 */  swl        $t1, 0x17($a0)
/* 3D3F8 8004CBF8 140089B8 */  swr        $t1, 0x14($a0)
/* 3D3FC 8004CBFC 18008AA4 */  sh         $t2, 0x18($a0)
.L8004CC00:
/* 3D400 8004CC00 07000011 */  beqz       $t0, .L8004CC20
/* 3D404 8004CC04 00000000 */   nop
/* 3D408 8004CC08 03000989 */  lwl        $t1, 0x3($t0)
/* 3D40C 8004CC0C 00000999 */  lwr        $t1, 0x0($t0)
/* 3D410 8004CC10 04000A85 */  lh         $t2, 0x4($t0)
/* 3D414 8004CC14 230089A8 */  swl        $t1, 0x23($a0)
/* 3D418 8004CC18 200089B8 */  swr        $t1, 0x20($a0)
/* 3D41C 8004CC1C 24008AA4 */  sh         $t2, 0x24($a0)
.L8004CC20:
/* 3D420 8004CC20 1A0086A4 */  sh         $a2, 0x1A($a0)
/* 3D424 8004CC24 1400A28F */  lw         $v0, 0x14($sp)
/* 3D428 8004CC28 00000000 */  nop
/* 3D42C 8004CC2C 260082A4 */  sh         $v0, 0x26($a0)
/* 3D430 8004CC30 1C00A28F */  lw         $v0, 0x1C($sp)
/* 3D434 8004CC34 00000000 */  nop
/* 3D438 8004CC38 280082A4 */  sh         $v0, 0x28($a0)
.L8004CC3C:
/* 3D43C 8004CC3C 0800E003 */  jr         $ra
/* 3D440 8004CC40 00000000 */   nop
.size FX_SetLightingPos, . - FX_SetLightingPos
