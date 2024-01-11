.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateInitStartMove
/* 9AA18 800AA218 C4FC828F */  lw         $v0, %gp_rel(PadData)($gp)
/* 9AA1C 800AA21C A0A4838F */  lw         $v1, %gp_rel(RazielCommands + 0x1C)($gp)
/* 9AA20 800AA220 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9AA24 800AA224 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9AA28 800AA228 21888000 */  addu       $s1, $a0, $zero
/* 9AA2C 800AA22C 1800B0AF */  sw         $s0, 0x18($sp)
/* 9AA30 800AA230 2180A000 */  addu       $s0, $a1, $zero
/* 9AA34 800AA234 2800BFAF */  sw         $ra, 0x28($sp)
/* 9AA38 800AA238 2400B3AF */  sw         $s3, 0x24($sp)
/* 9AA3C 800AA23C 2000B2AF */  sw         $s2, 0x20($sp)
/* 9AA40 800AA240 0000428C */  lw         $v0, 0x0($v0)
/* 9AA44 800AA244 00000000 */  nop
/* 9AA48 800AA248 24104300 */  and        $v0, $v0, $v1
/* 9AA4C 800AA24C 05004010 */  beqz       $v0, .L800AA264
/* 9AA50 800AA250 2198C000 */   addu      $s3, $a2, $zero
/* 9AA54 800AA254 0B80063C */  lui        $a2, %hi(StateHandlerMove)
/* 9AA58 800AA258 A8ABC624 */  addiu      $a2, $a2, %lo(StateHandlerMove)
/* 9AA5C 800AA25C C1CA010C */  jal        StateSwitchStateData
/* 9AA60 800AA260 03000724 */   addiu     $a3, $zero, 0x3
.L800AA264:
/* 9AA64 800AA264 21280002 */  addu       $a1, $s0, $zero
/* 9AA68 800AA268 30000624 */  addiu      $a2, $zero, 0x30
/* 9AA6C 800AA26C FFFF1224 */  addiu      $s2, $zero, -0x1
/* 9AA70 800AA270 1000B2AF */  sw         $s2, 0x10($sp)
/* 9AA74 800AA274 0000248E */  lw         $a0, 0x0($s1)
/* 9AA78 800AA278 5E9C020C */  jal        razSwitchVAnimGroup
/* 9AA7C 800AA27C 21386002 */   addu      $a3, $s3, $zero
/* 9AA80 800AA280 06004010 */  beqz       $v0, .L800AA29C
/* 9AA84 800AA284 21280002 */   addu      $a1, $s0, $zero
/* 9AA88 800AA288 21300000 */  addu       $a2, $zero, $zero
/* 9AA8C 800AA28C 1000B2AF */  sw         $s2, 0x10($sp)
/* 9AA90 800AA290 0000248E */  lw         $a0, 0x0($s1)
/* 9AA94 800AA294 A39C020C */  jal        razSwitchVAnimSingle
/* 9AA98 800AA298 21386002 */   addu      $a3, $s3, $zero
.L800AA29C:
/* 9AA9C 800AA29C C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AAA0 800AA2A0 2800BF8F */  lw         $ra, 0x28($sp)
/* 9AAA4 800AA2A4 2400B38F */  lw         $s3, 0x24($sp)
/* 9AAA8 800AA2A8 2000B28F */  lw         $s2, 0x20($sp)
/* 9AAAC 800AA2AC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9AAB0 800AA2B0 1800B08F */  lw         $s0, 0x18($sp)
/* 9AAB4 800AA2B4 00204234 */  ori        $v0, $v0, 0x2000
/* 9AAB8 800AA2B8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9AABC 800AA2BC 0800E003 */  jr         $ra
/* 9AAC0 800AA2C0 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateInitStartMove, . - StateInitStartMove
