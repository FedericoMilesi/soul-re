.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_NearestPointOnLineVec
/* B17C 8001A97C B0FFBD27 */  addiu      $sp, $sp, -0x50
/* B180 8001A980 4000B0AF */  sw         $s0, 0x40($sp)
/* B184 8001A984 2180C000 */  addu       $s0, $a2, $zero
/* B188 8001A988 4C00BFAF */  sw         $ra, 0x4C($sp)
/* B18C 8001A98C 4800B2AF */  sw         $s2, 0x48($sp)
/* B190 8001A990 4400B1AF */  sw         $s1, 0x44($sp)
/* B194 8001A994 00000296 */  lhu        $v0, 0x0($s0)
/* B198 8001A998 00000000 */  nop
/* B19C 8001A99C 1000A2A7 */  sh         $v0, 0x10($sp)
/* B1A0 8001A9A0 02000296 */  lhu        $v0, 0x2($s0)
/* B1A4 8001A9A4 00000000 */  nop
/* B1A8 8001A9A8 1200A2A7 */  sh         $v0, 0x12($sp)
/* B1AC 8001A9AC 04000296 */  lhu        $v0, 0x4($s0)
/* B1B0 8001A9B0 2188A000 */  addu       $s1, $a1, $zero
/* B1B4 8001A9B4 1400A2A7 */  sh         $v0, 0x14($sp)
/* B1B8 8001A9B8 00002296 */  lhu        $v0, 0x0($s1)
/* B1BC 8001A9BC 00000000 */  nop
/* B1C0 8001A9C0 1600A2A7 */  sh         $v0, 0x16($sp)
/* B1C4 8001A9C4 02002296 */  lhu        $v0, 0x2($s1)
/* B1C8 8001A9C8 00000000 */  nop
/* B1CC 8001A9CC 1800A2A7 */  sh         $v0, 0x18($sp)
/* B1D0 8001A9D0 04002296 */  lhu        $v0, 0x4($s1)
/* B1D4 8001A9D4 21908000 */  addu       $s2, $a0, $zero
/* B1D8 8001A9D8 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* B1DC 8001A9DC 0000E294 */  lhu        $v0, 0x0($a3)
/* B1E0 8001A9E0 1000A427 */  addiu      $a0, $sp, 0x10
/* B1E4 8001A9E4 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* B1E8 8001A9E8 0200E294 */  lhu        $v0, 0x2($a3)
/* B1EC 8001A9EC 21280002 */  addu       $a1, $s0, $zero
/* B1F0 8001A9F0 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* B1F4 8001A9F4 0400E294 */  lhu        $v0, 0x4($a3)
/* B1F8 8001A9F8 3000A627 */  addiu      $a2, $sp, 0x30
/* B1FC 8001A9FC 1AF2020C */  jal        ApplyMatrix
/* B200 8001AA00 2000A2A7 */   sh        $v0, 0x20($sp)
/* B204 8001AA04 3400A28F */  lw         $v0, 0x34($sp)
/* B208 8001AA08 3800A38F */  lw         $v1, 0x38($sp)
/* B20C 8001AA0C 00000000 */  nop
/* B210 8001AA10 23104300 */  subu       $v0, $v0, $v1
/* B214 8001AA14 3000A38F */  lw         $v1, 0x30($sp)
/* B218 8001AA18 00000000 */  nop
/* B21C 8001AA1C 04006010 */  beqz       $v1, .L8001AA30
/* B220 8001AA20 00230200 */   sll       $a0, $v0, 12
/* B224 8001AA24 23100400 */  negu       $v0, $a0
/* B228 8001AA28 1A004300 */  div        $zero, $v0, $v1
/* B22C 8001AA2C 12200000 */  mflo       $a0
.L8001AA30:
/* B230 8001AA30 00000286 */  lh         $v0, 0x0($s0)
/* B234 8001AA34 00000000 */  nop
/* B238 8001AA38 18004400 */  mult       $v0, $a0
/* B23C 8001AA3C 00002296 */  lhu        $v0, 0x0($s1)
/* B240 8001AA40 12400000 */  mflo       $t0
/* B244 8001AA44 031B0800 */  sra        $v1, $t0, 12
/* B248 8001AA48 21104300 */  addu       $v0, $v0, $v1
/* B24C 8001AA4C 000042A6 */  sh         $v0, 0x0($s2)
/* B250 8001AA50 02000286 */  lh         $v0, 0x2($s0)
/* B254 8001AA54 00000000 */  nop
/* B258 8001AA58 18004400 */  mult       $v0, $a0
/* B25C 8001AA5C 02002296 */  lhu        $v0, 0x2($s1)
/* B260 8001AA60 12400000 */  mflo       $t0
/* B264 8001AA64 031B0800 */  sra        $v1, $t0, 12
/* B268 8001AA68 21104300 */  addu       $v0, $v0, $v1
/* B26C 8001AA6C 020042A6 */  sh         $v0, 0x2($s2)
/* B270 8001AA70 04000286 */  lh         $v0, 0x4($s0)
/* B274 8001AA74 00000000 */  nop
/* B278 8001AA78 18004400 */  mult       $v0, $a0
/* B27C 8001AA7C 04002296 */  lhu        $v0, 0x4($s1)
/* B280 8001AA80 12400000 */  mflo       $t0
/* B284 8001AA84 031B0800 */  sra        $v1, $t0, 12
/* B288 8001AA88 21104300 */  addu       $v0, $v0, $v1
/* B28C 8001AA8C 040042A6 */  sh         $v0, 0x4($s2)
/* B290 8001AA90 4C00BF8F */  lw         $ra, 0x4C($sp)
/* B294 8001AA94 4800B28F */  lw         $s2, 0x48($sp)
/* B298 8001AA98 4400B18F */  lw         $s1, 0x44($sp)
/* B29C 8001AA9C 4000B08F */  lw         $s0, 0x40($sp)
/* B2A0 8001AAA0 0800E003 */  jr         $ra
/* B2A4 8001AAA4 5000BD27 */   addiu     $sp, $sp, 0x50
.size CAMERA_NearestPointOnLineVec, . - CAMERA_NearestPointOnLineVec
