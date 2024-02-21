.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_CdReadReady
/* 27C64 80037464 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 27C68 80037468 C0BB838F */  lw         $v1, %gp_rel(loadStatus + 0x2C)($gp)
/* 27C6C 8003746C 02000224 */  addiu      $v0, $zero, 0x2
/* 27C70 80037470 3000BFAF */  sw         $ra, 0x30($sp)
/* 27C74 80037474 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 27C78 80037478 38006214 */  bne        $v1, $v0, .L8003755C
/* 27C7C 8003747C 2800B0AF */   sw        $s0, 0x28($sp)
/* 27C80 80037480 FF009130 */  andi       $s1, $a0, 0xFF
/* 27C84 80037484 01000224 */  addiu      $v0, $zero, 0x1
/* 27C88 80037488 29002216 */  bne        $s1, $v0, .L80037530
/* 27C8C 8003748C 05000224 */   addiu     $v0, $zero, 0x5
/* 27C90 80037490 98BB828F */  lw         $v0, %gp_rel(loadStatus + 0x4)($gp)
/* 27C94 80037494 9CBB838F */  lw         $v1, %gp_rel(loadStatus + 0x8)($gp)
/* 27C98 80037498 00000000 */  nop
/* 27C9C 8003749C 23104300 */  subu       $v0, $v0, $v1
/* 27CA0 800374A0 21804000 */  addu       $s0, $v0, $zero
/* 27CA4 800374A4 0008022A */  slti       $v0, $s0, 0x800
/* 27CA8 800374A8 02004014 */  bnez       $v0, .L800374B4
/* 27CAC 800374AC 00000000 */   nop
/* 27CB0 800374B0 00081024 */  addiu      $s0, $zero, 0x800
.L800374B4:
/* 27CB4 800374B4 1000A427 */  addiu      $a0, $sp, 0x10
/* 27CB8 800374B8 04000224 */  addiu      $v0, $zero, 0x4
/* 27CBC 800374BC C4BB90AF */  sw         $s0, %gp_rel(loadStatus + 0x30)($gp)
/* 27CC0 800374C0 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27CC4 800374C4 3FF9020C */  jal        CdGetSector
/* 27CC8 800374C8 03000524 */   addiu     $a1, $zero, 0x3
/* 27CCC 800374CC 56FC020C */  jal        CdPosToInt
/* 27CD0 800374D0 1000A427 */   addiu     $a0, $sp, 0x10
/* 27CD4 800374D4 28BC838F */  lw         $v1, %gp_rel(loadStatus + 0x94)($gp)
/* 27CD8 800374D8 00000000 */  nop
/* 27CDC 800374DC 09006214 */  bne        $v1, $v0, .L80037504
/* 27CE0 800374E0 01006224 */   addiu     $v0, $v1, 0x1
/* 27CE4 800374E4 A4BB848F */  lw         $a0, %gp_rel(loadStatus + 0x10)($gp)
/* 27CE8 800374E8 28BC82AF */  sw         $v0, %gp_rel(loadStatus + 0x94)($gp)
/* 27CEC 800374EC 3FF9020C */  jal        CdGetSector
/* 27CF0 800374F0 82281000 */   srl       $a1, $s0, 2
/* 27CF4 800374F4 D1DC000C */  jal        LOAD_CdDataReady
/* 27CF8 800374F8 00000000 */   nop
/* 27CFC 800374FC 57DD0008 */  j          .L8003755C
/* 27D00 80037500 00000000 */   nop
.L80037504:
/* 27D04 80037504 C0BB91AF */  sw         $s1, %gp_rel(loadStatus + 0x2C)($gp)
/* 27D08 80037508 21206000 */  addu       $a0, $v1, $zero
/* 27D0C 8003750C 2000B027 */  addiu      $s0, $sp, 0x20
/* 27D10 80037510 15FC020C */  jal        CdIntToPos
/* 27D14 80037514 21280002 */   addu      $a1, $s0, $zero
/* 27D18 80037518 06000424 */  addiu      $a0, $zero, 0x6
/* 27D1C 8003751C 21280002 */  addu       $a1, $s0, $zero
/* 27D20 80037520 50F8020C */  jal        CdControl
/* 27D24 80037524 21300000 */   addu      $a2, $zero, $zero
/* 27D28 80037528 57DD0008 */  j          .L8003755C
/* 27D2C 8003752C 00000000 */   nop
.L80037530:
/* 27D30 80037530 07002216 */  bne        $s1, $v0, .L80037550
/* 27D34 80037534 0D80043C */   lui       $a0, %hi(D_800D0924)
/* 27D38 80037538 06000224 */  addiu      $v0, $zero, 0x6
/* 27D3C 8003753C C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27D40 80037540 04000224 */  addiu      $v0, $zero, 0x4
/* 27D44 80037544 A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 27D48 80037548 57DD0008 */  j          .L8003755C
/* 27D4C 8003754C 00000000 */   nop
.L80037550:
/* 27D50 80037550 24098424 */  addiu      $a0, $a0, %lo(D_800D0924)
/* 27D54 80037554 06D1010C */  jal        printf
/* 27D58 80037558 21282002 */   addu      $a1, $s1, $zero
.L8003755C:
/* 27D5C 8003755C 34BC848F */  lw         $a0, %gp_rel(crap1)($gp)
/* 27D60 80037560 00000000 */  nop
/* 27D64 80037564 05008010 */  beqz       $a0, .L8003757C
/* 27D68 80037568 00000000 */   nop
/* 27D6C 8003756C 93F7000C */  jal        TIMER_TimeDiff
/* 27D70 80037570 00000000 */   nop
/* 27D74 80037574 30BC82AF */  sw         $v0, %gp_rel(loadStatus + 0x9C)($gp)
/* 27D78 80037578 34BC80AF */  sw         $zero, %gp_rel(crap1)($gp)
.L8003757C:
/* 27D7C 8003757C 84BB848F */  lw         $a0, %gp_rel(crap.35)($gp)
/* 27D80 80037580 93F7000C */  jal        TIMER_TimeDiff
/* 27D84 80037584 00000000 */   nop
/* 27D88 80037588 00F2043C */  lui        $a0, (0xF2000000 >> 16)
/* 27D8C 8003758C 2CBC82AF */  sw         $v0, %gp_rel(loadStatus + 0x98)($gp)
/* 27D90 80037590 EBF4020C */  jal        GetRCnt
/* 27D94 80037594 00000000 */   nop
/* 27D98 80037598 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 27D9C 8003759C 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 27DA0 800375A0 3000BF8F */  lw         $ra, 0x30($sp)
/* 27DA4 800375A4 2C00B18F */  lw         $s1, 0x2C($sp)
/* 27DA8 800375A8 2800B08F */  lw         $s0, 0x28($sp)
/* 27DAC 800375AC 001C0300 */  sll        $v1, $v1, 16
/* 27DB0 800375B0 25104300 */  or         $v0, $v0, $v1
/* 27DB4 800375B4 84BB82AF */  sw         $v0, %gp_rel(crap.35)($gp)
/* 27DB8 800375B8 0800E003 */  jr         $ra
/* 27DBC 800375BC 3800BD27 */   addiu     $sp, $sp, 0x38
.size LOAD_CdReadReady, . - LOAD_CdReadReady
