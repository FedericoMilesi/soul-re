.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ResetPrimPool
/* 20890 80030090 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 20894 80030094 1000BFAF */  sw         $ra, 0x10($sp)
/* 20898 80030098 DAC0000C */  jal        ResetDrawPage
/* 2089C 8003009C 00000000 */   nop
/* 208A0 800300A0 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 208A4 800300A4 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 208A8 800300A8 24104300 */  and        $v0, $v0, $v1
/* 208AC 800300AC 11004014 */  bnez       $v0, .L800300F4
/* 208B0 800300B0 00000000 */   nop
/* 208B4 800300B4 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 208B8 800300B8 14BA838F */  lw         $v1, %gp_rel(primPool)($gp)
/* 208BC 800300BC 00000000 */  nop
/* 208C0 800300C0 06004314 */  bne        $v0, $v1, .L800300DC
/* 208C4 800300C4 00000000 */   nop
/* 208C8 800300C8 18BA828F */  lw         $v0, %gp_rel(primPool + 0x4)($gp)
/* 208CC 800300CC 00000000 */  nop
/* 208D0 800300D0 08BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 208D4 800300D4 38C00008 */  j          .L800300E0
/* 208D8 800300D8 00000000 */   nop
.L800300DC:
/* 208DC 800300DC 08BE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
.L800300E0:
/* 208E0 800300E0 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 208E4 800300E4 00000000 */  nop
/* 208E8 800300E8 0C004324 */  addiu      $v1, $v0, 0xC
/* 208EC 800300EC 48C00008 */  j          .L80030120
/* 208F0 800300F0 040043AC */   sw        $v1, 0x4($v0)
.L800300F4:
/* 208F4 800300F4 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 208F8 800300F8 00000000 */  nop
/* 208FC 800300FC 04004010 */  beqz       $v0, .L80030110
/* 20900 80030100 0100023C */   lui       $v0, (0x101DC >> 16)
/* 20904 80030104 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20908 80030108 46C00008 */  j          .L80030118
/* 2090C 8003010C DC014234 */   ori       $v0, $v0, (0x101DC & 0xFFFF)
.L80030110:
/* 20910 80030110 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20914 80030114 AC8C0234 */  ori        $v0, $zero, 0x8CAC
.L80030118:
/* 20918 80030118 21106200 */  addu       $v0, $v1, $v0
/* 2091C 8003011C 040062AC */  sw         $v0, 0x4($v1)
.L80030120:
/* 20920 80030120 08BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x40)($gp)
/* 20924 80030124 00000000 */  nop
/* 20928 80030128 000040AC */  sw         $zero, 0x0($v0)
/* 2092C 8003012C 1000BF8F */  lw         $ra, 0x10($sp)
/* 20930 80030130 00000000 */  nop
/* 20934 80030134 0800E003 */  jr         $ra
/* 20938 80030138 1800BD27 */   addiu     $sp, $sp, 0x18
.size ResetPrimPool, . - ResetPrimPool
