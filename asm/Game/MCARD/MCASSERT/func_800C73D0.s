.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C73D0
/* B7BD0 800C73D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B7BD4 800C73D4 1000B0AF */  sw         $s0, 0x10($sp)
/* B7BD8 800C73D8 21808000 */  addu       $s0, $a0, $zero
/* B7BDC 800C73DC 00260400 */  sll        $a0, $a0, 24
/* B7BE0 800C73E0 03260400 */  sra        $a0, $a0, 24
/* B7BE4 800C73E4 09000224 */  addiu      $v0, $zero, 0x9
/* B7BE8 800C73E8 09008210 */  beq        $a0, $v0, .L800C7410
/* B7BEC 800C73EC 1400BFAF */   sw        $ra, 0x14($sp)
/* B7BF0 800C73F0 0A000224 */  addiu      $v0, $zero, 0xA
/* B7BF4 800C73F4 10008214 */  bne        $a0, $v0, .L800C7438
/* B7BF8 800C73F8 FF000232 */   andi      $v0, $s0, 0xFF
/* B7BFC 800C73FC F41C030C */  jal        func_800C73D0
/* B7C00 800C7400 0D000424 */   addiu     $a0, $zero, 0xD
/* B7C04 800C7404 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2B0)
/* B7C08 800C7408 1B1D0308 */  j          .L800C746C
/* B7C0C 800C740C 9CF420AC */   sw        $zero, %lo(_spu_rev_param + 0x2B0)($at)
.L800C7410:
/* B7C10 800C7410 F41C030C */  jal        func_800C73D0
/* B7C14 800C7414 20000424 */   addiu     $a0, $zero, 0x20
/* B7C18 800C7418 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2B0)
/* B7C1C 800C741C 9CF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2B0)($v0)
/* B7C20 800C7420 00000000 */  nop
/* B7C24 800C7424 07004230 */  andi       $v0, $v0, 0x7
/* B7C28 800C7428 24004010 */  beqz       $v0, .L800C74BC
/* B7C2C 800C742C 00000000 */   nop
/* B7C30 800C7430 041D0308 */  j          .L800C7410
/* B7C34 800C7434 00000000 */   nop
.L800C7438:
/* B7C38 800C7438 0D80013C */  lui        $at, %hi(_ctype_ + 0x1)
/* B7C3C 800C743C 21082200 */  addu       $at, $at, $v0
/* B7C40 800C7440 FDF42280 */  lb         $v0, %lo(_ctype_ + 0x1)($at)
/* B7C44 800C7444 00000000 */  nop
/* B7C48 800C7448 97004230 */  andi       $v0, $v0, 0x97
/* B7C4C 800C744C 07004010 */  beqz       $v0, .L800C746C
/* B7C50 800C7450 00000000 */   nop
/* B7C54 800C7454 0D80023C */  lui        $v0, %hi(_spu_rev_param + 0x2B0)
/* B7C58 800C7458 9CF4428C */  lw         $v0, %lo(_spu_rev_param + 0x2B0)($v0)
/* B7C5C 800C745C 00000000 */  nop
/* B7C60 800C7460 01004224 */  addiu      $v0, $v0, 0x1
/* B7C64 800C7464 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2B0)
/* B7C68 800C7468 9CF422AC */  sw         $v0, %lo(_spu_rev_param + 0x2B0)($at)
.L800C746C:
/* B7C6C 800C746C 0D80063C */  lui        $a2, %hi(_spu_rev_param + 0x2B4)
/* B7C70 800C7470 A0F4C68C */  lw         $a2, %lo(_spu_rev_param + 0x2B4)($a2)
/* B7C74 800C7474 00000000 */  nop
/* B7C78 800C7478 2000C228 */  slti       $v0, $a2, 0x20
/* B7C7C 800C747C 07004014 */  bnez       $v0, .L800C749C
/* B7C80 800C7480 00000000 */   nop
/* B7C84 800C7484 0E80053C */  lui        $a1, %hi(_spu_RQ + 0x24)
/* B7C88 800C7488 E0FDA524 */  addiu      $a1, $a1, %lo(_spu_RQ + 0x24)
/* B7C8C 800C748C 7E1D030C */  jal        func_800C75F8
/* B7C90 800C7490 01000424 */   addiu     $a0, $zero, 0x1
/* B7C94 800C7494 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2B4)
/* B7C98 800C7498 A0F420AC */  sw         $zero, %lo(_spu_rev_param + 0x2B4)($at)
.L800C749C:
/* B7C9C 800C749C 0D80033C */  lui        $v1, %hi(_spu_rev_param + 0x2B4)
/* B7CA0 800C74A0 A0F46324 */  addiu      $v1, $v1, %lo(_spu_rev_param + 0x2B4)
/* B7CA4 800C74A4 0000628C */  lw         $v0, 0x0($v1)
/* B7CA8 800C74A8 0E80013C */  lui        $at, %hi(_spu_RQ + 0x24)
/* B7CAC 800C74AC 21082200 */  addu       $at, $at, $v0
/* B7CB0 800C74B0 E0FD30A0 */  sb         $s0, %lo(_spu_RQ + 0x24)($at)
/* B7CB4 800C74B4 01004224 */  addiu      $v0, $v0, 0x1
/* B7CB8 800C74B8 000062AC */  sw         $v0, 0x0($v1)
.L800C74BC:
/* B7CBC 800C74BC 1400BF8F */  lw         $ra, 0x14($sp)
/* B7CC0 800C74C0 1000B08F */  lw         $s0, 0x10($sp)
/* B7CC4 800C74C4 0800E003 */  jr         $ra
/* B7CC8 800C74C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C73D0, . - func_800C73D0
