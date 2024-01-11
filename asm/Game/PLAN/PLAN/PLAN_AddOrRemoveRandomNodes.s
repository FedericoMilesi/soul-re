.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLAN_AddOrRemoveRandomNodes
/* 8821C 80097A1C ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88220 80097A20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 88224 80097A24 1000BFAF */  sw         $ra, 0x10($sp)
/* 88228 80097A28 01004290 */  lbu        $v0, 0x1($v0)
/* 8822C 80097A2C 00000000 */  nop
/* 88230 80097A30 F0FF4224 */  addiu      $v0, $v0, -0x10
/* 88234 80097A34 05004104 */  bgez       $v0, .L80097A4C
/* 88238 80097A38 00000000 */   nop
/* 8823C 80097A3C C15D020C */  jal        PLAN_AddRandomNode
/* 88240 80097A40 00000000 */   nop
/* 88244 80097A44 975E0208 */  j          .L80097A5C
/* 88248 80097A48 00000000 */   nop
.L80097A4C:
/* 8824C 80097A4C 03004018 */  blez       $v0, .L80097A5C
/* 88250 80097A50 00000000 */   nop
/* 88254 80097A54 445E020C */  jal        PLAN_DeleteRandomNode
/* 88258 80097A58 00000000 */   nop
.L80097A5C:
/* 8825C 80097A5C 1000BF8F */  lw         $ra, 0x10($sp)
/* 88260 80097A60 00000000 */  nop
/* 88264 80097A64 0800E003 */  jr         $ra
/* 88268 80097A68 1800BD27 */   addiu     $sp, $sp, 0x18
.size PLAN_AddOrRemoveRandomNodes, . - PLAN_AddOrRemoveRandomNodes
