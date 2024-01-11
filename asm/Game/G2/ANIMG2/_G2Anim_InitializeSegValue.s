.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_InitializeSegValue
/* 84C88 80094488 0010033C */  lui        $v1, (0x10001000 >> 16)
/* 84C8C 8009448C 00106334 */  ori        $v1, $v1, (0x10001000 & 0xFFFF)
/* 84C90 80094490 0010023C */  lui        $v0, (0x10000000 >> 16)
/* 84C94 80094494 0400A2AC */  sw         $v0, 0x4($a1)
/* 84C98 80094498 00100224 */  addiu      $v0, $zero, 0x1000
/* 84C9C 8009449C 0800A3AC */  sw         $v1, 0x8($a1)
/* 84CA0 800944A0 40180600 */  sll        $v1, $a2, 1
/* 84CA4 800944A4 0000A0AC */  sw         $zero, 0x0($a1)
/* 84CA8 800944A8 0C00A2A4 */  sh         $v0, 0xC($a1)
/* 84CAC 800944AC 1000828C */  lw         $v0, 0x10($a0)
/* 84CB0 800944B0 21186600 */  addu       $v1, $v1, $a2
/* 84CB4 800944B4 1C00428C */  lw         $v0, 0x1C($v0)
/* 84CB8 800944B8 C0180300 */  sll        $v1, $v1, 3
/* 84CBC 800944BC 21104300 */  addu       $v0, $v0, $v1
/* 84CC0 800944C0 0C00438C */  lw         $v1, 0xC($v0)
/* 84CC4 800944C4 1000428C */  lw         $v0, 0x10($v0)
/* 84CC8 800944C8 00000000 */  nop
/* 84CCC 800944CC FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 84CD0 800944D0 1000A3AC */  sw         $v1, 0x10($a1)
/* 84CD4 800944D4 0800E003 */  jr         $ra
/* 84CD8 800944D8 1400A2AC */   sw        $v0, 0x14($a1)
.size _G2Anim_InitializeSegValue, . - _G2Anim_InitializeSegValue
