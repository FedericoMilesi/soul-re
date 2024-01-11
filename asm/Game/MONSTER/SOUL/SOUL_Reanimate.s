.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_Reanimate
/* 7F174 8008E974 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F178 8008E978 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F17C 8008E97C 21888000 */  addu       $s1, $a0, $zero
/* 7F180 8008E980 08C0868F */  lw         $a2, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7F184 8008E984 1800BFAF */  sw         $ra, 0x18($sp)
/* 7F188 8008E988 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F18C 8008E98C 6C01308E */  lw         $s0, 0x16C($s1)
/* 7F190 8008E990 9036020C */  jal        SOUL_MoveToDest
/* 7F194 8008E994 10000524 */   addiu     $a1, $zero, 0x10
/* 7F198 8008E998 5C002386 */  lh         $v1, 0x5C($s1)
/* 7F19C 8008E99C 24010486 */  lh         $a0, 0x124($s0)
/* 7F1A0 8008E9A0 5E002286 */  lh         $v0, 0x5E($s1)
/* 7F1A4 8008E9A4 26010586 */  lh         $a1, 0x126($s0)
/* 7F1A8 8008E9A8 23206400 */  subu       $a0, $v1, $a0
/* 7F1AC 8008E9AC EBE6000C */  jal        MATH3D_LengthXY
/* 7F1B0 8008E9B0 23284500 */   subu      $a1, $v0, $a1
/* 7F1B4 8008E9B4 FA004228 */  slti       $v0, $v0, 0xFA
/* 7F1B8 8008E9B8 13004010 */  beqz       $v0, .L8008EA08
/* 7F1BC 8008E9BC 00000000 */   nop
/* 7F1C0 8008E9C0 D800048E */  lw         $a0, 0xD8($s0)
/* 7F1C4 8008E9C4 00000000 */  nop
/* 7F1C8 8008E9C8 0B008010 */  beqz       $a0, .L8008E9F8
/* 7F1CC 8008E9CC 00000000 */   nop
/* 7F1D0 8008E9D0 62D2000C */  jal        INSTANCE_Find
/* 7F1D4 8008E9D4 00000000 */   nop
/* 7F1D8 8008E9D8 05004010 */  beqz       $v0, .L8008E9F0
/* 7F1DC 8008E9DC 21204000 */   addu      $a0, $v0, $zero
/* 7F1E0 8008E9E0 0001053C */  lui        $a1, (0x100000D >> 16)
/* 7F1E4 8008E9E4 0D00A534 */  ori        $a1, $a1, (0x100000D & 0xFFFF)
/* 7F1E8 8008E9E8 A1D1000C */  jal        INSTANCE_Post
/* 7F1EC 8008E9EC 21300000 */   addu      $a2, $zero, $zero
.L8008E9F0:
/* 7F1F0 8008E9F0 B8D8020C */  jal        SAVE_DeleteInstance
/* 7F1F4 8008E9F4 21202002 */   addu      $a0, $s1, $zero
.L8008E9F8:
/* 7F1F8 8008E9F8 D00B020C */  jal        MON_KillMonster
/* 7F1FC 8008E9FC 21202002 */   addu      $a0, $s1, $zero
/* 7F200 8008EA00 863A0208 */  j          .L8008EA18
/* 7F204 8008EA04 00000000 */   nop
.L8008EA08:
/* 7F208 8008EA08 27C3010C */  jal        DeMessageQueue
/* 7F20C 8008EA0C 08000426 */   addiu     $a0, $s0, 0x8
/* 7F210 8008EA10 FDFF4014 */  bnez       $v0, .L8008EA08
/* 7F214 8008EA14 00000000 */   nop
.L8008EA18:
/* 7F218 8008EA18 1800BF8F */  lw         $ra, 0x18($sp)
/* 7F21C 8008EA1C 1400B18F */  lw         $s1, 0x14($sp)
/* 7F220 8008EA20 1000B08F */  lw         $s0, 0x10($sp)
/* 7F224 8008EA24 0800E003 */  jr         $ra
/* 7F228 8008EA28 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_Reanimate, . - SOUL_Reanimate
