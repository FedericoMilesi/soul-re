.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BCAF0
/* AD2F0 800BCAF0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AD2F4 800BCAF4 C02B0500 */  sll        $a1, $a1, 15
/* AD2F8 800BCAF8 1000A5AF */  sw         $a1, 0x10($sp)
/* AD2FC 800BCAFC 0D80023C */  lui        $v0, %hi(Vcount)
/* AD300 800BCB00 ACE8428C */  lw         $v0, %lo(Vcount)($v0)
/* AD304 800BCB04 00000000 */  nop
/* AD308 800BCB08 2A104400 */  slt        $v0, $v0, $a0
/* AD30C 800BCB0C 1A004010 */  beqz       $v0, .L800BCB78
/* AD310 800BCB10 1800BFAF */   sw        $ra, 0x18($sp)
/* AD314 800BCB14 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800BCB18:
/* AD318 800BCB18 1000A28F */  lw         $v0, 0x10($sp)
/* AD31C 800BCB1C 00000000 */  nop
/* AD320 800BCB20 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AD324 800BCB24 1000A2AF */  sw         $v0, 0x10($sp)
/* AD328 800BCB28 1000A28F */  lw         $v0, 0x10($sp)
/* AD32C 800BCB2C 00000000 */  nop
/* AD330 800BCB30 0B004314 */  bne        $v0, $v1, .L800BCB60
/* AD334 800BCB34 00000000 */   nop
/* AD338 800BCB38 0180043C */  lui        $a0, %hi(D_80012764)
/* AD33C 800BCB3C 9901030C */  jal        func_800C0664
/* AD340 800BCB40 64278424 */   addiu     $a0, $a0, %lo(D_80012764)
/* AD344 800BCB44 C808030C */  jal        func_800C2320
/* AD348 800BCB48 21200000 */   addu      $a0, $zero, $zero
/* AD34C 800BCB4C 03000424 */  addiu      $a0, $zero, 0x3
/* AD350 800BCB50 CC08030C */  jal        func_800C2330
/* AD354 800BCB54 21280000 */   addu      $a1, $zero, $zero
/* AD358 800BCB58 DEF20208 */  j          .L800BCB78
/* AD35C 800BCB5C 00000000 */   nop
.L800BCB60:
/* AD360 800BCB60 0D80023C */  lui        $v0, %hi(Vcount)
/* AD364 800BCB64 ACE8428C */  lw         $v0, %lo(Vcount)($v0)
/* AD368 800BCB68 00000000 */  nop
/* AD36C 800BCB6C 2A104400 */  slt        $v0, $v0, $a0
/* AD370 800BCB70 E9FF4014 */  bnez       $v0, .L800BCB18
/* AD374 800BCB74 00000000 */   nop
.L800BCB78:
/* AD378 800BCB78 1800BF8F */  lw         $ra, 0x18($sp)
/* AD37C 800BCB7C 2000BD27 */  addiu      $sp, $sp, 0x20
/* AD380 800BCB80 0800E003 */  jr         $ra
/* AD384 800BCB84 00000000 */   nop
.size func_800BCAF0, . - func_800BCAF0
