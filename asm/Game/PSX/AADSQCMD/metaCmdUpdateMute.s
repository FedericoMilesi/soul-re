.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdUpdateMute
/* 46C54 80056454 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46C58 80056458 1400B1AF */  sw         $s1, 0x14($sp)
/* 46C5C 8005645C 2188A000 */  addu       $s1, $a1, $zero
/* 46C60 80056460 1800BFAF */  sw         $ra, 0x18($sp)
/* 46C64 80056464 1000B0AF */  sw         $s0, 0x10($sp)
/* 46C68 80056468 07008290 */  lbu        $v0, 0x7($a0)
/* 46C6C 8005646C 06008390 */  lbu        $v1, 0x6($a0)
/* 46C70 80056470 3805248E */  lw         $a0, 0x538($s1)
/* 46C74 80056474 00120200 */  sll        $v0, $v0, 8
/* 46C78 80056478 25804300 */  or         $s0, $v0, $v1
/* 46C7C 8005647C 44058294 */  lhu        $v0, 0x544($a0)
/* 46C80 80056480 27181000 */  nor        $v1, $zero, $s0
/* 46C84 80056484 24104300 */  and        $v0, $v0, $v1
/* 46C88 80056488 440582A4 */  sh         $v0, 0x544($a0)
/* 46C8C 8005648C 3805248E */  lw         $a0, 0x538($s1)
/* 46C90 80056490 00000000 */  nop
/* 46C94 80056494 46058294 */  lhu        $v0, 0x546($a0)
/* 46C98 80056498 00000000 */  nop
/* 46C9C 8005649C 24285000 */  and        $a1, $v0, $s0
/* 46CA0 800564A0 0400A010 */  beqz       $a1, .L800564B4
/* 46CA4 800564A4 00000000 */   nop
/* 46CA8 800564A8 D652010C */  jal        aadMuteChannels
/* 46CAC 800564AC 00000000 */   nop
/* 46CB0 800564B0 3805248E */  lw         $a0, 0x538($s1)
.L800564B4:
/* 46CB4 800564B4 00000000 */  nop
/* 46CB8 800564B8 48058294 */  lhu        $v0, 0x548($a0)
/* 46CBC 800564BC 00000000 */  nop
/* 46CC0 800564C0 24285000 */  and        $a1, $v0, $s0
/* 46CC4 800564C4 0300A010 */  beqz       $a1, .L800564D4
/* 46CC8 800564C8 00000000 */   nop
/* 46CCC 800564CC 0D53010C */  jal        aadUnMuteChannels
/* 46CD0 800564D0 00000000 */   nop
.L800564D4:
/* 46CD4 800564D4 1800BF8F */  lw         $ra, 0x18($sp)
/* 46CD8 800564D8 1400B18F */  lw         $s1, 0x14($sp)
/* 46CDC 800564DC 1000B08F */  lw         $s0, 0x10($sp)
/* 46CE0 800564E0 0800E003 */  jr         $ra
/* 46CE4 800564E4 2000BD27 */   addiu     $sp, $sp, 0x20
.size metaCmdUpdateMute, . - metaCmdUpdateMute
