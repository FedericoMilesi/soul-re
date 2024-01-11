.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_GetNextTimer
/* 51930 80061130 30CE828F */  lw         $v0, %gp_rel(numActiveEventTimers)($gp)
/* 51934 80061134 00000000 */  nop
/* 51938 80061138 18004228 */  slti       $v0, $v0, 0x18
/* 5193C 8006113C 14004010 */  beqz       $v0, .L80061190
/* 51940 80061140 F8FFBD27 */   addiu     $sp, $sp, -0x8
/* 51944 80061144 F0CB8327 */  addiu      $v1, $gp, %gp_rel(eventTimerArray)
/* 51948 80061148 18000424 */  addiu      $a0, $zero, 0x18
/* 5194C 8006114C FEFF0524 */  addiu      $a1, $zero, -0x2
.L80061150:
/* 51950 80061150 0000628C */  lw         $v0, 0x0($v1)
/* 51954 80061154 00000000 */  nop
/* 51958 80061158 01004230 */  andi       $v0, $v0, 0x1
/* 5195C 8006115C 0A004014 */  bnez       $v0, .L80061188
/* 51960 80061160 FFFF8424 */   addiu     $a0, $a0, -0x1
/* 51964 80061164 21106000 */  addu       $v0, $v1, $zero
/* 51968 80061168 0000648C */  lw         $a0, 0x0($v1)
/* 5196C 8006116C 30CE838F */  lw         $v1, %gp_rel(numActiveEventTimers)($gp)
/* 51970 80061170 24208500 */  and        $a0, $a0, $a1
/* 51974 80061174 01008434 */  ori        $a0, $a0, 0x1
/* 51978 80061178 01006324 */  addiu      $v1, $v1, 0x1
/* 5197C 8006117C 30CE83AF */  sw         $v1, %gp_rel(numActiveEventTimers)($gp)
/* 51980 80061180 65840108 */  j          .L80061194
/* 51984 80061184 000044AC */   sw        $a0, 0x0($v0)
.L80061188:
/* 51988 80061188 F1FF801C */  bgtz       $a0, .L80061150
/* 5198C 8006118C 18006324 */   addiu     $v1, $v1, 0x18
.L80061190:
/* 51990 80061190 21100000 */  addu       $v0, $zero, $zero
.L80061194:
/* 51994 80061194 0800E003 */  jr         $ra
/* 51998 80061198 0800BD27 */   addiu     $sp, $sp, 0x8
.size EVENT_GetNextTimer, . - EVENT_GetNextTimer
