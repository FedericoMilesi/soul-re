.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDefDrawEnv
/* AFB84 800BF384 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AFB88 800BF388 1800B2AF */  sw         $s2, 0x18($sp)
/* AFB8C 800BF38C 3800B28F */  lw         $s2, 0x38($sp)
/* AFB90 800BF390 1400B1AF */  sw         $s1, 0x14($sp)
/* AFB94 800BF394 21888000 */  addu       $s1, $a0, $zero
/* AFB98 800BF398 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AFB9C 800BF39C 2198A000 */  addu       $s3, $a1, $zero
/* AFBA0 800BF3A0 2000B4AF */  sw         $s4, 0x20($sp)
/* AFBA4 800BF3A4 21A0C000 */  addu       $s4, $a2, $zero
/* AFBA8 800BF3A8 1000B0AF */  sw         $s0, 0x10($sp)
/* AFBAC 800BF3AC 2400BFAF */  sw         $ra, 0x24($sp)
/* AFBB0 800BF3B0 D808030C */  jal        GetVideoMode
/* AFBB4 800BF3B4 2180E000 */   addu      $s0, $a3, $zero
/* AFBB8 800BF3B8 01000324 */  addiu      $v1, $zero, 0x1
/* AFBBC 800BF3BC 000033A6 */  sh         $s3, 0x0($s1)
/* AFBC0 800BF3C0 020034A6 */  sh         $s4, 0x2($s1)
/* AFBC4 800BF3C4 040030A6 */  sh         $s0, 0x4($s1)
/* AFBC8 800BF3C8 0C0020A6 */  sh         $zero, 0xC($s1)
/* AFBCC 800BF3CC 0E0020A6 */  sh         $zero, 0xE($s1)
/* AFBD0 800BF3D0 100020A6 */  sh         $zero, 0x10($s1)
/* AFBD4 800BF3D4 120020A6 */  sh         $zero, 0x12($s1)
/* AFBD8 800BF3D8 190020A2 */  sb         $zero, 0x19($s1)
/* AFBDC 800BF3DC 1A0020A2 */  sb         $zero, 0x1A($s1)
/* AFBE0 800BF3E0 1B0020A2 */  sb         $zero, 0x1B($s1)
/* AFBE4 800BF3E4 160023A2 */  sb         $v1, 0x16($s1)
/* AFBE8 800BF3E8 03004010 */  beqz       $v0, .L800BF3F8
/* AFBEC 800BF3EC 060032A6 */   sh        $s2, 0x6($s1)
/* AFBF0 800BF3F0 FFFC0208 */  j          .L800BF3FC
/* AFBF4 800BF3F4 2101422A */   slti      $v0, $s2, 0x121
.L800BF3F8:
/* AFBF8 800BF3F8 0101422A */  slti       $v0, $s2, 0x101
.L800BF3FC:
/* AFBFC 800BF3FC 170022A2 */  sb         $v0, 0x17($s1)
/* AFC00 800BF400 21102002 */  addu       $v0, $s1, $zero
/* AFC04 800BF404 0A000324 */  addiu      $v1, $zero, 0xA
/* AFC08 800BF408 080053A4 */  sh         $s3, 0x8($v0)
/* AFC0C 800BF40C 0A0054A4 */  sh         $s4, 0xA($v0)
/* AFC10 800BF410 140043A4 */  sh         $v1, 0x14($v0)
/* AFC14 800BF414 180040A0 */  sb         $zero, 0x18($v0)
/* AFC18 800BF418 2400BF8F */  lw         $ra, 0x24($sp)
/* AFC1C 800BF41C 2000B48F */  lw         $s4, 0x20($sp)
/* AFC20 800BF420 1C00B38F */  lw         $s3, 0x1C($sp)
/* AFC24 800BF424 1800B28F */  lw         $s2, 0x18($sp)
/* AFC28 800BF428 1400B18F */  lw         $s1, 0x14($sp)
/* AFC2C 800BF42C 1000B08F */  lw         $s0, 0x10($sp)
/* AFC30 800BF430 0800E003 */  jr         $ra
/* AFC34 800BF434 2800BD27 */   addiu     $sp, $sp, 0x28
/* AFC38 800BF438 00000000 */  nop
/* AFC3C 800BF43C 00000000 */  nop
/* AFC40 800BF440 00000000 */  nop
.size SetDefDrawEnv, . - SetDefDrawEnv
