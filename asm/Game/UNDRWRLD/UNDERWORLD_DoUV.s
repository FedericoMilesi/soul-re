.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_DoUV
/* A5218 800B4A18 0000A284 */  lh         $v0, 0x0($a1)
/* A521C 800B4A1C 00000000 */  nop
/* A5220 800B4A20 23184600 */  subu       $v1, $v0, $a2
/* A5224 800B4A24 00016228 */  slti       $v0, $v1, 0x100
/* A5228 800B4A28 03004014 */  bnez       $v0, .L800B4A38
/* A522C 800B4A2C FF000224 */   addiu     $v0, $zero, 0xFF
/* A5230 800B4A30 8FD20208 */  j          .L800B4A3C
/* A5234 800B4A34 000082A0 */   sb        $v0, 0x0($a0)
.L800B4A38:
/* A5238 800B4A38 000083A0 */  sb         $v1, 0x0($a0)
.L800B4A3C:
/* A523C 800B4A3C 0200A284 */  lh         $v0, 0x2($a1)
/* A5240 800B4A40 00000000 */  nop
/* A5244 800B4A44 00014228 */  slti       $v0, $v0, 0x100
/* A5248 800B4A48 03004014 */  bnez       $v0, .L800B4A58
/* A524C 800B4A4C FF000224 */   addiu     $v0, $zero, 0xFF
/* A5250 800B4A50 0800E003 */  jr         $ra
/* A5254 800B4A54 010082A0 */   sb        $v0, 0x1($a0)
.L800B4A58:
/* A5258 800B4A58 0200A290 */  lbu        $v0, 0x2($a1)
/* A525C 800B4A5C 0800E003 */  jr         $ra
/* A5260 800B4A60 010082A0 */   sb        $v0, 0x1($a0)
.size UNDERWORLD_DoUV, . - UNDERWORLD_DoUV
