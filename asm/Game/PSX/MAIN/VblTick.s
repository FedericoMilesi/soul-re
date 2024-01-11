.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel VblTick
/* 293C0 80038BC0 84BC828F */  lw         $v0, %gp_rel(devstation)($gp)
/* 293C4 80038BC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 293C8 80038BC8 02004010 */  beqz       $v0, .L80038BD4
/* 293CC 80038BCC 1000BFAF */   sw        $ra, 0x10($sp)
/* 293D0 80038BD0 0D000100 */  break      1
.L80038BD4:
/* 293D4 80038BD4 FCBE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x134)($gp)
/* 293D8 80038BD8 E0BE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x118)($gp)
/* 293DC 80038BDC 01004324 */  addiu      $v1, $v0, 0x1
/* 293E0 80038BE0 00BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x138)($gp)
/* 293E4 80038BE4 FCBE83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x134)($gp)
/* 293E8 80038BE8 01004224 */  addiu      $v0, $v0, 0x1
/* 293EC 80038BEC 00BF82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x138)($gp)
/* 293F0 80038BF0 0A008010 */  beqz       $a0, .L80038C1C
/* 293F4 80038BF4 00000000 */   nop
/* 293F8 80038BF8 30C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x268)($gp)
/* 293FC 80038BFC 00000000 */  nop
/* 29400 80038C00 2B104300 */  sltu       $v0, $v0, $v1
/* 29404 80038C04 05004010 */  beqz       $v0, .L80038C1C
/* 29408 80038C08 00000000 */   nop
/* 2940C 80038C0C 68EA020C */  jal        PutDispEnv
/* 29410 80038C10 00000000 */   nop
/* 29414 80038C14 E0BE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x118)($gp)
/* 29418 80038C18 FCBE80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x134)($gp)
.L80038C1C:
/* 2941C 80038C1C 1000BF8F */  lw         $ra, 0x10($sp)
/* 29420 80038C20 00000000 */  nop
/* 29424 80038C24 0800E003 */  jr         $ra
/* 29428 80038C28 1800BD27 */   addiu     $sp, $sp, 0x18
.size VblTick, . - VblTick
