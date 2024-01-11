.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_ChangeNodePosition
/* 8A200 80099A00 21408000 */  addu       $t0, $a0, $zero
/* 8A204 80099A04 2320A600 */  subu       $a0, $a1, $a2
/* 8A208 80099A08 C0100400 */  sll        $v0, $a0, 3
/* 8A20C 80099A0C 21104400 */  addu       $v0, $v0, $a0
/* 8A210 80099A10 80190200 */  sll        $v1, $v0, 6
/* 8A214 80099A14 21104300 */  addu       $v0, $v0, $v1
/* 8A218 80099A18 C0100200 */  sll        $v0, $v0, 3
/* 8A21C 80099A1C 21104400 */  addu       $v0, $v0, $a0
/* 8A220 80099A20 C01B0200 */  sll        $v1, $v0, 15
/* 8A224 80099A24 21104300 */  addu       $v0, $v0, $v1
/* 8A228 80099A28 C0100200 */  sll        $v0, $v0, 3
/* 8A22C 80099A2C 21104400 */  addu       $v0, $v0, $a0
/* 8A230 80099A30 23100200 */  negu       $v0, $v0
/* 8A234 80099A34 1E00A010 */  beqz       $a1, .L80099AB0
/* 8A238 80099A38 83180200 */   sra       $v1, $v0, 2
/* 8A23C 80099A3C 01000224 */  addiu      $v0, $zero, 0x1
/* 8A240 80099A40 ECF5878F */  lw         $a3, %gp_rel(poolManagementData)($gp)
/* 8A244 80099A44 04186200 */  sllv       $v1, $v0, $v1
/* 8A248 80099A48 03000989 */  lwl        $t1, 0x3($t0)
/* 8A24C 80099A4C 00000999 */  lwr        $t1, 0x0($t0)
/* 8A250 80099A50 04000A85 */  lh         $t2, 0x4($t0)
/* 8A254 80099A54 0300A9A8 */  swl        $t1, 0x3($a1)
/* 8A258 80099A58 0000A9B8 */  swr        $t1, 0x0($a1)
/* 8A25C 80099A5C 0400AAA4 */  sh         $t2, 0x4($a1)
/* 8A260 80099A60 0800A0AC */  sw         $zero, 0x8($a1)
/* 8A264 80099A64 0C00A0AC */  sw         $zero, 0xC($a1)
/* 8A268 80099A68 0100E290 */  lbu        $v0, 0x1($a3)
/* 8A26C 80099A6C 00000000 */  nop
/* 8A270 80099A70 0F004010 */  beqz       $v0, .L80099AB0
/* 8A274 80099A74 21200000 */   addu      $a0, $zero, $zero
/* 8A278 80099A78 FF006230 */  andi       $v0, $v1, 0xFF
/* 8A27C 80099A7C 27280200 */  nor        $a1, $zero, $v0
.L80099A80:
/* 8A280 80099A80 01008424 */  addiu      $a0, $a0, 0x1
/* 8A284 80099A84 0800C28C */  lw         $v0, 0x8($a2)
/* 8A288 80099A88 0C00C38C */  lw         $v1, 0xC($a2)
/* 8A28C 80099A8C 24104500 */  and        $v0, $v0, $a1
/* 8A290 80099A90 24186500 */  and        $v1, $v1, $a1
/* 8A294 80099A94 0800C2AC */  sw         $v0, 0x8($a2)
/* 8A298 80099A98 0C00C3AC */  sw         $v1, 0xC($a2)
/* 8A29C 80099A9C 0100E290 */  lbu        $v0, 0x1($a3)
/* 8A2A0 80099AA0 00000000 */  nop
/* 8A2A4 80099AA4 2A108200 */  slt        $v0, $a0, $v0
/* 8A2A8 80099AA8 F5FF4014 */  bnez       $v0, .L80099A80
/* 8A2AC 80099AAC 1C00C624 */   addiu     $a2, $a2, 0x1C
.L80099AB0:
/* 8A2B0 80099AB0 0800E003 */  jr         $ra
/* 8A2B4 80099AB4 00000000 */   nop
.size PLANPOOL_ChangeNodePosition, . - PLANPOOL_ChangeNodePosition
