.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_GetNormal
/* F308 8001EB08 00240400 */  sll        $a0, $a0, 16
/* F30C 8001EB0C 031C0400 */  sra        $v1, $a0, 16
/* F310 8001EB10 0F006004 */  bltz       $v1, .L8001EB50
/* F314 8001EB14 00000000 */   nop
/* F318 8001EB18 40100300 */  sll        $v0, $v1, 1
/* F31C 8001EB1C 21104300 */  addu       $v0, $v0, $v1
/* F320 8001EB20 40100200 */  sll        $v0, $v0, 1
/* F324 8001EB24 2128A200 */  addu       $a1, $a1, $v0
/* F328 8001EB28 0000A394 */  lhu        $v1, 0x0($a1)
/* F32C 8001EB2C 0200A524 */  addiu      $a1, $a1, 0x2
/* F330 8001EB30 FF1F6230 */  andi       $v0, $v1, 0x1FFF
/* F334 8001EB34 0000C2A4 */  sh         $v0, 0x0($a2)
/* F338 8001EB38 0000A294 */  lhu        $v0, 0x0($a1)
/* F33C 8001EB3C 001C0300 */  sll        $v1, $v1, 16
/* F340 8001EB40 0200C2A4 */  sh         $v0, 0x2($a2)
/* F344 8001EB44 0200A294 */  lhu        $v0, 0x2($a1)
/* F348 8001EB48 E57A0008 */  j          .L8001EB94
/* F34C 8001EB4C 431F0300 */   sra       $v1, $v1, 29
.L8001EB50:
/* F350 8001EB50 23180300 */  negu       $v1, $v1
/* F354 8001EB54 40100300 */  sll        $v0, $v1, 1
/* F358 8001EB58 21104300 */  addu       $v0, $v0, $v1
/* F35C 8001EB5C 40100200 */  sll        $v0, $v0, 1
/* F360 8001EB60 2128A200 */  addu       $a1, $a1, $v0
/* F364 8001EB64 0000A394 */  lhu        $v1, 0x0($a1)
/* F368 8001EB68 0200A524 */  addiu      $a1, $a1, 0x2
/* F36C 8001EB6C FF1F6230 */  andi       $v0, $v1, 0x1FFF
/* F370 8001EB70 23100200 */  negu       $v0, $v0
/* F374 8001EB74 0000C2A4 */  sh         $v0, 0x0($a2)
/* F378 8001EB78 0000A294 */  lhu        $v0, 0x0($a1)
/* F37C 8001EB7C 001C0300 */  sll        $v1, $v1, 16
/* F380 8001EB80 23100200 */  negu       $v0, $v0
/* F384 8001EB84 0200C2A4 */  sh         $v0, 0x2($a2)
/* F388 8001EB88 0200A294 */  lhu        $v0, 0x2($a1)
/* F38C 8001EB8C 431F0300 */  sra        $v1, $v1, 29
/* F390 8001EB90 23100200 */  negu       $v0, $v0
.L8001EB94:
/* F394 8001EB94 0400C2A4 */  sh         $v0, 0x4($a2)
/* F398 8001EB98 0800E003 */  jr         $ra
/* F39C 8001EB9C 21106000 */   addu      $v0, $v1, $zero
.size COLLIDE_GetNormal, . - COLLIDE_GetNormal
