.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BC4C4
/* ACCC4 800BC4C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* ACCC8 800BC4C8 1400BFAF */  sw         $ra, 0x14($sp)
/* ACCCC 800BC4CC 2A008014 */  bnez       $a0, .L800BC578
/* ACCD0 800BC4D0 1000B0AF */   sw        $s0, 0x10($sp)
/* ACCD4 800BC4D4 80F1020C */  jal        func_800BC600
/* ACCD8 800BC4D8 00000000 */   nop
/* ACCDC 800BC4DC 3FF10208 */  j          .L800BC4FC
/* ACCE0 800BC4E0 00000000 */   nop
.L800BC4E4:
/* ACCE4 800BC4E4 45F0020C */  jal        func_800BC114
/* ACCE8 800BC4E8 00000000 */   nop
/* ACCEC 800BC4EC 8DF1020C */  jal        func_800BC634
/* ACCF0 800BC4F0 00000000 */   nop
/* ACCF4 800BC4F4 3E004014 */  bnez       $v0, .L800BC5F0
/* ACCF8 800BC4F8 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BC4FC:
/* ACCFC 800BC4FC 0D80033C */  lui        $v1, %hi(_qin)
/* ACD00 800BC500 34DB638C */  lw         $v1, %lo(_qin)($v1)
/* ACD04 800BC504 0D80023C */  lui        $v0, %hi(_qout)
/* ACD08 800BC508 38DB428C */  lw         $v0, %lo(_qout)($v0)
/* ACD0C 800BC50C 00000000 */  nop
/* ACD10 800BC510 07006210 */  beq        $v1, $v0, .L800BC530
/* ACD14 800BC514 00000000 */   nop
/* ACD18 800BC518 39F10208 */  j          .L800BC4E4
/* ACD1C 800BC51C 00000000 */   nop
.L800BC520:
/* ACD20 800BC520 8DF1020C */  jal        func_800BC634
/* ACD24 800BC524 00000000 */   nop
/* ACD28 800BC528 31004014 */  bnez       $v0, .L800BC5F0
/* ACD2C 800BC52C FFFF0224 */   addiu     $v0, $zero, -0x1
.L800BC530:
/* ACD30 800BC530 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* ACD34 800BC534 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* ACD38 800BC538 00000000 */  nop
/* ACD3C 800BC53C 0000428C */  lw         $v0, 0x0($v0)
/* ACD40 800BC540 0001033C */  lui        $v1, (0x1000000 >> 16)
/* ACD44 800BC544 24104300 */  and        $v0, $v0, $v1
/* ACD48 800BC548 F5FF4014 */  bnez       $v0, .L800BC520
/* ACD4C 800BC54C 00000000 */   nop
/* ACD50 800BC550 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ACD54 800BC554 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ACD58 800BC558 00000000 */  nop
/* ACD5C 800BC55C 0000428C */  lw         $v0, 0x0($v0)
/* ACD60 800BC560 0004033C */  lui        $v1, (0x4000000 >> 16)
/* ACD64 800BC564 24104300 */  and        $v0, $v0, $v1
/* ACD68 800BC568 EDFF4010 */  beqz       $v0, .L800BC520
/* ACD6C 800BC56C 21100000 */   addu      $v0, $zero, $zero
/* ACD70 800BC570 7CF10208 */  j          .L800BC5F0
/* ACD74 800BC574 00000000 */   nop
.L800BC578:
/* ACD78 800BC578 0D80023C */  lui        $v0, %hi(_qin)
/* ACD7C 800BC57C 34DB428C */  lw         $v0, %lo(_qin)($v0)
/* ACD80 800BC580 0D80033C */  lui        $v1, %hi(_qout)
/* ACD84 800BC584 38DB638C */  lw         $v1, %lo(_qout)($v1)
/* ACD88 800BC588 00000000 */  nop
/* ACD8C 800BC58C 23104300 */  subu       $v0, $v0, $v1
/* ACD90 800BC590 3F005030 */  andi       $s0, $v0, 0x3F
/* ACD94 800BC594 03000012 */  beqz       $s0, .L800BC5A4
/* ACD98 800BC598 00000000 */   nop
/* ACD9C 800BC59C 45F0020C */  jal        func_800BC114
/* ACDA0 800BC5A0 00000000 */   nop
.L800BC5A4:
/* ACDA4 800BC5A4 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* ACDA8 800BC5A8 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* ACDAC 800BC5AC 00000000 */  nop
/* ACDB0 800BC5B0 0000428C */  lw         $v0, 0x0($v0)
/* ACDB4 800BC5B4 0001033C */  lui        $v1, (0x1000000 >> 16)
/* ACDB8 800BC5B8 24104300 */  and        $v0, $v0, $v1
/* ACDBC 800BC5BC 09004014 */  bnez       $v0, .L800BC5E4
/* ACDC0 800BC5C0 00000000 */   nop
/* ACDC4 800BC5C4 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* ACDC8 800BC5C8 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* ACDCC 800BC5CC 00000000 */  nop
/* ACDD0 800BC5D0 0000428C */  lw         $v0, 0x0($v0)
/* ACDD4 800BC5D4 0004033C */  lui        $v1, (0x4000000 >> 16)
/* ACDD8 800BC5D8 24104300 */  and        $v0, $v0, $v1
/* ACDDC 800BC5DC 04004014 */  bnez       $v0, .L800BC5F0
/* ACDE0 800BC5E0 21100002 */   addu      $v0, $s0, $zero
.L800BC5E4:
/* ACDE4 800BC5E4 02000016 */  bnez       $s0, .L800BC5F0
/* ACDE8 800BC5E8 21100002 */   addu      $v0, $s0, $zero
/* ACDEC 800BC5EC 01000224 */  addiu      $v0, $zero, 0x1
.L800BC5F0:
/* ACDF0 800BC5F0 1400BF8F */  lw         $ra, 0x14($sp)
/* ACDF4 800BC5F4 1000B08F */  lw         $s0, 0x10($sp)
/* ACDF8 800BC5F8 0800E003 */  jr         $ra
/* ACDFC 800BC5FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BC4C4, . - func_800BC4C4
