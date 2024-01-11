.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_BirthCollectible
/* 5B12C 8006A92C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5B130 8006A930 3800A28F */  lw         $v0, 0x38($sp)
/* 5B134 8006A934 1400B1AF */  sw         $s1, 0x14($sp)
/* 5B138 8006A938 2188A000 */  addu       $s1, $a1, $zero
/* 5B13C 8006A93C 1800B2AF */  sw         $s2, 0x18($sp)
/* 5B140 8006A940 2190C000 */  addu       $s2, $a2, $zero
/* 5B144 8006A944 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5B148 8006A948 2198E000 */  addu       $s3, $a3, $zero
/* 5B14C 8006A94C 1000B0AF */  sw         $s0, 0x10($sp)
/* 5B150 8006A950 3C00B08F */  lw         $s0, 0x3C($sp)
/* 5B154 8006A954 21300000 */  addu       $a2, $zero, $zero
/* 5B158 8006A958 05004010 */  beqz       $v0, .L8006A970
/* 5B15C 8006A95C 2000BFAF */   sw        $ra, 0x20($sp)
/* 5B160 8006A960 0D80023C */  lui        $v0, %hi(objectAccess + 0xD4)
/* 5B164 8006A964 10A3458C */  lw         $a1, %lo(objectAccess + 0xD4)($v0)
/* 5B168 8006A968 5EAA0108 */  j          .L8006A978
/* 5B16C 8006A96C 00000000 */   nop
.L8006A970:
/* 5B170 8006A970 0D80023C */  lui        $v0, %hi(objectAccess + 0xCC)
/* 5B174 8006A974 08A3458C */  lw         $a1, %lo(objectAccess + 0xCC)($v0)
.L8006A978:
/* 5B178 8006A978 00000000 */  nop
/* 5B17C 8006A97C 0F00A010 */  beqz       $a1, .L8006A9BC
/* 5B180 8006A980 00000000 */   nop
/* 5B184 8006A984 ACCF000C */  jal        INSTANCE_BirthObject
/* 5B188 8006A988 21300000 */   addu      $a2, $zero, $zero
/* 5B18C 8006A98C 21304000 */  addu       $a2, $v0, $zero
/* 5B190 8006A990 0A00C010 */  beqz       $a2, .L8006A9BC
/* 5B194 8006A994 00111000 */   sll       $v0, $s0, 4
/* 5B198 8006A998 23105000 */  subu       $v0, $v0, $s0
/* 5B19C 8006A99C 6C01C38C */  lw         $v1, 0x16C($a2)
/* 5B1A0 8006A9A0 40130200 */  sll        $v0, $v0, 13
/* 5B1A4 8006A9A4 040062AC */  sw         $v0, 0x4($v1)
/* 5B1A8 8006A9A8 00100224 */  addiu      $v0, $zero, 0x1000
/* 5B1AC 8006A9AC 0401C2A4 */  sh         $v0, 0x104($a2)
/* 5B1B0 8006A9B0 5C00D1A4 */  sh         $s1, 0x5C($a2)
/* 5B1B4 8006A9B4 5E00D2A4 */  sh         $s2, 0x5E($a2)
/* 5B1B8 8006A9B8 6000D3A4 */  sh         $s3, 0x60($a2)
.L8006A9BC:
/* 5B1BC 8006A9BC 2000BF8F */  lw         $ra, 0x20($sp)
/* 5B1C0 8006A9C0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 5B1C4 8006A9C4 1800B28F */  lw         $s2, 0x18($sp)
/* 5B1C8 8006A9C8 1400B18F */  lw         $s1, 0x14($sp)
/* 5B1CC 8006A9CC 1000B08F */  lw         $s0, 0x10($sp)
/* 5B1D0 8006A9D0 2110C000 */  addu       $v0, $a2, $zero
/* 5B1D4 8006A9D4 0800E003 */  jr         $ra
/* 5B1D8 8006A9D8 2800BD27 */   addiu     $sp, $sp, 0x28
.size PHYSOB_BirthCollectible, . - PHYSOB_BirthCollectible
