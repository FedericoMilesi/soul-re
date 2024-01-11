.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleSetSlideAngle
/* EA6C 8001E26C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EA70 8001E270 1000BFAF */  sw         $ra, 0x10($sp)
/* EA74 8001E274 0400A68C */  lw         $a2, 0x4($a1)
/* EA78 8001E278 04008010 */  beqz       $a0, .L8001E28C
/* EA7C 8001E27C 00000000 */   nop
/* EA80 8001E280 0004053C */  lui        $a1, (0x4000005 >> 16)
/* EA84 8001E284 A1D1000C */  jal        INSTANCE_Post
/* EA88 8001E288 0500A534 */   ori       $a1, $a1, (0x4000005 & 0xFFFF)
.L8001E28C:
/* EA8C 8001E28C 1000BF8F */  lw         $ra, 0x10($sp)
/* EA90 8001E290 01000224 */  addiu      $v0, $zero, 0x1
/* EA94 8001E294 0800E003 */  jr         $ra
/* EA98 8001E298 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleSetSlideAngle, . - SIGNAL_HandleSetSlideAngle
