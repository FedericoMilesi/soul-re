.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7BFC
/* B83FC 800C7BFC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B8400 800C7C00 1000B0AF */  sw         $s0, 0x10($sp)
/* B8404 800C7C04 21808000 */  addu       $s0, $a0, $zero
/* B8408 800C7C08 0D80023C */  lui        $v0, %hi(_padModeMtap)
/* B840C 800C7C0C 50E9428C */  lw         $v0, %lo(_padModeMtap)($v0)
/* B8410 800C7C10 21200000 */  addu       $a0, $zero, $zero
/* B8414 800C7C14 0B004010 */  beqz       $v0, .L800C7C44
/* B8418 800C7C18 1400BFAF */   sw        $ra, 0x14($sp)
/* B841C 800C7C1C 3C00028E */  lw         $v0, 0x3C($s0)
/* B8420 800C7C20 00000000 */  nop
/* B8424 800C7C24 00004290 */  lbu        $v0, 0x0($v0)
/* B8428 800C7C28 08000324 */  addiu      $v1, $zero, 0x8
/* B842C 800C7C2C 02110200 */  srl        $v0, $v0, 4
/* B8430 800C7C30 04004314 */  bne        $v0, $v1, .L800C7C44
/* B8434 800C7C34 00000000 */   nop
/* B8438 800C7C38 37000292 */  lbu        $v0, 0x37($s0)
/* B843C 800C7C3C 00000000 */  nop
/* B8440 800C7C40 0100442C */  sltiu      $a0, $v0, 0x1
.L800C7C44:
/* B8444 800C7C44 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2DC)
/* B8448 800C7C48 06008014 */  bnez       $a0, .L800C7C64
/* B844C 800C7C4C C8F424AC */   sw        $a0, %lo(_spu_rev_param + 0x2DC)($at)
/* B8450 800C7C50 0D80023C */  lui        $v0, %hi(_padFuncCurrLimit)
/* B8454 800C7C54 10E9428C */  lw         $v0, %lo(_padFuncCurrLimit)($v0)
/* B8458 800C7C58 00000000 */  nop
/* B845C 800C7C5C 09F84000 */  jalr       $v0
/* B8460 800C7C60 21200002 */   addu      $a0, $s0, $zero
.L800C7C64:
/* B8464 800C7C64 0D80053C */  lui        $a1, %hi(_spu_rev_param + 0x2DC)
/* B8468 800C7C68 C8F4A58C */  lw         $a1, %lo(_spu_rev_param + 0x2DC)($a1)
/* B846C 800C7C6C 0D80023C */  lui        $v0, %hi(_padFuncGetTxd)
/* B8470 800C7C70 0CE9428C */  lw         $v0, %lo(_padFuncGetTxd)($v0)
/* B8474 800C7C74 00000000 */  nop
/* B8478 800C7C78 09F84000 */  jalr       $v0
/* B847C 800C7C7C 21200002 */   addu      $a0, $s0, $zero
/* B8480 800C7C80 21200002 */  addu       $a0, $s0, $zero
/* B8484 800C7C84 3F0B030C */  jal        _padSioRW2
/* B8488 800C7C88 FF004530 */   andi      $a1, $v0, 0xFF
/* B848C 800C7C8C 21184000 */  addu       $v1, $v0, $zero
/* B8490 800C7C90 5A000224 */  addiu      $v0, $zero, 0x5A
/* B8494 800C7C94 06006210 */  beq        $v1, $v0, .L800C7CB0
/* B8498 800C7C98 21106000 */   addu      $v0, $v1, $zero
/* B849C 800C7C9C 04006010 */  beqz       $v1, .L800C7CB0
/* B84A0 800C7CA0 00000000 */   nop
/* B84A4 800C7CA4 02006104 */  bgez       $v1, .L800C7CB0
/* B84A8 800C7CA8 FCFF0224 */   addiu     $v0, $zero, -0x4
/* B84AC 800C7CAC 21106000 */  addu       $v0, $v1, $zero
.L800C7CB0:
/* B84B0 800C7CB0 1400BF8F */  lw         $ra, 0x14($sp)
/* B84B4 800C7CB4 1000B08F */  lw         $s0, 0x10($sp)
/* B84B8 800C7CB8 0800E003 */  jr         $ra
/* B84BC 800C7CBC 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C7BFC, . - func_800C7BFC
