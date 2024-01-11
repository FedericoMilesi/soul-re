.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_LoadMainVram
/* 4B160 8005A960 40FFBD27 */  addiu      $sp, $sp, -0xC0
/* 4B164 8005A964 5C018424 */  addiu      $a0, $a0, 0x15C
/* 4B168 8005A968 1000A527 */  addiu      $a1, $sp, 0x10
/* 4B16C 8005A96C B400B1AF */  sw         $s1, 0xB4($sp)
/* 4B170 8005A970 6000B127 */  addiu      $s1, $sp, 0x60
/* 4B174 8005A974 B800BFAF */  sw         $ra, 0xB8($sp)
/* 4B178 8005A978 B000B0AF */  sw         $s0, 0xB0($sp)
/* 4B17C 8005A97C 0800D08C */  lw         $s0, 0x8($a2)
/* 4B180 8005A980 21302002 */  addu       $a2, $s1, $zero
/* 4B184 8005A984 8062010C */  jal        STREAM_FillOutFileNames
/* 4B188 8005A988 21380000 */   addu      $a3, $zero, $zero
/* 4B18C 8005A98C A0000486 */  lh         $a0, 0xA0($s0)
/* 4B190 8005A990 23000524 */  addiu      $a1, $zero, 0x23
/* 4B194 8005A994 40200400 */  sll        $a0, $a0, 1
/* 4B198 8005A998 8140010C */  jal        MEMPACK_Malloc
/* 4B19C 8005A99C 14008424 */   addiu     $a0, $a0, 0x14
/* 4B1A0 8005A9A0 14004324 */  addiu      $v1, $v0, 0x14
/* 4B1A4 8005A9A4 21202002 */  addu       $a0, $s1, $zero
/* 4B1A8 8005A9A8 100043AC */  sw         $v1, 0x10($v0)
/* 4B1AC 8005A9AC 000040AC */  sw         $zero, 0x0($v0)
/* 4B1B0 8005A9B0 9C000396 */  lhu        $v1, 0x9C($s0)
/* 4B1B4 8005A9B4 0780053C */  lui        $a1, %hi(VRAM_TransferBufferToVram)
/* 4B1B8 8005A9B8 00026324 */  addiu      $v1, $v1, 0x200
/* 4B1BC 8005A9BC 040043A4 */  sh         $v1, 0x4($v0)
/* 4B1C0 8005A9C0 9E000396 */  lhu        $v1, 0x9E($s0)
/* 4B1C4 8005A9C4 7040A524 */  addiu      $a1, $a1, %lo(VRAM_TransferBufferToVram)
/* 4B1C8 8005A9C8 060043A4 */  sh         $v1, 0x6($v0)
/* 4B1CC 8005A9CC A0000396 */  lhu        $v1, 0xA0($s0)
/* 4B1D0 8005A9D0 21304000 */  addu       $a2, $v0, $zero
/* 4B1D4 8005A9D4 0800C3A4 */  sh         $v1, 0x8($a2)
/* 4B1D8 8005A9D8 A2000296 */  lhu        $v0, 0xA2($s0)
/* 4B1DC 8005A9DC 21380000 */  addu       $a3, $zero, $zero
/* 4B1E0 8005A9E0 20EC80A7 */  sh         $zero, %gp_rel(M_TrackClutUpdate)($gp)
/* 4B1E4 8005A9E4 0C00C0A4 */  sh         $zero, 0xC($a2)
/* 4B1E8 8005A9E8 0E00C0A4 */  sh         $zero, 0xE($a2)
/* 4B1EC 8005A9EC 0B82010C */  jal        LOAD_NonBlockingBufferedLoad
/* 4B1F0 8005A9F0 0A00C2A4 */   sh        $v0, 0xA($a2)
/* 4B1F4 8005A9F4 B800BF8F */  lw         $ra, 0xB8($sp)
/* 4B1F8 8005A9F8 B400B18F */  lw         $s1, 0xB4($sp)
/* 4B1FC 8005A9FC B000B08F */  lw         $s0, 0xB0($sp)
/* 4B200 8005AA00 0800E003 */  jr         $ra
/* 4B204 8005AA04 C000BD27 */   addiu     $sp, $sp, 0xC0
.size STREAM_LoadMainVram, . - STREAM_LoadMainVram
