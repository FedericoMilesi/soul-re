.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_Query
/* 7DA08 8008D208 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7DA0C 8008D20C 1000BFAF */  sw         $ra, 0x10($sp)
/* 7DA10 8008D210 6C01838C */  lw         $v1, 0x16C($a0)
/* 7DA14 8008D214 2400868C */  lw         $a2, 0x24($a0)
/* 7DA18 8008D218 0E00A010 */  beqz       $a1, .L8008D254
/* 7DA1C 8008D21C 01000224 */   addiu     $v0, $zero, 0x1
/* 7DA20 8008D220 1800A214 */  bne        $a1, $v0, .L8008D284
/* 7DA24 8008D224 00000000 */   nop
/* 7DA28 8008D228 0400628C */  lw         $v0, 0x4($v1)
/* 7DA2C 8008D22C 00000000 */  nop
/* 7DA30 8008D230 01004230 */  andi       $v0, $v0, 0x1
/* 7DA34 8008D234 04004010 */  beqz       $v0, .L8008D248
/* 7DA38 8008D238 00000000 */   nop
/* 7DA3C 8008D23C 1000C28C */  lw         $v0, 0x10($a2)
/* 7DA40 8008D240 A3340208 */  j          .L8008D28C
/* 7DA44 8008D244 04004234 */   ori       $v0, $v0, 0x4
.L8008D248:
/* 7DA48 8008D248 1000C28C */  lw         $v0, 0x10($a2)
/* 7DA4C 8008D24C A3340208 */  j          .L8008D28C
/* 7DA50 8008D250 00000000 */   nop
.L8008D254:
/* 7DA54 8008D254 0400628C */  lw         $v0, 0x4($v1)
/* 7DA58 8008D258 00000000 */  nop
/* 7DA5C 8008D25C 01004230 */  andi       $v0, $v0, 0x1
/* 7DA60 8008D260 06004014 */  bnez       $v0, .L8008D27C
/* 7DA64 8008D264 00000000 */   nop
/* 7DA68 8008D268 01006290 */  lbu        $v0, 0x1($v1)
/* 7DA6C 8008D26C 00000000 */  nop
/* 7DA70 8008D270 01004230 */  andi       $v0, $v0, 0x1
/* 7DA74 8008D274 A3340208 */  j          .L8008D28C
/* 7DA78 8008D278 40170200 */   sll       $v0, $v0, 29
.L8008D27C:
/* 7DA7C 8008D27C A3340208 */  j          .L8008D28C
/* 7DA80 8008D280 0004023C */   lui       $v0, (0x4000000 >> 16)
.L8008D284:
/* 7DA84 8008D284 7EF9010C */  jal        MonsterQuery
/* 7DA88 8008D288 00000000 */   nop
.L8008D28C:
/* 7DA8C 8008D28C 1000BF8F */  lw         $ra, 0x10($sp)
/* 7DA90 8008D290 00000000 */  nop
/* 7DA94 8008D294 0800E003 */  jr         $ra
/* 7DA98 8008D298 1800BD27 */   addiu     $sp, $sp, 0x18
.size SLUAGH_Query, . - SLUAGH_Query
