.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_StreamLoadObjectAbort
/* 49B20 80059320 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 49B24 80059324 1000B0AF */  sw         $s0, 0x10($sp)
/* 49B28 80059328 2180A000 */  addu       $s0, $a1, $zero
/* 49B2C 8005932C 03008010 */  beqz       $a0, .L8005933C
/* 49B30 80059330 1400BFAF */   sw        $ra, 0x14($sp)
/* 49B34 80059334 2641010C */  jal        MEMPACK_Free
/* 49B38 80059338 00000000 */   nop
.L8005933C:
/* 49B3C 8005933C 140000A6 */  sh         $zero, 0x14($s0)
/* 49B40 80059340 1400BF8F */  lw         $ra, 0x14($sp)
/* 49B44 80059344 1000B08F */  lw         $s0, 0x10($sp)
/* 49B48 80059348 0800E003 */  jr         $ra
/* 49B4C 8005934C 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_StreamLoadObjectAbort, . - STREAM_StreamLoadObjectAbort
