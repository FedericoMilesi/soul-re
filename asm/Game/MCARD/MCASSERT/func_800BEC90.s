.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BEC90
/* AF490 800BEC90 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AF494 800BEC94 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AF498 800BEC98 21988000 */  addu       $s3, $a0, $zero
/* AF49C 800BEC9C 2000B4AF */  sw         $s4, 0x20($sp)
/* AF4A0 800BECA0 21A0A000 */  addu       $s4, $a1, $zero
/* AF4A4 800BECA4 1000B0AF */  sw         $s0, 0x10($sp)
/* AF4A8 800BECA8 21800000 */  addu       $s0, $zero, $zero
/* AF4AC 800BECAC 1800B2AF */  sw         $s2, 0x18($sp)
/* AF4B0 800BECB0 0E80123C */  lui        $s2, %hi(GsOUT_PACKET_P_dup1 + 0x88C)
/* AF4B4 800BECB4 F4DE5226 */  addiu      $s2, $s2, %lo(GsOUT_PACKET_P_dup1 + 0x88C)
/* AF4B8 800BECB8 1400B1AF */  sw         $s1, 0x14($sp)
/* AF4BC 800BECBC 21880000 */  addu       $s1, $zero, $zero
/* AF4C0 800BECC0 2400BFAF */  sw         $ra, 0x24($sp)
.L800BECC4:
/* AF4C4 800BECC4 0E80023C */  lui        $v0, %hi(GsOUT_PACKET_P_dup1 + 0x884)
/* AF4C8 800BECC8 21105100 */  addu       $v0, $v0, $s1
/* AF4CC 800BECCC ECDE428C */  lw         $v0, %lo(GsOUT_PACKET_P_dup1 + 0x884)($v0)
/* AF4D0 800BECD0 00000000 */  nop
/* AF4D4 800BECD4 0E004010 */  beqz       $v0, .L800BED10
/* AF4D8 800BECD8 00000000 */   nop
/* AF4DC 800BECDC 07005314 */  bne        $v0, $s3, .L800BECFC
/* AF4E0 800BECE0 21208002 */   addu      $a0, $s4, $zero
/* AF4E4 800BECE4 83F7020C */  jal        func_800BDE0C
/* AF4E8 800BECE8 21284002 */   addu      $a1, $s2, $zero
/* AF4EC 800BECEC 04004014 */  bnez       $v0, .L800BED00
/* AF4F0 800BECF0 2C005226 */   addiu     $s2, $s2, 0x2C
/* AF4F4 800BECF4 45FB0208 */  j          .L800BED14
/* AF4F8 800BECF8 01000226 */   addiu     $v0, $s0, 0x1
.L800BECFC:
/* AF4FC 800BECFC 2C005226 */  addiu      $s2, $s2, 0x2C
.L800BED00:
/* AF500 800BED00 01001026 */  addiu      $s0, $s0, 0x1
/* AF504 800BED04 8000022A */  slti       $v0, $s0, 0x80
/* AF508 800BED08 EEFF4014 */  bnez       $v0, .L800BECC4
/* AF50C 800BED0C 2C003126 */   addiu     $s1, $s1, 0x2C
.L800BED10:
/* AF510 800BED10 FFFF0224 */  addiu      $v0, $zero, -0x1
.L800BED14:
/* AF514 800BED14 2400BF8F */  lw         $ra, 0x24($sp)
/* AF518 800BED18 2000B48F */  lw         $s4, 0x20($sp)
/* AF51C 800BED1C 1C00B38F */  lw         $s3, 0x1C($sp)
/* AF520 800BED20 1800B28F */  lw         $s2, 0x18($sp)
/* AF524 800BED24 1400B18F */  lw         $s1, 0x14($sp)
/* AF528 800BED28 1000B08F */  lw         $s0, 0x10($sp)
/* AF52C 800BED2C 0800E003 */  jr         $ra
/* AF530 800BED30 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BEC90, . - func_800BEC90
