.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_AddClearPrim
/* 1FD58 8002F558 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* 1FD5C 8002F55C 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 1FD60 8002F560 24104300 */  and        $v0, $v0, $v1
/* 1FD64 8002F564 03004010 */  beqz       $v0, .L8002F574
/* 1FD68 8002F568 21388000 */   addu      $a3, $a0, $zero
/* 1FD6C 8002F56C 1C00A010 */  beqz       $a1, .L8002F5E0
/* 1FD70 8002F570 00000000 */   nop
.L8002F574:
/* 1FD74 8002F574 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* 1FD78 8002F578 A4BD8527 */  addiu      $a1, $gp, %gp_rel(clearRect)
/* 1FD7C 8002F57C FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 1FD80 8002F580 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 1FD84 8002F584 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1FD88 8002F588 00110200 */  sll        $v0, $v0, 4
/* 1FD8C 8002F58C 0400648C */  lw         $a0, 0x4($v1)
/* 1FD90 8002F590 21104500 */  addu       $v0, $v0, $a1
/* 1FD94 8002F594 0000488C */  lw         $t0, 0x0($v0)
/* 1FD98 8002F598 0400498C */  lw         $t1, 0x4($v0)
/* 1FD9C 8002F59C 08004A8C */  lw         $t2, 0x8($v0)
/* 1FDA0 8002F5A0 0C004B8C */  lw         $t3, 0xC($v0)
/* 1FDA4 8002F5A4 000088AC */  sw         $t0, 0x0($a0)
/* 1FDA8 8002F5A8 040089AC */  sw         $t1, 0x4($a0)
/* 1FDAC 8002F5AC 08008AAC */  sw         $t2, 0x8($a0)
/* 1FDB0 8002F5B0 0C008BAC */  sw         $t3, 0xC($a0)
/* 1FDB4 8002F5B4 08BE838F */  lw         $v1, %gp_rel(gameTrackerX + 0x40)($gp)
/* 1FDB8 8002F5B8 10008224 */  addiu      $v0, $a0, 0x10
/* 1FDBC 8002F5BC 040062AC */  sw         $v0, 0x4($v1)
/* 1FDC0 8002F5C0 FC2FE28C */  lw         $v0, 0x2FFC($a3)
/* 1FDC4 8002F5C4 0003033C */  lui        $v1, (0x3000000 >> 16)
/* 1FDC8 8002F5C8 24104600 */  and        $v0, $v0, $a2
/* 1FDCC 8002F5CC 25104300 */  or         $v0, $v0, $v1
/* 1FDD0 8002F5D0 000082AC */  sw         $v0, 0x0($a0)
/* 1FDD4 8002F5D4 24208600 */  and        $a0, $a0, $a2
/* 1FDD8 8002F5D8 0800E003 */  jr         $ra
/* 1FDDC 8002F5DC FC2FE4AC */   sw        $a0, 0x2FFC($a3)
.L8002F5E0:
/* 1FDE0 8002F5E0 F8BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x30)($gp)
/* 1FDE4 8002F5E4 A4BD8327 */  addiu      $v1, $gp, %gp_rel(clearRect)
/* 1FDE8 8002F5E8 00110200 */  sll        $v0, $v0, 4
/* 1FDEC 8002F5EC 21104300 */  addu       $v0, $v0, $v1
/* 1FDF0 8002F5F0 A4BF838F */  lw         $v1, %gp_rel(gameTrackerX + 0x1DC)($gp)
/* 1FDF4 8002F5F4 0A004294 */  lhu        $v0, 0xA($v0)
/* 1FDF8 8002F5F8 0800E003 */  jr         $ra
/* 1FDFC 8002F5FC 0A0062A4 */   sh        $v0, 0xA($v1)
.size GAMELOOP_AddClearPrim, . - GAMELOOP_AddClearPrim
