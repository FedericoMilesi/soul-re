.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel TIMER_GetTimeMS
/* 2E5BC 8003DDBC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2E5C0 8003DDC0 1800BFAF */  sw         $ra, 0x18($sp)
/* 2E5C4 8003DDC4 1400B1AF */  sw         $s1, 0x14($sp)
/* 2E5C8 8003DDC8 A5FC020C */  jal        EnterCriticalSection
/* 2E5CC 8003DDCC 1000B0AF */   sw        $s0, 0x10($sp)
/* 2E5D0 8003DDD0 EBF4020C */  jal        GetRCnt
/* 2E5D4 8003DDD4 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 2E5D8 8003DDD8 FFFF5130 */  andi       $s1, $v0, 0xFFFF
/* 2E5DC 8003DDDC 5890908F */  lw         $s0, %gp_rel(gameTimer)($gp)
/* 2E5E0 8003DDE0 11FC020C */  jal        ExitCriticalSection
/* 2E5E4 8003DDE4 00000000 */   nop
/* 2E5E8 8003DDE8 00141000 */  sll        $v0, $s0, 16
/* 2E5EC 8003DDEC 25882202 */  or         $s1, $s1, $v0
/* 2E5F0 8003DDF0 5BEF023C */  lui        $v0, (0xEF5B29DB >> 16)
/* 2E5F4 8003DDF4 DB294234 */  ori        $v0, $v0, (0xEF5B29DB & 0xFFFF)
/* 2E5F8 8003DDF8 19002202 */  multu      $s1, $v0
/* 2E5FC 8003DDFC 1800BF8F */  lw         $ra, 0x18($sp)
/* 2E600 8003DE00 02841000 */  srl        $s0, $s0, 16
/* 2E604 8003DE04 80191000 */  sll        $v1, $s0, 6
/* 2E608 8003DE08 23187000 */  subu       $v1, $v1, $s0
/* 2E60C 8003DE0C C0180300 */  sll        $v1, $v1, 3
/* 2E610 8003DE10 23187000 */  subu       $v1, $v1, $s0
/* 2E614 8003DE14 80180300 */  sll        $v1, $v1, 2
/* 2E618 8003DE18 21187000 */  addu       $v1, $v1, $s0
/* 2E61C 8003DE1C 80210300 */  sll        $a0, $v1, 6
/* 2E620 8003DE20 23208300 */  subu       $a0, $a0, $v1
/* 2E624 8003DE24 1000B08F */  lw         $s0, 0x10($sp)
/* 2E628 8003DE28 10100000 */  mfhi       $v0
/* 2E62C 8003DE2C 23882202 */  subu       $s1, $s1, $v0
/* 2E630 8003DE30 42881100 */  srl        $s1, $s1, 1
/* 2E634 8003DE34 21105100 */  addu       $v0, $v0, $s1
/* 2E638 8003DE38 C2130200 */  srl        $v0, $v0, 15
/* 2E63C 8003DE3C 1400B18F */  lw         $s1, 0x14($sp)
/* 2E640 8003DE40 21108200 */  addu       $v0, $a0, $v0
/* 2E644 8003DE44 0800E003 */  jr         $ra
/* 2E648 8003DE48 2000BD27 */   addiu     $sp, $sp, 0x20
.size TIMER_GetTimeMS, . - TIMER_GetTimeMS
