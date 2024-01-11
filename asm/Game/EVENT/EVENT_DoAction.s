.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_DoAction
/* 52260 80061A60 48FBBD27 */  addiu      $sp, $sp, -0x4B8
/* 52264 80061A64 B004B4AF */  sw         $s4, 0x4B0($sp)
/* 52268 80061A68 A404B1AF */  sw         $s1, 0x4A4($sp)
/* 5226C 80061A6C 2188A000 */  addu       $s1, $a1, $zero
/* 52270 80061A70 A004B0AF */  sw         $s0, 0x4A0($sp)
/* 52274 80061A74 2180C000 */  addu       $s0, $a2, $zero
/* 52278 80061A78 B404BFAF */  sw         $ra, 0x4B4($sp)
/* 5227C 80061A7C AC04B3AF */  sw         $s3, 0x4AC($sp)
/* 52280 80061A80 A804B2AF */  sw         $s2, 0x4A8($sp)
/* 52284 80061A84 1000A0AF */  sw         $zero, 0x10($sp)
/* 52288 80061A88 02002296 */  lhu        $v0, 0x2($s1)
/* 5228C 80061A8C 01001324 */  addiu      $s3, $zero, 0x1
/* 52290 80061A90 54CB91AF */  sw         $s1, %gp_rel(currentActionScript)($gp)
/* 52294 80061A94 5AA480A7 */  sh         $zero, %gp_rel(EventJustRecievedTimer)($gp)
/* 52298 80061A98 58CB90AF */  sw         $s0, %gp_rel(EventAbortedPosition)($gp)
/* 5229C 80061A9C 24105300 */  and        $v0, $v0, $s3
/* 522A0 80061AA0 44004014 */  bnez       $v0, .L80061BB4
/* 522A4 80061AA4 21A08000 */   addu      $s4, $a0, $zero
/* 522A8 80061AA8 43000012 */  beqz       $s0, .L80061BB8
/* 522AC 80061AAC 21106002 */   addu      $v0, $s3, $zero
/* 522B0 80061AB0 58A48287 */  lh         $v0, %gp_rel(EventAbortLine)($gp)
/* 522B4 80061AB4 00000000 */  nop
/* 522B8 80061AB8 3F004014 */  bnez       $v0, .L80061BB8
/* 522BC 80061ABC 21106002 */   addu      $v0, $s3, $zero
/* 522C0 80061AC0 1000B227 */  addiu      $s2, $sp, 0x10
/* 522C4 80061AC4 1000A427 */  addiu      $a0, $sp, 0x10
.L80061AC8:
/* 522C8 80061AC8 21280002 */  addu       $a1, $s0, $zero
/* 522CC 80061ACC 769B010C */  jal        EVENT_ParseOpcode
/* 522D0 80061AD0 9804A627 */   addiu     $a2, $sp, 0x498
/* 522D4 80061AD4 58A48387 */  lh         $v1, %gp_rel(EventAbortLine)($gp)
/* 522D8 80061AD8 00000000 */  nop
/* 522DC 80061ADC 19006010 */  beqz       $v1, .L80061B44
/* 522E0 80061AE0 21804000 */   addu      $s0, $v0, $zero
/* 522E4 80061AE4 5AA48287 */  lh         $v0, %gp_rel(EventJustRecievedTimer)($gp)
/* 522E8 80061AE8 00000000 */  nop
/* 522EC 80061AEC 15004014 */  bnez       $v0, .L80061B44
/* 522F0 80061AF0 00000000 */   nop
/* 522F4 80061AF4 4C84010C */  jal        EVENT_GetNextTimer
/* 522F8 80061AF8 00000000 */   nop
/* 522FC 80061AFC 21284000 */  addu       $a1, $v0, $zero
/* 52300 80061B00 1000A010 */  beqz       $a1, .L80061B44
/* 52304 80061B04 00000000 */   nop
/* 52308 80061B08 0000A28C */  lw         $v0, 0x0($a1)
/* 5230C 80061B0C 58CB838F */  lw         $v1, %gp_rel(EventAbortedPosition)($gp)
/* 52310 80061B10 64A4848F */  lw         $a0, %gp_rel(EventCurrentEventIndex)($gp)
/* 52314 80061B14 21980000 */  addu       $s3, $zero, $zero
/* 52318 80061B18 0400B4AC */  sw         $s4, 0x4($a1)
/* 5231C 80061B1C 0800B1AC */  sw         $s1, 0x8($a1)
/* 52320 80061B20 01004230 */  andi       $v0, $v0, 0x1
/* 52324 80061B24 0000A2AC */  sw         $v0, 0x0($a1)
/* 52328 80061B28 0C00A3AC */  sw         $v1, 0xC($a1)
/* 5232C 80061B2C 02002296 */  lhu        $v0, 0x2($s1)
/* 52330 80061B30 ECCB838F */  lw         $v1, %gp_rel(CurrentPuzzleLevel)($gp)
/* 52334 80061B34 01004234 */  ori        $v0, $v0, 0x1
/* 52338 80061B38 020022A6 */  sh         $v0, 0x2($s1)
/* 5233C 80061B3C 1000A3AC */  sw         $v1, 0x10($a1)
/* 52340 80061B40 1400A4AC */  sw         $a0, 0x14($a1)
.L80061B44:
/* 52344 80061B44 9804A28F */  lw         $v0, 0x498($sp)
/* 52348 80061B48 00000000 */  nop
/* 5234C 80061B4C 13004010 */  beqz       $v0, .L80061B9C
/* 52350 80061B50 00000000 */   nop
/* 52354 80061B54 58A48287 */  lh         $v0, %gp_rel(EventAbortLine)($gp)
/* 52358 80061B58 00000000 */  nop
/* 5235C 80061B5C 0F004014 */  bnez       $v0, .L80061B9C
/* 52360 80061B60 00000000 */   nop
/* 52364 80061B64 1000A28F */  lw         $v0, 0x10($sp)
/* 52368 80061B68 00000000 */  nop
/* 5236C 80061B6C 0B004018 */  blez       $v0, .L80061B9C
/* 52370 80061B70 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 52374 80061B74 1000A2AF */  sw         $v0, 0x10($sp)
/* 52378 80061B78 C0200200 */  sll        $a0, $v0, 3
/* 5237C 80061B7C 21208200 */  addu       $a0, $a0, $v0
/* 52380 80061B80 80200400 */  sll        $a0, $a0, 2
/* 52384 80061B84 04008424 */  addiu      $a0, $a0, 0x4
/* 52388 80061B88 21204402 */  addu       $a0, $s2, $a0
/* 5238C 80061B8C 21280000 */  addu       $a1, $zero, $zero
/* 52390 80061B90 21304002 */  addu       $a2, $s2, $zero
/* 52394 80061B94 F1A1010C */  jal        EVENT_ExecuteActionCommand
/* 52398 80061B98 21380002 */   addu      $a3, $s0, $zero
.L80061B9C:
/* 5239C 80061B9C 06000012 */  beqz       $s0, .L80061BB8
/* 523A0 80061BA0 21106002 */   addu      $v0, $s3, $zero
/* 523A4 80061BA4 58A48287 */  lh         $v0, %gp_rel(EventAbortLine)($gp)
/* 523A8 80061BA8 00000000 */  nop
/* 523AC 80061BAC C6FF4010 */  beqz       $v0, .L80061AC8
/* 523B0 80061BB0 1000A427 */   addiu     $a0, $sp, 0x10
.L80061BB4:
/* 523B4 80061BB4 21106002 */  addu       $v0, $s3, $zero
.L80061BB8:
/* 523B8 80061BB8 B404BF8F */  lw         $ra, 0x4B4($sp)
/* 523BC 80061BBC B004B48F */  lw         $s4, 0x4B0($sp)
/* 523C0 80061BC0 AC04B38F */  lw         $s3, 0x4AC($sp)
/* 523C4 80061BC4 A804B28F */  lw         $s2, 0x4A8($sp)
/* 523C8 80061BC8 A404B18F */  lw         $s1, 0x4A4($sp)
/* 523CC 80061BCC A004B08F */  lw         $s0, 0x4A0($sp)
/* 523D0 80061BD0 0800E003 */  jr         $ra
/* 523D4 80061BD4 B804BD27 */   addiu     $sp, $sp, 0x4B8
.size EVENT_DoAction, . - EVENT_DoAction
