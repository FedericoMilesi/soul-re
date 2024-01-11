.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ENMYPLAN_GetPosOfNextWaypoint
/* 8798C 8009718C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 87990 80097190 1000B0AF */  sw         $s0, 0x10($sp)
/* 87994 80097194 21808000 */  addu       $s0, $a0, $zero
/* 87998 80097198 1800B2AF */  sw         $s2, 0x18($sp)
/* 8799C 8009719C 2190A000 */  addu       $s2, $a1, $zero
/* 879A0 800971A0 1400B1AF */  sw         $s1, 0x14($sp)
/* 879A4 800971A4 DCBF918F */  lw         $s1, %gp_rel(gameTrackerX + 0x214)($gp)
/* 879A8 800971A8 21280002 */  addu       $a1, $s0, $zero
/* 879AC 800971AC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 879B0 800971B0 375C020C */  jal        ValidSlotAndState
/* 879B4 800971B4 21202002 */   addu      $a0, $s1, $zero
/* 879B8 800971B8 03004014 */  bnez       $v0, .L800971C8
/* 879BC 800971BC 40181000 */   sll       $v1, $s0, 1
/* 879C0 800971C0 855C0208 */  j          .L80097214
/* 879C4 800971C4 21100000 */   addu      $v0, $zero, $zero
.L800971C8:
/* 879C8 800971C8 21187000 */  addu       $v1, $v1, $s0
/* 879CC 800971CC 00190300 */  sll        $v1, $v1, 4
/* 879D0 800971D0 23187000 */  subu       $v1, $v1, $s0
/* 879D4 800971D4 40180300 */  sll        $v1, $v1, 1
/* 879D8 800971D8 21182302 */  addu       $v1, $s1, $v1
/* 879DC 800971DC 02006490 */  lbu        $a0, 0x2($v1)
/* 879E0 800971E0 00000000 */  nop
/* 879E4 800971E4 40100400 */  sll        $v0, $a0, 1
/* 879E8 800971E8 21104400 */  addu       $v0, $v0, $a0
/* 879EC 800971EC 40100200 */  sll        $v0, $v0, 1
/* 879F0 800971F0 26004224 */  addiu      $v0, $v0, 0x26
/* 879F4 800971F4 21186200 */  addu       $v1, $v1, $v0
/* 879F8 800971F8 00006494 */  lhu        $a0, 0x0($v1)
/* 879FC 800971FC 02006594 */  lhu        $a1, 0x2($v1)
/* 87A00 80097200 04006394 */  lhu        $v1, 0x4($v1)
/* 87A04 80097204 01000224 */  addiu      $v0, $zero, 0x1
/* 87A08 80097208 000044A6 */  sh         $a0, 0x0($s2)
/* 87A0C 8009720C 020045A6 */  sh         $a1, 0x2($s2)
/* 87A10 80097210 040043A6 */  sh         $v1, 0x4($s2)
.L80097214:
/* 87A14 80097214 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 87A18 80097218 1800B28F */  lw         $s2, 0x18($sp)
/* 87A1C 8009721C 1400B18F */  lw         $s1, 0x14($sp)
/* 87A20 80097220 1000B08F */  lw         $s0, 0x10($sp)
/* 87A24 80097224 0800E003 */  jr         $ra
/* 87A28 80097228 2000BD27 */   addiu     $sp, $sp, 0x20
.size ENMYPLAN_GetPosOfNextWaypoint, . - ENMYPLAN_GetPosOfNextWaypoint
