.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_RestoreControllers
/* 228F8 800320F8 7492828F */  lw         $v0, %gp_rel(gpSaved)($gp)
/* 228FC 800320FC 00000000 */  nop
/* 22900 80032100 2A004010 */  beqz       $v0, .L800321AC
/* 22904 80032104 00000000 */   nop
/* 22908 80032108 749280AF */  sw         $zero, %gp_rel(gpSaved)($gp)
/* 2290C 8003210C 38BE8327 */  addiu      $v1, $gp, %gp_rel(gameTrackerX + 0x70)
/* 22910 80032110 70BA8227 */  addiu      $v0, $gp, %gp_rel(overrideData)
/* 22914 80032114 90BA8427 */  addiu      $a0, $gp, %gp_rel(overrideData + 0x20)
.L80032118:
/* 22918 80032118 0000458C */  lw         $a1, 0x0($v0)
/* 2291C 8003211C 0400468C */  lw         $a2, 0x4($v0)
/* 22920 80032120 0800478C */  lw         $a3, 0x8($v0)
/* 22924 80032124 0C00488C */  lw         $t0, 0xC($v0)
/* 22928 80032128 000065AC */  sw         $a1, 0x0($v1)
/* 2292C 8003212C 040066AC */  sw         $a2, 0x4($v1)
/* 22930 80032130 080067AC */  sw         $a3, 0x8($v1)
/* 22934 80032134 0C0068AC */  sw         $t0, 0xC($v1)
/* 22938 80032138 10004224 */  addiu      $v0, $v0, 0x10
/* 2293C 8003213C F6FF4414 */  bne        $v0, $a0, .L80032118
/* 22940 80032140 10006324 */   addiu     $v1, $v1, 0x10
/* 22944 80032144 0000458C */  lw         $a1, 0x0($v0)
/* 22948 80032148 0400468C */  lw         $a2, 0x4($v0)
/* 2294C 8003214C 000065AC */  sw         $a1, 0x0($v1)
/* 22950 80032150 040066AC */  sw         $a2, 0x4($v1)
/* 22954 80032154 10BE8327 */  addiu      $v1, $gp, %gp_rel(gameTrackerX + 0x48)
/* 22958 80032158 A0BA8227 */  addiu      $v0, $gp, %gp_rel(overrideCommand)
/* 2295C 8003215C C0BA8427 */  addiu      $a0, $gp, %gp_rel(overrideCommand + 0x20)
.L80032160:
/* 22960 80032160 0000458C */  lw         $a1, 0x0($v0)
/* 22964 80032164 0400468C */  lw         $a2, 0x4($v0)
/* 22968 80032168 0800478C */  lw         $a3, 0x8($v0)
/* 2296C 8003216C 0C00488C */  lw         $t0, 0xC($v0)
/* 22970 80032170 000065AC */  sw         $a1, 0x0($v1)
/* 22974 80032174 040066AC */  sw         $a2, 0x4($v1)
/* 22978 80032178 080067AC */  sw         $a3, 0x8($v1)
/* 2297C 8003217C 0C0068AC */  sw         $t0, 0xC($v1)
/* 22980 80032180 10004224 */  addiu      $v0, $v0, 0x10
/* 22984 80032184 F6FF4414 */  bne        $v0, $a0, .L80032160
/* 22988 80032188 10006324 */   addiu     $v1, $v1, 0x10
/* 2298C 8003218C 0000458C */  lw         $a1, 0x0($v0)
/* 22990 80032190 0400468C */  lw         $a2, 0x4($v0)
/* 22994 80032194 000065AC */  sw         $a1, 0x0($v1)
/* 22998 80032198 040066AC */  sw         $a2, 0x4($v1)
/* 2299C 8003219C 10BE828F */  lw         $v0, %gp_rel(gameTrackerX + 0x48)($gp)
/* 229A0 800321A0 00000000 */  nop
/* 229A4 800321A4 80004234 */  ori        $v0, $v0, 0x80
/* 229A8 800321A8 10BE82AF */  sw         $v0, %gp_rel(gameTrackerX + 0x48)($gp)
.L800321AC:
/* 229AC 800321AC 0800E003 */  jr         $ra
/* 229B0 800321B0 00000000 */   nop
.size GAMEPAD_RestoreControllers, . - GAMEPAD_RestoreControllers
