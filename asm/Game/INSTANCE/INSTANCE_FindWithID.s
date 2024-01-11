.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_FindWithID
/* 24FF0 800347F0 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 24FF4 800347F4 00000000 */  nop
/* 24FF8 800347F8 0400438C */  lw         $v1, 0x4($v0)
/* 24FFC 800347FC 00000000 */  nop
/* 25000 80034800 09006010 */  beqz       $v1, .L80034828
/* 25004 80034804 21280000 */   addu      $a1, $zero, $zero
.L80034808:
/* 25008 80034808 3C00628C */  lw         $v0, 0x3C($v1)
/* 2500C 8003480C 0800638C */  lw         $v1, 0x8($v1)
/* 25010 80034810 03004414 */  bne        $v0, $a0, .L80034820
/* 25014 80034814 00000000 */   nop
/* 25018 80034818 0AD20008 */  j          .L80034828
/* 2501C 8003481C 01000524 */   addiu     $a1, $zero, 0x1
.L80034820:
/* 25020 80034820 F9FF6014 */  bnez       $v1, .L80034808
/* 25024 80034824 00000000 */   nop
.L80034828:
/* 25028 80034828 0800E003 */  jr         $ra
/* 2502C 8003482C 2110A000 */   addu      $v0, $a1, $zero
.size INSTANCE_FindWithID, . - INSTANCE_FindWithID
