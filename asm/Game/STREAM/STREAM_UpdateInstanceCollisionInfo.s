.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_UpdateInstanceCollisionInfo
/* 4B11C 8005A91C FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4B120 8005A920 00000000 */  nop
/* 4B124 8005A924 0400438C */  lw         $v1, 0x4($v0)
/* 4B128 8005A928 00000000 */  nop
/* 4B12C 8005A92C 0A006010 */  beqz       $v1, .L8005A958
/* 4B130 8005A930 00000000 */   nop
.L8005A934:
/* 4B134 8005A934 0001628C */  lw         $v0, 0x100($v1)
/* 4B138 8005A938 00000000 */  nop
/* 4B13C 8005A93C 02004414 */  bne        $v0, $a0, .L8005A948
/* 4B140 8005A940 00000000 */   nop
/* 4B144 8005A944 000165AC */  sw         $a1, 0x100($v1)
.L8005A948:
/* 4B148 8005A948 0800638C */  lw         $v1, 0x8($v1)
/* 4B14C 8005A94C 00000000 */  nop
/* 4B150 8005A950 F8FF6014 */  bnez       $v1, .L8005A934
/* 4B154 8005A954 00000000 */   nop
.L8005A958:
/* 4B158 8005A958 0800E003 */  jr         $ra
/* 4B15C 8005A95C 00000000 */   nop
.size STREAM_UpdateInstanceCollisionInfo, . - STREAM_UpdateInstanceCollisionInfo
