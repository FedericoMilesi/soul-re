.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_PutMusicCommand
/* 3119C 8004099C 6CC3828F */  lw         $v0, %gp_rel(musicInfo + 0x40)($gp)
/* 311A0 800409A0 4CC38327 */  addiu      $v1, $gp, %gp_rel(musicInfo + 0x20)
/* 311A4 800409A4 C0100200 */  sll        $v0, $v0, 3
/* 311A8 800409A8 21104300 */  addu       $v0, $v0, $v1
/* 311AC 800409AC 000044AC */  sw         $a0, 0x0($v0)
/* 311B0 800409B0 040045AC */  sw         $a1, 0x4($v0)
/* 311B4 800409B4 74C3838F */  lw         $v1, %gp_rel(musicInfo + 0x48)($gp)
/* 311B8 800409B8 00000000 */  nop
/* 311BC 800409BC 03006228 */  slti       $v0, $v1, 0x3
/* 311C0 800409C0 06004010 */  beqz       $v0, .L800409DC
/* 311C4 800409C4 01006324 */   addiu     $v1, $v1, 0x1
/* 311C8 800409C8 6CC3828F */  lw         $v0, %gp_rel(musicInfo + 0x40)($gp)
/* 311CC 800409CC 74C383AF */  sw         $v1, %gp_rel(musicInfo + 0x48)($gp)
/* 311D0 800409D0 01004224 */  addiu      $v0, $v0, 0x1
/* 311D4 800409D4 03004230 */  andi       $v0, $v0, 0x3
/* 311D8 800409D8 6CC382AF */  sw         $v0, %gp_rel(musicInfo + 0x40)($gp)
.L800409DC:
/* 311DC 800409DC 0800E003 */  jr         $ra
/* 311E0 800409E0 00000000 */   nop
.size SOUND_PutMusicCommand, . - SOUND_PutMusicCommand
