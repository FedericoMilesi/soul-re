.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel gt2mcmenu
/* AA0F0 800B98F0 2400828C */  lw         $v0, 0x24($a0)
/* AA0F4 800B98F4 00000000 */  nop
/* AA0F8 800B98F8 0800428C */  lw         $v0, 0x8($v0)
/* AA0FC 800B98FC 0800E003 */  jr         $ra
/* AA100 800B9900 00000000 */   nop
.size gt2mcmenu, . - gt2mcmenu
