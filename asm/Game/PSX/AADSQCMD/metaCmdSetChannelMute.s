.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelMute
/* 46BDC 800563DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46BE0 800563E0 21108000 */  addu       $v0, $a0, $zero
/* 46BE4 800563E4 1400B1AF */  sw         $s1, 0x14($sp)
/* 46BE8 800563E8 2188A000 */  addu       $s1, $a1, $zero
/* 46BEC 800563EC 1800BFAF */  sw         $ra, 0x18($sp)
/* 46BF0 800563F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 46BF4 800563F4 3805248E */  lw         $a0, 0x538($s1)
/* 46BF8 800563F8 07005090 */  lbu        $s0, 0x7($v0)
/* 46BFC 800563FC 06004290 */  lbu        $v0, 0x6($v0)
/* 46C00 80056400 00821000 */  sll        $s0, $s0, 8
/* 46C04 80056404 25800202 */  or         $s0, $s0, $v0
/* 46C08 80056408 0D53010C */  jal        aadUnMuteChannels
/* 46C0C 8005640C 27281000 */   nor       $a1, $zero, $s0
/* 46C10 80056410 3805248E */  lw         $a0, 0x538($s1)
/* 46C14 80056414 D652010C */  jal        aadMuteChannels
/* 46C18 80056418 21280002 */   addu      $a1, $s0, $zero
/* 46C1C 8005641C 1800BF8F */  lw         $ra, 0x18($sp)
/* 46C20 80056420 1400B18F */  lw         $s1, 0x14($sp)
/* 46C24 80056424 1000B08F */  lw         $s0, 0x10($sp)
/* 46C28 80056428 0800E003 */  jr         $ra
/* 46C2C 8005642C 2000BD27 */   addiu     $sp, $sp, 0x20
.size metaCmdSetChannelMute, . - metaCmdSetChannelMute
