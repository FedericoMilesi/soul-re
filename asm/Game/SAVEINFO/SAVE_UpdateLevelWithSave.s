.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_UpdateLevelWithSave
/* A6518 800B5D18 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A651C 800B5D1C 1000B0AF */  sw         $s0, 0x10($sp)
/* A6520 800B5D20 21808000 */  addu       $s0, $a0, $zero
/* A6524 800B5D24 1800BFAF */  sw         $ra, 0x18($sp)
/* A6528 800B5D28 1400B1AF */  sw         $s1, 0x14($sp)
/* A652C 800B5D2C 0800028E */  lw         $v0, 0x8($s0)
/* A6530 800B5D30 00000000 */  nop
/* A6534 800B5D34 0000428C */  lw         $v0, 0x0($v0)
/* A6538 800B5D38 00000000 */  nop
/* A653C 800B5D3C 4800428C */  lw         $v0, 0x48($v0)
/* A6540 800B5D40 0000048E */  lw         $a0, 0x0($s0)
/* A6544 800B5D44 10005184 */  lh         $s1, 0x10($v0)
/* A6548 800B5D48 2DD7020C */  jal        SAVE_HasSavedLevel
/* A654C 800B5D4C 00000000 */   nop
/* A6550 800B5D50 21584000 */  addu       $t3, $v0, $zero
/* A6554 800B5D54 3E006011 */  beqz       $t3, .L800B5E50
/* A6558 800B5D58 00000000 */   nop
/* A655C 800B5D5C 0800028E */  lw         $v0, 0x8($s0)
/* A6560 800B5D60 06006385 */  lh         $v1, 0x6($t3)
/* A6564 800B5D64 00004C8C */  lw         $t4, 0x0($v0)
/* A6568 800B5D68 28006018 */  blez       $v1, .L800B5E0C
/* A656C 800B5D6C 21500000 */   addu      $t2, $zero, $zero
/* A6570 800B5D70 21486001 */  addu       $t1, $t3, $zero
.L800B5D74:
/* A6574 800B5D74 0F002391 */  lbu        $v1, 0xF($t1)
/* A6578 800B5D78 01004A25 */  addiu      $t2, $t2, 0x1
/* A657C 800B5D7C C0100300 */  sll        $v0, $v1, 3
/* A6580 800B5D80 21104300 */  addu       $v0, $v0, $v1
/* A6584 800B5D84 4800838D */  lw         $v1, 0x48($t4)
/* A6588 800B5D88 80100200 */  sll        $v0, $v0, 2
/* A658C 800B5D8C 21186200 */  addu       $v1, $v1, $v0
/* A6590 800B5D90 0B002D89 */  lwl        $t5, 0xB($t1)
/* A6594 800B5D94 08002D99 */  lwr        $t5, 0x8($t1)
/* A6598 800B5D98 0C002E85 */  lh         $t6, 0xC($t1)
/* A659C 800B5D9C 17006DA8 */  swl        $t5, 0x17($v1)
/* A65A0 800B5DA0 14006DB8 */  swr        $t5, 0x14($v1)
/* A65A4 800B5DA4 18006EA4 */  sh         $t6, 0x18($v1)
/* A65A8 800B5DA8 12006594 */  lhu        $a1, 0x12($v1)
/* A65AC 800B5DAC 0C006294 */  lhu        $v0, 0xC($v1)
/* A65B0 800B5DB0 14006494 */  lhu        $a0, 0x14($v1)
/* A65B4 800B5DB4 16006694 */  lhu        $a2, 0x16($v1)
/* A65B8 800B5DB8 18006794 */  lhu        $a3, 0x18($v1)
/* A65BC 800B5DBC 002C0500 */  sll        $a1, $a1, 16
/* A65C0 800B5DC0 032E0500 */  sra        $a1, $a1, 24
/* A65C4 800B5DC4 002A0500 */  sll        $a1, $a1, 8
/* A65C8 800B5DC8 120065A4 */  sh         $a1, 0x12($v1)
/* A65CC 800B5DCC 0E002891 */  lbu        $t0, 0xE($t1)
/* A65D0 800B5DD0 21104400 */  addu       $v0, $v0, $a0
/* A65D4 800B5DD4 0C0062A4 */  sh         $v0, 0xC($v1)
/* A65D8 800B5DD8 0E006294 */  lhu        $v0, 0xE($v1)
/* A65DC 800B5DDC 10006494 */  lhu        $a0, 0x10($v1)
/* A65E0 800B5DE0 21104600 */  addu       $v0, $v0, $a2
/* A65E4 800B5DE4 21208700 */  addu       $a0, $a0, $a3
/* A65E8 800B5DE8 2528A800 */  or         $a1, $a1, $t0
/* A65EC 800B5DEC 0E0062A4 */  sh         $v0, 0xE($v1)
/* A65F0 800B5DF0 100064A4 */  sh         $a0, 0x10($v1)
/* A65F4 800B5DF4 120065A4 */  sh         $a1, 0x12($v1)
/* A65F8 800B5DF8 06006285 */  lh         $v0, 0x6($t3)
/* A65FC 800B5DFC 00000000 */  nop
/* A6600 800B5E00 2A104201 */  slt        $v0, $t2, $v0
/* A6604 800B5E04 DBFF4014 */  bnez       $v0, .L800B5D74
/* A6608 800B5E08 08002925 */   addiu     $t1, $t1, 0x8
.L800B5E0C:
/* A660C 800B5E0C 04006485 */  lh         $a0, 0x4($t3)
/* A6610 800B5E10 01800224 */  addiu      $v0, $zero, -0x7FFF
/* A6614 800B5E14 06008210 */  beq        $a0, $v0, .L800B5E30
/* A6618 800B5E18 FF7F0224 */   addiu     $v0, $zero, 0x7FFF
/* A661C 800B5E1C 04008210 */  beq        $a0, $v0, .L800B5E30
/* A6620 800B5E20 21109100 */   addu      $v0, $a0, $s1
/* A6624 800B5E24 0800038E */  lw         $v1, 0x8($s0)
/* A6628 800B5E28 90D70208 */  j          .L800B5E40
/* A662C 800B5E2C 380062AC */   sw        $v0, 0x38($v1)
.L800B5E30:
/* A6630 800B5E30 0800038E */  lw         $v1, 0x8($s0)
/* A6634 800B5E34 04006285 */  lh         $v0, 0x4($t3)
/* A6638 800B5E38 00000000 */  nop
/* A663C 800B5E3C 380062AC */  sw         $v0, 0x38($v1)
.L800B5E40:
/* A6640 800B5E40 00008295 */  lhu        $v0, 0x0($t4)
/* A6644 800B5E44 00000000 */  nop
/* A6648 800B5E48 03004234 */  ori        $v0, $v0, 0x3
/* A664C 800B5E4C 000082A5 */  sh         $v0, 0x0($t4)
.L800B5E50:
/* A6650 800B5E50 1800BF8F */  lw         $ra, 0x18($sp)
/* A6654 800B5E54 1400B18F */  lw         $s1, 0x14($sp)
/* A6658 800B5E58 1000B08F */  lw         $s0, 0x10($sp)
/* A665C 800B5E5C 0800E003 */  jr         $ra
/* A6660 800B5E60 2000BD27 */   addiu     $sp, $sp, 0x20
.size SAVE_UpdateLevelWithSave, . - SAVE_UpdateLevelWithSave
