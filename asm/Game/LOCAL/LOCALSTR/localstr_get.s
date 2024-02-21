.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel localstr_get
/* A7ECC 800B76CC 48A9838F */  lw         $v1, %gp_rel(LocalStrings)($gp)
/* A7ED0 800B76D0 00000000 */  nop
/* A7ED4 800B76D4 04006014 */  bnez       $v1, .L800B76E8
/* A7ED8 800B76D8 80100400 */   sll       $v0, $a0, 2
/* A7EDC 800B76DC 60A98227 */  addiu      $v0, $gp, %gp_rel(D_800D1EF8)
/* A7EE0 800B76E0 0800E003 */  jr         $ra
/* A7EE4 800B76E4 00000000 */   nop
.L800B76E8:
/* A7EE8 800B76E8 21104300 */  addu       $v0, $v0, $v1
/* A7EEC 800B76EC 0000428C */  lw         $v0, 0x0($v0)
/* A7EF0 800B76F0 0800E003 */  jr         $ra
/* A7EF4 800B76F4 00000000 */   nop
.size localstr_get, . - localstr_get
