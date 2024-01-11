.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C0440
/* B0C40 800C0440 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B0C44 800C0444 7F00E730 */  andi       $a3, $a3, 0x7F
/* B0C48 800C0448 80390700 */  sll        $a3, $a3, 6
/* B0C4C 800C044C 7F00A530 */  andi       $a1, $a1, 0x7F
/* B0C50 800C0450 002A0500 */  sll        $a1, $a1, 8
/* B0C54 800C0454 0F00C630 */  andi       $a2, $a2, 0xF
/* B0C58 800C0458 2000A28F */  lw         $v0, 0x20($sp)
/* B0C5C 800C045C 00310600 */  sll        $a2, $a2, 4
/* B0C60 800C0460 05004238 */  xori       $v0, $v0, 0x5
/* B0C64 800C0464 0100422C */  sltiu      $v0, $v0, 0x1
/* B0C68 800C0468 C0430200 */  sll        $t0, $v0, 15
/* B0C6C 800C046C 1800A28F */  lw         $v0, 0x18($sp)
/* B0C70 800C0470 2528A600 */  or         $a1, $a1, $a2
/* B0C74 800C0474 1F004230 */  andi       $v0, $v0, 0x1F
/* B0C78 800C0478 2538E200 */  or         $a3, $a3, $v0
/* B0C7C 800C047C 1C00A28F */  lw         $v0, 0x1C($sp)
/* B0C80 800C0480 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0C84 800C0484 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B0C88 800C0488 0F004230 */  andi       $v0, $v0, 0xF
/* B0C8C 800C048C 2528A200 */  or         $a1, $a1, $v0
/* B0C90 800C0490 2528A800 */  or         $a1, $a1, $t0
/* B0C94 800C0494 00400824 */  addiu      $t0, $zero, 0x4000
/* B0C98 800C0498 00110400 */  sll        $v0, $a0, 4
/* B0C9C 800C049C 21104300 */  addu       $v0, $v0, $v1
/* B0CA0 800C04A0 080045A4 */  sh         $a1, 0x8($v0)
/* B0CA4 800C04A4 C0280400 */  sll        $a1, $a0, 3
/* B0CA8 800C04A8 05000224 */  addiu      $v0, $zero, 0x5
/* B0CAC 800C04AC 2400A38F */  lw         $v1, 0x24($sp)
/* B0CB0 800C04B0 2800A48F */  lw         $a0, 0x28($sp)
/* B0CB4 800C04B4 0E006210 */  beq        $v1, $v0, .L800C04F0
/* B0CB8 800C04B8 06006228 */   slti      $v0, $v1, 0x6
/* B0CBC 800C04BC 05004010 */  beqz       $v0, .L800C04D4
/* B0CC0 800C04C0 01000224 */   addiu     $v0, $zero, 0x1
/* B0CC4 800C04C4 08006210 */  beq        $v1, $v0, .L800C04E8
/* B0CC8 800C04C8 07000224 */   addiu     $v0, $zero, 0x7
/* B0CCC 800C04CC 40010308 */  j          .L800C0500
/* B0CD0 800C04D0 00000000 */   nop
.L800C04D4:
/* B0CD4 800C04D4 07000224 */  addiu      $v0, $zero, 0x7
/* B0CD8 800C04D8 07006210 */  beq        $v1, $v0, .L800C04F8
/* B0CDC 800C04DC 00000000 */   nop
/* B0CE0 800C04E0 40010308 */  j          .L800C0500
/* B0CE4 800C04E4 00000000 */   nop
.L800C04E8:
/* B0CE8 800C04E8 3F010308 */  j          .L800C04FC
/* B0CEC 800C04EC 21400000 */   addu      $t0, $zero, $zero
.L800C04F0:
/* B0CF0 800C04F0 3F010308 */  j          .L800C04FC
/* B0CF4 800C04F4 00800834 */   ori       $t0, $zero, 0x8000
.L800C04F8:
/* B0CF8 800C04F8 00C00834 */  ori        $t0, $zero, 0xC000
.L800C04FC:
/* B0CFC 800C04FC 07000224 */  addiu      $v0, $zero, 0x7
.L800C0500:
/* B0D00 800C0500 03008214 */  bne        $a0, $v0, .L800C0510
/* B0D04 800C0504 2520E800 */   or        $a0, $a3, $t0
/* B0D08 800C0508 20000835 */  ori        $t0, $t0, 0x20
/* B0D0C 800C050C 2520E800 */  or         $a0, $a3, $t0
.L800C0510:
/* B0D10 800C0510 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B0D14 800C0514 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B0D18 800C0518 40100500 */  sll        $v0, $a1, 1
/* B0D1C 800C051C 21104300 */  addu       $v0, $v0, $v1
/* B0D20 800C0520 0A0044A4 */  sh         $a0, 0xA($v0)
/* B0D24 800C0524 01000224 */  addiu      $v0, $zero, 0x1
/* B0D28 800C0528 0400A2AF */  sw         $v0, 0x4($sp)
/* B0D2C 800C052C 58010308 */  j          .L800C0560
/* B0D30 800C0530 0000A0AF */   sw        $zero, 0x0($sp)
.L800C0534:
/* B0D34 800C0534 0400A38F */  lw         $v1, 0x4($sp)
/* B0D38 800C0538 00000000 */  nop
/* B0D3C 800C053C 40100300 */  sll        $v0, $v1, 1
/* B0D40 800C0540 21104300 */  addu       $v0, $v0, $v1
/* B0D44 800C0544 80100200 */  sll        $v0, $v0, 2
/* B0D48 800C0548 21104300 */  addu       $v0, $v0, $v1
/* B0D4C 800C054C 0400A2AF */  sw         $v0, 0x4($sp)
/* B0D50 800C0550 0000A28F */  lw         $v0, 0x0($sp)
/* B0D54 800C0554 00000000 */  nop
/* B0D58 800C0558 01004224 */  addiu      $v0, $v0, 0x1
/* B0D5C 800C055C 0000A2AF */  sw         $v0, 0x0($sp)
.L800C0560:
/* B0D60 800C0560 0000A28F */  lw         $v0, 0x0($sp)
/* B0D64 800C0564 00000000 */  nop
/* B0D68 800C0568 02004228 */  slti       $v0, $v0, 0x2
/* B0D6C 800C056C F1FF4014 */  bnez       $v0, .L800C0534
/* B0D70 800C0570 00000000 */   nop
/* B0D74 800C0574 0800E003 */  jr         $ra
/* B0D78 800C0578 0800BD27 */   addiu     $sp, $sp, 0x8
/* B0D7C 800C057C 00000000 */  nop
.size func_800C0440, . - func_800C0440
