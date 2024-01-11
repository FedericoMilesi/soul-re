.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7B50
/* B8350 800C7B50 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2D8)
/* B8354 800C7B54 C4F4428C */  lw         $v0, %lo(_spu_rev_param + 0x2D8)($v0)
/* B8358 800C7B58 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B835C 800C7B5C 1000B0AF */  sw         $s0, 0x10($sp)
/* B8360 800C7B60 21808000 */  addu       $s0, $a0, $zero
/* B8364 800C7B64 0D004010 */  beqz       $v0, .L800C7B9C
/* B8368 800C7B68 1400BFAF */   sw        $ra, 0x14($sp)
/* B836C 800C7B6C 0C00048E */  lw         $a0, 0xC($s0)
/* B8370 800C7B70 0D80023C */  lui        $v0, %hi(_padFuncSendAuto)
/* B8374 800C7B74 1CE9428C */  lw         $v0, %lo(_padFuncSendAuto)($v0)
/* B8378 800C7B78 00000000 */  nop
/* B837C 800C7B7C 09F84000 */  jalr       $v0
/* B8380 800C7B80 E0018424 */   addiu     $a0, $a0, 0x1E0
/* B8384 800C7B84 0C00048E */  lw         $a0, 0xC($s0)
/* B8388 800C7B88 0D80023C */  lui        $v0, %hi(_padFuncSendAuto)
/* B838C 800C7B8C 1CE9428C */  lw         $v0, %lo(_padFuncSendAuto)($v0)
/* B8390 800C7B90 00000000 */  nop
/* B8394 800C7B94 09F84000 */  jalr       $v0
/* B8398 800C7B98 D0028424 */   addiu     $a0, $a0, 0x2D0
.L800C7B9C:
/* B839C 800C7B9C 37000292 */  lbu        $v0, 0x37($s0)
/* B83A0 800C7BA0 00000000 */  nop
/* B83A4 800C7BA4 03004014 */  bnez       $v0, .L800C7BB4
/* B83A8 800C7BA8 21280000 */   addu      $a1, $zero, $zero
/* B83AC 800C7BAC 0D80053C */  lui        $a1, %hi(_padModeMtap)
/* B83B0 800C7BB0 50E9A58C */  lw         $a1, %lo(_padModeMtap)($a1)
.L800C7BB4:
/* B83B4 800C7BB4 3F0B030C */  jal        _padSioRW2
/* B83B8 800C7BB8 21200002 */   addu      $a0, $s0, $zero
/* B83BC 800C7BBC 0B004004 */  bltz       $v0, .L800C7BEC
/* B83C0 800C7BC0 00000000 */   nop
/* B83C4 800C7BC4 0F004230 */  andi       $v0, $v0, 0xF
/* B83C8 800C7BC8 40100200 */  sll        $v0, $v0, 1
/* B83CC 800C7BCC 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B83D0 800C7BD0 BCF422AC */  sw         $v0, %lo(_spu_rev_param + 0x2D0)($at)
/* B83D4 800C7BD4 05004014 */  bnez       $v0, .L800C7BEC
/* B83D8 800C7BD8 21100000 */   addu      $v0, $zero, $zero
/* B83DC 800C7BDC 20000224 */  addiu      $v0, $zero, 0x20
/* B83E0 800C7BE0 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D0)
/* B83E4 800C7BE4 BCF422AC */  sw         $v0, %lo(_spu_rev_param + 0x2D0)($at)
/* B83E8 800C7BE8 21100000 */  addu       $v0, $zero, $zero
.L800C7BEC:
/* B83EC 800C7BEC 1400BF8F */  lw         $ra, 0x14($sp)
/* B83F0 800C7BF0 1000B08F */  lw         $s0, 0x10($sp)
/* B83F4 800C7BF4 0800E003 */  jr         $ra
/* B83F8 800C7BF8 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C7B50, . - func_800C7B50
