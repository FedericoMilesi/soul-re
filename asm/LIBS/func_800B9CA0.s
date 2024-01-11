.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9CA0
/* AA4A0 800B9CA0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AA4A4 800B9CA4 1400B1AF */  sw         $s1, 0x14($sp)
/* AA4A8 800B9CA8 0D80113C */  lui        $s1, %hi(the_attract_movies + 0x68)
/* AA4AC 800B9CAC 14C93126 */  addiu      $s1, $s1, %lo(the_attract_movies + 0x68)
/* AA4B0 800B9CB0 2400BFAF */  sw         $ra, 0x24($sp)
/* AA4B4 800B9CB4 2000B4AF */  sw         $s4, 0x20($sp)
/* AA4B8 800B9CB8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AA4BC 800B9CBC 1800B2AF */  sw         $s2, 0x18($sp)
/* AA4C0 800B9CC0 1000B0AF */  sw         $s0, 0x10($sp)
/* AA4C4 800B9CC4 00002296 */  lhu        $v0, 0x0($s1)
/* AA4C8 800B9CC8 00000000 */  nop
/* AA4CC 800B9CCC 0A004014 */  bnez       $v0, .L800B9CF8
/* AA4D0 800B9CD0 00000000 */   nop
/* AA4D4 800B9CD4 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F4)
/* AA4D8 800B9CD8 A0D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F4)($v0)
/* AA4DC 800B9CDC 00000000 */  nop
/* AA4E0 800B9CE0 00004594 */  lhu        $a1, 0x0($v0)
/* AA4E4 800B9CE4 0180043C */  lui        $a0, %hi(D_80012508)
/* AA4E8 800B9CE8 06D1010C */  jal        printf
/* AA4EC 800B9CEC 08258424 */   addiu     $a0, $a0, %lo(D_80012508)
/* AA4F0 800B9CF0 C408030C */  jal        ReturnFromException
/* AA4F4 800B9CF4 00000000 */   nop
.L800B9CF8:
/* AA4F8 800B9CF8 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10F4)
/* AA4FC 800B9CFC A0D9848C */  lw         $a0, %lo(the_attract_movies + 0x10F4)($a0)
/* AA500 800B9D00 30002396 */  lhu        $v1, 0x30($s1)
/* AA504 800B9D04 01000224 */  addiu      $v0, $zero, 0x1
/* AA508 800B9D08 020022A6 */  sh         $v0, 0x2($s1)
/* AA50C 800B9D0C 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA510 800B9D10 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA514 800B9D14 00008494 */  lhu        $a0, 0x0($a0)
/* AA518 800B9D18 00004294 */  lhu        $v0, 0x0($v0)
/* AA51C 800B9D1C 24186400 */  and        $v1, $v1, $a0
/* AA520 800B9D20 24104300 */  and        $v0, $v0, $v1
/* AA524 800B9D24 26004010 */  beqz       $v0, .L800B9DC0
/* AA528 800B9D28 21804000 */   addu      $s0, $v0, $zero
/* AA52C 800B9D2C 01001324 */  addiu      $s3, $zero, 0x1
/* AA530 800B9D30 04003426 */  addiu      $s4, $s1, 0x4
.L800B9D34:
/* AA534 800B9D34 16000012 */  beqz       $s0, .L800B9D90
/* AA538 800B9D38 21880000 */   addu      $s1, $zero, $zero
/* AA53C 800B9D3C 21908002 */  addu       $s2, $s4, $zero
.L800B9D40:
/* AA540 800B9D40 0B00222A */  slti       $v0, $s1, 0xB
/* AA544 800B9D44 12004010 */  beqz       $v0, .L800B9D90
/* AA548 800B9D48 01000232 */   andi      $v0, $s0, 0x1
/* AA54C 800B9D4C 0B004010 */  beqz       $v0, .L800B9D7C
/* AA550 800B9D50 04103302 */   sllv      $v0, $s3, $s1
/* AA554 800B9D54 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x10F4)
/* AA558 800B9D58 A0D9638C */  lw         $v1, %lo(the_attract_movies + 0x10F4)($v1)
/* AA55C 800B9D5C 27100200 */  nor        $v0, $zero, $v0
/* AA560 800B9D60 000062A4 */  sh         $v0, 0x0($v1)
/* AA564 800B9D64 0000428E */  lw         $v0, 0x0($s2)
/* AA568 800B9D68 00000000 */  nop
/* AA56C 800B9D6C 03004010 */  beqz       $v0, .L800B9D7C
/* AA570 800B9D70 00000000 */   nop
/* AA574 800B9D74 09F84000 */  jalr       $v0
/* AA578 800B9D78 00000000 */   nop
.L800B9D7C:
/* AA57C 800B9D7C 04005226 */  addiu      $s2, $s2, 0x4
/* AA580 800B9D80 42801000 */  srl        $s0, $s0, 1
/* AA584 800B9D84 FFFF0232 */  andi       $v0, $s0, 0xFFFF
/* AA588 800B9D88 EDFF4014 */  bnez       $v0, .L800B9D40
/* AA58C 800B9D8C 01003126 */   addiu     $s1, $s1, 0x1
.L800B9D90:
/* AA590 800B9D90 0D80043C */  lui        $a0, %hi(the_attract_movies + 0x10F4)
/* AA594 800B9D94 A0D9848C */  lw         $a0, %lo(the_attract_movies + 0x10F4)($a0)
/* AA598 800B9D98 0D80033C */  lui        $v1, %hi(the_attract_movies + 0x98)
/* AA59C 800B9D9C 44C96394 */  lhu        $v1, %lo(the_attract_movies + 0x98)($v1)
/* AA5A0 800B9DA0 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA5A4 800B9DA4 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA5A8 800B9DA8 00008494 */  lhu        $a0, 0x0($a0)
/* AA5AC 800B9DAC 00004294 */  lhu        $v0, 0x0($v0)
/* AA5B0 800B9DB0 24186400 */  and        $v1, $v1, $a0
/* AA5B4 800B9DB4 24104300 */  and        $v0, $v0, $v1
/* AA5B8 800B9DB8 DEFF4014 */  bnez       $v0, .L800B9D34
/* AA5BC 800B9DBC 21804000 */   addu      $s0, $v0, $zero
.L800B9DC0:
/* AA5C0 800B9DC0 0D80053C */  lui        $a1, %hi(the_attract_movies + 0x10F4)
/* AA5C4 800B9DC4 A0D9A58C */  lw         $a1, %lo(the_attract_movies + 0x10F4)($a1)
/* AA5C8 800B9DC8 0D80063C */  lui        $a2, %hi(the_attract_movies + 0x10F8)
/* AA5CC 800B9DCC A4D9C68C */  lw         $a2, %lo(the_attract_movies + 0x10F8)($a2)
/* AA5D0 800B9DD0 0000A294 */  lhu        $v0, 0x0($a1)
/* AA5D4 800B9DD4 0000C394 */  lhu        $v1, 0x0($a2)
/* AA5D8 800B9DD8 00000000 */  nop
/* AA5DC 800B9DDC 24104300 */  and        $v0, $v0, $v1
/* AA5E0 800B9DE0 16004010 */  beqz       $v0, .L800B9E3C
/* AA5E4 800B9DE4 00000000 */   nop
/* AA5E8 800B9DE8 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1100)
/* AA5EC 800B9DEC ACD94224 */  addiu      $v0, $v0, %lo(the_attract_movies + 0x1100)
/* AA5F0 800B9DF0 0000438C */  lw         $v1, 0x0($v0)
/* AA5F4 800B9DF4 00000000 */  nop
/* AA5F8 800B9DF8 21206000 */  addu       $a0, $v1, $zero
/* AA5FC 800B9DFC 01006324 */  addiu      $v1, $v1, 0x1
/* AA600 800B9E00 01088428 */  slti       $a0, $a0, 0x801
/* AA604 800B9E04 0F008014 */  bnez       $a0, .L800B9E44
/* AA608 800B9E08 000043AC */   sw        $v1, 0x0($v0)
/* AA60C 800B9E0C 0180043C */  lui        $a0, %hi(D_80012524)
/* AA610 800B9E10 24258424 */  addiu      $a0, $a0, %lo(D_80012524)
/* AA614 800B9E14 0000A594 */  lhu        $a1, 0x0($a1)
/* AA618 800B9E18 0000C694 */  lhu        $a2, 0x0($a2)
/* AA61C 800B9E1C 06D1010C */  jal        printf
/* AA620 800B9E20 00000000 */   nop
/* AA624 800B9E24 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F4)
/* AA628 800B9E28 A0D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F4)($v0)
/* AA62C 800B9E2C 0D80013C */  lui        $at, %hi(the_attract_movies + 0x1100)
/* AA630 800B9E30 ACD920AC */  sw         $zero, %lo(the_attract_movies + 0x1100)($at)
/* AA634 800B9E34 91E70208 */  j          .L800B9E44
/* AA638 800B9E38 000040A4 */   sh        $zero, 0x0($v0)
.L800B9E3C:
/* AA63C 800B9E3C 0D80013C */  lui        $at, %hi(the_attract_movies + 0x1100)
/* AA640 800B9E40 ACD920AC */  sw         $zero, %lo(the_attract_movies + 0x1100)($at)
.L800B9E44:
/* AA644 800B9E44 0D80013C */  lui        $at, %hi(the_attract_movies + 0x6A)
/* AA648 800B9E48 C408030C */  jal        ReturnFromException
/* AA64C 800B9E4C 16C920A4 */   sh        $zero, %lo(the_attract_movies + 0x6A)($at)
/* AA650 800B9E50 2400BF8F */  lw         $ra, 0x24($sp)
/* AA654 800B9E54 2000B48F */  lw         $s4, 0x20($sp)
/* AA658 800B9E58 1C00B38F */  lw         $s3, 0x1C($sp)
/* AA65C 800B9E5C 1800B28F */  lw         $s2, 0x18($sp)
/* AA660 800B9E60 1400B18F */  lw         $s1, 0x14($sp)
/* AA664 800B9E64 1000B08F */  lw         $s0, 0x10($sp)
/* AA668 800B9E68 0800E003 */  jr         $ra
/* AA66C 800B9E6C 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800B9CA0, . - func_800B9CA0
