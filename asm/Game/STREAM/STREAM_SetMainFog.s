.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_SetMainFog
/* 4A2DC 80059ADC D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4A2E0 80059AE0 0800838C */  lw         $v1, 0x8($a0)
/* 4A2E4 80059AE4 07004010 */  beqz       $v0, .L80059B04
/* 4A2E8 80059AE8 00000000 */   nop
/* 4A2EC 80059AEC 4A006294 */  lhu        $v0, 0x4A($v1)
/* 4A2F0 80059AF0 00000000 */  nop
/* 4A2F4 80059AF4 360082A4 */  sh         $v0, 0x36($a0)
/* 4A2F8 80059AF8 48006294 */  lhu        $v0, 0x48($v1)
/* 4A2FC 80059AFC C7660108 */  j          .L80059B1C
/* 4A300 80059B00 340082A4 */   sh        $v0, 0x34($a0)
.L80059B04:
/* 4A304 80059B04 A6006294 */  lhu        $v0, 0xA6($v1)
/* 4A308 80059B08 00000000 */  nop
/* 4A30C 80059B0C 360082A4 */  sh         $v0, 0x36($a0)
/* 4A310 80059B10 A4006294 */  lhu        $v0, 0xA4($v1)
/* 4A314 80059B14 00000000 */  nop
/* 4A318 80059B18 340082A4 */  sh         $v0, 0x34($a0)
.L80059B1C:
/* 4A31C 80059B1C 36008294 */  lhu        $v0, 0x36($a0)
/* 4A320 80059B20 34008394 */  lhu        $v1, 0x34($a0)
/* 4A324 80059B24 3A0082A4 */  sh         $v0, 0x3A($a0)
/* 4A328 80059B28 0800E003 */  jr         $ra
/* 4A32C 80059B2C 380083A4 */   sh        $v1, 0x38($a0)
.size STREAM_SetMainFog, . - STREAM_SetMainFog
