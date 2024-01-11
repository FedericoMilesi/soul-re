.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_StartSwimThrowMode
/* C43C 8001BC3C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C440 8001BC40 1000B0AF */  sw         $s0, 0x10($sp)
/* C444 8001BC44 01000224 */  addiu      $v0, $zero, 0x1
/* C448 8001BC48 1400BFAF */  sw         $ra, 0x14($sp)
/* C44C 8001BC4C 668E82A7 */  sh         $v0, %gp_rel(CameraLookStickyFlag)($gp)
/* C450 8001BC50 EB6E000C */  jal        CAMERA_StartLookaroundMode
/* C454 8001BC54 21808000 */   addu      $s0, $a0, $zero
/* C458 8001BC58 0801048E */  lw         $a0, 0x108($s0)
/* C45C 8001BC5C 884B000C */  jal        PLAYER_SetLookAround
/* C460 8001BC60 00000000 */   nop
/* C464 8001BC64 02000224 */  addiu      $v0, $zero, 0x2
/* C468 8001BC68 F00102A6 */  sh         $v0, 0x1F0($s0)
/* C46C 8001BC6C 1400BF8F */  lw         $ra, 0x14($sp)
/* C470 8001BC70 1000B08F */  lw         $s0, 0x10($sp)
/* C474 8001BC74 0800E003 */  jr         $ra
/* C478 8001BC78 1800BD27 */   addiu     $sp, $sp, 0x18
.size CAMERA_StartSwimThrowMode, . - CAMERA_StartSwimThrowMode
