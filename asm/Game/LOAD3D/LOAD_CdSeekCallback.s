.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CdSeekCallback
/* 27AF8 800372F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 27AFC 800372FC C0BB838F */  lw         $v1, %gp_rel(loadStatus + 0x2C)($gp)
/* 27B00 80037300 01000224 */  addiu      $v0, $zero, 0x1
/* 27B04 80037304 0B006214 */  bne        $v1, $v0, .L80037334
/* 27B08 80037308 1000BFAF */   sw        $ra, 0x10($sp)
/* 27B0C 8003730C 02000224 */  addiu      $v0, $zero, 0x2
/* 27B10 80037310 00F2043C */  lui        $a0, (0xF2000000 >> 16)
/* 27B14 80037314 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27B18 80037318 EBF4020C */  jal        GetRCnt
/* 27B1C 8003731C 00000000 */   nop
/* 27B20 80037320 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 27B24 80037324 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 27B28 80037328 001C0300 */  sll        $v1, $v1, 16
/* 27B2C 8003732C 25104300 */  or         $v0, $v0, $v1
/* 27B30 80037330 34BC82AF */  sw         $v0, %gp_rel(crap1)($gp)
.L80037334:
/* 27B34 80037334 1000BF8F */  lw         $ra, 0x10($sp)
/* 27B38 80037338 00000000 */  nop
/* 27B3C 8003733C 0800E003 */  jr         $ra
/* 27B40 80037340 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_CdSeekCallback, . - LOAD_CdSeekCallback
