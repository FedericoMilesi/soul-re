.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Die
/* 32E40 80042640 BCC3828F */  lw         $v0, %gp_rel(FX_LastUsedPrim)($gp)
/* 32E44 80042644 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 32E48 80042648 1000B0AF */  sw         $s0, 0x10($sp)
/* 32E4C 8004264C 21808000 */  addu       $s0, $a0, $zero
/* 32E50 80042650 1400B1AF */  sw         $s1, 0x14($sp)
/* 32E54 80042654 2188A000 */  addu       $s1, $a1, $zero
/* 32E58 80042658 08005014 */  bne        $v0, $s0, .L8004267C
/* 32E5C 8004265C 1800BFAF */   sw        $ra, 0x18($sp)
/* 32E60 80042660 0000028E */  lw         $v0, 0x0($s0)
/* 32E64 80042664 00000000 */  nop
/* 32E68 80042668 0000438C */  lw         $v1, 0x0($v0)
/* 32E6C 8004266C BCC382AF */  sw         $v0, %gp_rel(FX_LastUsedPrim)($gp)
/* 32E70 80042670 02006014 */  bnez       $v1, .L8004267C
/* 32E74 80042674 00000000 */   nop
/* 32E78 80042678 BCC380AF */  sw         $zero, %gp_rel(FX_LastUsedPrim)($gp)
.L8004267C:
/* 32E7C 8004267C 0C00028E */  lw         $v0, 0xC($s0)
/* 32E80 80042680 21200002 */  addu       $a0, $s0, $zero
/* 32E84 80042684 10004234 */  ori        $v0, $v0, 0x10
/* 32E88 80042688 E03E010C */  jal        LIST_DeleteFunc
/* 32E8C 8004268C 0C0002AE */   sw        $v0, 0xC($s0)
/* 32E90 80042690 A06D2426 */  addiu      $a0, $s1, 0x6DA0
/* 32E94 80042694 D53E010C */  jal        LIST_InsertFunc
/* 32E98 80042698 21280002 */   addu      $a1, $s0, $zero
/* 32E9C 8004269C 1800BF8F */  lw         $ra, 0x18($sp)
/* 32EA0 800426A0 1400B18F */  lw         $s1, 0x14($sp)
/* 32EA4 800426A4 1000B08F */  lw         $s0, 0x10($sp)
/* 32EA8 800426A8 0800E003 */  jr         $ra
/* 32EAC 800426AC 2000BD27 */   addiu     $sp, $sp, 0x20
.size FX_Die, . - FX_Die
