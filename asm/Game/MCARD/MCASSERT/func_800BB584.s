.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BB584
/* ABD84 800BB584 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* ABD88 800BB588 1000B0AF */  sw         $s0, 0x10($sp)
/* ABD8C 800BB58C 2180A000 */  addu       $s0, $a1, $zero
/* ABD90 800BB590 0D80053C */  lui        $a1, %hi(GEnv + 0x124)
/* ABD94 800BB594 30DBA58C */  lw         $a1, %lo(GEnv + 0x124)($a1)
/* ABD98 800BB598 1800BFAF */  sw         $ra, 0x18($sp)
/* ABD9C 800BB59C 1400B1AF */  sw         $s1, 0x14($sp)
/* ABDA0 800BB5A0 0000A28C */  lw         $v0, 0x0($a1)
/* ABDA4 800BB5A4 0008033C */  lui        $v1, (0x8000000 >> 16)
/* ABDA8 800BB5A8 25104300 */  or         $v0, $v0, $v1
/* ABDAC 800BB5AC 0000A2AC */  sw         $v0, 0x0($a1)
/* ABDB0 800BB5B0 0D80023C */  lui        $v0, %hi(GEnv + 0x120)
/* ABDB4 800BB5B4 2CDB428C */  lw         $v0, %lo(GEnv + 0x120)($v0)
/* ABDB8 800BB5B8 00000000 */  nop
/* ABDBC 800BB5BC 000040AC */  sw         $zero, 0x0($v0)
/* ABDC0 800BB5C0 80101000 */  sll        $v0, $s0, 2
/* ABDC4 800BB5C4 FCFF4224 */  addiu      $v0, $v0, -0x4
/* ABDC8 800BB5C8 0D80033C */  lui        $v1, %hi(GEnv + 0x118)
/* ABDCC 800BB5CC 24DB638C */  lw         $v1, %lo(GEnv + 0x118)($v1)
/* ABDD0 800BB5D0 21208200 */  addu       $a0, $a0, $v0
/* ABDD4 800BB5D4 000064AC */  sw         $a0, 0x0($v1)
/* ABDD8 800BB5D8 0D80023C */  lui        $v0, %hi(GEnv + 0x11C)
/* ABDDC 800BB5DC 28DB428C */  lw         $v0, %lo(GEnv + 0x11C)($v0)
/* ABDE0 800BB5E0 0011033C */  lui        $v1, (0x11000002 >> 16)
/* ABDE4 800BB5E4 000050AC */  sw         $s0, 0x0($v0)
/* ABDE8 800BB5E8 0D80023C */  lui        $v0, %hi(GEnv + 0x120)
/* ABDEC 800BB5EC 2CDB428C */  lw         $v0, %lo(GEnv + 0x120)($v0)
/* ABDF0 800BB5F0 02006334 */  ori        $v1, $v1, (0x11000002 & 0xFFFF)
/* ABDF4 800BB5F4 80F1020C */  jal        func_800BC600
/* ABDF8 800BB5F8 000043AC */   sw        $v1, 0x0($v0)
/* ABDFC 800BB5FC 0D80023C */  lui        $v0, %hi(GEnv + 0x120)
/* ABE00 800BB600 2CDB428C */  lw         $v0, %lo(GEnv + 0x120)($v0)
/* ABE04 800BB604 00000000 */  nop
/* ABE08 800BB608 0000428C */  lw         $v0, 0x0($v0)
/* ABE0C 800BB60C 0001033C */  lui        $v1, (0x1000000 >> 16)
/* ABE10 800BB610 24104300 */  and        $v0, $v0, $v1
/* ABE14 800BB614 0E004010 */  beqz       $v0, .L800BB650
/* ABE18 800BB618 21100002 */   addu      $v0, $s0, $zero
/* ABE1C 800BB61C 0001113C */  lui        $s1, (0x1000000 >> 16)
.L800BB620:
/* ABE20 800BB620 8DF1020C */  jal        func_800BC634
/* ABE24 800BB624 00000000 */   nop
/* ABE28 800BB628 09004014 */  bnez       $v0, .L800BB650
/* ABE2C 800BB62C FFFF0224 */   addiu     $v0, $zero, -0x1
/* ABE30 800BB630 0D80023C */  lui        $v0, %hi(GEnv + 0x120)
/* ABE34 800BB634 2CDB428C */  lw         $v0, %lo(GEnv + 0x120)($v0)
/* ABE38 800BB638 00000000 */  nop
/* ABE3C 800BB63C 0000428C */  lw         $v0, 0x0($v0)
/* ABE40 800BB640 00000000 */  nop
/* ABE44 800BB644 24105100 */  and        $v0, $v0, $s1
/* ABE48 800BB648 F5FF4014 */  bnez       $v0, .L800BB620
/* ABE4C 800BB64C 21100002 */   addu      $v0, $s0, $zero
.L800BB650:
/* ABE50 800BB650 1800BF8F */  lw         $ra, 0x18($sp)
/* ABE54 800BB654 1400B18F */  lw         $s1, 0x14($sp)
/* ABE58 800BB658 1000B08F */  lw         $s0, 0x10($sp)
/* ABE5C 800BB65C 0800E003 */  jr         $ra
/* ABE60 800BB660 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BB584, . - func_800BB584
