.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdSync
/* AE8D8 800BE0D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE8DC 800BE0DC 1000BFAF */  sw         $ra, 0x10($sp)
/* AE8E0 800BE0E0 4C11030C */  jal        CD_sync
/* AE8E4 800BE0E4 00000000 */   nop
/* AE8E8 800BE0E8 1000BF8F */  lw         $ra, 0x10($sp)
/* AE8EC 800BE0EC 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE8F0 800BE0F0 0800E003 */  jr         $ra
/* AE8F4 800BE0F4 00000000 */   nop
.size CdSync, . - CdSync
