.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD610
/* ADE10 800BD610 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* ADE14 800BD614 21288000 */  addu       $a1, $a0, $zero
/* ADE18 800BD618 1400B1AF */  sw         $s1, 0x14($sp)
/* ADE1C 800BD61C 0E80113C */  lui        $s1, %hi(GsOUT_PACKET_P_dup1 + 0xA0)
/* ADE20 800BD620 08D73126 */  addiu      $s1, $s1, %lo(GsOUT_PACKET_P_dup1 + 0xA0)
/* ADE24 800BD624 1C00B3AF */  sw         $s3, 0x1C($sp)
/* ADE28 800BD628 F7FF1324 */  addiu      $s3, $zero, -0x9
/* ADE2C 800BD62C 1800B2AF */  sw         $s2, 0x18($sp)
/* ADE30 800BD630 0D80123C */  lui        $s2, %hi(_padFixResult)
/* ADE34 800BD634 5CE95226 */  addiu      $s2, $s2, %lo(_padFixResult)
/* ADE38 800BD638 2000BFAF */  sw         $ra, 0x20($sp)
/* ADE3C 800BD63C 1000B0AF */  sw         $s0, 0x10($sp)
.L800BD640:
/* ADE40 800BD640 0D80033C */  lui        $v1, %hi(_padSioChan)
/* ADE44 800BD644 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* ADE48 800BD648 00000000 */  nop
/* ADE4C 800BD64C 00110300 */  sll        $v0, $v1, 4
/* ADE50 800BD650 23104300 */  subu       $v0, $v0, $v1
/* ADE54 800BD654 00110200 */  sll        $v0, $v0, 4
/* ADE58 800BD658 0A00B310 */  beq        $a1, $s3, .L800BD684
/* ADE5C 800BD65C 21805100 */   addu      $s0, $v0, $s1
/* ADE60 800BD660 0400A014 */  bnez       $a1, .L800BD674
/* ADE64 800BD664 80100300 */   sll       $v0, $v1, 2
/* ADE68 800BD668 21105200 */  addu       $v0, $v0, $s2
/* ADE6C 800BD66C A1F50208 */  j          .L800BD684
/* ADE70 800BD670 000040AC */   sw        $zero, 0x0($v0)
.L800BD674:
/* ADE74 800BD674 F80C030C */  jal        _dirFailAuto
/* ADE78 800BD678 21200002 */   addu      $a0, $s0, $zero
/* ADE7C 800BD67C C1F5020C */  jal        func_800BD704
/* ADE80 800BD680 21200002 */   addu      $a0, $s0, $zero
.L800BD684:
/* ADE84 800BD684 0D80023C */  lui        $v0, %hi(ratan_tbl + 0x830)
/* ADE88 800BD688 ACE3428C */  lw         $v0, %lo(ratan_tbl + 0x830)($v0)
/* ADE8C 800BD68C 0D80033C */  lui        $v1, %hi(_padSioChan)
/* ADE90 800BD690 44E9638C */  lw         $v1, %lo(_padSioChan)($v1)
/* ADE94 800BD694 0D80013C */  lui        $at, %hi(_padSioState)
/* ADE98 800BD698 48E920AC */  sw         $zero, %lo(_padSioState)($at)
/* ADE9C 800BD69C 0A0040A4 */  sh         $zero, 0xA($v0)
/* ADEA0 800BD6A0 0D80023C */  lui        $v0, %hi(_padChanStop)
/* ADEA4 800BD6A4 58E9428C */  lw         $v0, %lo(_padChanStop)($v0)
/* ADEA8 800BD6A8 01006324 */  addiu      $v1, $v1, 0x1
/* ADEAC 800BD6AC 0D80013C */  lui        $at, %hi(_padSioChan)
/* ADEB0 800BD6B0 44E923AC */  sw         $v1, %lo(_padSioChan)($at)
/* ADEB4 800BD6B4 2A104300 */  slt        $v0, $v0, $v1
/* ADEB8 800BD6B8 08004014 */  bnez       $v0, .L800BD6DC
/* ADEBC 800BD6BC 01000224 */   addiu     $v0, $zero, 0x1
/* ADEC0 800BD6C0 00210300 */  sll        $a0, $v1, 4
/* ADEC4 800BD6C4 23208300 */  subu       $a0, $a0, $v1
/* ADEC8 800BD6C8 00210400 */  sll        $a0, $a0, 4
/* ADECC 800BD6CC B209030C */  jal        _padInitSioMode
/* ADED0 800BD6D0 21209100 */   addu      $a0, $a0, $s1
/* ADED4 800BD6D4 B8F50208 */  j          .L800BD6E0
/* ADED8 800BD6D8 FFFF0534 */   ori       $a1, $zero, 0xFFFF
.L800BD6DC:
/* ADEDC 800BD6DC FFFF0534 */  ori        $a1, $zero, 0xFFFF
.L800BD6E0:
/* ADEE0 800BD6E0 D7FF4010 */  beqz       $v0, .L800BD640
/* ADEE4 800BD6E4 00000000 */   nop
/* ADEE8 800BD6E8 2000BF8F */  lw         $ra, 0x20($sp)
/* ADEEC 800BD6EC 1C00B38F */  lw         $s3, 0x1C($sp)
/* ADEF0 800BD6F0 1800B28F */  lw         $s2, 0x18($sp)
/* ADEF4 800BD6F4 1400B18F */  lw         $s1, 0x14($sp)
/* ADEF8 800BD6F8 1000B08F */  lw         $s0, 0x10($sp)
/* ADEFC 800BD6FC 0800E003 */  jr         $ra
/* ADF00 800BD700 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800BD610, . - func_800BD610
