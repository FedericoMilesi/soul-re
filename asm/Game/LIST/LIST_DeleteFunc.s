.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LIST_DeleteFunc
/* 40380 8004FB80 0000838C */  lw         $v1, 0x0($a0)
/* 40384 8004FB84 00000000 */  nop
/* 40388 8004FB88 0A006010 */  beqz       $v1, .L8004FBB4
/* 4038C 8004FB8C 00000000 */   nop
/* 40390 8004FB90 0400828C */  lw         $v0, 0x4($a0)
/* 40394 8004FB94 00000000 */  nop
/* 40398 8004FB98 0C004010 */  beqz       $v0, .L8004FBCC
/* 4039C 8004FB9C 00000000 */   nop
/* 403A0 8004FBA0 040062AC */  sw         $v0, 0x4($v1)
/* 403A4 8004FBA4 0400838C */  lw         $v1, 0x4($a0)
/* 403A8 8004FBA8 0000828C */  lw         $v0, 0x0($a0)
/* 403AC 8004FBAC F83E0108 */  j          .L8004FBE0
/* 403B0 8004FBB0 000062AC */   sw        $v0, 0x0($v1)
.L8004FBB4:
/* 403B4 8004FBB4 0400828C */  lw         $v0, 0x4($a0)
/* 403B8 8004FBB8 00000000 */  nop
/* 403BC 8004FBBC 03004010 */  beqz       $v0, .L8004FBCC
/* 403C0 8004FBC0 00000000 */   nop
/* 403C4 8004FBC4 F83E0108 */  j          .L8004FBE0
/* 403C8 8004FBC8 000040AC */   sw        $zero, 0x0($v0)
.L8004FBCC:
/* 403CC 8004FBCC 0000828C */  lw         $v0, 0x0($a0)
/* 403D0 8004FBD0 00000000 */  nop
/* 403D4 8004FBD4 02004010 */  beqz       $v0, .L8004FBE0
/* 403D8 8004FBD8 00000000 */   nop
/* 403DC 8004FBDC 040040AC */  sw         $zero, 0x4($v0)
.L8004FBE0:
/* 403E0 8004FBE0 040080AC */  sw         $zero, 0x4($a0)
/* 403E4 8004FBE4 0800E003 */  jr         $ra
/* 403E8 8004FBE8 000080AC */   sw        $zero, 0x0($a0)
.size LIST_DeleteFunc, . - LIST_DeleteFunc
