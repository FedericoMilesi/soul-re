.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ProjectileEntry
/* 7A920 8008A120 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7A924 8008A124 1400BFAF */  sw         $ra, 0x14($sp)
/* 7A928 8008A128 1000B0AF */  sw         $s0, 0x10($sp)
/* 7A92C 8008A12C 6C01908C */  lw         $s0, 0x16C($a0)
/* 7A930 8008A130 00000000 */  nop
/* 7A934 8008A134 6801028E */  lw         $v0, 0x168($s0)
/* 7A938 8008A138 00000000 */  nop
/* 7A93C 8008A13C 0800428C */  lw         $v0, 0x8($v0)
/* 7A940 8008A140 2400838C */  lw         $v1, 0x24($a0)
/* 7A944 8008A144 1E004280 */  lb         $v0, 0x1E($v0)
/* 7A948 8008A148 3C00658C */  lw         $a1, 0x3C($v1)
/* 7A94C 8008A14C 00110200 */  sll        $v0, $v0, 4
/* 7A950 8008A150 2128A200 */  addu       $a1, $a1, $v0
/* 7A954 8008A154 0E00A524 */  addiu      $a1, $a1, 0xE
/* 7A958 8008A158 21300000 */  addu       $a2, $zero, $zero
/* 7A95C 8008A15C 6FFF010C */  jal        MON_PlayAnimFromList
/* 7A960 8008A160 01000724 */   addiu     $a3, $zero, 0x1
/* 7A964 8008A164 5F0100A2 */  sb         $zero, 0x15F($s0)
/* 7A968 8008A168 1400BF8F */  lw         $ra, 0x14($sp)
/* 7A96C 8008A16C 1000B08F */  lw         $s0, 0x10($sp)
/* 7A970 8008A170 0800E003 */  jr         $ra
/* 7A974 8008A174 1800BD27 */   addiu     $sp, $sp, 0x18
.size MON_ProjectileEntry, . - MON_ProjectileEntry
