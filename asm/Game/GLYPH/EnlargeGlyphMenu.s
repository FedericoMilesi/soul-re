.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EnlargeGlyphMenu
/* 6BCA4 8007B4A4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6BCA8 8007B4A8 2400B1AF */  sw         $s1, 0x24($sp)
/* 6BCAC 8007B4AC 21888000 */  addu       $s1, $a0, $zero
/* 6BCB0 8007B4B0 0CBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 6BCB4 8007B4B4 1000023C */  lui        $v0, (0x100000 >> 16)
/* 6BCB8 8007B4B8 2800BFAF */  sw         $ra, 0x28($sp)
/* 6BCBC 8007B4BC 2000B0AF */  sw         $s0, 0x20($sp)
/* 6BCC0 8007B4C0 6C01308E */  lw         $s0, 0x16C($s1)
/* 6BCC4 8007B4C4 25186200 */  or         $v1, $v1, $v0
/* 6BCC8 8007B4C8 0CBF83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x144)($gp)
/* 6BCCC 8007B4CC 90000286 */  lh         $v0, 0x90($s0)
/* 6BCD0 8007B4D0 90000396 */  lhu        $v1, 0x90($s0)
/* 6BCD4 8007B4D4 00104228 */  slti       $v0, $v0, 0x1000
/* 6BCD8 8007B4D8 10004010 */  beqz       $v0, .L8007B51C
/* 6BCDC 8007B4DC 00000000 */   nop
/* 6BCE0 8007B4E0 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6BCE4 8007B4E4 00000000 */  nop
/* 6BCE8 8007B4E8 40120200 */  sll        $v0, $v0, 9
/* 6BCEC 8007B4EC 02130200 */  srl        $v0, $v0, 12
/* 6BCF0 8007B4F0 21106200 */  addu       $v0, $v1, $v0
/* 6BCF4 8007B4F4 900002A6 */  sh         $v0, 0x90($s0)
/* 6BCF8 8007B4F8 00140200 */  sll        $v0, $v0, 16
/* 6BCFC 8007B4FC 03140200 */  sra        $v0, $v0, 16
/* 6BD00 8007B500 01104228 */  slti       $v0, $v0, 0x1001
/* 6BD04 8007B504 02004014 */  bnez       $v0, .L8007B510
/* 6BD08 8007B508 00100224 */   addiu     $v0, $zero, 0x1000
/* 6BD0C 8007B50C 900002A6 */  sh         $v0, 0x90($s0)
.L8007B510:
/* 6BD10 8007B510 90000296 */  lhu        $v0, 0x90($s0)
/* 6BD14 8007B514 00000000 */  nop
/* 6BD18 8007B518 DCEC82A7 */  sh         $v0, %gp_rel(glyph_time)($gp)
.L8007B51C:
/* 6BD1C 8007B51C 90000486 */  lh         $a0, 0x90($s0)
/* 6BD20 8007B520 D9EC010C */  jal        GlyphTime
/* 6BD24 8007B524 00000000 */   nop
/* 6BD28 8007B528 21284000 */  addu       $a1, $v0, $zero
/* 6BD2C 8007B52C 80180500 */  sll        $v1, $a1, 2
/* 6BD30 8007B530 21186500 */  addu       $v1, $v1, $a1
/* 6BD34 8007B534 00110300 */  sll        $v0, $v1, 4
/* 6BD38 8007B538 23104300 */  subu       $v0, $v0, $v1
/* 6BD3C 8007B53C 40100200 */  sll        $v0, $v0, 1
/* 6BD40 8007B540 02004104 */  bgez       $v0, .L8007B54C
/* 6BD44 8007B544 21202002 */   addu      $a0, $s1, $zero
/* 6BD48 8007B548 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007B54C:
/* 6BD4C 8007B54C 03130200 */  sra        $v0, $v0, 12
/* 6BD50 8007B550 920002A6 */  sh         $v0, 0x92($s0)
/* 6BD54 8007B554 00EC010C */  jal        GlyphDrawMenu
/* 6BD58 8007B558 940005A6 */   sh        $a1, 0x94($s0)
/* 6BD5C 8007B55C 05000424 */  addiu      $a0, $zero, 0x5
/* 6BD60 8007B560 1800A227 */  addiu      $v0, $sp, 0x18
/* 6BD64 8007B564 1000A2AF */  sw         $v0, 0x10($sp)
/* 6BD68 8007B568 0C000224 */  addiu      $v0, $zero, 0xC
/* 6BD6C 8007B56C D8EC8527 */  addiu      $a1, $gp, %gp_rel(MANNA_Position)
/* 6BD70 8007B570 18000624 */  addiu      $a2, $zero, 0x18
/* 6BD74 8007B574 DAEC8727 */  addiu      $a3, $gp, %gp_rel(MANNA_Pos_vel)
/* 6BD78 8007B578 F0EC80AF */  sw         $zero, %gp_rel(MANNA_Pickup_Time)($gp)
/* 6BD7C 8007B57C 605C000C */  jal        CriticalDampValue
/* 6BD80 8007B580 1400A2AF */   sw        $v0, 0x14($sp)
/* 6BD84 8007B584 01000224 */  addiu      $v0, $zero, 0x1
/* 6BD88 8007B588 8E0002A6 */  sh         $v0, 0x8E($s0)
/* 6BD8C 8007B58C 2800BF8F */  lw         $ra, 0x28($sp)
/* 6BD90 8007B590 2400B18F */  lw         $s1, 0x24($sp)
/* 6BD94 8007B594 2000B08F */  lw         $s0, 0x20($sp)
/* 6BD98 8007B598 0800E003 */  jr         $ra
/* 6BD9C 8007B59C 3000BD27 */   addiu     $sp, $sp, 0x30
.size EnlargeGlyphMenu, . - EnlargeGlyphMenu
