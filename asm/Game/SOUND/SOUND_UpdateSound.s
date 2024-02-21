.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_UpdateSound
/* 3173C 80040F3C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 31740 80040F40 1800BFAF */  sw         $ra, 0x18($sp)
/* 31744 80040F44 BA4B010C */  jal        aadProcessLoadQueue
/* 31748 80040F48 00000000 */   nop
/* 3174C 80040F4C 88BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0xC0)($gp)
/* 31750 80040F50 0400033C */  lui        $v1, (0x40000 >> 16)
/* 31754 80040F54 24104300 */  and        $v0, $v0, $v1
/* 31758 80040F58 19004014 */  bnez       $v0, .L80040FC0
/* 3175C 80040F5C 00000000 */   nop
/* 31760 80040F60 8899828F */  lw         $v0, %gp_rel(gSramFullAlarm)($gp)
/* 31764 80040F64 00000000 */  nop
/* 31768 80040F68 05004014 */  bnez       $v0, .L80040F80
/* 3176C 80040F6C 00000000 */   nop
/* 31770 80040F70 8C99828F */  lw         $v0, %gp_rel(gSramFullMsgCnt)($gp)
/* 31774 80040F74 00000000 */  nop
/* 31778 80040F78 11004010 */  beqz       $v0, .L80040FC0
/* 3177C 80040F7C 00000000 */   nop
.L80040F80:
/* 31780 80040F80 8C99828F */  lw         $v0, %gp_rel(gSramFullMsgCnt)($gp)
/* 31784 80040F84 00000000 */  nop
/* 31788 80040F88 02004014 */  bnez       $v0, .L80040F94
/* 3178C 80040F8C FFFF4224 */   addiu     $v0, $v0, -0x1
/* 31790 80040F90 3C000224 */  addiu      $v0, $zero, 0x3C
.L80040F94:
/* 31794 80040F94 8C9982AF */  sw         $v0, %gp_rel(gSramFullMsgCnt)($gp)
/* 31798 80040F98 0D80043C */  lui        $a0, %hi(D_800D0F9C)
/* 3179C 80040F9C 1CC3828F */  lw         $v0, %gp_rel(gSramFreeBlocks)($gp)
/* 317A0 80040FA0 D8C0838F */  lw         $v1, %gp_rel(gSramLargestFree)($gp)
/* 317A4 80040FA4 24C3858F */  lw         $a1, %gp_rel(gSramTotalUsed)($gp)
/* 317A8 80040FA8 20C3868F */  lw         $a2, %gp_rel(gSramUsedBlocks)($gp)
/* 317AC 80040FAC 28C3878F */  lw         $a3, %gp_rel(gSramTotalFree)($gp)
/* 317B0 80040FB0 9C0F8424 */  addiu      $a0, $a0, %lo(D_800D0F9C)
/* 317B4 80040FB4 1000A2AF */  sw         $v0, 0x10($sp)
/* 317B8 80040FB8 C3B5000C */  jal        FONT_Print
/* 317BC 80040FBC 1400A3AF */   sw        $v1, 0x14($sp)
.L80040FC0:
/* 317C0 80040FC0 89BF8293 */  lbu        $v0, %gp_rel(gameTrackerX + 0x1C1)($gp)
/* 317C4 80040FC4 00000000 */  nop
/* 317C8 80040FC8 03004010 */  beqz       $v0, .L80040FD8
/* 317CC 80040FCC 00000000 */   nop
/* 317D0 80040FD0 9002010C */  jal        SOUND_ProcessMusicLoad
/* 317D4 80040FD4 00000000 */   nop
.L80040FD8:
/* 317D8 80040FD8 1800BF8F */  lw         $ra, 0x18($sp)
/* 317DC 80040FDC 00000000 */  nop
/* 317E0 80040FE0 0800E003 */  jr         $ra
/* 317E4 80040FE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUND_UpdateSound, . - SOUND_UpdateSound
