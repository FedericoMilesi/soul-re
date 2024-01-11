.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_GetTimeOfDay
/* 1E6F8 8002DEF8 E2BF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 1E6FC 8002DEFC 00000000 */  nop
/* 1E700 8002DF00 A7FD6224 */  addiu      $v0, $v1, -0x259
/* 1E704 8002DF04 6300422C */  sltiu      $v0, $v0, 0x63
/* 1E708 8002DF08 03004010 */  beqz       $v0, .L8002DF18
/* 1E70C 8002DF0C 44FD6224 */   addiu     $v0, $v1, -0x2BC
/* 1E710 8002DF10 0800E003 */  jr         $ra
/* 1E714 8002DF14 58020224 */   addiu     $v0, $zero, 0x258
.L8002DF18:
/* 1E718 8002DF18 4C04422C */  sltiu      $v0, $v0, 0x44C
/* 1E71C 8002DF1C 07004014 */  bnez       $v0, .L8002DF3C
/* 1E720 8002DF20 BC020224 */   addiu     $v0, $zero, 0x2BC
/* 1E724 8002DF24 F8F86324 */  addiu      $v1, $v1, -0x708
/* 1E728 8002DF28 6400632C */  sltiu      $v1, $v1, 0x64
/* 1E72C 8002DF2C 03006014 */  bnez       $v1, .L8002DF3C
/* 1E730 8002DF30 08070224 */   addiu     $v0, $zero, 0x708
/* 1E734 8002DF34 0800E003 */  jr         $ra
/* 1E738 8002DF38 6C070224 */   addiu     $v0, $zero, 0x76C
.L8002DF3C:
/* 1E73C 8002DF3C 0800E003 */  jr         $ra
/* 1E740 8002DF40 00000000 */   nop
.size GAMELOOP_GetTimeOfDay, . - GAMELOOP_GetTimeOfDay
