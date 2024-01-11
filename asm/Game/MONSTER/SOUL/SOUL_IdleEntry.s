.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_IdleEntry
/* 7EF68 8008E768 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7EF6C 8008E76C 1800BFAF */  sw         $ra, 0x18($sp)
/* 7EF70 8008E770 1400B1AF */  sw         $s1, 0x14($sp)
/* 7EF74 8008E774 1000B0AF */  sw         $s0, 0x10($sp)
/* 7EF78 8008E778 6C01918C */  lw         $s1, 0x16C($a0)
/* 7EF7C 8008E77C 0F000224 */  addiu      $v0, $zero, 0xF
/* 7EF80 8008E780 8C0182AC */  sw         $v0, 0x18C($a0)
/* 7EF84 8008E784 900182AC */  sw         $v0, 0x190($a0)
/* 7EF88 8008E788 11000224 */  addiu      $v0, $zero, 0x11
/* 7EF8C 8008E78C 9006020C */  jal        MON_GetTime
/* 7EF90 8008E790 940182AC */   sw        $v0, 0x194($a0)
/* 7EF94 8008E794 3AF2020C */  jal        func_800BC8E8
/* 7EF98 8008E798 21804000 */   addu      $s0, $v0, $zero
/* 7EF9C 8008E79C 7605033C */  lui        $v1, (0x57619F1 >> 16)
/* 7EFA0 8008E7A0 F1196334 */  ori        $v1, $v1, (0x57619F1 & 0xFFFF)
/* 7EFA4 8008E7A4 18004300 */  mult       $v0, $v1
/* 7EFA8 8008E7A8 FBFF043C */  lui        $a0, (0xFFFBFFFF >> 16)
/* 7EFAC 8008E7AC 0000238E */  lw         $v1, 0x0($s1)
/* 7EFB0 8008E7B0 FFFF8434 */  ori        $a0, $a0, (0xFFFBFFFF & 0xFFFF)
/* 7EFB4 8008E7B4 24186400 */  and        $v1, $v1, $a0
/* 7EFB8 8008E7B8 000023AE */  sw         $v1, 0x0($s1)
/* 7EFBC 8008E7BC C31F0200 */  sra        $v1, $v0, 31
/* 7EFC0 8008E7C0 10280000 */  mfhi       $a1
/* 7EFC4 8008E7C4 83210500 */  sra        $a0, $a1, 6
/* 7EFC8 8008E7C8 23208300 */  subu       $a0, $a0, $v1
/* 7EFCC 8008E7CC 40180400 */  sll        $v1, $a0, 1
/* 7EFD0 8008E7D0 21186400 */  addu       $v1, $v1, $a0
/* 7EFD4 8008E7D4 00190300 */  sll        $v1, $v1, 4
/* 7EFD8 8008E7D8 23186400 */  subu       $v1, $v1, $a0
/* 7EFDC 8008E7DC C0180300 */  sll        $v1, $v1, 3
/* 7EFE0 8008E7E0 23186400 */  subu       $v1, $v1, $a0
/* 7EFE4 8008E7E4 C0180300 */  sll        $v1, $v1, 3
/* 7EFE8 8008E7E8 23104300 */  subu       $v0, $v0, $v1
/* 7EFEC 8008E7EC B80B4224 */  addiu      $v0, $v0, 0xBB8
/* 7EFF0 8008E7F0 21800202 */  addu       $s0, $s0, $v0
/* 7EFF4 8008E7F4 140130AE */  sw         $s0, 0x114($s1)
/* 7EFF8 8008E7F8 1800BF8F */  lw         $ra, 0x18($sp)
/* 7EFFC 8008E7FC 1400B18F */  lw         $s1, 0x14($sp)
/* 7F000 8008E800 1000B08F */  lw         $s0, 0x10($sp)
/* 7F004 8008E804 0800E003 */  jr         $ra
/* 7F008 8008E808 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_IdleEntry, . - SOUL_IdleEntry
