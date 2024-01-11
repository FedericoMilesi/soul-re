.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_SetInstancePosition
/* 4CB88 8005C388 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4CB8C 8005C38C 1800BFAF */  sw         $ra, 0x18($sp)
/* 4CB90 8005C390 0000A294 */  lhu        $v0, 0x0($a1)
/* 4CB94 8005C394 5C008394 */  lhu        $v1, 0x5C($a0)
/* 4CB98 8005C398 00000000 */  nop
/* 4CB9C 8005C39C 23104300 */  subu       $v0, $v0, $v1
/* 4CBA0 8005C3A0 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4CBA4 8005C3A4 0200A294 */  lhu        $v0, 0x2($a1)
/* 4CBA8 8005C3A8 5E008394 */  lhu        $v1, 0x5E($a0)
/* 4CBAC 8005C3AC 21300000 */  addu       $a2, $zero, $zero
/* 4CBB0 8005C3B0 23104300 */  subu       $v0, $v0, $v1
/* 4CBB4 8005C3B4 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4CBB8 8005C3B8 0400A294 */  lhu        $v0, 0x4($a1)
/* 4CBBC 8005C3BC 60008394 */  lhu        $v1, 0x60($a0)
/* 4CBC0 8005C3C0 1000A527 */  addiu      $a1, $sp, 0x10
/* 4CBC4 8005C3C4 23104300 */  subu       $v0, $v0, $v1
/* 4CBC8 8005C3C8 9C70010C */  jal        STREAM_OffsetInstancePosition
/* 4CBCC 8005C3CC 1400A2A7 */   sh        $v0, 0x14($sp)
/* 4CBD0 8005C3D0 1800BF8F */  lw         $ra, 0x18($sp)
/* 4CBD4 8005C3D4 00000000 */  nop
/* 4CBD8 8005C3D8 0800E003 */  jr         $ra
/* 4CBDC 8005C3DC 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_SetInstancePosition, . - STREAM_SetInstancePosition
