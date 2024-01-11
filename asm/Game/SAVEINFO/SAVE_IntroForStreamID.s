.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_IntroForStreamID
/* A6348 800B5B48 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A634C 800B5B4C 1800B0AF */  sw         $s0, 0x18($sp)
/* A6350 800B5B50 E0FD908F */  lw         $s0, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6354 800B5B54 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6358 800B5B58 2000B2AF */  sw         $s2, 0x20($sp)
/* A635C 800B5B5C 21908000 */  addu       $s2, $a0, $zero
/* A6360 800B5B60 2400BFAF */  sw         $ra, 0x24($sp)
/* A6364 800B5B64 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A6368 800B5B68 0000518E */  lw         $s1, 0x0($s2)
/* A636C 800B5B6C 2B100202 */  sltu       $v0, $s0, $v0
/* A6370 800B5B70 26004010 */  beqz       $v0, .L800B5C0C
/* A6374 800B5B74 00000000 */   nop
.L800B5B78:
/* A6378 800B5B78 1000A0AF */  sw         $zero, 0x10($sp)
/* A637C 800B5B7C 00000392 */  lbu        $v1, 0x0($s0)
/* A6380 800B5B80 01000224 */  addiu      $v0, $zero, 0x1
/* A6384 800B5B84 0B006214 */  bne        $v1, $v0, .L800B5BB4
/* A6388 800B5B88 07000224 */   addiu     $v0, $zero, 0x7
/* A638C 800B5B8C 0E000286 */  lh         $v0, 0xE($s0)
/* A6390 800B5B90 00000000 */  nop
/* A6394 800B5B94 07005114 */  bne        $v0, $s1, .L800B5BB4
/* A6398 800B5B98 07000224 */   addiu     $v0, $zero, 0x7
/* A639C 800B5B9C 21200002 */  addu       $a0, $s0, $zero
/* A63A0 800B5BA0 21284002 */  addu       $a1, $s2, $zero
/* A63A4 800B5BA4 72D2000C */  jal        INSTANCE_IntroduceSavedInstance
/* A63A8 800B5BA8 1000A627 */   addiu     $a2, $sp, 0x10
/* A63AC 800B5BAC F6D60208 */  j          .L800B5BD8
/* A63B0 800B5BB0 00000000 */   nop
.L800B5BB4:
/* A63B4 800B5BB4 08006214 */  bne        $v1, $v0, .L800B5BD8
/* A63B8 800B5BB8 00000000 */   nop
/* A63BC 800B5BBC 06000286 */  lh         $v0, 0x6($s0)
/* A63C0 800B5BC0 00000000 */  nop
/* A63C4 800B5BC4 04005114 */  bne        $v0, $s1, .L800B5BD8
/* A63C8 800B5BC8 21200002 */   addu      $a0, $s0, $zero
/* A63CC 800B5BCC 21284002 */  addu       $a1, $s2, $zero
/* A63D0 800B5BD0 8DD3000C */  jal        INSTANCE_IntroduceSavedInstanceWithIntro
/* A63D4 800B5BD4 1000A627 */   addiu     $a2, $sp, 0x10
.L800B5BD8:
/* A63D8 800B5BD8 1000A28F */  lw         $v0, 0x10($sp)
/* A63DC 800B5BDC 00000000 */  nop
/* A63E0 800B5BE0 05004014 */  bnez       $v0, .L800B5BF8
/* A63E4 800B5BE4 00000000 */   nop
/* A63E8 800B5BE8 01000292 */  lbu        $v0, 0x1($s0)
/* A63EC 800B5BEC 00000000 */  nop
/* A63F0 800B5BF0 80100200 */  sll        $v0, $v0, 2
/* A63F4 800B5BF4 21800202 */  addu       $s0, $s0, $v0
.L800B5BF8:
/* A63F8 800B5BF8 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A63FC 800B5BFC 00000000 */  nop
/* A6400 800B5C00 2B100202 */  sltu       $v0, $s0, $v0
/* A6404 800B5C04 DCFF4014 */  bnez       $v0, .L800B5B78
/* A6408 800B5C08 00000000 */   nop
.L800B5C0C:
/* A640C 800B5C0C 2400BF8F */  lw         $ra, 0x24($sp)
/* A6410 800B5C10 2000B28F */  lw         $s2, 0x20($sp)
/* A6414 800B5C14 1C00B18F */  lw         $s1, 0x1C($sp)
/* A6418 800B5C18 1800B08F */  lw         $s0, 0x18($sp)
/* A641C 800B5C1C 0800E003 */  jr         $ra
/* A6420 800B5C20 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_IntroForStreamID, . - SAVE_IntroForStreamID
