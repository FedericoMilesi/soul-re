.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC374
/* ACB74 800BC374 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* ACB78 800BC378 1000B0AF */  sw         $s0, 0x10($sp)
/* ACB7C 800BC37C 21808000 */  addu       $s0, $a0, $zero
/* ACB80 800BC380 1400BFAF */  sw         $ra, 0x14($sp)
/* ACB84 800BC384 ECE6020C */  jal        func_800B9BB0
/* ACB88 800BC388 21200000 */   addu      $a0, $zero, $zero
/* ACB8C 800BC38C 0D80013C */  lui        $at, %hi(_qout)
/* ACB90 800BC390 38DB20AC */  sw         $zero, %lo(_qout)($at)
/* ACB94 800BC394 0D80033C */  lui        $v1, %hi(_qout)
/* ACB98 800BC398 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACB9C 800BC39C 0D80013C */  lui        $at, %hi(_qout + 0xC)
/* ACBA0 800BC3A0 44DB22AC */  sw         $v0, %lo(_qout + 0xC)($at)
/* ACBA4 800BC3A4 01000224 */  addiu      $v0, $zero, 0x1
/* ACBA8 800BC3A8 0D80013C */  lui        $at, %hi(_qin)
/* ACBAC 800BC3AC 34DB23AC */  sw         $v1, %lo(_qin)($at)
/* ACBB0 800BC3B0 07000332 */  andi       $v1, $s0, 0x7
/* ACBB4 800BC3B4 23006210 */  beq        $v1, $v0, .L800BC444
/* ACBB8 800BC3B8 02006228 */   slti      $v0, $v1, 0x2
/* ACBBC 800BC3BC 05004010 */  beqz       $v0, .L800BC3D4
/* ACBC0 800BC3C0 03000224 */   addiu     $v0, $zero, 0x3
/* ACBC4 800BC3C4 07006010 */  beqz       $v1, .L800BC3E4
/* ACBC8 800BC3C8 00000000 */   nop
/* ACBCC 800BC3CC 24F10208 */  j          .L800BC490
/* ACBD0 800BC3D0 00000000 */   nop
.L800BC3D4:
/* ACBD4 800BC3D4 1B006210 */  beq        $v1, $v0, .L800BC444
/* ACBD8 800BC3D8 05000224 */   addiu     $v0, $zero, 0x5
/* ACBDC 800BC3DC 2C006214 */  bne        $v1, $v0, .L800BC490
/* ACBE0 800BC3E0 00000000 */   nop
.L800BC3E4:
/* ACBE4 800BC3E4 0D80033C */  lui        $v1, %hi(GEnv + 0x114)
/* ACBE8 800BC3E8 20DB638C */  lw         $v1, %lo(GEnv + 0x114)($v1)
/* ACBEC 800BC3EC 01040224 */  addiu      $v0, $zero, 0x401
/* ACBF0 800BC3F0 000062AC */  sw         $v0, 0x0($v1)
/* ACBF4 800BC3F4 0D80033C */  lui        $v1, %hi(GEnv + 0x124)
/* ACBF8 800BC3F8 30DB638C */  lw         $v1, %lo(GEnv + 0x124)($v1)
/* ACBFC 800BC3FC 0E80043C */  lui        $a0, %hi(gMemcard + 0x58)
/* ACC00 800BC400 60BD8424 */  addiu      $a0, $a0, %lo(gMemcard + 0x58)
/* ACC04 800BC404 0000628C */  lw         $v0, 0x0($v1)
/* ACC08 800BC408 21280000 */  addu       $a1, $zero, $zero
/* ACC0C 800BC40C 00084234 */  ori        $v0, $v0, 0x800
/* ACC10 800BC410 000062AC */  sw         $v0, 0x0($v1)
/* ACC14 800BC414 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ACC18 800BC418 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ACC1C 800BC41C 00010624 */  addiu      $a2, $zero, 0x100
/* ACC20 800BC420 10F2020C */  jal        func_800BC840
/* ACC24 800BC424 000040AC */   sw        $zero, 0x0($v0)
/* ACC28 800BC428 0E80043C */  lui        $a0, %hi(_que)
/* ACC2C 800BC42C 68BE8424 */  addiu      $a0, $a0, %lo(_que)
/* ACC30 800BC430 21280000 */  addu       $a1, $zero, $zero
/* ACC34 800BC434 10F2020C */  jal        func_800BC840
/* ACC38 800BC438 00180624 */   addiu     $a2, $zero, 0x1800
/* ACC3C 800BC43C 24F10208 */  j          .L800BC490
/* ACC40 800BC440 00000000 */   nop
.L800BC444:
/* ACC44 800BC444 0D80033C */  lui        $v1, %hi(GEnv + 0x114)
/* ACC48 800BC448 20DB638C */  lw         $v1, %lo(GEnv + 0x114)($v1)
/* ACC4C 800BC44C 01040224 */  addiu      $v0, $zero, 0x401
/* ACC50 800BC450 000062AC */  sw         $v0, 0x0($v1)
/* ACC54 800BC454 0D80033C */  lui        $v1, %hi(GEnv + 0x124)
/* ACC58 800BC458 30DB638C */  lw         $v1, %lo(GEnv + 0x124)($v1)
/* ACC5C 800BC45C 00000000 */  nop
/* ACC60 800BC460 0000628C */  lw         $v0, 0x0($v1)
/* ACC64 800BC464 00000000 */  nop
/* ACC68 800BC468 00084234 */  ori        $v0, $v0, 0x800
/* ACC6C 800BC46C 000062AC */  sw         $v0, 0x0($v1)
/* ACC70 800BC470 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* ACC74 800BC474 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* ACC78 800BC478 0002023C */  lui        $v0, (0x2000000 >> 16)
/* ACC7C 800BC47C 000062AC */  sw         $v0, 0x0($v1)
/* ACC80 800BC480 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* ACC84 800BC484 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* ACC88 800BC488 0001023C */  lui        $v0, (0x1000000 >> 16)
/* ACC8C 800BC48C 000062AC */  sw         $v0, 0x0($v1)
.L800BC490:
/* ACC90 800BC490 0D80043C */  lui        $a0, %hi(_qout + 0xC)
/* ACC94 800BC494 44DB848C */  lw         $a0, %lo(_qout + 0xC)($a0)
/* ACC98 800BC498 ECE6020C */  jal        func_800B9BB0
/* ACC9C 800BC49C 00000000 */   nop
/* ACCA0 800BC4A0 07000232 */  andi       $v0, $s0, 0x7
/* ACCA4 800BC4A4 03004014 */  bnez       $v0, .L800BC4B4
/* ACCA8 800BC4A8 21100000 */   addu      $v0, $zero, $zero
/* ACCAC 800BC4AC DEF1020C */  jal        func_800BC778
/* ACCB0 800BC4B0 21200002 */   addu      $a0, $s0, $zero
.L800BC4B4:
/* ACCB4 800BC4B4 1400BF8F */  lw         $ra, 0x14($sp)
/* ACCB8 800BC4B8 1000B08F */  lw         $s0, 0x10($sp)
/* ACCBC 800BC4BC 0800E003 */  jr         $ra
/* ACCC0 800BC4C0 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BC374, . - func_800BC374
