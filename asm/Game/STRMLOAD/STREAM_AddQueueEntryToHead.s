.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_AddQueueEntryToHead
/* 50900 80060100 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 50904 80060104 1000B0AF */  sw         $s0, 0x10($sp)
/* 50908 80060108 40CB908F */  lw         $s0, %gp_rel(loadFree)($gp)
/* 5090C 8006010C 00000000 */  nop
/* 50910 80060110 04000016 */  bnez       $s0, .L80060124
/* 50914 80060114 1400BFAF */   sw        $ra, 0x14($sp)
/* 50918 80060118 0D80043C */  lui        $a0, %hi(gCurDir + 0x4)
/* 5091C 8006011C 2B52000C */  jal        DEBUG_FatalError
/* 50920 80060120 80198424 */   addiu     $a0, $a0, %lo(gCurDir + 0x4)
.L80060124:
/* 50924 80060124 0000028E */  lw         $v0, 0x0($s0)
/* 50928 80060128 44CB848F */  lw         $a0, %gp_rel(loadHead)($gp)
/* 5092C 8006012C 40CB82AF */  sw         $v0, %gp_rel(loadFree)($gp)
/* 50930 80060130 0B008010 */  beqz       $a0, .L80060160
/* 50934 80060134 01000224 */   addiu     $v0, $zero, 0x1
/* 50938 80060138 04008384 */  lh         $v1, 0x4($a0)
/* 5093C 8006013C 00000000 */  nop
/* 50940 80060140 07006210 */  beq        $v1, $v0, .L80060160
/* 50944 80060144 05000224 */   addiu     $v0, $zero, 0x5
/* 50948 80060148 05006210 */  beq        $v1, $v0, .L80060160
/* 5094C 8006014C 0A000224 */   addiu     $v0, $zero, 0xA
/* 50950 80060150 03006210 */  beq        $v1, $v0, .L80060160
/* 50954 80060154 08000224 */   addiu     $v0, $zero, 0x8
/* 50958 80060158 05006214 */  bne        $v1, $v0, .L80060170
/* 5095C 8006015C 00000000 */   nop
.L80060160:
/* 50960 80060160 44CB828F */  lw         $v0, %gp_rel(loadHead)($gp)
/* 50964 80060164 44CB90AF */  sw         $s0, %gp_rel(loadHead)($gp)
/* 50968 80060168 60800108 */  j          .L80060180
/* 5096C 8006016C 000002AE */   sw        $v0, 0x0($s0)
.L80060170:
/* 50970 80060170 0000828C */  lw         $v0, 0x0($a0)
/* 50974 80060174 00000000 */  nop
/* 50978 80060178 000002AE */  sw         $v0, 0x0($s0)
/* 5097C 8006017C 000090AC */  sw         $s0, 0x0($a0)
.L80060180:
/* 50980 80060180 48CB828F */  lw         $v0, %gp_rel(loadTail)($gp)
/* 50984 80060184 00000000 */  nop
/* 50988 80060188 02004014 */  bnez       $v0, .L80060194
/* 5098C 8006018C 00000000 */   nop
/* 50990 80060190 48CB90AF */  sw         $s0, %gp_rel(loadTail)($gp)
.L80060194:
/* 50994 80060194 4CCB828F */  lw         $v0, %gp_rel(numLoads)($gp)
/* 50998 80060198 1400BF8F */  lw         $ra, 0x14($sp)
/* 5099C 8006019C 01004224 */  addiu      $v0, $v0, 0x1
/* 509A0 800601A0 4CCB82AF */  sw         $v0, %gp_rel(numLoads)($gp)
/* 509A4 800601A4 21100002 */  addu       $v0, $s0, $zero
/* 509A8 800601A8 1000B08F */  lw         $s0, 0x10($sp)
/* 509AC 800601AC 0800E003 */  jr         $ra
/* 509B0 800601B0 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_AddQueueEntryToHead, . - STREAM_AddQueueEntryToHead
