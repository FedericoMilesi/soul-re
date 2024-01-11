.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_FollowGoBehindPlayer
/* D564 8001CD64 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* D568 8001CD68 21188000 */  addu       $v1, $a0, $zero
/* D56C 8001CD6C 1000BFAF */  sw         $ra, 0x10($sp)
/* D570 8001CD70 0801628C */  lw         $v0, 0x108($v1)
/* D574 8001CD74 B6016424 */  addiu      $a0, $v1, 0x1B6
/* D578 8001CD78 78004594 */  lhu        $a1, 0x78($v0)
/* D57C 8001CD7C 88016684 */  lh         $a2, 0x188($v1)
/* D580 8001CD80 0008A524 */  addiu      $a1, $a1, 0x800
/* D584 8001CD84 002C0500 */  sll        $a1, $a1, 16
/* D588 8001CD88 4C5C000C */  jal        Decouple_AngleMoveToward
/* D58C 8001CD8C 032C0500 */   sra       $a1, $a1, 16
/* D590 8001CD90 1000BF8F */  lw         $ra, 0x10($sp)
/* D594 8001CD94 00000000 */  nop
/* D598 8001CD98 0800E003 */  jr         $ra
/* D59C 8001CD9C 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_FollowGoBehindPlayer, . - CAMERA_FollowGoBehindPlayer
