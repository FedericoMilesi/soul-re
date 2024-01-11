.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetImpulsePhysics
/* 8AB10 8009A310 6003A28C */  lw         $v0, 0x360($a1)
/* 8AB14 8009A314 0400033C */  lui        $v1, (0x40000 >> 16)
/* 8AB18 8009A318 24104300 */  and        $v0, $v0, $v1
/* 8AB1C 8009A31C 46004014 */  bnez       $v0, .L8009A438
/* 8AB20 8009A320 21488000 */   addu      $t1, $a0, $zero
/* 8AB24 8009A324 E0002285 */  lh         $v0, 0xE0($t1)
/* 8AB28 8009A328 6C03A884 */  lh         $t0, 0x36C($a1)
/* 8AB2C 8009A32C 23100200 */  negu       $v0, $v0
/* 8AB30 8009A330 18004800 */  mult       $v0, $t0
/* 8AB34 8009A334 12380000 */  mflo       $a3
/* 8AB38 8009A338 00000000 */  nop
/* 8AB3C 8009A33C 00000000 */  nop
/* 8AB40 8009A340 18000801 */  mult       $t0, $t0
/* 8AB44 8009A344 E2002285 */  lh         $v0, 0xE2($t1)
/* 8AB48 8009A348 12300000 */  mflo       $a2
/* 8AB4C 8009A34C 6E03A484 */  lh         $a0, 0x36E($a1)
/* 8AB50 8009A350 23100200 */  negu       $v0, $v0
/* 8AB54 8009A354 18004400 */  mult       $v0, $a0
/* 8AB58 8009A358 E4002285 */  lh         $v0, 0xE4($t1)
/* 8AB5C 8009A35C 12500000 */  mflo       $t2
/* 8AB60 8009A360 7003A384 */  lh         $v1, 0x370($a1)
/* 8AB64 8009A364 23100200 */  negu       $v0, $v0
/* 8AB68 8009A368 18004300 */  mult       $v0, $v1
/* 8AB6C 8009A36C 12600000 */  mflo       $t4
/* 8AB70 8009A370 00000000 */  nop
/* 8AB74 8009A374 00000000 */  nop
/* 8AB78 8009A378 18008400 */  mult       $a0, $a0
/* 8AB7C 8009A37C 12100000 */  mflo       $v0
/* 8AB80 8009A380 00000000 */  nop
/* 8AB84 8009A384 00000000 */  nop
/* 8AB88 8009A388 18006300 */  mult       $v1, $v1
/* 8AB8C 8009A38C 2138EA00 */  addu       $a3, $a3, $t2
/* 8AB90 8009A390 E0002495 */  lhu        $a0, 0xE0($t1)
/* 8AB94 8009A394 2130C200 */  addu       $a2, $a2, $v0
/* 8AB98 8009A398 12180000 */  mflo       $v1
/* 8AB9C 8009A39C 2130C300 */  addu       $a2, $a2, $v1
/* 8ABA0 8009A3A0 2500C010 */  beqz       $a2, .L8009A438
/* 8ABA4 8009A3A4 2138EC00 */   addu      $a3, $a3, $t4
/* 8ABA8 8009A3A8 1800E800 */  mult       $a3, $t0
/* 8ABAC 8009A3AC 12100000 */  mflo       $v0
/* 8ABB0 8009A3B0 00000000 */  nop
/* 8ABB4 8009A3B4 00000000 */  nop
/* 8ABB8 8009A3B8 1A004600 */  div        $zero, $v0, $a2
/* 8ABBC 8009A3BC 12100000 */  mflo       $v0
/* 8ABC0 8009A3C0 5C002395 */  lhu        $v1, 0x5C($t1)
/* 8ABC4 8009A3C4 21108200 */  addu       $v0, $a0, $v0
/* 8ABC8 8009A3C8 21186200 */  addu       $v1, $v1, $v0
/* 8ABCC 8009A3CC 5C0023A5 */  sh         $v1, 0x5C($t1)
/* 8ABD0 8009A3D0 6E03A284 */  lh         $v0, 0x36E($a1)
/* 8ABD4 8009A3D4 00000000 */  nop
/* 8ABD8 8009A3D8 1800E200 */  mult       $a3, $v0
/* 8ABDC 8009A3DC 12100000 */  mflo       $v0
/* 8ABE0 8009A3E0 00000000 */  nop
/* 8ABE4 8009A3E4 00000000 */  nop
/* 8ABE8 8009A3E8 1A004600 */  div        $zero, $v0, $a2
/* 8ABEC 8009A3EC 12200000 */  mflo       $a0
/* 8ABF0 8009A3F0 E2002295 */  lhu        $v0, 0xE2($t1)
/* 8ABF4 8009A3F4 5E002395 */  lhu        $v1, 0x5E($t1)
/* 8ABF8 8009A3F8 21104400 */  addu       $v0, $v0, $a0
/* 8ABFC 8009A3FC 21186200 */  addu       $v1, $v1, $v0
/* 8AC00 8009A400 5E0023A5 */  sh         $v1, 0x5E($t1)
/* 8AC04 8009A404 7003A284 */  lh         $v0, 0x370($a1)
/* 8AC08 8009A408 00000000 */  nop
/* 8AC0C 8009A40C 1800E200 */  mult       $a3, $v0
/* 8AC10 8009A410 12100000 */  mflo       $v0
/* 8AC14 8009A414 00000000 */  nop
/* 8AC18 8009A418 00000000 */  nop
/* 8AC1C 8009A41C 1A004600 */  div        $zero, $v0, $a2
/* 8AC20 8009A420 12200000 */  mflo       $a0
/* 8AC24 8009A424 E4002295 */  lhu        $v0, 0xE4($t1)
/* 8AC28 8009A428 60002395 */  lhu        $v1, 0x60($t1)
/* 8AC2C 8009A42C 21104400 */  addu       $v0, $v0, $a0
/* 8AC30 8009A430 21186200 */  addu       $v1, $v1, $v0
/* 8AC34 8009A434 600023A5 */  sh         $v1, 0x60($t1)
.L8009A438:
/* 8AC38 8009A438 0800E003 */  jr         $ra
/* 8AC3C 8009A43C 00000000 */   nop
.size SetImpulsePhysics, . - SetImpulsePhysics
