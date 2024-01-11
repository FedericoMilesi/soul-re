.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateLevelWithInstances
/* 4C600 8005BE00 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4C604 8005BE04 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C608 8005BE08 1400BFAF */  sw         $ra, 0x14($sp)
/* 4C60C 8005BE0C BD6E010C */  jal        RelocateLevel
/* 4C610 8005BE10 2180A000 */   addu      $s0, $a1, $zero
/* 4C614 8005BE14 F870010C */  jal        RelocateInstances
/* 4C618 8005BE18 21200002 */   addu      $a0, $s0, $zero
/* 4C61C 8005BE1C D8BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x210)($gp)
/* 4C620 8005BE20 0970010C */  jal        RelocatePlanPool
/* 4C624 8005BE24 21280002 */   addu      $a1, $s0, $zero
/* 4C628 8005BE28 1400BF8F */  lw         $ra, 0x14($sp)
/* 4C62C 8005BE2C 1000B08F */  lw         $s0, 0x10($sp)
/* 4C630 8005BE30 0800E003 */  jr         $ra
/* 4C634 8005BE34 1800BD27 */   addiu     $sp, $sp, 0x18
.size RelocateLevelWithInstances, . - RelocateLevelWithInstances
