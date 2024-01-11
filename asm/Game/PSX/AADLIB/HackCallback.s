.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HackCallback
/* 44424 80053C24 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 44428 80053C28 1800BFAF */  sw         $ra, 0x18($sp)
/* 4442C 80053C2C E4FF020C */  jal        func_800BFF90
/* 44430 80053C30 21200000 */   addu      $a0, $zero, $zero
/* 44434 80053C34 08C7848F */  lw         $a0, %gp_rel(smfDataPtr)($gp)
/* 44438 80053C38 0CC7858F */  lw         $a1, %gp_rel(smfBytesLeft)($gp)
/* 4443C 80053C3C 10C7878F */  lw         $a3, %gp_rel(smfInfo)($gp)
/* 44440 80053C40 21300000 */  addu       $a2, $zero, $zero
/* 44444 80053C44 174F010C */  jal        aadLoadDynamicSfxReturn2
/* 44448 80053C48 1000A0AF */   sw        $zero, 0x10($sp)
/* 4444C 80053C4C 1800BF8F */  lw         $ra, 0x18($sp)
/* 44450 80053C50 00000000 */  nop
/* 44454 80053C54 0800E003 */  jr         $ra
/* 44458 80053C58 2000BD27 */   addiu     $sp, $sp, 0x20
.size HackCallback, . - HackCallback
