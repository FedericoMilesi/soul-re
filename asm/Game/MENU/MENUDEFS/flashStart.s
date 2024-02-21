.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel flashStart
/* A9518 800B8D18 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* A951C 800B8D1C 1CAA838F */  lw         $v1, %gp_rel(StartGameFading)($gp)
/* A9520 800B8D20 01000224 */  addiu      $v0, $zero, 0x1
/* A9524 800B8D24 3400BFAF */  sw         $ra, 0x34($sp)
/* A9528 800B8D28 3000B2AF */  sw         $s2, 0x30($sp)
/* A952C 800B8D2C 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A9530 800B8D30 2800B0AF */  sw         $s0, 0x28($sp)
/* A9534 800B8D34 28C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x260)($gp)
/* A9538 800B8D38 17006214 */  bne        $v1, $v0, .L800B8D98
/* A953C 800B8D3C 8888023C */   lui       $v0, (0x88888889 >> 16)
/* A9540 800B8D40 18AA83AF */  sw         $v1, %gp_rel(hack_reset_attract)($gp)
/* A9544 800B8D44 94BE8387 */  lh         $v1, %gp_rel(gameTrackerX + 0xCC)($gp)
/* A9548 800B8D48 FFFF0224 */  addiu      $v0, $zero, -0x1
/* A954C 800B8D4C 6B006214 */  bne        $v1, $v0, .L800B8EFC
/* A9550 800B8D50 0D80043C */   lui       $a0, %hi(D_800D1FC8)
/* A9554 800B8D54 DAE1020C */  jal        womp_background
/* A9558 800B8D58 C81F8424 */   addiu     $a0, $a0, %lo(D_800D1FC8)
/* A955C 800B8D5C E8BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x20)($gp)
/* A9560 800B8D60 0A000224 */  addiu      $v0, $zero, 0xA
/* A9564 800B8D64 98BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xD0)($gp)
/* A9568 800B8D68 14000224 */  addiu      $v0, $zero, 0x14
/* A956C 800B8D6C 94BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCC)($gp)
/* A9570 800B8D70 96BE82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xCE)($gp)
/* A9574 800B8D74 1CAA80AF */  sw         $zero, %gp_rel(StartGameFading)($gp)
/* A9578 800B8D78 0ADE020C */  jal        menu_pop
/* A957C 800B8D7C 00000000 */   nop
/* A9580 800B8D80 0C80053C */  lui        $a1, %hi(main_menu)
/* A9584 800B8D84 E8BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x20)($gp)
/* A9588 800B8D88 EEDD020C */  jal        menu_push
/* A958C 800B8D8C 008CA524 */   addiu     $a1, $a1, %lo(main_menu)
/* A9590 800B8D90 C1E30208 */  j          .L800B8F04
/* A9594 800B8D94 21100000 */   addu      $v0, $zero, $zero
.L800B8D98:
/* A9598 800B8D98 50AA848F */  lw         $a0, %gp_rel(D_800D1FE8)($gp)
/* A959C 800B8D9C 89884234 */  ori        $v0, $v0, (0x88888889 & 0xFFFF)
/* A95A0 800B8DA0 01008424 */  addiu      $a0, $a0, 0x1
/* A95A4 800B8DA4 18008200 */  mult       $a0, $v0
/* A95A8 800B8DA8 0D80023C */  lui        $v0, %hi(D_800D1FEC)
/* A95AC 800B8DAC EC1F4C24 */  addiu      $t4, $v0, %lo(D_800D1FEC)
/* A95B0 800B8DB0 0000898D */  lw         $t1, 0x0($t4)
/* A95B4 800B8DB4 04008A8D */  lw         $t2, 0x4($t4)
/* A95B8 800B8DB8 08008B8D */  lw         $t3, 0x8($t4)
/* A95BC 800B8DBC 1000A9AF */  sw         $t1, 0x10($sp)
/* A95C0 800B8DC0 1400AAAF */  sw         $t2, 0x14($sp)
/* A95C4 800B8DC4 1800ABAF */  sw         $t3, 0x18($sp)
/* A95C8 800B8DC8 0C00898D */  lw         $t1, 0xC($t4)
/* A95CC 800B8DCC 10008A8D */  lw         $t2, 0x10($t4)
/* A95D0 800B8DD0 14008B8D */  lw         $t3, 0x14($t4)
/* A95D4 800B8DD4 1C00A9AF */  sw         $t1, 0x1C($sp)
/* A95D8 800B8DD8 2000AAAF */  sw         $t2, 0x20($sp)
/* A95DC 800B8DDC 2400ABAF */  sw         $t3, 0x24($sp)
/* A95E0 800B8DE0 C3170400 */  sra        $v0, $a0, 31
/* A95E4 800B8DE4 10480000 */  mfhi       $t1
/* A95E8 800B8DE8 21182401 */  addu       $v1, $t1, $a0
/* A95EC 800B8DEC 43190300 */  sra        $v1, $v1, 5
/* A95F0 800B8DF0 23186200 */  subu       $v1, $v1, $v0
/* A95F4 800B8DF4 00110300 */  sll        $v0, $v1, 4
/* A95F8 800B8DF8 23104300 */  subu       $v0, $v0, $v1
/* A95FC 800B8DFC 80100200 */  sll        $v0, $v0, 2
/* A9600 800B8E00 23208200 */  subu       $a0, $a0, $v0
/* A9604 800B8E04 0A008228 */  slti       $v0, $a0, 0xA
/* A9608 800B8E08 50AA84AF */  sw         $a0, %gp_rel(D_800D1FE8)($gp)
/* A960C 800B8E0C 03004010 */  beqz       $v0, .L800B8E1C
/* A9610 800B8E10 1E008228 */   slti      $v0, $a0, 0x1E
/* A9614 800B8E14 99E30208 */  j          .L800B8E64
/* A9618 800B8E18 21200000 */   addu      $a0, $zero, $zero
.L800B8E1C:
/* A961C 800B8E1C 04004010 */  beqz       $v0, .L800B8E30
/* A9620 800B8E20 6666033C */   lui       $v1, (0x66666667 >> 16)
/* A9624 800B8E24 67666334 */  ori        $v1, $v1, (0x66666667 & 0xFFFF)
/* A9628 800B8E28 93E30208 */  j          .L800B8E4C
/* A962C 800B8E2C F6FF8224 */   addiu     $v0, $a0, -0xA
.L800B8E30:
/* A9630 800B8E30 28008228 */  slti       $v0, $a0, 0x28
/* A9634 800B8E34 03004010 */  beqz       $v0, .L800B8E44
/* A9638 800B8E38 67666334 */   ori       $v1, $v1, (0x66666667 & 0xFFFF)
/* A963C 800B8E3C 99E30208 */  j          .L800B8E64
/* A9640 800B8E40 00100424 */   addiu     $a0, $zero, 0x1000
.L800B8E44:
/* A9644 800B8E44 3C000224 */  addiu      $v0, $zero, 0x3C
/* A9648 800B8E48 23104400 */  subu       $v0, $v0, $a0
.L800B8E4C:
/* A964C 800B8E4C 00130200 */  sll        $v0, $v0, 12
/* A9650 800B8E50 18004300 */  mult       $v0, $v1
/* A9654 800B8E54 C3170200 */  sra        $v0, $v0, 31
/* A9658 800B8E58 10480000 */  mfhi       $t1
/* A965C 800B8E5C C3180900 */  sra        $v1, $t1, 3
/* A9660 800B8E60 23206200 */  subu       $a0, $v1, $v0
.L800B8E64:
/* A9664 800B8E64 00100324 */  addiu      $v1, $zero, 0x1000
/* A9668 800B8E68 1000A28F */  lw         $v0, 0x10($sp)
/* A966C 800B8E6C 23186400 */  subu       $v1, $v1, $a0
/* A9670 800B8E70 18004300 */  mult       $v0, $v1
/* A9674 800B8E74 12400000 */  mflo       $t0
/* A9678 800B8E78 1C00A28F */  lw         $v0, 0x1C($sp)
/* A967C 800B8E7C 00000000 */  nop
/* A9680 800B8E80 18004400 */  mult       $v0, $a0
/* A9684 800B8E84 12300000 */  mflo       $a2
/* A9688 800B8E88 1400A28F */  lw         $v0, 0x14($sp)
/* A968C 800B8E8C 00000000 */  nop
/* A9690 800B8E90 18004300 */  mult       $v0, $v1
/* A9694 800B8E94 12380000 */  mflo       $a3
/* A9698 800B8E98 2000A28F */  lw         $v0, 0x20($sp)
/* A969C 800B8E9C 00000000 */  nop
/* A96A0 800B8EA0 18004400 */  mult       $v0, $a0
/* A96A4 800B8EA4 12280000 */  mflo       $a1
/* A96A8 800B8EA8 1800A28F */  lw         $v0, 0x18($sp)
/* A96AC 800B8EAC 00000000 */  nop
/* A96B0 800B8EB0 18004300 */  mult       $v0, $v1
/* A96B4 800B8EB4 12180000 */  mflo       $v1
/* A96B8 800B8EB8 2400A28F */  lw         $v0, 0x24($sp)
/* A96BC 800B8EBC 00000000 */  nop
/* A96C0 800B8EC0 18004400 */  mult       $v0, $a0
/* A96C4 800B8EC4 21900601 */  addu       $s2, $t0, $a2
/* A96C8 800B8EC8 03931200 */  sra        $s2, $s2, 12
/* A96CC 800B8ECC 2188E500 */  addu       $s1, $a3, $a1
/* A96D0 800B8ED0 038B1100 */  sra        $s1, $s1, 12
/* A96D4 800B8ED4 04000424 */  addiu      $a0, $zero, 0x4
/* A96D8 800B8ED8 12680000 */  mflo       $t5
/* A96DC 800B8EDC 21806D00 */  addu       $s0, $v1, $t5
/* A96E0 800B8EE0 BEB6000C */  jal        FONT_SetColorIndex
/* A96E4 800B8EE4 03831000 */   sra       $s0, $s0, 12
/* A96E8 800B8EE8 04000424 */  addiu      $a0, $zero, 0x4
/* A96EC 800B8EEC 21284002 */  addu       $a1, $s2, $zero
/* A96F0 800B8EF0 21302002 */  addu       $a2, $s1, $zero
/* A96F4 800B8EF4 C1B6000C */  jal        FONT_SetColorIndexCol
/* A96F8 800B8EF8 21380002 */   addu      $a3, $s0, $zero
.L800B8EFC:
/* A96FC 800B8EFC B3DD020C */  jal        localstr_get
/* A9700 800B8F00 22000424 */   addiu     $a0, $zero, 0x22
.L800B8F04:
/* A9704 800B8F04 3400BF8F */  lw         $ra, 0x34($sp)
/* A9708 800B8F08 3000B28F */  lw         $s2, 0x30($sp)
/* A970C 800B8F0C 2C00B18F */  lw         $s1, 0x2C($sp)
/* A9710 800B8F10 2800B08F */  lw         $s0, 0x28($sp)
/* A9714 800B8F14 0800E003 */  jr         $ra
/* A9718 800B8F18 3800BD27 */   addiu     $sp, $sp, 0x38
.size flashStart, . - flashStart
