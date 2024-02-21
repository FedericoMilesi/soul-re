.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetCollisionType
/* A4338 800B3B38 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A433C 800B3B3C 1400B1AF */  sw         $s1, 0x14($sp)
/* A4340 800B3B40 21888000 */  addu       $s1, $a0, $zero
/* A4344 800B3B44 1800BFAF */  sw         $ra, 0x18($sp)
/* A4348 800B3B48 1000B0AF */  sw         $s0, 0x10($sp)
/* A434C 800B3B4C C000308E */  lw         $s0, 0xC0($s1)
/* A4350 800B3B50 00000000 */  nop
/* A4354 800B3B54 0800028E */  lw         $v0, 0x8($s0)
/* A4358 800B3B58 00000000 */  nop
/* A435C 800B3B5C 04004390 */  lbu        $v1, 0x4($v0)
/* A4360 800B3B60 09000224 */  addiu      $v0, $zero, 0x9
/* A4364 800B3B64 1F006214 */  bne        $v1, $v0, .L800B3BE4
/* A4368 800B3B68 03000224 */   addiu     $v0, $zero, 0x3
/* A436C 800B3B6C 07000392 */  lbu        $v1, 0x7($s0)
/* A4370 800B3B70 00000000 */  nop
/* A4374 800B3B74 08006210 */  beq        $v1, $v0, .L800B3B98
/* A4378 800B3B78 21200002 */   addu      $a0, $s0, $zero
/* A437C 800B3B7C 1400038E */  lw         $v1, 0x14($s0)
/* A4380 800B3B80 00000000 */  nop
/* A4384 800B3B84 1400628C */  lw         $v0, 0x14($v1)
/* A4388 800B3B88 00000000 */  nop
/* A438C 800B3B8C 04004234 */  ori        $v0, $v0, 0x4
/* A4390 800B3B90 E8CE0208 */  j          .L800B3BA0
/* A4394 800B3B94 140062AC */   sw        $v0, 0x14($v1)
.L800B3B98:
/* A4398 800B3B98 8A93000C */  jal        COLLIDE_SetBSPTreeFlag
/* A439C 800B3B9C 00080524 */   addiu     $a1, $zero, 0x800
.L800B3BA0:
/* A43A0 800B3BA0 07000392 */  lbu        $v1, 0x7($s0)
/* A43A4 800B3BA4 01000224 */  addiu      $v0, $zero, 0x1
/* A43A8 800B3BA8 0E006210 */  beq        $v1, $v0, .L800B3BE4
/* A43AC 800B3BAC 00000000 */   nop
/* A43B0 800B3BB0 05000592 */  lbu        $a1, 0x5($s0)
/* A43B4 800B3BB4 0A93000C */  jal        COLLIDE_SegmentCollisionOff
/* A43B8 800B3BB8 21202002 */   addu      $a0, $s1, $zero
/* A43BC 800B3BBC F8F9848F */  lw         $a0, %gp_rel(Raziel + 0x3C8)($gp)
/* A43C0 800B3BC0 00000000 */  nop
/* A43C4 800B3BC4 04008010 */  beqz       $a0, .L800B3BD8
/* A43C8 800B3BC8 0001053C */   lui       $a1, (0x1000024 >> 16)
/* A43CC 800B3BCC 2400A534 */  ori        $a1, $a1, (0x1000024 & 0xFFFF)
/* A43D0 800B3BD0 A1D1000C */  jal        INSTANCE_Post
/* A43D4 800B3BD4 21300000 */   addu      $a2, $zero, $zero
.L800B3BD8:
/* A43D8 800B3BD8 F8F980AF */  sw         $zero, %gp_rel(Raziel + 0x3C8)($gp)
.L800B3BDC:
/* A43DC 800B3BDC 33CF0208 */  j          .L800B3CCC
/* A43E0 800B3BE0 01000224 */   addiu     $v0, $zero, 0x1
.L800B3BE4:
/* A43E4 800B3BE4 0400028E */  lw         $v0, 0x4($s0)
/* A43E8 800B3BE8 FFFF033C */  lui        $v1, (0xFFFF0000 >> 16)
/* A43EC 800B3BEC 24104300 */  and        $v0, $v0, $v1
/* A43F0 800B3BF0 0101033C */  lui        $v1, (0x1010000 >> 16)
/* A43F4 800B3BF4 23004314 */  bne        $v0, $v1, .L800B3C84
/* A43F8 800B3BF8 00000000 */   nop
/* A43FC 800B3BFC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* A4400 800B3C00 00000000 */  nop
/* A4404 800B3C04 00104230 */  andi       $v0, $v0, 0x1000
/* A4408 800B3C08 30004014 */  bnez       $v0, .L800B3CCC
/* A440C 800B3C0C 01000224 */   addiu     $v0, $zero, 0x1
/* A4410 800B3C10 0800028E */  lw         $v0, 0x8($s0)
/* A4414 800B3C14 00000000 */  nop
/* A4418 800B3C18 04004390 */  lbu        $v1, 0x4($v0)
/* A441C 800B3C1C 09000224 */  addiu      $v0, $zero, 0x9
/* A4420 800B3C20 18006214 */  bne        $v1, $v0, .L800B3C84
/* A4424 800B3C24 00000000 */   nop
/* A4428 800B3C28 0C00028E */  lw         $v0, 0xC($s0)
/* A442C 800B3C2C 00000000 */  nop
/* A4430 800B3C30 04004390 */  lbu        $v1, 0x4($v0)
/* A4434 800B3C34 08000224 */  addiu      $v0, $zero, 0x8
/* A4438 800B3C38 12006214 */  bne        $v1, $v0, .L800B3C84
/* A443C 800B3C3C 00000000 */   nop
/* A4440 800B3C40 F8F9838F */  lw         $v1, %gp_rel(Raziel + 0x3C8)($gp)
/* A4444 800B3C44 00000000 */  nop
/* A4448 800B3C48 06006014 */  bnez       $v1, .L800B3C64
/* A444C 800B3C4C 00000000 */   nop
/* A4450 800B3C50 1400028E */  lw         $v0, 0x14($s0)
/* A4454 800B3C54 00000000 */  nop
/* A4458 800B3C58 F8F982AF */  sw         $v0, %gp_rel(Raziel + 0x3C8)($gp)
/* A445C 800B3C5C 33CF0208 */  j          .L800B3CCC
/* A4460 800B3C60 01000224 */   addiu     $v0, $zero, 0x1
.L800B3C64:
/* A4464 800B3C64 1400028E */  lw         $v0, 0x14($s0)
/* A4468 800B3C68 00000000 */  nop
/* A446C 800B3C6C DBFF6210 */  beq        $v1, $v0, .L800B3BDC
/* A4470 800B3C70 0D80043C */   lui       $a0, %hi(D_800D1DB8)
/* A4474 800B3C74 06D1010C */  jal        printf
/* A4478 800B3C78 B81D8424 */   addiu     $a0, $a0, %lo(D_800D1DB8)
/* A447C 800B3C7C 33CF0208 */  j          .L800B3CCC
/* A4480 800B3C80 01000224 */   addiu     $v0, $zero, 0x1
.L800B3C84:
/* A4484 800B3C84 06000392 */  lbu        $v1, 0x6($s0)
/* A4488 800B3C88 05000224 */  addiu      $v0, $zero, 0x5
/* A448C 800B3C8C 09006210 */  beq        $v1, $v0, .L800B3CB4
/* A4490 800B3C90 00000000 */   nop
/* A4494 800B3C94 07000492 */  lbu        $a0, 0x7($s0)
/* A4498 800B3C98 00000000 */  nop
/* A449C 800B3C9C 05008210 */  beq        $a0, $v0, .L800B3CB4
/* A44A0 800B3CA0 02000224 */   addiu     $v0, $zero, 0x2
/* A44A4 800B3CA4 03006210 */  beq        $v1, $v0, .L800B3CB4
/* A44A8 800B3CA8 00000000 */   nop
/* A44AC 800B3CAC 07008214 */  bne        $a0, $v0, .L800B3CCC
/* A44B0 800B3CB0 21100000 */   addu      $v0, $zero, $zero
.L800B3CB4:
/* A44B4 800B3CB4 C8FD838F */  lw         $v1, %gp_rel(ControlFlag)($gp)
/* A44B8 800B3CB8 0008043C */  lui        $a0, (0x8000000 >> 16)
/* A44BC 800B3CBC 24186400 */  and        $v1, $v1, $a0
/* A44C0 800B3CC0 02006014 */  bnez       $v1, .L800B3CCC
/* A44C4 800B3CC4 01000224 */   addiu     $v0, $zero, 0x1
/* A44C8 800B3CC8 21100000 */  addu       $v0, $zero, $zero
.L800B3CCC:
/* A44CC 800B3CCC 1800BF8F */  lw         $ra, 0x18($sp)
/* A44D0 800B3CD0 1400B18F */  lw         $s1, 0x14($sp)
/* A44D4 800B3CD4 1000B08F */  lw         $s0, 0x10($sp)
/* A44D8 800B3CD8 0800E003 */  jr         $ra
/* A44DC 800B3CDC 2000BD27 */   addiu     $sp, $sp, 0x20
.size GetCollisionType, . - GetCollisionType
