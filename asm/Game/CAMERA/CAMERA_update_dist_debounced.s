.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_update_dist_debounced
/* 9AEC 800192EC 9C04828C */  lw         $v0, 0x49C($a0)
/* 9AF0 800192F0 0002033C */  lui        $v1, (0x2000000 >> 16)
/* 9AF4 800192F4 24104300 */  and        $v0, $v0, $v1
/* 9AF8 800192F8 0B004010 */  beqz       $v0, .L80019328
/* 9AFC 800192FC 2130A000 */   addu      $a2, $a1, $zero
/* 9B00 80019300 00140500 */  sll        $v0, $a1, 16
/* 9B04 80019304 03140200 */  sra        $v0, $v0, 16
/* 9B08 80019308 58024228 */  slti       $v0, $v0, 0x258
/* 9B0C 8001930C 06004010 */  beqz       $v0, .L80019328
/* 9B10 80019310 00000000 */   nop
/* 9B14 80019314 D8AB8287 */  lh         $v0, %gp_rel(combat_cam_weight)($gp)
/* 9B18 80019318 00000000 */  nop
/* 9B1C 8001931C C80F4228 */  slti       $v0, $v0, 0xFC8
/* 9B20 80019320 0C004014 */  bnez       $v0, .L80019354
/* 9B24 80019324 00000000 */   nop
.L80019328:
/* 9B28 80019328 448E8297 */  lhu        $v0, %gp_rel(shorten_count)($gp)
/* 9B2C 8001932C 01000324 */  addiu      $v1, $zero, 0x1
/* 9B30 80019330 468E83A7 */  sh         $v1, %gp_rel(shorten_flag)($gp)
/* 9B34 80019334 01004224 */  addiu      $v0, $v0, 0x1
/* 9B38 80019338 448E82A7 */  sh         $v0, %gp_rel(shorten_count)($gp)
/* 9B3C 8001933C 00140200 */  sll        $v0, $v0, 16
/* 9B40 80019340 03140200 */  sra        $v0, $v0, 16
/* 9B44 80019344 03004228 */  slti       $v0, $v0, 0x3
/* 9B48 80019348 02004014 */  bnez       $v0, .L80019354
/* 9B4C 8001934C 00000000 */   nop
/* 9B50 80019350 B00186A4 */  sh         $a2, 0x1B0($a0)
.L80019354:
/* 9B54 80019354 0800E003 */  jr         $ra
/* 9B58 80019358 00000000 */   nop
.size CAMERA_update_dist_debounced, . - CAMERA_update_dist_debounced
