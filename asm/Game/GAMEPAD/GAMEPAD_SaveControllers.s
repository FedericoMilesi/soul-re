.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_SaveControllers
/* 2285C 8003205C 01000224 */  addiu      $v0, $zero, 0x1
/* 22860 80032060 749282AF */  sw         $v0, %gp_rel(gpSaved)($gp)
/* 22864 80032064 A0BA8327 */  addiu      $v1, $gp, %gp_rel(overrideCommand)
/* 22868 80032068 10BE8227 */  addiu      $v0, $gp, %gp_rel(gameTrackerX + 0x48)
/* 2286C 8003206C 30BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x68)
.L80032070:
/* 22870 80032070 0000458C */  lw         $a1, 0x0($v0)
/* 22874 80032074 0400468C */  lw         $a2, 0x4($v0)
/* 22878 80032078 0800478C */  lw         $a3, 0x8($v0)
/* 2287C 8003207C 0C00488C */  lw         $t0, 0xC($v0)
/* 22880 80032080 000065AC */  sw         $a1, 0x0($v1)
/* 22884 80032084 040066AC */  sw         $a2, 0x4($v1)
/* 22888 80032088 080067AC */  sw         $a3, 0x8($v1)
/* 2288C 8003208C 0C0068AC */  sw         $t0, 0xC($v1)
/* 22890 80032090 10004224 */  addiu      $v0, $v0, 0x10
/* 22894 80032094 F6FF4414 */  bne        $v0, $a0, .L80032070
/* 22898 80032098 10006324 */   addiu     $v1, $v1, 0x10
/* 2289C 8003209C 0000458C */  lw         $a1, 0x0($v0)
/* 228A0 800320A0 0400468C */  lw         $a2, 0x4($v0)
/* 228A4 800320A4 000065AC */  sw         $a1, 0x0($v1)
/* 228A8 800320A8 040066AC */  sw         $a2, 0x4($v1)
/* 228AC 800320AC 70BA8327 */  addiu      $v1, $gp, %gp_rel(overrideData)
/* 228B0 800320B0 38BE8227 */  addiu      $v0, $gp, %gp_rel(gameTrackerX + 0x70)
/* 228B4 800320B4 58BE8427 */  addiu      $a0, $gp, %gp_rel(gameTrackerX + 0x90)
.L800320B8:
/* 228B8 800320B8 0000458C */  lw         $a1, 0x0($v0)
/* 228BC 800320BC 0400468C */  lw         $a2, 0x4($v0)
/* 228C0 800320C0 0800478C */  lw         $a3, 0x8($v0)
/* 228C4 800320C4 0C00488C */  lw         $t0, 0xC($v0)
/* 228C8 800320C8 000065AC */  sw         $a1, 0x0($v1)
/* 228CC 800320CC 040066AC */  sw         $a2, 0x4($v1)
/* 228D0 800320D0 080067AC */  sw         $a3, 0x8($v1)
/* 228D4 800320D4 0C0068AC */  sw         $t0, 0xC($v1)
/* 228D8 800320D8 10004224 */  addiu      $v0, $v0, 0x10
/* 228DC 800320DC F6FF4414 */  bne        $v0, $a0, .L800320B8
/* 228E0 800320E0 10006324 */   addiu     $v1, $v1, 0x10
/* 228E4 800320E4 0000458C */  lw         $a1, 0x0($v0)
/* 228E8 800320E8 0400468C */  lw         $a2, 0x4($v0)
/* 228EC 800320EC 000065AC */  sw         $a1, 0x0($v1)
/* 228F0 800320F0 0800E003 */  jr         $ra
/* 228F4 800320F4 040066AC */   sw        $a2, 0x4($v1)
.size GAMEPAD_SaveControllers, . - GAMEPAD_SaveControllers
