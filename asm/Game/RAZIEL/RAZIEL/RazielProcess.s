.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielProcess
/* A45D0 800B3DD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A45D4 800B3DD4 1000B0AF */  sw         $s0, 0x10($sp)
/* A45D8 800B3DD8 21808000 */  addu       $s0, $a0, $zero
/* A45DC 800B3DDC 1400BFAF */  sw         $ra, 0x14($sp)
/* A45E0 800B3DE0 2C00A48C */  lw         $a0, 0x2C($a1)
/* A45E4 800B3DE4 46CF020C */  jal        mdRazielProcess
/* A45E8 800B3DE8 4800A624 */   addiu     $a2, $a1, 0x48
/* A45EC 800B3DEC 30F68527 */  addiu      $a1, $gp, %gp_rel(Raziel)
/* A45F0 800B3DF0 AF8C020C */  jal        DebugProcess
/* A45F4 800B3DF4 21200002 */   addu      $a0, $s0, $zero
/* A45F8 800B3DF8 1400BF8F */  lw         $ra, 0x14($sp)
/* A45FC 800B3DFC 1000B08F */  lw         $s0, 0x10($sp)
/* A4600 800B3E00 BCFD80A7 */  sh         $zero, %gp_rel(Norm + 0x4)($gp)
/* A4604 800B3E04 BAFD80A7 */  sh         $zero, %gp_rel(Norm + 0x2)($gp)
/* A4608 800B3E08 B8FD80A7 */  sh         $zero, %gp_rel(Norm)($gp)
/* A460C 800B3E0C 0800E003 */  jr         $ra
/* A4610 800B3E10 1800BD27 */   addiu     $sp, $sp, 0x18
.size RazielProcess, . - RazielProcess
