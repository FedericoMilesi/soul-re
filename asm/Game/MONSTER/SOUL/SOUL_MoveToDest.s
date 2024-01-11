.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_MoveToDest
/* 7E240 8008DA40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7E244 8008DA44 21388000 */  addu       $a3, $a0, $zero
/* 7E248 8008DA48 2140A000 */  addu       $t0, $a1, $zero
/* 7E24C 8008DA4C 1000BFAF */  sw         $ra, 0x10($sp)
/* 7E250 8008DA50 6C01E58C */  lw         $a1, 0x16C($a3)
/* 7E254 8008DA54 5C00E384 */  lh         $v1, 0x5C($a3)
/* 7E258 8008DA58 2401A284 */  lh         $v0, 0x124($a1)
/* 7E25C 8008DA5C 7401E48C */  lw         $a0, 0x174($a3)
/* 7E260 8008DA60 23104300 */  subu       $v0, $v0, $v1
/* 7E264 8008DA64 23104400 */  subu       $v0, $v0, $a0
/* 7E268 8008DA68 8001E2AC */  sw         $v0, 0x180($a3)
/* 7E26C 8008DA6C 2601A284 */  lh         $v0, 0x126($a1)
/* 7E270 8008DA70 5E00E384 */  lh         $v1, 0x5E($a3)
/* 7E274 8008DA74 7801E48C */  lw         $a0, 0x178($a3)
/* 7E278 8008DA78 23104300 */  subu       $v0, $v0, $v1
/* 7E27C 8008DA7C 23104400 */  subu       $v0, $v0, $a0
/* 7E280 8008DA80 8401E2AC */  sw         $v0, 0x184($a3)
/* 7E284 8008DA84 2801A284 */  lh         $v0, 0x128($a1)
/* 7E288 8008DA88 6000E384 */  lh         $v1, 0x60($a3)
/* 7E28C 8008DA8C 7C01E48C */  lw         $a0, 0x17C($a3)
/* 7E290 8008DA90 23104300 */  subu       $v0, $v0, $v1
/* 7E294 8008DA94 23104400 */  subu       $v0, $v0, $a0
/* 7E298 8008DA98 8001E48C */  lw         $a0, 0x180($a3)
/* 7E29C 8008DA9C 23180800 */  negu       $v1, $t0
/* 7E2A0 8008DAA0 8801E2AC */  sw         $v0, 0x188($a3)
/* 7E2A4 8008DAA4 2A108300 */  slt        $v0, $a0, $v1
/* 7E2A8 8008DAA8 03004010 */  beqz       $v0, .L8008DAB8
/* 7E2AC 8008DAAC 2A100401 */   slt       $v0, $t0, $a0
/* 7E2B0 8008DAB0 B1360208 */  j          .L8008DAC4
/* 7E2B4 8008DAB4 8001E3AC */   sw        $v1, 0x180($a3)
.L8008DAB8:
/* 7E2B8 8008DAB8 02004010 */  beqz       $v0, .L8008DAC4
/* 7E2BC 8008DABC 00000000 */   nop
/* 7E2C0 8008DAC0 8001E8AC */  sw         $t0, 0x180($a3)
.L8008DAC4:
/* 7E2C4 8008DAC4 8401E48C */  lw         $a0, 0x184($a3)
/* 7E2C8 8008DAC8 23180800 */  negu       $v1, $t0
/* 7E2CC 8008DACC 2A108300 */  slt        $v0, $a0, $v1
/* 7E2D0 8008DAD0 03004010 */  beqz       $v0, .L8008DAE0
/* 7E2D4 8008DAD4 2A100401 */   slt       $v0, $t0, $a0
/* 7E2D8 8008DAD8 BB360208 */  j          .L8008DAEC
/* 7E2DC 8008DADC 8401E3AC */   sw        $v1, 0x184($a3)
.L8008DAE0:
/* 7E2E0 8008DAE0 02004010 */  beqz       $v0, .L8008DAEC
/* 7E2E4 8008DAE4 00000000 */   nop
/* 7E2E8 8008DAE8 8401E8AC */  sw         $t0, 0x184($a3)
.L8008DAEC:
/* 7E2EC 8008DAEC 8801E48C */  lw         $a0, 0x188($a3)
/* 7E2F0 8008DAF0 23180800 */  negu       $v1, $t0
/* 7E2F4 8008DAF4 2A108300 */  slt        $v0, $a0, $v1
/* 7E2F8 8008DAF8 03004010 */  beqz       $v0, .L8008DB08
/* 7E2FC 8008DAFC 2A100401 */   slt       $v0, $t0, $a0
/* 7E300 8008DB00 C5360208 */  j          .L8008DB14
/* 7E304 8008DB04 8801E3AC */   sw        $v1, 0x188($a3)
.L8008DB08:
/* 7E308 8008DB08 03004010 */  beqz       $v0, .L8008DB18
/* 7E30C 8008DB0C 2120E000 */   addu      $a0, $a3, $zero
/* 7E310 8008DB10 8801E8AC */  sw         $t0, 0x188($a3)
.L8008DB14:
/* 7E314 8008DB14 2120E000 */  addu       $a0, $a3, $zero
.L8008DB18:
/* 7E318 8008DB18 4B36020C */  jal        SOUL_Physics
/* 7E31C 8008DB1C 2128C000 */   addu      $a1, $a2, $zero
/* 7E320 8008DB20 1000BF8F */  lw         $ra, 0x10($sp)
/* 7E324 8008DB24 00000000 */  nop
/* 7E328 8008DB28 0800E003 */  jr         $ra
/* 7E32C 8008DB2C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SOUL_MoveToDest, . - SOUL_MoveToDest
