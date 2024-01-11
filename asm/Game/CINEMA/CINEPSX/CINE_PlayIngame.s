.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_PlayIngame
/* A7DE0 800B75E0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A7DE4 800B75E4 2800BFAF */  sw         $ra, 0x28($sp)
/* A7DE8 800B75E8 21308000 */  addu       $a2, $a0, $zero
/* A7DEC 800B75EC 1000A427 */  addiu      $a0, $sp, 0x10
/* A7DF0 800B75F0 0180053C */  lui        $a1, %hi(D_8001247C)
/* A7DF4 800B75F4 1AD1010C */  jal        sprintf
/* A7DF8 800B75F8 7C24A524 */   addiu     $a1, $a1, %lo(D_8001247C)
/* A7DFC 800B75FC 39DD020C */  jal        CINE_Load
/* A7E00 800B7600 00000000 */   nop
/* A7E04 800B7604 06004010 */  beqz       $v0, .L800B7620
/* A7E08 800B7608 1000A427 */   addiu     $a0, $sp, 0x10
/* A7E0C 800B760C 21280000 */  addu       $a1, $zero, $zero
/* A7E10 800B7610 20DD020C */  jal        CINE_Play
/* A7E14 800B7614 02000624 */   addiu     $a2, $zero, 0x2
/* A7E18 800B7618 66DD020C */  jal        CINE_Unload
/* A7E1C 800B761C 00000000 */   nop
.L800B7620:
/* A7E20 800B7620 2800BF8F */  lw         $ra, 0x28($sp)
/* A7E24 800B7624 00000000 */  nop
/* A7E28 800B7628 0800E003 */  jr         $ra
/* A7E2C 800B762C 3000BD27 */   addiu     $sp, $sp, 0x30
.size CINE_PlayIngame, . - CINE_PlayIngame
