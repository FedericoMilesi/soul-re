.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_RelocatePlanPositions
/* 87A2C 8009722C 40100400 */  sll        $v0, $a0, 1
/* 87A30 80097230 21104400 */  addu       $v0, $v0, $a0
/* 87A34 80097234 00110200 */  sll        $v0, $v0, 4
/* 87A38 80097238 23104400 */  subu       $v0, $v0, $a0
/* 87A3C 8009723C DCBF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x214)($gp)
/* 87A40 80097240 40100200 */  sll        $v0, $v0, 1
/* 87A44 80097244 21486200 */  addu       $t1, $v1, $v0
/* 87A48 80097248 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 87A4C 8009724C 58002391 */  lbu        $v1, 0x58($t1)
/* 87A50 80097250 1B008210 */  beq        $a0, $v0, .L800972C0
/* 87A54 80097254 2150A000 */   addu      $t2, $a1, $zero
/* 87A58 80097258 0A008228 */  slti       $v0, $a0, 0xA
/* 87A5C 8009725C 18004010 */  beqz       $v0, .L800972C0
/* 87A60 80097260 08006228 */   slti      $v0, $v1, 0x8
/* 87A64 80097264 16004010 */  beqz       $v0, .L800972C0
/* 87A68 80097268 21386000 */   addu      $a3, $v1, $zero
/* 87A6C 8009726C 1400E018 */  blez       $a3, .L800972C0
/* 87A70 80097270 40100700 */   sll       $v0, $a3, 1
/* 87A74 80097274 21104700 */  addu       $v0, $v0, $a3
/* 87A78 80097278 40100200 */  sll        $v0, $v0, 1
/* 87A7C 8009727C 26004824 */  addiu      $t0, $v0, 0x26
.L80097280:
/* 87A80 80097280 FAFF0825 */  addiu      $t0, $t0, -0x6
/* 87A84 80097284 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 87A88 80097288 21202801 */  addu       $a0, $t1, $t0
/* 87A8C 8009728C 00008294 */  lhu        $v0, 0x0($a0)
/* 87A90 80097290 00004395 */  lhu        $v1, 0x0($t2)
/* 87A94 80097294 02004595 */  lhu        $a1, 0x2($t2)
/* 87A98 80097298 04004695 */  lhu        $a2, 0x4($t2)
/* 87A9C 8009729C 21104300 */  addu       $v0, $v0, $v1
/* 87AA0 800972A0 000082A4 */  sh         $v0, 0x0($a0)
/* 87AA4 800972A4 02008294 */  lhu        $v0, 0x2($a0)
/* 87AA8 800972A8 04008394 */  lhu        $v1, 0x4($a0)
/* 87AAC 800972AC 21104500 */  addu       $v0, $v0, $a1
/* 87AB0 800972B0 21186600 */  addu       $v1, $v1, $a2
/* 87AB4 800972B4 020082A4 */  sh         $v0, 0x2($a0)
/* 87AB8 800972B8 F1FFE01C */  bgtz       $a3, .L80097280
/* 87ABC 800972BC 040083A4 */   sh        $v1, 0x4($a0)
.L800972C0:
/* 87AC0 800972C0 0800E003 */  jr         $ra
/* 87AC4 800972C4 00000000 */   nop
.size ENMYPLAN_RelocatePlanPositions, . - ENMYPLAN_RelocatePlanPositions
