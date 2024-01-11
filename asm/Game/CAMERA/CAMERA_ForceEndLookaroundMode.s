.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ForceEndLookaroundMode
/* C4A0 8001BCA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C4A4 8001BCA4 1000B0AF */  sw         $s0, 0x10($sp)
/* C4A8 8001BCA8 1400BFAF */  sw         $ra, 0x14($sp)
/* C4AC 8001BCAC 668E80A7 */  sh         $zero, %gp_rel(CameraLookStickyFlag)($gp)
/* C4B0 8001BCB0 8970000C */  jal        CAMERA_EndLook
/* C4B4 8001BCB4 21808000 */   addu      $s0, $a0, $zero
/* C4B8 8001BCB8 FDFF033C */  lui        $v1, (0xFFFDFFFF >> 16)
/* C4BC 8001BCBC E800028E */  lw         $v0, 0xE8($s0)
/* C4C0 8001BCC0 FFFF6334 */  ori        $v1, $v1, (0xFFFDFFFF & 0xFFFF)
/* C4C4 8001BCC4 24104300 */  and        $v0, $v0, $v1
/* C4C8 8001BCC8 E80002AE */  sw         $v0, 0xE8($s0)
/* C4CC 8001BCCC 1400BF8F */  lw         $ra, 0x14($sp)
/* C4D0 8001BCD0 1000B08F */  lw         $s0, 0x10($sp)
/* C4D4 8001BCD4 0800E003 */  jr         $ra
/* C4D8 8001BCD8 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_ForceEndLookaroundMode, . - CAMERA_ForceEndLookaroundMode
