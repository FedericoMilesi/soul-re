.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_IsConditionTrue
/* 523D8 80061BD8 48FBBD27 */  addiu      $sp, $sp, -0x4B8
/* 523DC 80061BDC B004BFAF */  sw         $ra, 0x4B0($sp)
/* 523E0 80061BE0 AC04B1AF */  sw         $s1, 0x4AC($sp)
/* 523E4 80061BE4 A804B0AF */  sw         $s0, 0x4A8($sp)
/* 523E8 80061BE8 1000A0AF */  sw         $zero, 0x10($sp)
/* 523EC 80061BEC 0400B18C */  lw         $s1, 0x4($a1)
/* 523F0 80061BF0 54CB80AF */  sw         $zero, %gp_rel(currentActionScript)($gp)
/* 523F4 80061BF4 21870108 */  j          .L80061C84
/* 523F8 80061BF8 21800000 */   addu      $s0, $zero, $zero
.L80061BFC:
/* 523FC 80061BFC 21282002 */  addu       $a1, $s1, $zero
/* 52400 80061C00 769B010C */  jal        EVENT_ParseOpcode
/* 52404 80061C04 9804A627 */   addiu     $a2, $sp, 0x498
/* 52408 80061C08 9804A38F */  lw         $v1, 0x498($sp)
/* 5240C 80061C0C 00000000 */  nop
/* 52410 80061C10 1C006010 */  beqz       $v1, .L80061C84
/* 52414 80061C14 21884000 */   addu      $s1, $v0, $zero
/* 52418 80061C18 58A48287 */  lh         $v0, %gp_rel(EventAbortLine)($gp)
/* 5241C 80061C1C 00000000 */  nop
/* 52420 80061C20 18004014 */  bnez       $v0, .L80061C84
/* 52424 80061C24 00000000 */   nop
/* 52428 80061C28 60A4828F */  lw         $v0, %gp_rel(CurrentEventLine)($gp)
/* 5242C 80061C2C 1000A38F */  lw         $v1, 0x10($sp)
/* 52430 80061C30 01004224 */  addiu      $v0, $v0, 0x1
/* 52434 80061C34 60A482AF */  sw         $v0, %gp_rel(CurrentEventLine)($gp)
/* 52438 80061C38 12006018 */  blez       $v1, .L80061C84
/* 5243C 80061C3C FFFF6224 */   addiu     $v0, $v1, -0x1
/* 52440 80061C40 C0200200 */  sll        $a0, $v0, 3
/* 52444 80061C44 21208200 */  addu       $a0, $a0, $v0
/* 52448 80061C48 80200400 */  sll        $a0, $a0, 2
/* 5244C 80061C4C 21209D00 */  addu       $a0, $a0, $sp
/* 52450 80061C50 14008424 */  addiu      $a0, $a0, 0x14
/* 52454 80061C54 9C04A527 */  addiu      $a1, $sp, 0x49C
/* 52458 80061C58 A004A627 */  addiu      $a2, $sp, 0x4A0
/* 5245C 80061C5C 63A2010C */  jal        EVENT_GetScalerValueFromOperand
/* 52460 80061C60 1000A2AF */   sw        $v0, 0x10($sp)
/* 52464 80061C64 9C04A38F */  lw         $v1, 0x49C($sp)
/* 52468 80061C68 00000000 */  nop
/* 5246C 80061C6C 03006010 */  beqz       $v1, .L80061C7C
/* 52470 80061C70 21804000 */   addu      $s0, $v0, $zero
/* 52474 80061C74 27870108 */  j          .L80061C9C
/* 52478 80061C78 21800000 */   addu      $s0, $zero, $zero
.L80061C7C:
/* 5247C 80061C7C 07000012 */  beqz       $s0, .L80061C9C
/* 52480 80061C80 00000000 */   nop
.L80061C84:
/* 52484 80061C84 05002012 */  beqz       $s1, .L80061C9C
/* 52488 80061C88 00000000 */   nop
/* 5248C 80061C8C 58A48287 */  lh         $v0, %gp_rel(EventAbortLine)($gp)
/* 52490 80061C90 00000000 */  nop
/* 52494 80061C94 D9FF4010 */  beqz       $v0, .L80061BFC
/* 52498 80061C98 1000A427 */   addiu     $a0, $sp, 0x10
.L80061C9C:
/* 5249C 80061C9C 58A48387 */  lh         $v1, %gp_rel(EventAbortLine)($gp)
/* 524A0 80061CA0 01000224 */  addiu      $v0, $zero, 0x1
/* 524A4 80061CA4 03006214 */  bne        $v1, $v0, .L80061CB4
/* 524A8 80061CA8 21100002 */   addu      $v0, $s0, $zero
/* 524AC 80061CAC 21800000 */  addu       $s0, $zero, $zero
/* 524B0 80061CB0 21100002 */  addu       $v0, $s0, $zero
.L80061CB4:
/* 524B4 80061CB4 B004BF8F */  lw         $ra, 0x4B0($sp)
/* 524B8 80061CB8 AC04B18F */  lw         $s1, 0x4AC($sp)
/* 524BC 80061CBC A804B08F */  lw         $s0, 0x4A8($sp)
/* 524C0 80061CC0 0800E003 */  jr         $ra
/* 524C4 80061CC4 B804BD27 */   addiu     $sp, $sp, 0x4B8
.size EVENT_IsConditionTrue, . - EVENT_IsConditionTrue
