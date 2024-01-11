.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1C84
/* B2484 800C1C84 21388000 */  addu       $a3, $a0, $zero
/* B2488 800C1C88 0E80023C */  lui        $v0, %hi(StRingIdx3)
/* B248C 800C1C8C 3CFD428C */  lw         $v0, %lo(StRingIdx3)($v0)
/* B2490 800C1C90 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B2494 800C1C94 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B2498 800C1C98 40110200 */  sll        $v0, $v0, 5
/* B249C 800C1C9C 21306200 */  addu       $a2, $v1, $v0
/* B24A0 800C1CA0 0000C394 */  lhu        $v1, 0x0($a2)
/* B24A4 800C1CA4 01000224 */  addiu      $v0, $zero, 0x1
/* B24A8 800C1CA8 0D006214 */  bne        $v1, $v0, .L800C1CE0
/* B24AC 800C1CAC 2140A000 */   addu      $t0, $a1, $zero
/* B24B0 800C1CB0 0E80023C */  lui        $v0, %hi(StEndFrame)
/* B24B4 800C1CB4 18FD428C */  lw         $v0, %lo(StEndFrame)($v0)
/* B24B8 800C1CB8 0E80013C */  lui        $at, %hi(StRingIdx3)
/* B24BC 800C1CBC 02004010 */  beqz       $v0, .L800C1CC8
/* B24C0 800C1CC0 3CFD20AC */   sw        $zero, %lo(StRingIdx3)($at)
/* B24C4 800C1CC4 0000C0A4 */  sh         $zero, 0x0($a2)
.L800C1CC8:
/* B24C8 800C1CC8 0E80023C */  lui        $v0, %hi(StRingIdx3)
/* B24CC 800C1CCC 3CFD428C */  lw         $v0, %lo(StRingIdx3)($v0)
/* B24D0 800C1CD0 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B24D4 800C1CD4 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B24D8 800C1CD8 40110200 */  sll        $v0, $v0, 5
/* B24DC 800C1CDC 21306200 */  addu       $a2, $v1, $v0
.L800C1CE0:
/* B24E0 800C1CE0 0000C394 */  lhu        $v1, 0x0($a2)
/* B24E4 800C1CE4 02000224 */  addiu      $v0, $zero, 0x2
/* B24E8 800C1CE8 12006214 */  bne        $v1, $v0, .L800C1D34
/* B24EC 800C1CEC 01000224 */   addiu     $v0, $zero, 0x1
/* B24F0 800C1CF0 04000224 */  addiu      $v0, $zero, 0x4
/* B24F4 800C1CF4 0000C2A4 */  sh         $v0, 0x0($a2)
/* B24F8 800C1CF8 21100000 */  addu       $v0, $zero, $zero
/* B24FC 800C1CFC 0E80033C */  lui        $v1, %hi(StRingSize)
/* B2500 800C1D00 40FD638C */  lw         $v1, %lo(StRingSize)($v1)
/* B2504 800C1D04 0E80043C */  lui        $a0, %hi(StRingAddr)
/* B2508 800C1D08 30FD848C */  lw         $a0, %lo(StRingAddr)($a0)
/* B250C 800C1D0C 0E80053C */  lui        $a1, %hi(StRingIdx3)
/* B2510 800C1D10 3CFDA58C */  lw         $a1, %lo(StRingIdx3)($a1)
/* B2514 800C1D14 40190300 */  sll        $v1, $v1, 5
/* B2518 800C1D18 21208300 */  addu       $a0, $a0, $v1
/* B251C 800C1D1C 80190500 */  sll        $v1, $a1, 6
/* B2520 800C1D20 23186500 */  subu       $v1, $v1, $a1
/* B2524 800C1D24 40190300 */  sll        $v1, $v1, 5
/* B2528 800C1D28 21208300 */  addu       $a0, $a0, $v1
/* B252C 800C1D2C 0000E4AC */  sw         $a0, 0x0($a3)
/* B2530 800C1D30 000006AD */  sw         $a2, 0x0($t0)
.L800C1D34:
/* B2534 800C1D34 0800E003 */  jr         $ra
/* B2538 800C1D38 00000000 */   nop
/* B253C 800C1D3C 00000000 */  nop
/* B2540 800C1D40 00000000 */  nop
.size func_800C1C84, . - func_800C1C84
