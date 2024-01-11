.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_CharSpacing
/* 1DD5C 8002D55C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1DD60 8002D560 1000B0AF */  sw         $s0, 0x10($sp)
/* 1DD64 8002D564 2180A000 */  addu       $s0, $a1, $zero
/* 1DD68 8002D568 FF008430 */  andi       $a0, $a0, 0xFF
/* 1DD6C 8002D56C 20000224 */  addiu      $v0, $zero, 0x20
/* 1DD70 8002D570 46008210 */  beq        $a0, $v0, .L8002D68C
/* 1DD74 8002D574 1400BFAF */   sw        $ra, 0x14($sp)
/* 1DD78 8002D578 44B4000C */  jal        FONT_Get2DImageIndex
/* 1DD7C 8002D57C 00000000 */   nop
/* 1DD80 8002D580 21204000 */  addu       $a0, $v0, $zero
/* 1DD84 8002D584 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 1DD88 8002D588 40008210 */  beq        $a0, $v0, .L8002D68C
/* 1DD8C 8002D58C 0D80023C */   lui       $v0, %hi(charMap)
/* 1DD90 8002D590 E0A04224 */  addiu      $v0, $v0, %lo(charMap)
/* 1DD94 8002D594 40180400 */  sll        $v1, $a0, 1
/* 1DD98 8002D598 21186400 */  addu       $v1, $v1, $a0
/* 1DD9C 8002D59C 21186200 */  addu       $v1, $v1, $v0
/* 1DDA0 8002D5A0 0D80043C */  lui        $a0, %hi(fontPos)
/* 1DDA4 8002D5A4 C09F8424 */  addiu      $a0, $a0, %lo(fontPos)
/* 1DDA8 8002D5A8 00006280 */  lb         $v0, 0x0($v1)
/* 1DDAC 8002D5AC 01006790 */  lbu        $a3, 0x1($v1)
/* 1DDB0 8002D5B0 02006990 */  lbu        $t1, 0x2($v1)
/* 1DDB4 8002D5B4 80100200 */  sll        $v0, $v0, 2
/* 1DDB8 8002D5B8 21284400 */  addu       $a1, $v0, $a0
/* 1DDBC 8002D5BC 0200A480 */  lb         $a0, 0x2($a1)
/* 1DDC0 8002D5C0 00006390 */  lbu        $v1, 0x0($v1)
/* 1DDC4 8002D5C4 02008104 */  bgez       $a0, .L8002D5D0
/* 1DDC8 8002D5C8 00000000 */   nop
/* 1DDCC 8002D5CC 23200400 */  negu       $a0, $a0
.L8002D5D0:
/* 1DDD0 8002D5D0 0000A280 */  lb         $v0, 0x0($a1)
/* 1DDD4 8002D5D4 00000000 */  nop
/* 1DDD8 8002D5D8 02004104 */  bgez       $v0, .L8002D5E4
/* 1DDDC 8002D5DC 00160300 */   sll       $v0, $v1, 24
/* 1DDE0 8002D5E0 0300A480 */  lb         $a0, 0x3($a1)
.L8002D5E4:
/* 1DDE4 8002D5E4 02004004 */  bltz       $v0, .L8002D5F0
/* 1DDE8 8002D5E8 08000624 */   addiu     $a2, $zero, 0x8
/* 1DDEC 8002D5EC 21308000 */  addu       $a2, $a0, $zero
.L8002D5F0:
/* 1DDF0 8002D5F0 0D80023C */  lui        $v0, %hi(fontPos)
/* 1DDF4 8002D5F4 C09F4824 */  addiu      $t0, $v0, %lo(fontPos)
/* 1DDF8 8002D5F8 00160700 */  sll        $v0, $a3, 24
/* 1DDFC 8002D5FC 031E0200 */  sra        $v1, $v0, 24
/* 1DE00 8002D600 80100300 */  sll        $v0, $v1, 2
/* 1DE04 8002D604 21104800 */  addu       $v0, $v0, $t0
/* 1DE08 8002D608 02004480 */  lb         $a0, 0x2($v0)
/* 1DE0C 8002D60C 00000000 */  nop
/* 1DE10 8002D610 02008104 */  bgez       $a0, .L8002D61C
/* 1DE14 8002D614 00000000 */   nop
/* 1DE18 8002D618 23200400 */  negu       $a0, $a0
.L8002D61C:
/* 1DE1C 8002D61C 02006004 */  bltz       $v1, .L8002D628
/* 1DE20 8002D620 2128C000 */   addu      $a1, $a2, $zero
/* 1DE24 8002D624 21288000 */  addu       $a1, $a0, $zero
.L8002D628:
/* 1DE28 8002D628 00160900 */  sll        $v0, $t1, 24
/* 1DE2C 8002D62C 033E0200 */  sra        $a3, $v0, 24
/* 1DE30 8002D630 80100700 */  sll        $v0, $a3, 2
/* 1DE34 8002D634 21104800 */  addu       $v0, $v0, $t0
/* 1DE38 8002D638 02004480 */  lb         $a0, 0x2($v0)
/* 1DE3C 8002D63C 00000000 */  nop
/* 1DE40 8002D640 02008104 */  bgez       $a0, .L8002D64C
/* 1DE44 8002D644 00000000 */   nop
/* 1DE48 8002D648 23200400 */  negu       $a0, $a0
.L8002D64C:
/* 1DE4C 8002D64C 0200E004 */  bltz       $a3, .L8002D658
/* 1DE50 8002D650 2118C000 */   addu      $v1, $a2, $zero
/* 1DE54 8002D654 21188000 */  addu       $v1, $a0, $zero
.L8002D658:
/* 1DE58 8002D658 2A10A600 */  slt        $v0, $a1, $a2
/* 1DE5C 8002D65C 05004010 */  beqz       $v0, .L8002D674
/* 1DE60 8002D660 2A106600 */   slt       $v0, $v1, $a2
/* 1DE64 8002D664 0A004010 */  beqz       $v0, .L8002D690
/* 1DE68 8002D668 01006224 */   addiu     $v0, $v1, 0x1
/* 1DE6C 8002D66C A1B50008 */  j          .L8002D684
/* 1DE70 8002D670 2118C000 */   addu      $v1, $a2, $zero
.L8002D674:
/* 1DE74 8002D674 2A106500 */  slt        $v0, $v1, $a1
/* 1DE78 8002D678 05004010 */  beqz       $v0, .L8002D690
/* 1DE7C 8002D67C 01006224 */   addiu     $v0, $v1, 0x1
/* 1DE80 8002D680 2118A000 */  addu       $v1, $a1, $zero
.L8002D684:
/* 1DE84 8002D684 A4B50008 */  j          .L8002D690
/* 1DE88 8002D688 01006224 */   addiu     $v0, $v1, 0x1
.L8002D68C:
/* 1DE8C 8002D68C 21100002 */  addu       $v0, $s0, $zero
.L8002D690:
/* 1DE90 8002D690 1400BF8F */  lw         $ra, 0x14($sp)
/* 1DE94 8002D694 1000B08F */  lw         $s0, 0x10($sp)
/* 1DE98 8002D698 0800E003 */  jr         $ra
/* 1DE9C 8002D69C 1800BD27 */   addiu     $sp, $sp, 0x18
.size FONT_CharSpacing, . - FONT_CharSpacing
