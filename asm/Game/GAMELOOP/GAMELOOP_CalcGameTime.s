.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_CalcGameTime
/* 1E5B8 8002DDB8 00C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x238)($gp)
/* 1E5BC 8002DDBC E8BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x220)($gp)
/* 1E5C0 8002DDC0 00000000 */  nop
/* 1E5C4 8002DDC4 18006200 */  mult       $v1, $v0
/* 1E5C8 8002DDC8 12180000 */  mflo       $v1
/* 1E5CC 8002DDCC E745023C */  lui        $v0, (0x45E7B273 >> 16)
/* 1E5D0 8002DDD0 73B24234 */  ori        $v0, $v0, (0x45E7B273 & 0xFFFF)
/* 1E5D4 8002DDD4 19006200 */  multu      $v1, $v0
/* 1E5D8 8002DDD8 8888023C */  lui        $v0, (0x88888889 >> 16)
/* 1E5DC 8002DDDC 89884234 */  ori        $v0, $v0, (0x88888889 & 0xFFFF)
/* 1E5E0 8002DDE0 10180000 */  mfhi       $v1
/* 1E5E4 8002DDE4 822B0300 */  srl        $a1, $v1, 14
/* 1E5E8 8002DDE8 D002A524 */  addiu      $a1, $a1, 0x2D0
/* 1E5EC 8002DDEC 1800A200 */  mult       $a1, $v0
/* 1E5F0 8002DDF0 AA2A033C */  lui        $v1, (0x2AAAAAAB >> 16)
/* 1E5F4 8002DDF4 ABAA6334 */  ori        $v1, $v1, (0x2AAAAAAB & 0xFFFF)
/* 1E5F8 8002DDF8 10100000 */  mfhi       $v0
/* 1E5FC 8002DDFC 21204500 */  addu       $a0, $v0, $a1
/* 1E600 8002DE00 43210400 */  sra        $a0, $a0, 5
/* 1E604 8002DE04 C3170500 */  sra        $v0, $a1, 31
/* 1E608 8002DE08 23208200 */  subu       $a0, $a0, $v0
/* 1E60C 8002DE0C 18008300 */  mult       $a0, $v1
/* 1E610 8002DE10 10100000 */  mfhi       $v0
/* 1E614 8002DE14 83180200 */  sra        $v1, $v0, 2
/* 1E618 8002DE18 C3170400 */  sra        $v0, $a0, 31
/* 1E61C 8002DE1C 23186200 */  subu       $v1, $v1, $v0
/* 1E620 8002DE20 40100300 */  sll        $v0, $v1, 1
/* 1E624 8002DE24 21104300 */  addu       $v0, $v0, $v1
/* 1E628 8002DE28 C0100200 */  sll        $v0, $v0, 3
/* 1E62C 8002DE2C 23108200 */  subu       $v0, $a0, $v0
/* 1E630 8002DE30 40180200 */  sll        $v1, $v0, 1
/* 1E634 8002DE34 21186200 */  addu       $v1, $v1, $v0
/* 1E638 8002DE38 C0180300 */  sll        $v1, $v1, 3
/* 1E63C 8002DE3C 21186200 */  addu       $v1, $v1, $v0
/* 1E640 8002DE40 80180300 */  sll        $v1, $v1, 2
/* 1E644 8002DE44 00110400 */  sll        $v0, $a0, 4
/* 1E648 8002DE48 23104400 */  subu       $v0, $v0, $a0
/* 1E64C 8002DE4C 80100200 */  sll        $v0, $v0, 2
/* 1E650 8002DE50 2328A200 */  subu       $a1, $a1, $v0
/* 1E654 8002DE54 21186500 */  addu       $v1, $v1, $a1
/* 1E658 8002DE58 E2BF83A7 */  sh         $v1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 1E65C 8002DE5C 0800E003 */  jr         $ra
/* 1E660 8002DE60 00000000 */   nop
.size GAMELOOP_CalcGameTime, . - GAMELOOP_CalcGameTime
