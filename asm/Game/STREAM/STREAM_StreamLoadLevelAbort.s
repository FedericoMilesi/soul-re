.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_StreamLoadLevelAbort
/* 4A7CC 80059FCC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4A7D0 80059FD0 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A7D4 80059FD4 2180C000 */  addu       $s0, $a2, $zero
/* 4A7D8 80059FD8 03008010 */  beqz       $a0, .L80059FE8
/* 4A7DC 80059FDC 1400BFAF */   sw        $ra, 0x14($sp)
/* 4A7E0 80059FE0 2641010C */  jal        MEMPACK_Free
/* 4A7E4 80059FE4 00000000 */   nop
.L80059FE8:
/* 4A7E8 80059FE8 080000AE */  sw         $zero, 0x8($s0)
/* 4A7EC 80059FEC 040000A6 */  sh         $zero, 0x4($s0)
/* 4A7F0 80059FF0 060000A6 */  sh         $zero, 0x6($s0)
/* 4A7F4 80059FF4 1400BF8F */  lw         $ra, 0x14($sp)
/* 4A7F8 80059FF8 1000B08F */  lw         $s0, 0x10($sp)
/* 4A7FC 80059FFC 0800E003 */  jr         $ra
/* 4A800 8005A000 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_StreamLoadLevelAbort, . - STREAM_StreamLoadLevelAbort
