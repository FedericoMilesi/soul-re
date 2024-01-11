.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleCamera
/* E43C 8001DC3C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E440 8001DC40 1000BFAF */  sw         $ra, 0x10($sp)
/* E444 8001DC44 0400A58C */  lw         $a1, 0x4($a1)
/* E448 8001DC48 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* E44C 8001DC4C 1E5C000C */  jal        CAMERA_ChangeTo
/* E450 8001DC50 00000000 */   nop
/* E454 8001DC54 1000BF8F */  lw         $ra, 0x10($sp)
/* E458 8001DC58 01000224 */  addiu      $v0, $zero, 0x1
/* E45C 8001DC5C 0800E003 */  jr         $ra
/* E460 8001DC60 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleCamera, . - SIGNAL_HandleCamera
