.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_BirthEntry
/* 7E508 8008DD08 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7E50C 8008DD0C 1400BFAF */  sw         $ra, 0x14($sp)
/* 7E510 8008DD10 1000B0AF */  sw         $s0, 0x10($sp)
/* 7E514 8008DD14 60008394 */  lhu        $v1, 0x60($a0)
/* 7E518 8008DD18 6C01908C */  lw         $s0, 0x16C($a0)
/* 7E51C 8008DD1C 0F000224 */  addiu      $v0, $zero, 0xF
/* 7E520 8008DD20 8C0182AC */  sw         $v0, 0x18C($a0)
/* 7E524 8008DD24 900182AC */  sw         $v0, 0x190($a0)
/* 7E528 8008DD28 11000224 */  addiu      $v0, $zero, 0x11
/* 7E52C 8008DD2C 940182AC */  sw         $v0, 0x194($a0)
/* 7E530 8008DD30 880180AC */  sw         $zero, 0x188($a0)
/* 7E534 8008DD34 7C0180AC */  sw         $zero, 0x17C($a0)
/* 7E538 8008DD38 78006324 */  addiu      $v1, $v1, 0x78
/* 7E53C 8008DD3C 9006020C */  jal        MON_GetTime
/* 7E540 8008DD40 600083A4 */   sh        $v1, 0x60($a0)
/* 7E544 8008DD44 DC054224 */  addiu      $v0, $v0, 0x5DC
/* 7E548 8008DD48 140102AE */  sw         $v0, 0x114($s0)
/* 7E54C 8008DD4C 1400BF8F */  lw         $ra, 0x14($sp)
/* 7E550 8008DD50 1000B08F */  lw         $s0, 0x10($sp)
/* 7E554 8008DD54 0800E003 */  jr         $ra
/* 7E558 8008DD58 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_BirthEntry, . - SOUL_BirthEntry
