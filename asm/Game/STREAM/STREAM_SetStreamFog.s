.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_SetStreamFog
/* 4A330 80059B30 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4A334 80059B34 1400B1AF */  sw         $s1, 0x14($sp)
/* 4A338 80059B38 21888000 */  addu       $s1, $a0, $zero
/* 4A33C 80059B3C F0BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 4A340 80059B40 1800B2AF */  sw         $s2, 0x18($sp)
/* 4A344 80059B44 2190A000 */  addu       $s2, $a1, $zero
/* 4A348 80059B48 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A34C 80059B4C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 4A350 80059B50 FC62010C */  jal        FindStreamUnitFromLevel
/* 4A354 80059B54 2180C000 */   addu      $s0, $a2, $zero
/* 4A358 80059B58 34004384 */  lh         $v1, 0x34($v0)
/* 4A35C 80059B5C 00141000 */  sll        $v0, $s0, 16
/* 4A360 80059B60 03140200 */  sra        $v0, $v0, 16
/* 4A364 80059B64 2A104300 */  slt        $v0, $v0, $v1
/* 4A368 80059B68 02004010 */  beqz       $v0, .L80059B74
/* 4A36C 80059B6C 21206000 */   addu      $a0, $v1, $zero
/* 4A370 80059B70 21200002 */  addu       $a0, $s0, $zero
.L80059B74:
/* 4A374 80059B74 00140400 */  sll        $v0, $a0, 16
/* 4A378 80059B78 03140200 */  sra        $v0, $v0, 16
/* 4A37C 80059B7C 30F84324 */  addiu      $v1, $v0, -0x7D0
/* 4A380 80059B80 00141200 */  sll        $v0, $s2, 16
/* 4A384 80059B84 380024A6 */  sh         $a0, 0x38($s1)
/* 4A388 80059B88 340024A6 */  sh         $a0, 0x34($s1)
/* 4A38C 80059B8C 03240200 */  sra        $a0, $v0, 16
/* 4A390 80059B90 2A108300 */  slt        $v0, $a0, $v1
/* 4A394 80059B94 02004010 */  beqz       $v0, .L80059BA0
/* 4A398 80059B98 00000000 */   nop
/* 4A39C 80059B9C 21188000 */  addu       $v1, $a0, $zero
.L80059BA0:
/* 4A3A0 80059BA0 3A0023A6 */  sh         $v1, 0x3A($s1)
/* 4A3A4 80059BA4 360023A6 */  sh         $v1, 0x36($s1)
/* 4A3A8 80059BA8 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4A3AC 80059BAC 1800B28F */  lw         $s2, 0x18($sp)
/* 4A3B0 80059BB0 1400B18F */  lw         $s1, 0x14($sp)
/* 4A3B4 80059BB4 1000B08F */  lw         $s0, 0x10($sp)
/* 4A3B8 80059BB8 0800E003 */  jr         $ra
/* 4A3BC 80059BBC 2000BD27 */   addiu     $sp, $sp, 0x20
.size STREAM_SetStreamFog, . - STREAM_SetStreamFog
