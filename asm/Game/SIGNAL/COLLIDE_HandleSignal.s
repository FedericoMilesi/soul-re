.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel COLLIDE_HandleSignal
/* EB8C 8001E38C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* EB90 8001E390 1C00B3AF */  sw         $s3, 0x1C($sp)
/* EB94 8001E394 21988000 */  addu       $s3, $a0, $zero
/* EB98 8001E398 1000B0AF */  sw         $s0, 0x10($sp)
/* EB9C 8001E39C 2180A000 */  addu       $s0, $a1, $zero
/* EBA0 8001E3A0 2000BFAF */  sw         $ra, 0x20($sp)
/* EBA4 8001E3A4 1800B2AF */  sw         $s2, 0x18($sp)
/* EBA8 8001E3A8 3200C010 */  beqz       $a2, .L8001E474
/* EBAC 8001E3AC 1400B1AF */   sw        $s1, 0x14($sp)
/* EBB0 8001E3B0 FF7F113C */  lui        $s1, (0x7FFFFFFF >> 16)
/* EBB4 8001E3B4 FFFF3136 */  ori        $s1, $s1, (0x7FFFFFFF & 0xFFFF)
/* EBB8 8001E3B8 908E9227 */  addiu      $s2, $gp, %gp_rel(signalInfoList)
.L8001E3BC:
/* EBBC 8001E3BC 0000048E */  lw         $a0, 0x0($s0)
/* EBC0 8001E3C0 00000000 */  nop
/* EBC4 8001E3C4 24189100 */  and        $v1, $a0, $s1
/* EBC8 8001E3C8 40100300 */  sll        $v0, $v1, 1
/* EBCC 8001E3CC 21104300 */  addu       $v0, $v0, $v1
/* EBD0 8001E3D0 80100200 */  sll        $v0, $v0, 2
/* EBD4 8001E3D4 21105200 */  addu       $v0, $v0, $s2
/* EBD8 8001E3D8 06004284 */  lh         $v0, 0x6($v0)
/* EBDC 8001E3DC 00000000 */  nop
/* EBE0 8001E3E0 05004010 */  beqz       $v0, .L8001E3F8
/* EBE4 8001E3E4 00000000 */   nop
/* EBE8 8001E3E8 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* EBEC 8001E3EC 00000000 */  nop
/* EBF0 8001E3F0 13006216 */  bne        $s3, $v0, .L8001E440
/* EBF4 8001E3F4 00000000 */   nop
.L8001E3F8:
/* EBF8 8001E3F8 08BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x140)($gp)
/* EBFC 8001E3FC 00000000 */  nop
/* EC00 8001E400 40004230 */  andi       $v0, $v0, 0x40
/* EC04 8001E404 03004010 */  beqz       $v0, .L8001E414
/* EC08 8001E408 1B006228 */   slti      $v0, $v1, 0x1B
/* EC0C 8001E40C 0C008004 */  bltz       $a0, .L8001E440
/* EC10 8001E410 00000000 */   nop
.L8001E414:
/* EC14 8001E414 17004010 */  beqz       $v0, .L8001E474
/* EC18 8001E418 40100300 */   sll       $v0, $v1, 1
/* EC1C 8001E41C 21104300 */  addu       $v0, $v0, $v1
/* EC20 8001E420 80100200 */  sll        $v0, $v0, 2
/* EC24 8001E424 21105200 */  addu       $v0, $v0, $s2
/* EC28 8001E428 0000428C */  lw         $v0, 0x0($v0)
/* EC2C 8001E42C 21206002 */  addu       $a0, $s3, $zero
/* EC30 8001E430 09F84000 */  jalr       $v0
/* EC34 8001E434 21280002 */   addu      $a1, $s0, $zero
/* EC38 8001E438 0E004010 */  beqz       $v0, .L8001E474
/* EC3C 8001E43C 00000000 */   nop
.L8001E440:
/* EC40 8001E440 0000028E */  lw         $v0, 0x0($s0)
/* EC44 8001E444 00000000 */  nop
/* EC48 8001E448 24105100 */  and        $v0, $v0, $s1
/* EC4C 8001E44C 40180200 */  sll        $v1, $v0, 1
/* EC50 8001E450 21186200 */  addu       $v1, $v1, $v0
/* EC54 8001E454 80180300 */  sll        $v1, $v1, 2
/* EC58 8001E458 21187200 */  addu       $v1, $v1, $s2
/* EC5C 8001E45C 04006284 */  lh         $v0, 0x4($v1)
/* EC60 8001E460 00000000 */  nop
/* EC64 8001E464 01004224 */  addiu      $v0, $v0, 0x1
/* EC68 8001E468 80100200 */  sll        $v0, $v0, 2
/* EC6C 8001E46C EF780008 */  j          .L8001E3BC
/* EC70 8001E470 21800202 */   addu      $s0, $s0, $v0
.L8001E474:
/* EC74 8001E474 2000BF8F */  lw         $ra, 0x20($sp)
/* EC78 8001E478 1C00B38F */  lw         $s3, 0x1C($sp)
/* EC7C 8001E47C 1800B28F */  lw         $s2, 0x18($sp)
/* EC80 8001E480 1400B18F */  lw         $s1, 0x14($sp)
/* EC84 8001E484 1000B08F */  lw         $s0, 0x10($sp)
/* EC88 8001E488 0800E003 */  jr         $ra
/* EC8C 8001E48C 2800BD27 */   addiu     $sp, $sp, 0x28
.size COLLIDE_HandleSignal, . - COLLIDE_HandleSignal
