.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel menudefs_reset_hack_attract_mode
/* A8FE8 800B87E8 20AA828F */  lw         $v0, %gp_rel(hack_attract)($gp)
/* A8FEC 800B87EC 00000000 */  nop
/* A8FF0 800B87F0 04004018 */  blez       $v0, .L800B8804
/* A8FF4 800B87F4 00000000 */   nop
/* A8FF8 800B87F8 00BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x138)($gp)
/* A8FFC 800B87FC 00000000 */  nop
/* A9000 800B8800 20AA82AF */  sw         $v0, %gp_rel(hack_attract)($gp)
.L800B8804:
/* A9004 800B8804 0800E003 */  jr         $ra
/* A9008 800B8808 00000000 */   nop
.size menudefs_reset_hack_attract_mode, . - menudefs_reset_hack_attract_mode
