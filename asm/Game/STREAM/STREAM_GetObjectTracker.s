.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_GetObjectTracker
/* 49970 80059170 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 49974 80059174 1000BFAF */  sw         $ra, 0x10($sp)
/* 49978 80059178 C8BD8527 */  addiu      $a1, $gp, %gp_rel(gameTrackerX)
/* 4997C 8005917C F563010C */  jal        InsertGlobalObject
/* 49980 80059180 00000000 */   nop
/* 49984 80059184 21184000 */  addu       $v1, $v0, $zero
/* 49988 80059188 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4998C 8005918C 06006210 */  beq        $v1, $v0, .L800591A8
/* 49990 80059190 C0100300 */   sll       $v0, $v1, 3
/* 49994 80059194 21104300 */  addu       $v0, $v0, $v1
/* 49998 80059198 0CBE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x44)($gp)
/* 4999C 8005919C 80100200 */  sll        $v0, $v0, 2
/* 499A0 800591A0 6B640108 */  j          .L800591AC
/* 499A4 800591A4 21106200 */   addu      $v0, $v1, $v0
.L800591A8:
/* 499A8 800591A8 21100000 */  addu       $v0, $zero, $zero
.L800591AC:
/* 499AC 800591AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 499B0 800591B0 00000000 */  nop
/* 499B4 800591B4 0800E003 */  jr         $ra
/* 499B8 800591B8 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_GetObjectTracker, . - STREAM_GetObjectTracker
