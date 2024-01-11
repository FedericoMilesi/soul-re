.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AngleMoveToward
/* 2A94C 8003A14C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2A950 8003A150 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2A954 8003A154 21988000 */  addu       $s3, $a0, $zero
/* 2A958 8003A158 1800B2AF */  sw         $s2, 0x18($sp)
/* 2A95C 8003A15C 2190A000 */  addu       $s2, $a1, $zero
/* 2A960 8003A160 1400B1AF */  sw         $s1, 0x14($sp)
/* 2A964 8003A164 2188C000 */  addu       $s1, $a2, $zero
/* 2A968 8003A168 002C1200 */  sll        $a1, $s2, 16
/* 2A96C 8003A16C 2000BFAF */  sw         $ra, 0x20($sp)
/* 2A970 8003A170 1000B0AF */  sw         $s0, 0x10($sp)
/* 2A974 8003A174 00006486 */  lh         $a0, 0x0($s3)
/* 2A978 8003A178 032C0500 */  sra        $a1, $a1, 16
/* 2A97C 8003A17C 7EE8000C */  jal        AngleDiff
/* 2A980 8003A180 21808000 */   addu      $s0, $a0, $zero
/* 2A984 8003A184 00140200 */  sll        $v0, $v0, 16
/* 2A988 8003A188 03240200 */  sra        $a0, $v0, 16
/* 2A98C 8003A18C 08008010 */  beqz       $a0, .L8003A1B0
/* 2A990 8003A190 00141100 */   sll       $v0, $s1, 16
/* 2A994 8003A194 02008104 */  bgez       $a0, .L8003A1A0
/* 2A998 8003A198 21188000 */   addu      $v1, $a0, $zero
/* 2A99C 8003A19C 23180300 */  negu       $v1, $v1
.L8003A1A0:
/* 2A9A0 8003A1A0 03140200 */  sra        $v0, $v0, 16
/* 2A9A4 8003A1A4 2A186200 */  slt        $v1, $v1, $v0
/* 2A9A8 8003A1A8 03006010 */  beqz       $v1, .L8003A1B8
/* 2A9AC 8003A1AC 00000000 */   nop
.L8003A1B0:
/* 2A9B0 8003A1B0 77E80008 */  j          .L8003A1DC
/* 2A9B4 8003A1B4 000072A6 */   sh        $s2, 0x0($s3)
.L8003A1B8:
/* 2A9B8 8003A1B8 03008018 */  blez       $a0, .L8003A1C8
/* 2A9BC 8003A1BC 00000000 */   nop
/* 2A9C0 8003A1C0 75E80008 */  j          .L8003A1D4
/* 2A9C4 8003A1C4 21801102 */   addu      $s0, $s0, $s1
.L8003A1C8:
/* 2A9C8 8003A1C8 03008104 */  bgez       $a0, .L8003A1D8
/* 2A9CC 8003A1CC FF0F0232 */   andi      $v0, $s0, 0xFFF
/* 2A9D0 8003A1D0 23801102 */  subu       $s0, $s0, $s1
.L8003A1D4:
/* 2A9D4 8003A1D4 FF0F0232 */  andi       $v0, $s0, 0xFFF
.L8003A1D8:
/* 2A9D8 8003A1D8 000062A6 */  sh         $v0, 0x0($s3)
.L8003A1DC:
/* 2A9DC 8003A1DC 2000BF8F */  lw         $ra, 0x20($sp)
/* 2A9E0 8003A1E0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2A9E4 8003A1E4 1800B28F */  lw         $s2, 0x18($sp)
/* 2A9E8 8003A1E8 1400B18F */  lw         $s1, 0x14($sp)
/* 2A9EC 8003A1EC 1000B08F */  lw         $s0, 0x10($sp)
/* 2A9F0 8003A1F0 0800E003 */  jr         $ra
/* 2A9F4 8003A1F4 2800BD27 */   addiu     $sp, $sp, 0x28
.size AngleMoveToward, . - AngleMoveToward
