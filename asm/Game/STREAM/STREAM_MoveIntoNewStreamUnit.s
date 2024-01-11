.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_MoveIntoNewStreamUnit
/* 4B208 8005AA08 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4B20C 8005AA0C F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4B210 8005AA10 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4B214 8005AA14 1000BFAF */  sw         $ra, 0x10($sp)
/* 4B218 8005AA18 C80062A4 */  sh         $v0, 0xC8($v1)
/* 4B21C 8005AA1C F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4B220 8005AA20 00000000 */  nop
/* 4B224 8005AA24 CC0040AC */  sw         $zero, 0xCC($v0)
/* 4B228 8005AA28 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4B22C 8005AA2C 68BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x1A0)($gp)
/* 4B230 8005AA30 00000000 */  nop
/* 4B234 8005AA34 380062AC */  sw         $v0, 0x38($v1)
/* 4B238 8005AA38 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 4B23C 8005AA3C EAD5000C */  jal        INSTANCE_UpdateFamilyStreamUnitID
/* 4B240 8005AA40 00000000 */   nop
/* 4B244 8005AA44 48BF8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x180)
/* 4B248 8005AA48 58BF8687 */  lh         $a2, %gp_rel(gameTrackerX + 0x190)($gp)
/* 4B24C 8005AA4C 5ABF8787 */  lh         $a3, %gp_rel(gameTrackerX + 0x192)($gp)
/* 4B250 8005AA50 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 4B254 8005AA54 49B9000C */  jal        GAMELOOP_StreamLevelLoadAndInit
/* 4B258 8005AA58 00000000 */   nop
/* 4B25C 8005AA5C 46BF8387 */  lh         $v1, %gp_rel(gameTrackerX + 0x17E)($gp)
/* 4B260 8005AA60 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4B264 8005AA64 44BF80A7 */  sh         $zero, %gp_rel(gameTrackerX + 0x17C)($gp)
/* 4B268 8005AA68 08006210 */  beq        $v1, $v0, .L8005AA8C
/* 4B26C 8005AA6C 84010424 */   addiu     $a0, $zero, 0x184
/* 4B270 8005AA70 7F000524 */  addiu      $a1, $zero, 0x7F
/* 4B274 8005AA74 40000624 */  addiu      $a2, $zero, 0x40
/* 4B278 8005AA78 2402010C */  jal        SndPlayVolPan
/* 4B27C 8005AA7C 21380000 */   addu      $a3, $zero, $zero
/* 4B280 8005AA80 46BF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x17E)($gp)
/* 4B284 8005AA84 00000000 */  nop
/* 4B288 8005AA88 FCA082AF */  sw         $v0, %gp_rel(CurrentWarpNumber)($gp)
.L8005AA8C:
/* 4B28C 8005AA8C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4B290 8005AA90 00000000 */  nop
/* 4B294 8005AA94 0800E003 */  jr         $ra
/* 4B298 8005AA98 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_MoveIntoNewStreamUnit, . - STREAM_MoveIntoNewStreamUnit
