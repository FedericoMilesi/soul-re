.include "macro.inc"

.set noat
.set noreorder

.section .sdata

glabel depthQPTable
    .word 0

glabel depthQBlendStart
    .word 0

glabel depthQFogStart
    .word 0

glabel depthQFogFar
    .word 0

glabel depthQBackColor
    .word 0

glabel gameTimer
    .word 0

glabel modelFadeValue
    .word 0

glabel lowerSplitPush
    .word -100

glabel overlayAddress
    .word main_VRAM_END

glabel forceDrawInFront
    .short 0

glabel draw_belowSplit
    .word 1

glabel face_v0
    .word 0x1F800028

glabel face_v1
    .word 0x1F800030

glabel face_v2
    .word 0x1F800038

glabel face_v01
    .word 0x1F800040

glabel face_v12
    .word 0x1F800048

glabel face_v20
    .word 0x1F800050

glabel face_uv0
    .word 0x1F800058

glabel face_uv1
    .word 0x1F80005C

glabel face_uv2
    .word 0x1F800060

glabel face_uv01
    .word 0x1F800064

glabel face_uv12
    .word 0x1F800068

glabel face_uv20
    .word 0x1F80006C

.section .text, "ax"

glabel ClearBss
    lui        $v0, %hi(main_SBSS_START)
    addiu      $v0, $v0, %lo(main_SBSS_START)
    lui        $v1, %hi(main_BSS_END)
    addiu      $v1, $v1, %lo(main_BSS_END)
  .L800251BC:
    sw         $zero, 0x0($v0)
    addiu      $v0, $v0, 0x4
    sltu       $at, $v0, $v1
    bnez       $at, .L800251BC
    nop
    jr         $ra
    nop
.size ClearBss, . - ClearBss


glabel TimerTick
    addiu      $sp, $sp, -0x8
    sw         $v0, 0x0($sp)
    sw         $v1, 0x4($sp)
    lui        $v0, gameTimer_HI
    ori        $v0, $v0, gameTimer_LO
    lw         $v1, 0x0($v0)
    nop
    addi       $v1, $v1, 0x1
    sw         $v1, 0x0($v0)
    lw         $v0, 0x0($sp)
    lw         $v1, 0x4($sp)
    addiu      $sp, $sp, 0x8
    jr         $ra
    nop
.size TimerTick, . - TimerTick

glabel CheckVolatile
    addu       $v0, $a0, $zero
    jr         $ra
    nop
.size CheckVolatile, . - CheckVolatile

glabel DRAW_AnimatedModel_S
    lui        $v0, (0x1F800048 >> 16)
    sw         $fp, (0x1F800024 & 0xFFFF)($v0)
    sw         $s7, (0x1F800020 & 0xFFFF)($v0)
    sw         $s6, (0x1F80001C & 0xFFFF)($v0)
    sw         $s5, (0x1F800018 & 0xFFFF)($v0)
    sw         $s4, (0x1F800014 & 0xFFFF)($v0)
    sw         $s3, (0x1F800010 & 0xFFFF)($v0)
    sw         $s2, (0x1F80000C & 0xFFFF)($v0)
    sw         $s1, (0x1F800008 & 0xFFFF)($v0)
    sw         $s0, (0x1F800004 & 0xFFFF)($v0)
    lw         $s1, 0x10($sp)
    addu       $s3, $v0, $zero
    lui        $v0, %hi(depthQFogFar)
    lw         $v0, %lo(depthQFogFar)($v0)
    lui        $v1, %hi(depthQBlendStart)
    lw         $v1, %lo(depthQBlendStart)($v1)
    nop
    slt        $v0, $v0, $v1
    sw         $v0, (0x1F800040 & 0xFFFF)($s3)
    lui        $v1, %hi(SpecialFogClut)
    lh         $v1, %lo(SpecialFogClut)($v1)
    nop
    sh         $v1, (0x1F800044 & 0xFFFF)($s3)
    lui        $v0, %hi(depthQBackColor)
    lw         $v0, %lo(depthQBackColor)($v0)
    lui        $v1, gameTrackerX_HI
    ori        $v1, $v1, gameTrackerX_LO
    lui        $t8, gNormalList_HI
    lw         $t5, 0x4($v1)
    lw         $v1, 0x0($v1)
    ori        $t8, $t8, gNormalList_LO
    sw         $v1, (0x1F800000 & 0xFFFF)($s3)
    sw         $v0, (0x1F80002C & 0xFFFF)($s3)
    xori       $t5, $t5, 0x1
    sll        $t5, $t5, 4
    ori        $t5, $t5, 0x100
    sw         $t5, (0x1F80003C & 0xFFFF)($s3)
    lw         $s7, 0x4($a2)
    lw         $s6, 0x10($a0)
    lw         $s4, 0x4($a0)
    beqz       $s6, .L800258A8
    lui        $t3, (0xFFFFFF >> 16)
    lw         $v1, 0x14($a0)
    ori        $t3, $t3, (0xFFFFFF & 0xFFFF)
    addu       $s5, $zero, $v1
    sll        $v0, $s6, 1
    addu       $v0, $v0, $s6
    sll        $v0, $v0, 2
    addu       $v1, $v0, $v1
    sw         $v1, (0x1F800048 & 0xFFFF)($s3)
    mfc2       $a0, $8
    lui        $s0, %hi(modelFadeValue)
    lw         $s0, %lo(modelFadeValue)($s0)
    nop
    beqz       $s0, .L80025300
    lw         $t6, 0x4($s5)
    mtc2       $s0, $8
  .L80025300:
    lw         $t4, 0x0($s5)
    srl        $v1, $t6, 24
    andi       $v0, $t6, 0xFFFF
    andi       $v1, $v1, 0x10
    sll        $v0, $v0, 3
    bnez       $v1, .L80025890
    addu       $t1, $a1, $v0
    andi       $v0, $t4, 0xFFFF
    lw         $t7, 0x0($t1)
    srl        $v1, $t4, 13
    sll        $v0, $v0, 3
    addu       $t9, $a1, $v0
    addu       $s2, $a1, $v1
    lwc2       $12, 0x0($t9)
    mtc2       $t7, $14
    lui        $t7, (0xF00200 >> 16)
    ori        $t7, $t7, (0xF00200 & 0xFFFF)
    lwc2       $13, 0x0($s2)
    nop
    nop
    NCLIP
    lw         $v0, (0x1F800000 & 0xFFFF)($s3)
    mfc2       $t5, $24
    beqz       $v0, .L80025368
    lui        $v1, (0x80008000 >> 16)
    neg        $t5, $t5
  .L80025368:
    addi       $t5, $t5, 0x1
    bgez       $t5, .L80025890
    addi       $t5, $t5, 0x4
    ori        $v1, $v1, (0x80008000 & 0xFFFF)
    mfc2       $t2, $12
    mfc2       $s6, $13
    and        $v0, $t2, $v1
    mfc2       $t0, $14
    and        $v0, $s6, $v0
    and        $v0, $t0, $v0
    bnez       $v0, .L80025890
    subu       $t2, $t7, $t2
    and        $v0, $t2, $v1
    subu       $s6, $t7, $s6
    and        $v0, $s6, $v0
    subu       $t0, $t7, $t0
    and        $v0, $t0, $v0
    bnez       $v0, .L80025890
    srl        $v1, $t6, 24
    lwc2       $17, 0x4($t9)
    lwc2       $18, 0x4($s2)
    lwc2       $19, 0x4($t1)
    andi       $v0, $v1, 0x4
    beqz       $v0, .L800253E0
    nop
    AVSZ3
    lw         $t2, 0x8($s5)
    mfc2       $t0, $7
    j          .L80025414
    sll        $fp, $t0, 2
  .L800253E0:
    mfc2       $v1, $17
    mfc2       $fp, $18
    mfc2       $t0, $19
    slt        $v0, $v1, $fp
    bnez       $v0, .L800253FC
    nop
    addu       $fp, $v1, $zero
  .L800253FC:
    slt        $v0, $fp, $t0
    bnez       $v0, .L8002540C
    nop
    addu       $t0, $fp, $zero
  .L8002540C:
    lw         $t2, 0x8($s5)
    andi       $fp, $t0, 0xFFFC
  .L80025414:
    bgtz       $t2, .L80025430
    nop
    lw         $t7, 0x8($t2)
    nop
    sra        $v1, $t7, 24
    sll        $v1, $v1, 3
    addu       $fp, $fp, $v1
  .L80025430:
    slti       $v0, $fp, 0x3000
    slt        $v1, $zero, $fp
    and        $v0, $v0, $v1
    beqz       $v0, .L80025890
    lw         $v0, (0x1F800040 & 0xFFFF)($s3)
    srl        $v1, $t6, 24
    bnez       $s0, .L8002545C
    nop
    bnez       $v0, .L8002545C
    nop
    bnez       $a0, .L800258DC
  .L8002545C:
    andi       $s6, $v1, 0x2
    beqz       $s6, .L800256E4
  .L80025464:
    nop
    bgez       $t5, .L80025474
    andi       $s6, $v1, 0x1
    bnez       $s6, .L80025588
  .L80025474:
    srl        $v1, $t6, 13
    andi       $v1, $v1, 0x7F8
    addu       $v1, $t8, $v1
    lwc2       $0, 0x0($v1)
    lwc2       $1, 0x4($v1)
    lwc2       $6, 0xC($t2)
    beqz       $s0, .L800254B0
    nop
    mfc2       $v1, $6
    lui        $v0, (0x2000000 >> 16)
    lui        $at, (0xFEFFFFFF >> 16)
    ori        $at, $at, (0xFEFFFFFF & 0xFFFF)
    and        $v1, $v1, $at
    or         $v1, $v0, $v1
    mtc2       $v1, $6
  .L800254B0:
    nop
    nop
    NCDS
    lw         $v0, 0x0($t2)
    lw         $v1, 0x4($t2)
    sw         $v0, 0xC($s7)
    sw         $t7, 0x1C($s7)
    beqz       $s0, .L800254E8
    srl        $v0, $v1, 16
    andi       $v0, $v0, 0xFF9F
    ori        $v0, $v0, 0x20
    andi       $v1, $v1, 0xFFFF
    sll        $v0, $v0, 16
    or         $v1, $v0, $v1
  .L800254E8:
    sw         $v1, 0x14($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x7000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    beqz       $s0, .L80025560
    nop
    mfc2       $v0, $22
    lui        $v1, (0xEFFFFFFF >> 16)
    swc2       $12, 0x8($s7)
    ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
    swc2       $13, 0x10($s7)
    and        $v0, $v0, $v1
    swc2       $14, 0x18($s7)
    sw         $v0, 0x4($s7)
    lw         $v0, 0xC($t2)
    nop
    lui        $at, (0x2000000 >> 16)
    and        $v1, $v0, $at
    bnez       $v1, .L80025890
    addiu      $s7, $s7, 0x20
    lui        $at, (0x100000 >> 16)
    and        $v0, $t7, $at
    bnez       $v0, .L80025890
    nop
    j          .L80025CD0
    nop
  .L80025560:
    mfc2       $v0, $22
    lui        $v1, (0xEFFFFFFF >> 16)
    swc2       $12, 0x8($s7)
    ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
    swc2       $13, 0x10($s7)
    and        $v0, $v0, $v1
    swc2       $14, 0x18($s7)
    sw         $v0, 0x4($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x20
  .L80025588:
    andi       $v0, $t4, 0xFFFF
    srl        $s6, $t4, 16
    sll        $v0, $v0, 2
    addu       $t4, $v0, $s1
    lw         $t4, 0x0($t4)
    sll        $s6, $s6, 2
    addu       $s6, $s6, $s1
    lw         $s6, 0x0($s6)
    andi       $t5, $t6, 0xFFFF
    sll        $t5, $t5, 2
    addu       $t5, $t5, $s1
    lw         $t5, 0x0($t5)
    and        $a2, $t4, $s6
    and        $a2, $a2, $t5
    lui        $at, (0x80000000 >> 16)
    and        $t0, $a2, $at
    bnez       $t0, .L80025724
    lw         $t0, 0xC($t2)
    nop
    lui        $at, (0xFF000000 >> 16)
    and        $v0, $t0, $at
    beqz       $s0, .L800255F8
    nop
    lui        $at, (0xFEFFFFFF >> 16)
    ori        $at, $at, (0xFEFFFFFF & 0xFFFF)
    and        $v0, $v0, $at
    lui        $at, (0x2000000 >> 16)
    or         $v0, $v0, $at
  .L800255F8:
    and        $t4, $t4, $t3
    or         $t4, $v0, $t4
    sw         $t4, 0x4($s7)
    and        $s6, $s6, $t3
    or         $s6, $v0, $s6
    sw         $s6, 0x10($s7)
    and        $t5, $t5, $t3
    or         $t5, $v0, $t5
    sw         $t5, 0x1C($s7)
    lw         $v1, 0x0($t2)
    lw         $v0, 0x4($t2)
    sw         $t7, 0x24($s7)
    sw         $v1, 0xC($s7)
    beqz       $s0, .L80025688
    nop
    lui        $at, (0x2000000 >> 16)
    and        $v1, $t0, $at
    bnez       $v1, .L80025688
    nop
    lui        $at, (0x100000 >> 16)
    and        $t7, $t7, $at
    beqz       $t7, .L80025670
    nop
    srl        $v1, $v0, 16
    andi       $v1, $v1, 0xFF9F
    andi       $v0, $v0, 0xFFFF
    sll        $v1, $v1, 16
    or         $v0, $v0, $v1
    bgez       $zero, .L80025688
    nop
  .L80025670:
    srl        $v1, $v0, 16
    andi       $v1, $v1, 0xFF9F
    ori        $v1, $v1, 0x20
    andi       $v0, $v0, 0xFFFF
    sll        $v1, $v1, 16
    or         $v0, $v0, $v1
  .L80025688:
    sw         $v0, 0x18($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x9000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x14($s7)
    swc2       $14, 0x20($s7)
    lui        $at, (0x2000000 >> 16)
    and        $v1, $t0, $at
    or         $v0, $t7, $v1
    xor        $v0, $v0, $zero
    sltiu      $v0, $v0, 0x1
    xor        $v1, $s0, $zero
    sltu       $v1, $zero, $v1
    and        $v0, $v0, $v1
    beqz       $v0, .L80025890
    addiu      $s7, $s7, 0x28
    bgez       $zero, .L80025CD0
    nop
  .L800256E4:
    andi       $s6, $v1, 0x1
    beqz       $s6, .L8002583C
    andi       $v0, $t4, 0xFFFF
    srl        $s6, $t4, 16
    sll        $v0, $v0, 2
    addu       $t4, $v0, $s1
    lw         $t4, 0x0($t4)
    sll        $s6, $s6, 2
    addu       $s6, $s6, $s1
    lw         $s6, 0x0($s6)
    andi       $t5, $t6, 0xFFFF
    sll        $t5, $t5, 2
    addu       $t5, $t5, $s1
    lw         $t5, 0x0($t5)
    and        $a2, $t4, $s6
    and        $a2, $a2, $t5
  .L80025724:
    lui        $at, (0x1000000 >> 16)
    and        $a2, $a2, $at
    bnez       $a2, .L800257E4
    lw         $t4, 0x0($s5)
    lw         $t6, 0x4($s5)
    andi       $v0, $t4, 0xFFFF
    srl        $s6, $t4, 16
    sll        $v0, $v0, 3
    addu       $v0, $v0, $s4
    lh         $t4, 0x6($v0)
    sll        $s6, $s6, 3
    addu       $s6, $s6, $s4
    sll        $t4, $t4, 3
    addu       $t4, $t8, $t4
    lh         $s6, 0x6($s6)
    andi       $v0, $t6, 0xFFFF
    sll        $v0, $v0, 3
    addu       $v0, $v0, $s4
    lh         $v0, 0x6($v0)
    sll        $s6, $s6, 3
    addu       $t5, $t8, $s6
    lwc2       $0, 0x0($t4)
    sll        $v0, $v0, 3
    addu       $t6, $t8, $v0
    lwc2       $1, 0x4($t4)
    lwc2       $2, 0x0($t5)
    lwc2       $3, 0x4($t5)
    lwc2       $4, 0x0($t6)
    lwc2       $5, 0x4($t6)
    mtc2       $t2, $6
    nop
    nop
    NCDT
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x6000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x10($s7)
    swc2       $14, 0x18($s7)
    swc2       $20, 0x4($s7)
    swc2       $21, 0xC($s7)
    swc2       $22, 0x14($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x1C
  .L800257E4:
    lui        $v0, (0x30000000 >> 16)
    and        $t4, $t4, $t3
    or         $t4, $v0, $t4
    sw         $t4, 0x4($s7)
    and        $s6, $s6, $t3
    or         $s6, $v0, $s6
    sw         $s6, 0xC($s7)
    and        $t5, $t5, $t3
    or         $t5, $v0, $t5
    sw         $t5, 0x14($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x6000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x10($s7)
    swc2       $14, 0x18($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x1C
  .L8002583C:
    srl        $v1, $t6, 13
    andi       $v1, $v1, 0x7F8
    addu       $v1, $t8, $v1
    lwc2       $0, 0x0($v1)
    lwc2       $1, 0x4($v1)
    mtc2       $t2, $6
    nop
    nop
    NCDS
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x4000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0xC($s7)
    swc2       $14, 0x10($s7)
    swc2       $22, 0x4($s7)
    addiu      $s7, $s7, 0x14
  .L80025890:
    lw         $v0, (0x1F800048 & 0xFFFF)($s3)
    lw         $t6, 0x10($s5)
    addiu      $s5, $s5, 0xC
    sltu       $v0, $s5, $v0
    bnez       $v0, .L80025300
    nop
  .L800258A8:
    addu       $v0, $s7, $zero
    lui        $v1, (0x1F800004 >> 16)
    lw         $fp, (0x1F800024 & 0xFFFF)($v1)
    lw         $s7, (0x1F800020 & 0xFFFF)($v1)
    lw         $s6, (0x1F80001C & 0xFFFF)($v1)
    lw         $s5, (0x1F800018 & 0xFFFF)($v1)
    lw         $s4, (0x1F800014 & 0xFFFF)($v1)
    lw         $s3, (0x1F800010 & 0xFFFF)($v1)
    lw         $s2, (0x1F80000C & 0xFFFF)($v1)
    lw         $s1, (0x1F800008 & 0xFFFF)($v1)
    lw         $s0, (0x1F800004 & 0xFFFF)($v1)
    jr         $ra
    nop
  .L800258DC:
    beqz       $s6, .L80025B1C
    nop
    lw         $v0, 0xC($t2)
    lui        $s6, (0x2000000 >> 16)
    and        $s6, $s6, $v0
    bne        $zero, $s6, .L80025464
    nop
    bgez       $t5, .L80025904
    andi       $s6, $v1, 0x1
    bnez       $s6, .L80025990
  .L80025904:
    srl        $v1, $t6, 13
    andi       $v1, $v1, 0x7F8
    addu       $v1, $t8, $v1
    lwc2       $0, 0x0($v1)
    lwc2       $1, 0x4($v1)
    lw         $v0, 0xC($t2)
    lui        $v1, (0xEFFFFFFF >> 16)
    lui        $s6, (0x2000000 >> 16)
    ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
    or         $v0, $s6, $v0
    and        $v0, $v1, $v0
    mtc2       $v0, $6
    nop
    nop
    NCDS
    lw         $v0, 0x0($t2)
    lw         $v1, 0x4($t2)
    lui        $s6, (0x200000 >> 16)
    or         $v1, $s6, $v1
    sw         $v0, 0xC($s7)
    sw         $v1, 0x14($s7)
    sw         $t7, 0x1C($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x7000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x10($s7)
    swc2       $14, 0x18($s7)
    swc2       $22, 0x4($s7)
    j          .L80025A34
    addiu      $s7, $s7, 0x20
  .L80025990:
    andi       $v0, $t4, 0xFFFF
    srl        $s6, $t4, 16
    sll        $v0, $v0, 2
    addu       $t4, $v0, $s1
    lw         $t4, 0x0($t4)
    nop
    and        $t4, $t4, $t3
    lui        $v0, (0x34000000 >> 16)
    or         $t4, $v0, $t4
    sll        $s6, $s6, 2
    addu       $s6, $s6, $s1
    lw         $s6, 0x0($s6)
    andi       $t5, $t6, 0xFFFF
    sll        $t5, $t5, 2
    addu       $t5, $t5, $s1
    lw         $t5, 0x0($t5)
    lui        $v0, (0x2000000 >> 16)
    or         $t4, $v0, $t4
    or         $s6, $v0, $s6
    or         $t5, $v0, $t5
    sw         $t4, 0x4($s7)
    sw         $s6, 0x10($s7)
    sw         $t5, 0x1C($s7)
    lw         $v0, 0x0($t2)
    lw         $v1, 0x4($t2)
    lui        $s6, (0x200000 >> 16)
    or         $v1, $s6, $v1
    sw         $t7, 0x24($s7)
    sw         $v0, 0xC($s7)
    sw         $v1, 0x18($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x9000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x14($s7)
    swc2       $14, 0x20($s7)
    addiu      $s7, $s7, 0x28
  .L80025A34:
    lui        $at, (0x100000 >> 16)
    and        $v0, $t7, $at
    bnez       $v0, .L80025A9C
    lwc2       $6, (0x1F80002C & 0xFFFF)($s3)
    lw         $t9, (0x1F80002C & 0xFFFF)($s3)
    nop
    DPCS
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x6000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    mfc2       $v0, $22
    lui        $v1, (0x30000000 >> 16)
    or         $s6, $v1, $t9
    sub        $v0, $s6, $v0
    sw         $v0, 0x4($s7)
    sw         $v0, 0xC($s7)
    sw         $v0, 0x14($s7)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x10($s7)
    swc2       $14, 0x18($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x1C
  .L80025A9C:
    lwc2       $6, (0x1F80002C & 0xFFFF)($s3)
    lw         $t9, (0x1F80002C & 0xFFFF)($s3)
    nop
    DPCS
    lw         $v0, 0x0($t2)
    lw         $v1, 0x4($t2)
    lw         $s6, 0x8($t2)
    sw         $v0, 0xC($s7)
    sw         $v1, 0x18($s7)
    sw         $s6, 0x24($s7)
    lh         $v0, (0x1F800044 & 0xFFFF)($s3)
    nop
    sh         $v0, 0xE($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x9000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    mfc2       $v0, $22
    lui        $v1, (0x34000000 >> 16)
    or         $s6, $v1, $t9
    sub        $v0, $s6, $v0
    sw         $v0, 0x4($s7)
    sw         $v0, 0x10($s7)
    sw         $v0, 0x1C($s7)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x14($s7)
    swc2       $14, 0x20($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x28
  .L80025B1C:
    andi       $s6, $v1, 0x1
    beqz       $s6, .L80025C24
    cfc2       $t5, $21
    cfc2       $v0, $22
    cfc2       $t7, $23
    sw         $t5, (0x1F800030 & 0xFFFF)($s3)
    sw         $v0, (0x1F800034 & 0xFFFF)($s3)
    sw         $t7, (0x1F800038 & 0xFFFF)($s3)
    lb         $t5, (0x1F80002C & 0xFFFF)($s3)
    lb         $v0, (0x1F80002D & 0xFFFF)($s3)
    lb         $t7, (0x1F80002E & 0xFFFF)($s3)
    sll        $t5, $t5, 4
    sll        $v0, $v0, 4
    sll        $t7, $t7, 4
    ctc2       $t5, $21
    ctc2       $v0, $22
    ctc2       $t7, $23
    andi       $v0, $t4, 0xFFFF
    srl        $s6, $t4, 16
    sll        $v0, $v0, 3
    addu       $v0, $v0, $s4
    lh         $t4, 0x6($v0)
    sll        $s6, $s6, 3
    addu       $s6, $s6, $s4
    sll        $t4, $t4, 3
    addu       $t4, $t8, $t4
    lh         $s6, 0x6($s6)
    andi       $v0, $t6, 0xFFFF
    sll        $v0, $v0, 3
    addu       $v0, $v0, $s4
    lh         $v0, 0x6($v0)
    sll        $s6, $s6, 3
    addu       $t5, $t8, $s6
    lwc2       $0, 0x0($t4)
    sll        $v0, $v0, 3
    addu       $t6, $t8, $v0
    lwc2       $1, 0x4($t4)
    lwc2       $2, 0x0($t5)
    lwc2       $3, 0x4($t5)
    lwc2       $4, 0x0($t6)
    lwc2       $5, 0x4($t6)
    mtc2       $t2, $6
    nop
    nop
    NCDT
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x6000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0x10($s7)
    swc2       $14, 0x18($s7)
    swc2       $20, 0x4($s7)
    swc2       $21, 0xC($s7)
    swc2       $22, 0x14($s7)
    lw         $t5, (0x1F800030 & 0xFFFF)($s3)
    lw         $t6, (0x1F800034 & 0xFFFF)($s3)
    lw         $t7, (0x1F800038 & 0xFFFF)($s3)
    ctc2       $t5, $21
    ctc2       $t6, $22
    ctc2       $t7, $23
    j          .L80025890
    addiu      $s7, $s7, 0x1C
  .L80025C24:
    srl        $v1, $t6, 13
    cfc2       $t5, $21
    cfc2       $t6, $22
    cfc2       $t7, $23
    sw         $t5, (0x1F800030 & 0xFFFF)($s3)
    sw         $t6, (0x1F800034 & 0xFFFF)($s3)
    sw         $t7, (0x1F800038 & 0xFFFF)($s3)
    lb         $t5, (0x1F80002C & 0xFFFF)($s3)
    lb         $t6, (0x1F80002D & 0xFFFF)($s3)
    lb         $t7, (0x1F80002E & 0xFFFF)($s3)
    sll        $t5, $t5, 4
    sll        $t6, $t6, 4
    sll        $t7, $t7, 4
    ctc2       $t5, $21
    ctc2       $t6, $22
    ctc2       $t7, $23
    andi       $v1, $v1, 0x7F8
    addu       $v1, $t8, $v1
    lwc2       $0, 0x0($v1)
    lwc2       $1, 0x4($v1)
    mtc2       $t2, $6
    nop
    nop
    NCDS
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x4000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    swc2       $12, 0x8($s7)
    swc2       $13, 0xC($s7)
    swc2       $14, 0x10($s7)
    swc2       $22, 0x4($s7)
    lw         $t5, (0x1F800030 & 0xFFFF)($s3)
    lw         $t6, (0x1F800034 & 0xFFFF)($s3)
    lw         $t7, (0x1F800038 & 0xFFFF)($s3)
    ctc2       $t5, $21
    ctc2       $t6, $22
    ctc2       $t7, $23
    j          .L80025890
    addiu      $s7, $s7, 0x14
  .L80025CD0:
    lui        $v0, (0x808080 >> 16)
    ori        $v0, $v0, (0x808080 & 0xFFFF)
    mfc2       $t4, $12
    mfc2       $t5, $13
    mfc2       $t6, $14
    mtc2       $v0, $6
    sw         $t4, 0x8($s7)
    sw         $t5, 0x10($s7)
    sw         $t6, 0x18($s7)
    DPCS
    srl        $v0, $t4, 16
    sb         $v0, 0xD($s7)
    srl        $v0, $t5, 16
    sb         $v0, 0x15($s7)
    srl        $v0, $t6, 16
    sb         $v0, 0x1D($s7)
    andi       $t4, $t4, 0xFFFF
    andi       $t5, $t5, 0xFFFF
    andi       $t6, $t6, 0xFFFF
    slt        $at, $t5, $t4
    bnez       $at, .L80025D3C
    nop
    slt        $at, $t6, $t4
    bnez       $at, .L80025D50
    nop
    bgez       $zero, .L80025D54
    andi       $v0, $t4, 0xFFC0
  .L80025D3C:
    slt        $at, $t6, $t5
    bnez       $at, .L80025D50
    nop
    bgez       $zero, .L80025D54
    andi       $v0, $t5, 0xFFC0
  .L80025D50:
    andi       $v0, $t6, 0xFFC0
  .L80025D54:
    subu       $t4, $t4, $v0
    subu       $t5, $t5, $v0
    subu       $t6, $t6, $v0
    sb         $t4, 0xC($s7)
    sb         $t5, 0x14($s7)
    sb         $t6, 0x1C($s7)
    lui        $v1, (0x1F80003C >> 16)
    lw         $v1, (0x1F80003C & 0xFFFF)($v1)
    srl        $v0, $v0, 6
    or         $v0, $v0, $v1
    sh         $v0, 0x16($s7)
    addu       $s6, $fp, $a3
    lw         $v1, 0x0($s6)
    lui        $v0, (0x7000000 >> 16)
    or         $v1, $v1, $v0
    sw         $v1, 0x0($s7)
    and        $v0, $s7, $t3
    sw         $v0, 0x0($s6)
    mfc2       $v0, $22
    lui        $v1, (0x24808080 >> 16)
    ori        $v1, $v1, (0x24808080 & 0xFFFF)
    subu       $v0, $v1, $v0
    sw         $v0, 0x4($s7)
    j          .L80025890
    addiu      $s7, $s7, 0x20
  .L80025DB8:
    sw         $t0, 0xDC($t4)
    sw         $t1, 0xE0($t4)
    sw         $t2, 0xE4($t4)
    sw         $t3, 0xE8($t4)
    sw         $t6, 0xEC($t4)
    sw         $a1, 0xF0($t4)
    sw         $a2, 0xF4($t4)
    sw         $ra, 0xF8($t4)
    addu       $a0, $t0, $zero
    addu       $a1, $s4, $zero
    and        $a2, $a2, $zero
    jal        DRAW_Zclip_subdiv
    nop
    lui        $t4, (0x1F8000F8 >> 16)
    lw         $t0, (0x1F8000DC & 0xFFFF)($t4)
    lw         $t1, (0x1F8000E0 & 0xFFFF)($t4)
    lw         $t2, (0x1F8000E4 & 0xFFFF)($t4)
    lw         $t3, (0x1F8000E8 & 0xFFFF)($t4)
    lw         $t6, (0x1F8000EC & 0xFFFF)($t4)
    lw         $a1, (0x1F8000F0 & 0xFFFF)($t4)
    lw         $a2, (0x1F8000F4 & 0xFFFF)($t4)
    lw         $ra, (0x1F8000F8 & 0xFFFF)($t4)
    beqz       $v0, .L80025E24
    nop
    addu       $t0, $v0, $zero
    jr         $ra
    and        $v0, $v0, $zero
  .L80025E24:
    jr         $ra
    xori       $v0, $zero, 0x1
.size DRAW_AnimatedModel_S, . - DRAW_AnimatedModel_S

glabel DRAW_DisplayTFace_S
    cfc2       $t8, $31
    nop
    NCLIP
    lui        $v1, (0x80008000 >> 16)
    lui        $t7, (0xF00200 >> 16)
    ori        $v1, $v1, (0x80008000 & 0xFFFF)
    ori        $t7, $t7, (0xF00200 & 0xFFFF)
    mfc2       $a0, $12
    mfc2       $t5, $13
    and        $v0, $a0, $v1
    mfc2       $t9, $14
    and        $v0, $t5, $v0
    and        $v0, $t9, $v0
    bnez       $v0, .L80025FF8
    subu       $a0, $t7, $a0
    and        $v0, $a0, $v1
    subu       $t5, $t7, $t5
    and        $v0, $t5, $v0
    subu       $t9, $t7, $t9
    and        $v0, $t9, $v0
    bnez       $v0, .L80025FF8
    nop
    and        $v0, $t8, $s2
    bnez       $v0, .L80025DB8
    nop
    mfc2       $v0, $24
    nop
    bgez       $v0, .L80026000
    nop
    mfc2       $a0, $17
    mfc2       $v1, $18
    mfc2       $t5, $19
    slt        $v0, $v1, $a0
    bnez       $v0, .L80025EBC
    nop
    addu       $a0, $v1, $zero
  .L80025EBC:
    slt        $v0, $a0, $t5
    bnez       $v0, .L80025ECC
    nop
    addu       $t5, $a0, $zero
  .L80025ECC:
    lb         $v0, 0xC8($t4)
    andi       $a2, $t5, 0xFFFC
    sll        $v0, $v0, 4
    addu       $a2, $a2, $v0
    slti       $v0, $a2, 0x3000
    beqz       $v0, .L80025FF8
    slti       $v0, $a2, 0xA0
    bnez       $v0, .L80025FF8
    nop
    mfc2       $t5, $12
    mfc2       $t7, $13
    mfc2       $t9, $14
    DPCT
    addu       $a0, $a2, $s4
    sra        $v0, $t5, 16
    sra        $v1, $t7, 16
    sra        $a3, $t9, 16
    sub        $t8, $v0, $v1
    sub        $t6, $a3, $v1
    sub        $v1, $v0, $a3
    addiu      $at, $zero, -0x1FF
    slt        $at, $t8, $at
    bnez       $at, .L80025DB8
    sll        $t5, $t5, 16
    slti       $at, $t8, 0x200
    beqz       $at, .L80025DB8
    sll        $t7, $t7, 16
    addiu      $at, $zero, -0x1FF
    slt        $at, $v1, $at
    bnez       $at, .L80025DB8
    sll        $t9, $t9, 16
    slti       $at, $v1, 0x200
    beqz       $at, .L80025DB8
    sra        $t5, $t5, 16
    addiu      $at, $zero, -0x1FF
    slt        $at, $t6, $at
    bnez       $at, .L80025DB8
    sra        $t7, $t7, 16
    slti       $at, $t6, 0x200
    beqz       $at, .L80025DB8
    sra        $t9, $t9, 16
    sub        $t8, $t5, $t7
    addiu      $at, $zero, -0x3FF
    slt        $at, $t8, $at
    bnez       $at, .L80025DB8
    sub        $v1, $t5, $t9
    slti       $at, $t8, 0x400
    beqz       $at, .L80025DB8
    sub        $t6, $t9, $t7
    addiu      $at, $zero, -0x3FF
    slt        $at, $v1, $at
    bnez       $at, .L80025DB8
    nop
    slti       $at, $v1, 0x400
    beqz       $at, .L80025DB8
    nop
    addiu      $at, $zero, -0x3FF
    slt        $at, $t6, $at
    bnez       $at, .L80025DB8
    nop
    slti       $at, $t6, 0x400
    beqz       $at, .L80025DB8
    nop
    lw         $v0, 0x0($a0)
    and        $v1, $t0, $a1
    sw         $v1, 0x0($a0)
    or         $v0, $v0, $s3
    sw         $v0, 0x0($t0)
    swc2       $12, 0x8($t0)
    swc2       $13, 0x14($t0)
    swc2       $14, 0x20($t0)
    swc2       $20, 0x4($t0)
    swc2       $21, 0x10($t0)
    swc2       $22, 0x1C($t0)
    addiu      $t0, $t0, 0x28
  .L80025FF8:
    jr         $ra
    and        $v0, $v0, $zero
  .L80026000:
    jr         $ra
    xori       $v0, $zero, 0x1
  .L80026008:
    andi       $v0, $t6, 0x8
    beqz       $v0, .L800260EC
    mfc2       $t9, $21
    mfc2       $t6, $22
    mfc2       $v1, $23
    mtc2       $zero, $21
    mtc2       $zero, $22
    mtc2       $zero, $23
    addiu      $t5, $zero, 0x1000
    mfc2       $v0, $17
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L80026068
    nop
    bgtz       $v0, .L80026050
    nop
    addu       $v0, $zero, $zero
  .L80026050:
    lwc2       $6, 0x7C($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, 0x7C($t4)
  .L80026068:
    mfc2       $v0, $18
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L800260A4
    nop
    bgtz       $v0, .L8002608C
    nop
    addu       $v0, $zero, $zero
  .L8002608C:
    lwc2       $6, 0x80($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, 0x80($t4)
  .L800260A4:
    mfc2       $v0, $19
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L800260E0
    nop
    bgtz       $v0, .L800260C8
    nop
    addu       $v0, $zero, $zero
  .L800260C8:
    lwc2       $6, 0x84($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, 0x84($t4)
  .L800260E0:
    mtc2       $t9, $21
    mtc2       $t6, $22
    mtc2       $v1, $23
  .L800260EC:
    lw         $t5, 0x0($a3)
    lh         $t9, 0x4($a3)
    lw         $t6, 0x0($a0)
    lh         $t3, 0x4($a0)
    lw         $v1, 0x0($a2)
    lh         $t7, 0x4($a2)
    sll        $v0, $t5, 16
    sra        $v0, $v0, 16
    sra        $t8, $t5, 16
    sll        $t1, $t6, 16
    sra        $t1, $t1, 16
    sra        $t2, $t6, 16
    sw         $t6, 0x30($t4)
    sw         $t3, 0x34($t4)
    sw         $t5, 0x28($t4)
    sw         $t9, 0x2C($t4)
    sll        $t5, $v1, 16
    sra        $t5, $t5, 16
    sra        $t6, $v1, 16
    sw         $v1, 0x38($t4)
    sw         $t7, 0x3C($t4)
    addu       $v1, $v0, $t1
    sra        $v1, $v1, 1
    sh         $v1, 0x40($t4)
    addu       $v1, $t8, $t2
    sra        $v1, $v1, 1
    sh         $v1, 0x42($t4)
    addu       $v1, $t9, $t3
    sra        $v1, $v1, 1
    sh         $v1, 0x44($t4)
    addu       $v1, $t1, $t5
    sra        $v1, $v1, 1
    sh         $v1, 0x48($t4)
    addu       $v1, $t2, $t6
    sra        $v1, $v1, 1
    sh         $v1, 0x4A($t4)
    addu       $v1, $t3, $t7
    sra        $v1, $v1, 1
    sh         $v1, 0x4C($t4)
    addu       $v1, $t5, $v0
    sra        $v1, $v1, 1
    sh         $v1, 0x50($t4)
    addu       $v1, $t6, $t8
    sra        $v1, $v1, 1
    sh         $v1, 0x52($t4)
    addu       $v1, $t7, $t9
    sra        $v1, $v1, 1
    sh         $v1, 0x54($t4)
    lw         $t8, 0x0($s0)
    lw         $t9, 0x4($s0)
    lw         $v0, 0x8($s0)
    andi       $t1, $t8, 0xFF
    srl        $t2, $t8, 8
    andi       $t2, $t2, 0xFF
    andi       $t3, $t9, 0xFF
    srl        $t5, $t9, 8
    andi       $t5, $t5, 0xFF
    andi       $t6, $v0, 0xFF
    srl        $t7, $v0, 8
    andi       $t7, $t7, 0xFF
    sw         $t8, 0x58($t4)
    sw         $t9, 0x5C($t4)
    sw         $v0, 0x60($t4)
    addu       $v1, $t1, $t3
    srl        $v1, $v1, 1
    sb         $v1, 0x64($t4)
    addu       $v1, $t2, $t5
    srl        $v1, $v1, 1
    sb         $v1, 0x65($t4)
    addu       $v1, $t3, $t6
    srl        $v1, $v1, 1
    sb         $v1, 0x68($t4)
    addu       $v1, $t5, $t7
    srl        $v1, $v1, 1
    sb         $v1, 0x69($t4)
    addu       $v1, $t6, $t1
    srl        $v1, $v1, 1
    sb         $v1, 0x6C($t4)
    addu       $v1, $t7, $t2
    srl        $v1, $v1, 1
    sb         $v1, 0x6D($t4)
    lw         $v0, 0x7C($t4)
    lw         $t3, 0x80($t4)
    lw         $t7, 0x84($t4)
    andi       $v1, $v0, 0xFF
    srl        $t1, $v0, 8
    andi       $t1, $t1, 0xFF
    srl        $t2, $v0, 16
    andi       $t2, $t2, 0xFF
    sw         $v0, 0x7C($t4)
    addu       $v0, $t3, $zero
    andi       $t3, $v0, 0xFF
    srl        $t5, $v0, 8
    andi       $t5, $t5, 0xFF
    srl        $t6, $v0, 16
    andi       $t6, $t6, 0xFF
    sw         $v0, 0x80($t4)
    addu       $v0, $t7, $zero
    andi       $t7, $v0, 0xFF
    srl        $t8, $v0, 8
    andi       $t8, $t8, 0xFF
    srl        $t9, $v0, 16
    andi       $t9, $t9, 0xFF
    sw         $v0, 0x84($t4)
    srl        $v0, $v0, 24
    sb         $v0, 0x73($t4)
    sb         $v0, 0x77($t4)
    sb         $v0, 0x7B($t4)
    addu       $v0, $v1, $t3
    sra        $v0, $v0, 1
    sb         $v0, 0x70($t4)
    addu       $v0, $t1, $t5
    sra        $v0, $v0, 1
    sb         $v0, 0x71($t4)
    addu       $v0, $t2, $t6
    sra        $v0, $v0, 1
    sb         $v0, 0x72($t4)
    addu       $v0, $t3, $t7
    sra        $v0, $v0, 1
    sb         $v0, 0x74($t4)
    addu       $v0, $t5, $t8
    sra        $v0, $v0, 1
    sb         $v0, 0x75($t4)
    addu       $v0, $t6, $t9
    sra        $v0, $v0, 1
    sb         $v0, 0x76($t4)
    addu       $v0, $v1, $t7
    sra        $v0, $v0, 1
    sb         $v0, 0x78($t4)
    addu       $v0, $t1, $t8
    sra        $v0, $v0, 1
    sb         $v0, 0x79($t4)
    addu       $v0, $t2, $t9
    sra        $v0, $v0, 1
    sb         $v0, 0x7A($t4)
    lh         $v1, 0x5E($t4)
    lh         $v0, 0x5A($t4)
    lb         $s2, 0x7($s1)
    sh         $v1, 0x66($t4)
    sh         $v1, 0x6A($t4)
    sh         $v0, 0x6E($t4)
    sb         $s2, 0xC8($t4)
    lui        $s2, (0x66000 >> 16)
    ori        $s2, $s2, (0x66000 & 0xFFFF)
    lwc2       $0, 0x28($t4)
    lwc2       $1, 0x2C($t4)
    lwc2       $2, 0x40($t4)
    lwc2       $3, 0x44($t4)
    lwc2       $4, 0x50($t4)
    lwc2       $5, 0x54($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x58($t4)
    lw         $t8, 0x64($t4)
    lw         $t9, 0x6C($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x7C($t4)
    lwc2       $21, 0x70($t4)
    lwc2       $22, 0x78($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    bgtz       $v0, .L800265E4
    nop
    lwc2       $0, 0x50($t4)
    lwc2       $1, 0x54($t4)
    lwc2       $2, 0x48($t4)
    lwc2       $3, 0x4C($t4)
    lwc2       $4, 0x38($t4)
    lwc2       $5, 0x3C($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x6C($t4)
    lw         $t8, 0x68($t4)
    lw         $t9, 0x60($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x78($t4)
    lwc2       $21, 0x74($t4)
    lwc2       $22, 0x84($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    bgtz       $v0, .L800265E4
    lh         $v0, 0x5A($t4)
    lh         $v1, 0x5E($t4)
    sh         $v0, 0x66($t4)
    sh         $v1, 0x6E($t4)
    lwc2       $0, 0x40($t4)
    lwc2       $1, 0x44($t4)
    lwc2       $2, 0x48($t4)
    lwc2       $3, 0x4C($t4)
    lwc2       $4, 0x50($t4)
    lwc2       $5, 0x54($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x64($t4)
    lw         $t8, 0x68($t4)
    lw         $t9, 0x6C($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x70($t4)
    lwc2       $21, 0x74($t4)
    lwc2       $22, 0x78($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    bgtz       $v0, .L800265E4
    nop
    lwc2       $0, 0x40($t4)
    lwc2       $1, 0x44($t4)
    lwc2       $2, 0x30($t4)
    lwc2       $3, 0x34($t4)
    lwc2       $4, 0x48($t4)
    lwc2       $5, 0x4C($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x64($t4)
    lw         $t8, 0x5C($t4)
    lw         $t9, 0x68($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x70($t4)
    lwc2       $21, 0x80($t4)
    lwc2       $22, 0x74($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    bgtz       $v0, .L800265E4
    lui        $s2, (0x80000000 >> 16)
    lb         $v0, 0xC8($t4)
    nop
    addiu      $v0, $v0, 0x1
    sb         $v0, 0xC8($t4)
    lui        $s2, (0x66000 >> 16)
    ori        $s2, $s2, (0x66000 & 0xFFFF)
    lwc2       $0, 0x28($t4)
    lwc2       $1, 0x2C($t4)
    lwc2       $2, 0x30($t4)
    lwc2       $3, 0x34($t4)
    lwc2       $4, 0x40($t4)
    lwc2       $5, 0x44($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x58($t4)
    lw         $t8, 0x5C($t4)
    lw         $t9, 0x64($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x7C($t4)
    lwc2       $21, 0x80($t4)
    lwc2       $22, 0x70($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    lh         $v0, 0x5A($t4)
    nop
    sh         $v0, 0x6A($t4)
    lwc2       $0, 0x48($t4)
    lwc2       $1, 0x4C($t4)
    lwc2       $2, 0x30($t4)
    lwc2       $3, 0x34($t4)
    lwc2       $4, 0x38($t4)
    lwc2       $5, 0x3C($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x68($t4)
    lw         $t8, 0x5C($t4)
    lw         $t9, 0x60($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x74($t4)
    lwc2       $21, 0x80($t4)
    lwc2       $22, 0x84($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
    lwc2       $0, 0x28($t4)
    lwc2       $1, 0x2C($t4)
    lwc2       $2, 0x50($t4)
    lwc2       $3, 0x54($t4)
    lwc2       $4, 0x38($t4)
    lwc2       $5, 0x3C($t4)
    nop
    nop
    RTPT
    lw         $t7, 0x58($t4)
    lw         $t8, 0x6C($t4)
    lw         $t9, 0x60($t4)
    sw         $t7, 0xC($t0)
    sw         $t8, 0x18($t0)
    sw         $t9, 0x24($t0)
    lw         $t7, 0x7C($t4)
    lwc2       $21, 0x78($t4)
    lwc2       $22, 0x84($t4)
    mtc2       $t7, $20
    mtc2       $t7, $6
    jal        DRAW_DisplayTFace_S
    nop
  .L800265E4:
    addiu      $s1, $s1, 0xC
    sltu       $v0, $s1, $s6
    bnez       $v0, .L80026660
    nop
    bgez       $zero, .L80026E00
    nop
.size DRAW_DisplayTFace_S, . - DRAW_DisplayTFace_S

glabel DRAW_DisplaySubdivPolytope_S
    lui        $t4, (0x1F8000C4 >> 16)
    sw         $ra, (0x1F8000A8 & 0xFFFF)($t4)
    sw         $fp, (0x1F800014 & 0xFFFF)($t4)
    sw         $s7, (0x1F8000A4 & 0xFFFF)($t4)
    sw         $s6, (0x1F8000A0 & 0xFFFF)($t4)
    sw         $s5, (0x1F80009C & 0xFFFF)($t4)
    sw         $s4, (0x1F800098 & 0xFFFF)($t4)
    sw         $s3, (0x1F800094 & 0xFFFF)($t4)
    sw         $s2, (0x1F800090 & 0xFFFF)($t4)
    sw         $s1, (0x1F80008C & 0xFFFF)($t4)
    sw         $s0, (0x1F800088 & 0xFFFF)($t4)
    sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
    lw         $v0, 0x0($a0)
    lw         $s5, 0x1C($a1)
    lh         $v1, 0xC($v0)
    lw         $s1, 0x8($v0)
    beqz       $v1, .L80026E00
    sll        $v0, $v1, 2
    sll        $s6, $v1, 3
    addu       $s6, $v0, $s6
    addu       $s6, $s6, $s1
    lw         $fp, 0x34($a1)
    lui        $s3, (0x9000000 >> 16)
    lui        $a1, (0xFFFFFF >> 16)
    ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
  .L80026660:
    lw         $v0, 0x4($s1)
    lw         $t8, 0x0($s1)
    sra        $t6, $v0, 16
    andi       $a3, $t6, 0x4
    bnez       $a3, .L80026DCC
    andi       $a2, $v0, 0xFFFF
    andi       $a3, $t8, 0xFFFF
    sll        $t7, $a3, 2
    sll        $a3, $a3, 3
    addu       $a3, $a3, $t7
    addu       $a3, $s5, $a3
    lwc2       $0, 0x0($a3)
    lwc2       $1, 0x4($a3)
    srl        $a0, $t8, 16
    nop
    RTPS
    sll        $t7, $a0, 2
    sll        $a0, $a0, 3
    addu       $a0, $a0, $t7
    addu       $a0, $s5, $a0
    lw         $t7, 0x0($a0)
    lw         $t8, 0x4($a0)
    swc2       $8, (0x1F8000BC & 0xFFFF)($t4)
    mtc2       $t7, $0
    mtc2       $t8, $1
    sll        $t7, $a2, 2
    cfc2       $s2, $31
    RTPS
    sll        $a2, $a2, 3
    addu       $a2, $a2, $t7
    addu       $a2, $s5, $a2
    lw         $t7, 0x0($a2)
    lw         $t8, 0x4($a2)
    swc2       $8, (0x1F8000C0 & 0xFFFF)($t4)
    mtc2       $t7, $0
    mtc2       $t8, $1
    cfc2       $v0, $31
    nop
    RTPS
    or         $s2, $s2, $v0
    lh         $s0, 0xA($s1)
    nop
    add        $s0, $s0, $fp
    lw         $t7, 0x0($s0)
    lw         $s7, 0x4($s0)
    lw         $v1, 0x8($s0)
    cfc2       $v0, $31
    swc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
    or         $s2, $s2, $v0
    NCLIP
    sw         $t7, 0xC($t0)
    sw         $s7, 0x18($t0)
    sw         $v1, 0x24($t0)
    sw         $v1, (0x1F8000D8 & 0xFFFF)($t4)
    mfc2       $v0, $24
    nop
    bltz       $v0, .L80026790
    nop
    lui        $at, (0x26000 >> 16)
    ori        $at, $at, (0x26000 & 0xFFFF)
    and        $t7, $s2, $at
    beqz       $t7, .L80026DCC
    addiu      $s2, $zero, 0x6000
    mfc2       $t5, $17
    mfc2       $t8, $18
    mfc2       $t9, $19
    slti       $at, $t5, 0x801
    beqz       $at, .L80026DCC
    slti       $v0, $t5, 0xA0
    beqz       $v0, .L80026790
    slti       $v0, $t8, 0xA0
    beqz       $v0, .L80026790
    slti       $v0, $t9, 0xA0
    beqz       $v0, .L80026790
    nop
    bgez       $zero, .L80026DCC
  .L80026790:
    lui        $t9, (0x80008000 >> 16)
    mfc2       $t1, $12
    ori        $t9, $t9, (0x80008000 & 0xFFFF)
    mfc2       $t2, $13
    mfc2       $t3, $14
    and        $v0, $t1, $t9
    and        $v0, $t2, $v0
    and        $v0, $t3, $v0
    bnez       $v0, .L80026DCC
    lui        $t7, (0xF00200 >> 16)
    ori        $t7, $t7, (0xF00200 & 0xFFFF)
    subu       $t8, $t7, $t1
    and        $v0, $t8, $t9
    subu       $t5, $t7, $t2
    and        $v0, $t5, $v0
    subu       $t9, $t7, $t3
    and        $v0, $t9, $v0
    bnez       $v0, .L80026DCC
    lw         $t5, 0x8($a2)
    lw         $t9, 0x8($a0)
    lw         $t8, 0x8($a3)
    sw         $t5, (0x1F800084 & 0xFFFF)($t4)
    sw         $t9, (0x1F800080 & 0xFFFF)($t4)
    sw         $t8, (0x1F80007C & 0xFFFF)($t4)
    lw         $t7, (0x1F800018 & 0xFFFF)($t4)
    nop
    beqz       $t7, .L80026A64
    lw         $t7, 0x0($a3)
    lw         $v0, (0x1F80001C & 0xFFFF)($t4)
    swc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
    sll        $t5, $t7, 16
    sra        $t5, $t5, 16
    sub        $t5, $t5, $v0
    lw         $t9, (0x1F800020 & 0xFFFF)($t4)
    sra        $t7, $t7, 16
    bgez       $t5, .L80026828
    sub        $t7, $t7, $t9
    neg        $t5, $t5
  .L80026828:
    bgez       $t7, .L80026834
    lw         $t9, (0x1F800024 & 0xFFFF)($t4)
    neg        $t7, $t7
  .L80026834:
    slt        $at, $t5, $t7
    bnez       $at, .L80026844
    lw         $v0, (0x1F800018 & 0xFFFF)($t4)
    addu       $t7, $t5, $zero
  .L80026844:
    lh         $t5, 0x4($a3)
    nop
    sub        $t9, $t5, $t9
    bgez       $t9, .L8002685C
    lh         $t5, 0x10($v0)
    neg        $t9, $t9
  .L8002685C:
    slt        $at, $t9, $t7
    bnez       $at, .L8002686C
    nop
    addu       $t7, $t9, $zero
  .L8002686C:
    slt        $at, $t7, $t5
    beqz       $at, .L800268C8
    sub        $t7, $t5, $t7
    lwc2       $9, 0x4($v0)
    lwc2       $10, 0x8($v0)
    lwc2       $11, 0xC($v0)
    sll        $t7, $t7, 4
    mtc2       $t7, $8
    mtc2       $t8, $6
    and        $t7, $t8, $a1
    andi       $t5, $t7, 0xFF
    sll        $t5, $t5, 4
    mtc2       $t5, $25
    andi       $t5, $t7, 0xFF00
    srl        $t5, $t5, 4
    mtc2       $t5, $26
    srl        $t5, $t7, 16
    sll        $t5, $t5, 4
    mtc2       $t5, $27
    nop
    nop
    GPL        1
    swc2       $22, (0x1F80007C & 0xFFFF)($t4)
  .L800268C8:
    lw         $t8, (0x1F800080 & 0xFFFF)($t4)
    lw         $t7, 0x0($a0)
    lw         $v0, (0x1F80001C & 0xFFFF)($t4)
    sll        $t5, $t7, 16
    sra        $t5, $t5, 16
    sub        $t5, $t5, $v0
    lw         $t9, (0x1F800020 & 0xFFFF)($t4)
    sra        $t7, $t7, 16
    bgez       $t5, .L800268F4
    sub        $t7, $t7, $t9
    neg        $t5, $t5
  .L800268F4:
    bgez       $t7, .L80026900
    lw         $t9, (0x1F800024 & 0xFFFF)($t4)
    neg        $t7, $t7
  .L80026900:
    slt        $at, $t5, $t7
    bnez       $at, .L80026910
    lw         $v0, (0x1F800018 & 0xFFFF)($t4)
    addu       $t7, $t5, $zero
  .L80026910:
    lh         $t5, 0x4($a0)
    nop
    sub        $t9, $t5, $t9
    bgez       $t9, .L80026928
    lh         $t5, 0x10($v0)
    neg        $t9, $t9
  .L80026928:
    slt        $at, $t9, $t7
    bnez       $at, .L80026938
    nop
    addu       $t7, $t9, $zero
  .L80026938:
    slt        $at, $t7, $t5
    beqz       $at, .L80026994
    sub        $t7, $t5, $t7
    lwc2       $9, 0x4($v0)
    lwc2       $10, 0x8($v0)
    lwc2       $11, 0xC($v0)
    sll        $t7, $t7, 4
    mtc2       $t7, $8
    mtc2       $t8, $6
    and        $t7, $t8, $a1
    andi       $t5, $t7, 0xFF
    sll        $t5, $t5, 4
    mtc2       $t5, $25
    andi       $t5, $t7, 0xFF00
    srl        $t5, $t5, 4
    mtc2       $t5, $26
    srl        $t5, $t7, 16
    sll        $t5, $t5, 4
    mtc2       $t5, $27
    nop
    nop
    GPL        1
    swc2       $22, (0x1F800080 & 0xFFFF)($t4)
  .L80026994:
    lw         $t8, (0x1F800084 & 0xFFFF)($t4)
    lw         $t7, 0x0($a2)
    lw         $v0, (0x1F80001C & 0xFFFF)($t4)
    sll        $t5, $t7, 16
    sra        $t5, $t5, 16
    sub        $t5, $t5, $v0
    lw         $t9, (0x1F800020 & 0xFFFF)($t4)
    sra        $t7, $t7, 16
    bgez       $t5, .L800269C0
    sub        $t7, $t7, $t9
    neg        $t5, $t5
  .L800269C0:
    bgez       $t7, .L800269CC
    lw         $t9, (0x1F800024 & 0xFFFF)($t4)
    neg        $t7, $t7
  .L800269CC:
    slt        $at, $t5, $t7
    bnez       $at, .L800269DC
    lw         $v0, (0x1F800018 & 0xFFFF)($t4)
    addu       $t7, $t5, $zero
  .L800269DC:
    lh         $t5, 0x4($a2)
    nop
    sub        $t9, $t5, $t9
    bgez       $t9, .L800269F4
    lh         $t5, 0x10($v0)
    neg        $t9, $t9
  .L800269F4:
    slt        $at, $t9, $t7
    bnez       $at, .L80026A04
    nop
    addu       $t7, $t9, $zero
  .L80026A04:
    slt        $at, $t7, $t5
    beqz       $at, .L80026A60
    sub        $t7, $t5, $t7
    lwc2       $9, 0x4($v0)
    lwc2       $10, 0x8($v0)
    lwc2       $11, 0xC($v0)
    sll        $t7, $t7, 4
    mtc2       $t7, $8
    mtc2       $t8, $6
    and        $t7, $t8, $a1
    andi       $t5, $t7, 0xFF
    sll        $t5, $t5, 4
    mtc2       $t5, $25
    andi       $t5, $t7, 0xFF00
    srl        $t5, $t5, 4
    mtc2       $t5, $26
    srl        $t5, $t7, 16
    sll        $t5, $t5, 4
    mtc2       $t5, $27
    nop
    nop
    GPL        1
    swc2       $22, (0x1F800084 & 0xFFFF)($t4)
  .L80026A60:
    lwc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
  .L80026A64:
    andi       $v0, $t6, 0x8
    bnez       $v0, .L80026A94
    andi       $v0, $t6, 0x2
    lw         $t7, (0x1F8000AC & 0xFFFF)($t4)
    beqz       $v0, .L80026A80
    nop
    bnez       $t7, .L80026008
  .L80026A80:
    mfc2       $t9, $24
    nop
    addi       $t9, $t9, 0x4E20
    bltz       $t9, .L80026008
    sw         $t9, (0x1F8000AC & 0xFFFF)($t4)
  .L80026A94:
    lui        $t8, (0x66000 >> 16)
    sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
    ori        $t8, $t8, (0x66000 & 0xFFFF)
    and        $s2, $s2, $t8
    bnez       $s2, .L80026008
    nop
    sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
    mfc2       $t8, $17
    mfc2       $t9, $18
    mfc2       $t5, $19
    slt        $at, $t9, $t8
    bnez       $at, .L80026AD0
    addu       $t7, $t9, $zero
    addu       $t7, $t8, $zero
    addu       $t8, $t9, $zero
  .L80026AD0:
    slt        $at, $t8, $t5
    bnez       $at, .L80026AE4
    addu       $v0, $t5, $zero
    addu       $t5, $t8, $zero
    addu       $t8, $v0, $zero
  .L80026AE4:
    slt        $at, $t7, $t8
    bnez       $at, .L80026AF4
    sra        $v0, $t6, 8
    addu       $t7, $t8, $zero
  .L80026AF4:
    andi       $t9, $t5, 0xFFFC
    sll        $v0, $v0, 4
    addu       $t8, $t9, $v0
    blez       $t8, .L80026DCC
    slti       $v1, $t9, 0xA0
    bnez       $v1, .L80026DCC
    slti       $v1, $t8, 0x3000
    beqz       $v1, .L80026DCC
    lw         $v1, (0x1F8000D0 & 0xFFFF)($t4)
    nop
    slt        $at, $t7, $v1
    beqz       $at, .L80026DCC
    nop
    slti       $at, $t7, 0x280
    bnez       $at, .L80026008
    lw         $v1, (0x1F8000B0 & 0xFFFF)($t4)
    nop
    slt        $v0, $t9, $v1
    xori       $v0, $v0, 0x1
    bnez       $v0, .L80026C70
    nop
    andi       $v0, $t6, 0x8
    beqz       $v0, .L80026C2C
    mfc2       $t9, $21
    mfc2       $t6, $22
    mfc2       $v1, $23
    mtc2       $zero, $21
    mtc2       $zero, $22
    mtc2       $zero, $23
    addiu      $t5, $zero, 0x1000
    mfc2       $v0, $17
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L80026BA8
    nop
    bgtz       $v0, .L80026B90
    nop
    addu       $v0, $zero, $zero
  .L80026B90:
    lwc2       $6, (0x1F80007C & 0xFFFF)($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, (0x1F80007C & 0xFFFF)($t4)
  .L80026BA8:
    mfc2       $v0, $18
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L80026BE4
    nop
    bgtz       $v0, .L80026BCC
    nop
    addu       $v0, $zero, $zero
  .L80026BCC:
    lwc2       $6, (0x1F800080 & 0xFFFF)($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, (0x1F800080 & 0xFFFF)($t4)
  .L80026BE4:
    mfc2       $v0, $19
    nop
    sub        $v0, $t5, $v0
    slt        $at, $t5, $v0
    bnez       $at, .L80026C20
    nop
    bgtz       $v0, .L80026C08
    nop
    addu       $v0, $zero, $zero
  .L80026C08:
    lwc2       $6, (0x1F800084 & 0xFFFF)($t4)
    mtc2       $v0, $8
    nop
    nop
    DPCS
    swc2       $22, (0x1F800084 & 0xFFFF)($t4)
  .L80026C20:
    mtc2       $t9, $21
    mtc2       $t6, $22
    mtc2       $v1, $23
  .L80026C2C:
    lw         $t5, (0x1F800084 & 0xFFFF)($t4)
    lw         $v1, (0x1F800080 & 0xFFFF)($t4)
    lw         $v0, (0x1F80007C & 0xFFFF)($t4)
    sw         $t5, 0x1C($t0)
    sw         $v1, 0x10($t0)
    sw         $v0, 0x4($t0)
    sw         $t3, 0x20($t0)
    addu       $a2, $t8, $s4
    lw         $v0, 0x0($a2)
    and        $v1, $t0, $a1
    sw         $v1, 0x0($a2)
    or         $v0, $v0, $s3
    sw         $v0, 0x0($t0)
    sw         $t1, 0x8($t0)
    sw         $t2, 0x14($t0)
    bgez       $zero, .L80026DB4
    addiu      $t0, $t0, 0x28
  .L80026C70:
    lwc2       $6, (0x1F800084 & 0xFFFF)($t4)
    lwc2       $8, (0x1F8000C4 & 0xFFFF)($t4)
    addu       $a2, $t8, $s4
    lw         $v0, 0x0($a2)
    DPCS
    and        $v1, $t0, $a1
    sw         $v1, 0x0($a2)
    or         $v0, $v0, $s3
    sw         $v0, 0x0($t0)
    swc2       $22, 0x1C($t0)
    lwc2       $6, (0x1F800080 & 0xFFFF)($t4)
    lwc2       $8, (0x1F8000C0 & 0xFFFF)($t4)
    nop
    nop
    DPCS
    sw         $t3, 0x20($t0)
    sw         $t2, 0x14($t0)
    lb         $t5, (0x1F80007F & 0xFFFF)($t4)
    swc2       $22, 0x10($t0)
    lwc2       $6, (0x1F80007C & 0xFFFF)($t4)
    lwc2       $8, (0x1F8000BC & 0xFFFF)($t4)
    nop
    lw         $a2, (0x1F8000CC & 0xFFFF)($t4)
    sw         $t1, 0x8($t0)
    DPCS
    lw         $v1, (0x1F8000B8 & 0xFFFF)($t4)
    andi       $v0, $t6, 0x1
    andi       $t5, $t5, 0x2
    or         $v0, $v0, $t5
    slt        $at, $v1, $t9
    beqz       $at, .L80026DE4
    addiu      $t0, $t0, 0x28
    bnez       $v0, .L80026DE4
    lb         $v0, (0x1F8000DA & 0xFFFF)($t4)
    nop
    bnez       $v0, .L80026E30
    lui        $v0, (0x2000000 >> 16)
    mtc2       $a2, $6
    mfc2       $a2, $22
    nop
    or         $a2, $a2, $v0
    sw         $a2, -0x24($t0)
    lw         $t5, (0x1F8000CC & 0xFFFF)($t4)
    DPCS
    srl        $v1, $s7, 16
    andi       $v1, $v1, 0xFF9F
    ori        $v1, $v1, 0x20
    sh         $v1, -0xE($t0)
    lw         $a2, (0x1F8000C0 & 0xFFFF)($t4)
    sw         $t1, 0xC($t0)
    mfc2       $t1, $22
    lui        $v1, (0x30000000 >> 16)
    sub        $t1, $t5, $t1
    or         $t1, $t1, $v1
    sw         $t1, 0x8($t0)
    mtc2       $a2, $8
    lui        $v0, (0xE1000640 >> 16)
    ori        $v0, $v0, (0xE1000640 & 0xFFFF)
    DPCS
    lw         $a2, (0x1F8000C4 & 0xFFFF)($t4)
    sw         $t2, 0x14($t0)
    sw         $v0, 0x4($t0)
    mfc2       $t1, $22
    nop
    sub        $t1, $t5, $t1
    sw         $t1, 0x10($t0)
    mtc2       $a2, $8
    and        $v1, $t0, $a1
    addu       $t8, $t8, $s4
    DPCS
    lw         $v0, 0x0($t8)
    sw         $v1, 0x0($t8)
    lui        $at, (0x7000000 >> 16)
    or         $v0, $v0, $at
    sw         $v0, 0x0($t0)
    sw         $t3, 0x1C($t0)
    mfc2       $t1, $22
    nop
    sub        $t1, $t5, $t1
    sw         $t1, 0x18($t0)
    addiu      $t0, $t0, 0x20
  .L80026DB4:
    addiu      $s1, $s1, 0xC
    sltu       $v0, $s1, $s6
    bnez       $v0, .L80026660
    nop
    j          .L80026E00
    nop
  .L80026DCC:
    addiu      $s1, $s1, 0xC
    sltu       $v0, $s1, $s6
    bnez       $v0, .L80026660
    sw         $zero, (0x1F8000AC & 0xFFFF)($t4)
    j          .L80026E00
    nop
  .L80026DE4:
    swc2       $22, -0x24($t0)
    addiu      $s1, $s1, 0xC
    sltu       $v0, $s1, $s6
    bnez       $v0, .L80026660
    nop
    j          .L80026E00
    nop
  .L80026E00:
    lw         $ra, (0x1F8000A8 & 0xFFFF)($t4)
    lw         $fp, (0x1F800014 & 0xFFFF)($t4)
    lw         $s7, (0x1F8000A4 & 0xFFFF)($t4)
    lw         $s6, (0x1F8000A0 & 0xFFFF)($t4)
    lw         $s5, (0x1F80009C & 0xFFFF)($t4)
    lw         $s4, (0x1F800098 & 0xFFFF)($t4)
    lw         $s3, (0x1F800094 & 0xFFFF)($t4)
    lw         $s2, (0x1F800090 & 0xFFFF)($t4)
    lw         $s1, (0x1F80008C & 0xFFFF)($t4)
    lw         $s0, (0x1F800088 & 0xFFFF)($t4)
    jr         $ra
    nop
  .L80026E30:
    lui        $v0, (0x2000000 >> 16)
    mtc2       $a2, $6
    mfc2       $a2, $22
    nop
    or         $a2, $a2, $v0
    sw         $a2, -0x24($t0)
    lw         $t5, (0x1F8000CC & 0xFFFF)($t4)
    lui        $at, (0xFF000000 >> 16)
    and        $v0, $a2, $at
    lui        $at, (0x36000000 >> 16)
    beq        $v0, $at, .L80026E64
    nop
    mfc2       $v0, $22
  .L80026E64:
    DPCS
    srl        $v1, $s7, 16
    andi       $v1, $v1, 0xFF9F
    ori        $v1, $v1, 0x20
    sh         $v1, -0xE($t0)
    lw         $a2, (0x1F8000C0 & 0xFFFF)($t4)
    sw         $t1, 0x8($t0)
    mfc2       $t1, $22
    lui        $v1, (0x34000000 >> 16)
    sub        $t1, $t5, $t1
    or         $t1, $t1, $v1
    sw         $t1, 0x4($t0)
    mtc2       $a2, $8
    lui        $at, (0xFF9FFFFF >> 16)
    ori        $at, $at, (0xFF9FFFFF & 0xFFFF)
    and        $v1, $s7, $at
    sw         $v1, 0x18($t0)
    DPCS
    lw         $v0, -0x1C($t0)
    lw         $v1, -0x4($t0)
    sw         $v0, 0xC($t0)
    sw         $v1, 0x24($t0)
    lh         $a2, (0x1F8000D4 & 0xFFFF)($t4)
    nop
    sh         $a2, 0xE($t0)
    lw         $a2, (0x1F8000C4 & 0xFFFF)($t4)
    sw         $t2, 0x14($t0)
    mfc2       $t1, $22
    nop
    sub        $t1, $t5, $t1
    sw         $t1, 0x10($t0)
    mtc2       $a2, $8
    and        $v1, $t0, $a1
    addu       $t8, $t8, $s4
    DPCS
    lw         $v0, 0x0($t8)
    sw         $v1, 0x0($t8)
    lui        $at, (0x9000000 >> 16)
    or         $v0, $v0, $at
    sw         $v0, 0x0($t0)
    sw         $t3, 0x20($t0)
    mfc2       $t1, $22
    nop
    sub        $t1, $t5, $t1
    sw         $t1, 0x1C($t0)
    addiu      $t0, $t0, 0x28
    addiu      $s1, $s1, 0xC
    sltu       $v0, $s1, $s6
    bnez       $v0, .L80026660
    nop
    j          .L80026E00
    nop
.size DRAW_DisplaySubdivPolytope_S, . - DRAW_DisplaySubdivPolytope_S

glabel DRAW_DisplayPolytopeList_S
    addiu      $sp, $sp, -0x58
    sw         $s6, 0x48($sp)
    sw         $ra, 0x50($sp)
    sw         $s7, 0x4C($sp)
    sw         $s5, 0x44($sp)
    sw         $s4, 0x40($sp)
    sw         $s3, 0x3C($sp)
    sw         $s2, 0x38($sp)
    sw         $s1, 0x34($sp)
    sw         $s0, 0x30($sp)
    addu       $s6, $a1, $zero
    lw         $s4, 0x68($sp)
    lw         $s2, 0x6C($sp)
    lw         $t0, 0x4($a3)
    lw         $t3, 0x60($a2)
    lw         $s3, 0x8($a3)
    lw         $t4, 0x0($t3)
    lw         $t5, 0x4($t3)
    lw         $t6, 0x8($t3)
    lw         $t7, 0xC($t3)
    ctc2       $t4, $0
    ctc2       $t5, $1
    ctc2       $t6, $2
    ctc2       $t7, $3
    lw         $t4, 0x10($t3)
    lw         $t5, 0x14($t3)
    lw         $t6, 0x18($t3)
    lw         $t7, 0x1C($t3)
    ctc2       $t4, $4
    ctc2       $t5, $5
    ctc2       $t6, $6
    ctc2       $t7, $7
    lui        $s5, (0x1F800018 >> 16)
    lui        $t4, %hi(depthQFogStart)
    lw         $t4, %lo(depthQFogStart)($t4)
    lui        $t5, %hi(depthQPTable)
    lw         $t5, %lo(depthQPTable)($t5)
    lui        $t6, %hi(depthQBlendStart)
    lw         $t6, %lo(depthQBlendStart)($t6)
    lui        $t7, %hi(depthQBackColor)
    lw         $t7, %lo(depthQBackColor)($t7)
    lui        $t8, %hi(depthQFogFar)
    lw         $t8, %lo(depthQFogFar)($t8)
    lui        $v0, %hi(SpecialFogClut)
    lh         $v0, %lo(SpecialFogClut)($v0)
    sw         $t4, (0x1F8000B0 & 0xFFFF)($s5)
    sw         $t5, (0x1F8000B4 & 0xFFFF)($s5)
    sw         $t6, (0x1F8000B8 & 0xFFFF)($s5)
    sw         $t7, (0x1F8000CC & 0xFFFF)($s5)
    sw         $t8, (0x1F8000D0 & 0xFFFF)($s5)
    sh         $v0, (0x1F8000D4 & 0xFFFF)($s5)
    lw         $v0, 0x0($a0)
    addiu      $s0, $a0, 0x4
    sll        $v0, $v0, 2
    addiu      $v0, $v0, 0x4
    addu       $s7, $a0, $v0
    sltu       $v0, $s0, $s7
    beqz       $v0, .L8002713C
    lui        $s1, (0xFFFFFF >> 16)
    ori        $s1, $s1, (0xFFFFFF & 0xFFFF)
  .L80027024:
    lw         $v1, 0x0($s0)
    nop
    lh         $v0, 0xE($v1)
    nop
    andi       $v0, $v0, 0x2
    beqz       $v0, .L8002712C
    addi       $t4, $t0, 0xC00
    slt        $at, $t4, $s3
    beqz       $at, .L8002712C
    nop
    lui        $v0, gameTrackerX_HI
    ori        $v0, $v0, gameTrackerX_LO
    addiu      $v0, $v0, 0xC
    lw         $v0, 0x0($v0)
    nop
    beq        $zero, $v0, .L8002711C
    sw         $zero, (0x1F800018 & 0xFFFF)($s5)
    lw         $v0, 0x40($v0)
    nop
    lw         $t5, 0x14($v0)
    lw         $a0, 0x18($v0)
    lw         $v0, 0x1C($v0)
    lh         $a1, 0x0($s2)
    lh         $a2, 0x2($s2)
    lh         $a3, 0x4($s2)
    sub        $t5, $t5, $a1
    sub        $a0, $a0, $a2
    sub        $v0, $v0, $a3
    sw         $t5, (0x1F80001C & 0xFFFF)($s5)
    sw         $a0, (0x1F800020 & 0xFFFF)($s5)
    sw         $v0, (0x1F800024 & 0xFFFF)($s5)
    lh         $a1, 0x0($v1)
    lh         $a2, 0x2($v1)
    lh         $a3, 0x4($v1)
    sub        $a1, $t5, $a1
    bgez       $a1, .L800270BC
    sub        $a2, $a0, $a2
    neg        $a1, $a1
  .L800270BC:
    bgez       $a2, .L800270C8
    sub        $a3, $v0, $a3
    neg        $a2, $a2
  .L800270C8:
    bgez       $a3, .L800270D4
    lh         $v0, 0x6($v1)
    neg        $a3, $a3
  .L800270D4:
    slt        $at, $a2, $a1
    bnez       $at, .L800270E4
    nop
    addu       $a1, $a2, $zero
  .L800270E4:
    slt        $at, $a3, $a1
    bnez       $at, .L800270F4
    nop
    addu       $a1, $a3, $zero
  .L800270F4:
    lui        $a2, gameTrackerX_HI
    ori        $a2, $a2, gameTrackerX_LO
    addiu      $a2, $a2, 0xC
    lh         $a3, 0x10($a2)
    nop
    add        $a3, $a3, $v0
    slt        $at, $a1, $a3
    beqz       $at, .L8002711C
    nop
    sw         $a2, (0x1F800018 & 0xFFFF)($s5)
  .L8002711C:
    addu       $a0, $s0, $zero
    addu       $a1, $s6, $zero
    jal        DRAW_DisplaySubdivPolytope_S
    nop
  .L8002712C:
    addiu      $s0, $s0, 0x4
    sltu       $v0, $s0, $s7
    bnez       $v0, .L80027024
    nop
  .L8002713C:
    addu       $v0, $t0, $zero
    lw         $ra, 0x50($sp)
    lw         $s7, 0x4C($sp)
    lw         $s6, 0x48($sp)
    lw         $s5, 0x44($sp)
    lw         $s4, 0x40($sp)
    lw         $s3, 0x3C($sp)
    lw         $s2, 0x38($sp)
    lw         $s1, 0x34($sp)
    lw         $s0, 0x30($sp)
    addiu      $sp, $sp, 0x58
    jr         $ra
    nop
.size DRAW_DisplayPolytopeList_S, . - DRAW_DisplayPolytopeList_S

glabel PIPE3D_TransformAnimatedInstanceVertices_S
    lw         $t2, 0x18($a2)
    addu       $t0, $a1, $zero
    blez       $t2, .L80027F84
    lui        $t3, (0x1F80005C >> 16)
    sw         $s6, (0x1F800074 & 0xFFFF)($t3)
    sw         $s5, (0x1F800070 & 0xFFFF)($t3)
    sw         $s4, (0x1F80006C & 0xFFFF)($t3)
    sw         $s3, (0x1F800068 & 0xFFFF)($t3)
    sw         $s2, (0x1F800064 & 0xFFFF)($t3)
    sw         $s1, (0x1F800060 & 0xFFFF)($t3)
    sw         $s0, (0x1F80005C & 0xFFFF)($t3)
    lw         $t1, 0x10($sp)
    lw         $t8, 0x1C($a2)
    addu       $t9, $a0, $zero
    lw         $s1, 0x18($sp)
    lui        $s2, gNormalList_HI
    ori        $s2, $s2, gNormalList_LO
    lw         $s6, 0x1C($sp)
    lw         $t4, 0x0($a3)
    lw         $t5, 0x4($a3)
    sw         $t4, (0x1F800000 & 0xFFFF)($t3)
    sw         $t5, (0x1F800004 & 0xFFFF)($t3)
    lw         $t4, 0x8($a3)
    lw         $t5, 0xC($a3)
    lw         $t6, 0x10($a3)
    sw         $t4, (0x1F800008 & 0xFFFF)($t3)
    sw         $t5, (0x1F80000C & 0xFFFF)($t3)
    sw         $t6, (0x1F800010 & 0xFFFF)($t3)
    lw         $t4, 0x14($a3)
    lw         $t5, 0x18($a3)
    lw         $t6, 0x1C($a3)
    sw         $t4, (0x1F800014 & 0xFFFF)($t3)
    sw         $t5, (0x1F800018 & 0xFFFF)($t3)
    sw         $t6, (0x1F80001C & 0xFFFF)($t3)
    addiu      $at, $zero, -0x1
    or         $a2, $a2, $at
    beqz       $s1, .L80027728
    lw         $s0, 0x14($sp)
    nop
    lw         $t4, 0x0($s0)
    lw         $t5, 0x4($s0)
    sw         $t4, (0x1F800034 & 0xFFFF)($t3)
    sw         $t5, (0x1F800038 & 0xFFFF)($t3)
    lw         $t4, 0x8($s0)
    lw         $t5, 0xC($s0)
    lw         $t6, 0x10($s0)
    sw         $t4, (0x1F80003C & 0xFFFF)($t3)
    sw         $t5, (0x1F800040 & 0xFFFF)($t3)
    sw         $t6, (0x1F800044 & 0xFFFF)($t3)
    bnez       $s6, .L800279CC
    lui        $v0, (0x34FFFFFF >> 16)
    ori        $v0, $v0, (0x34FFFFFF & 0xFFFF)
    mtc2       $v0, $6
  .L80027244:
    lw         $a0, 0x8($t8)
    nop
    sra        $v0, $a0, 16
    addiu      $v1, $v0, 0x1
    beqz       $v1, .L80027710
    sll        $t7, $v0, 3
    addu       $t7, $t9, $t7
    andi       $t4, $a0, 0xFFFF
    sll        $a1, $t4, 3
    addu       $a1, $t9, $a1
    addiu      $v0, $t3, (0x1F800034 & 0xFFFF)
    addiu      $v1, $t3, (0x1F800048 & 0xFFFF)
    lw         $t4, 0x0($v0)
    lw         $t5, 0x4($v0)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v0)
    lw         $t5, 0xC($v0)
    lw         $t6, 0x10($v0)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lhu        $t4, 0x0($t1)
    lhu        $t5, 0x6($t1)
    lhu        $t6, 0xC($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x0($v1)
    sh         $t5, 0x6($v1)
    sh         $t6, 0xC($v1)
    lhu        $t4, 0x2($t1)
    lhu        $t5, 0x8($t1)
    lhu        $t6, 0xE($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x2($v1)
    sh         $t5, 0x8($v1)
    sh         $t6, 0xE($v1)
    lhu        $t4, 0x4($t1)
    lhu        $t5, 0xA($t1)
    lhu        $t6, 0x10($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x4($v1)
    sh         $t5, 0xA($v1)
    sh         $t6, 0x10($v1)
    lw         $t4, 0x0($v1)
    lw         $t5, 0x4($v1)
    ctc2       $t4, $8
    ctc2       $t5, $9
    lw         $t4, 0x8($v1)
    lw         $t5, 0xC($v1)
    lw         $t6, 0x10($v1)
    ctc2       $t4, $10
    ctc2       $t5, $11
    ctc2       $t6, $12
    addiu      $v0, $t3, (0x1F800000 & 0xFFFF)
    addiu      $v1, $t3, (0x1F800020 & 0xFFFF)
    lw         $t4, 0x0($v0)
    lw         $t5, 0x4($v0)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v0)
    lw         $t5, 0xC($v0)
    lw         $t6, 0x10($v0)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lhu        $t4, 0x0($t1)
    lhu        $t5, 0x6($t1)
    lhu        $t6, 0xC($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x0($v1)
    sh         $t5, 0x6($v1)
    sh         $t6, 0xC($v1)
    lhu        $t4, 0x2($t1)
    lhu        $t5, 0x8($t1)
    lhu        $t6, 0xE($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x2($v1)
    sh         $t5, 0x8($v1)
    sh         $t6, 0xE($v1)
    lhu        $t4, 0x4($t1)
    lhu        $t5, 0xA($t1)
    lhu        $t6, 0x10($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x4($v1)
    sh         $t5, 0xA($v1)
    sh         $t6, 0x10($v1)
    lw         $t4, 0x14($v0)
    lw         $t5, 0x18($v0)
    lw         $t6, 0x1C($v0)
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lhu        $t5, 0x18($t1)
    lhu        $t4, 0x14($t1)
    sll        $t5, $t5, 16
    or         $t4, $t4, $t5
    mtc2       $t4, $0
    lwc2       $1, 0x1C($t1)
    nop
    nop
    MVMVA      1, 0, 0, 0, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lw         $t4, 0x0($v1)
    lw         $t5, 0x4($v1)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v1)
    lw         $t5, 0xC($v1)
    lw         $t6, 0x10($v1)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    addiu      $t4, $a1, 0x10
    sltu       $t4, $t7, $t4
    bnez       $t4, .L80027600
    nop
  .L80027500:
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $2
    mtc2       $t6, $3
    mtc2       $a0, $4
    mtc2       $s0, $5
    srl        $s3, $v1, 16
    srl        $s4, $t6, 16
    RTPT
    srl        $s5, $s0, 16
    sll        $s3, $s3, 3
    sll        $s4, $s4, 3
    sll        $s5, $s5, 3
    addu       $s3, $s2, $s3
    addu       $s4, $s2, $s4
    addu       $s5, $s2, $s5
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    lw         $t5, 0x0($s4)
    lw         $t6, 0x4($s4)
    lw         $a0, 0x0($s5)
    lw         $s0, 0x4($s5)
    swc2       $12, 0x0($t0)
    swc2       $17, 0x4($t0)
    swc2       $13, 0x8($t0)
    cfc2       $t4, $31
    swc2       $18, 0xC($t0)
    and        $a2, $a2, $t4
    swc2       $14, 0x10($t0)
    swc2       $19, 0x14($t0)
    mfc2       $t4, $8
    lui        $s4, %hi(modelFadeValue)
    lw         $s4, %lo(modelFadeValue)($s4)
    nop
    beqz       $s4, .L80027598
    nop
    mtc2       $s4, $8
    addu       $t4, $s4, $zero
  .L80027598:
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $2
    mtc2       $t6, $3
    mtc2       $a0, $4
    mtc2       $s0, $5
    beqz       $t4, .L800275C4
    addiu      $a1, $a1, 0x18
    NCDT
    bgez       $zero, .L800275CC
    addiu      $t4, $a1, 0x10
  .L800275C4:
    NCT
    addiu      $t4, $a1, 0x10
  .L800275CC:
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    swc2       $20, 0x0($s1)
    swc2       $21, 0x4($s1)
    swc2       $22, 0x8($s1)
    addiu      $s1, $s1, 0xC
    sltu       $t4, $t7, $t4
    beqz       $t4, .L80027500
    addiu      $t0, $t0, 0x18
  .L80027600:
    slt        $at, $t7, $a1
    bnez       $at, .L80027710
    nop
    mtc2       $v0, $0
    mtc2       $v1, $1
    addiu      $a1, $a1, 0x8
    srl        $s3, $v1, 16
    RTPS
    sll        $s3, $s3, 3
    addu       $s3, $s2, $s3
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    mfc2       $s3, $8
    lui        $s4, %hi(modelFadeValue)
    lw         $s4, %lo(modelFadeValue)($s4)
    nop
    beqz       $s4, .L8002765C
    nop
    mtc2       $s4, $8
    addu       $s3, $s4, $zero
  .L8002765C:
    mtc2       $v0, $0
    mtc2       $v1, $1
    beqz       $s3, .L80027678
    nop
    NCDS
    bgez       $zero, .L8002767C
    nop
  .L80027678:
    NCS
  .L8002767C:
    addiu      $t0, $t0, 0x8
    swc2       $22, 0x0($s1)
    addiu      $s1, $s1, 0x4
    slt        $at, $t7, $a1
    bnez       $at, .L80027710
    and        $a2, $a2, $a0
    mtc2       $t5, $0
    mtc2       $t6, $1
    srl        $s3, $t6, 16
    sll        $s3, $s3, 3
    RTPS
    addu       $s3, $s2, $s3
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    mfc2       $s3, $8
    lui        $s4, %hi(modelFadeValue)
    lw         $s4, %lo(modelFadeValue)($s4)
    nop
    beqz       $s4, .L800276E0
    nop
    mtc2       $s4, $8
    addu       $s3, $s4, $zero
  .L800276E0:
    mtc2       $v0, $0
    mtc2       $v1, $1
    beqz       $s3, .L800276FC
    nop
    NCDS
    bgez       $zero, .L80027700
    nop
  .L800276FC:
    NCS
  .L80027700:
    addiu      $t0, $t0, 0x8
    and        $a2, $a2, $a0
    swc2       $22, 0x0($s1)
    addiu      $s1, $s1, 0x4
  .L80027710:
    addiu      $t1, $t1, 0x20
    addiu      $t2, $t2, -0x1
    bnez       $t2, .L80027244
    addiu      $t8, $t8, 0x18
    bgez       $zero, .L80027F84
    nop
  .L80027728:
    lw         $a0, 0x8($t8)
    nop
    sra        $v0, $a0, 16
    addiu      $v1, $v0, 0x1
    beqz       $v1, .L800279B4
    sll        $t7, $v0, 3
    addu       $t7, $t9, $t7
    andi       $t4, $a0, 0xFFFF
    sll        $a1, $t4, 3
    addu       $a1, $t9, $a1
    addiu      $v0, $t3, (0x1F800000 & 0xFFFF)
    addiu      $v1, $t3, (0x1F800020 & 0xFFFF)
    lw         $t4, 0x0($v0)
    lw         $t5, 0x4($v0)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v0)
    lw         $t5, 0xC($v0)
    lw         $t6, 0x10($v0)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lhu        $t4, 0x0($t1)
    lhu        $t5, 0x6($t1)
    lhu        $t6, 0xC($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x0($v1)
    sh         $t5, 0x6($v1)
    sh         $t6, 0xC($v1)
    lhu        $t4, 0x2($t1)
    lhu        $t5, 0x8($t1)
    lhu        $t6, 0xE($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x2($v1)
    sh         $t5, 0x8($v1)
    sh         $t6, 0xE($v1)
    lhu        $t4, 0x4($t1)
    lhu        $t5, 0xA($t1)
    lhu        $t6, 0x10($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x4($v1)
    sh         $t5, 0xA($v1)
    sh         $t6, 0x10($v1)
    lw         $t4, 0x14($v0)
    lw         $t5, 0x18($v0)
    lw         $t6, 0x1C($v0)
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lhu        $t5, 0x18($t1)
    lhu        $t4, 0x14($t1)
    sll        $t5, $t5, 16
    or         $t4, $t4, $t5
    mtc2       $t4, $0
    lwc2       $1, 0x1C($t1)
    nop
    nop
    MVMVA      1, 0, 0, 0, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lw         $t4, 0x0($v1)
    lw         $t5, 0x4($v1)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v1)
    lw         $t5, 0xC($v1)
    lw         $t6, 0x10($v1)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    addiu      $t4, $a1, 0x10
    sltu       $t4, $t7, $t4
    bnez       $t4, .L80027948
    nop
  .L800278D8:
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $2
    mtc2       $t6, $3
    mtc2       $a0, $4
    mtc2       $s0, $5
    nop
    nop
    RTPT
    swc2       $12, 0x0($t0)
    addiu      $a1, $a1, 0x18
    swc2       $17, 0x4($t0)
    swc2       $13, 0x8($t0)
    cfc2       $t4, $31
    swc2       $18, 0xC($t0)
    and        $a2, $a2, $t4
    swc2       $14, 0x10($t0)
    addiu      $t4, $a1, 0x10
    swc2       $19, 0x14($t0)
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    sltu       $t4, $t7, $t4
    beqz       $t4, .L800278D8
    addiu      $t0, $t0, 0x18
  .L80027948:
    slt        $at, $t7, $a1
    bnez       $at, .L800279B4
    nop
    mtc2       $v0, $0
    mtc2       $v1, $1
    addiu      $a1, $a1, 0x8
    nop
    RTPS
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    mfc2       $s3, $8
    addiu      $t0, $t0, 0x8
    slt        $at, $t7, $a1
    bnez       $at, .L800279B4
    and        $a2, $a2, $a0
    mtc2       $t5, $0
    mtc2       $t6, $1
    nop
    nop
    RTPS
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    mfc2       $s3, $8
    addiu      $t0, $t0, 0x8
    and        $a2, $a2, $a0
  .L800279B4:
    addiu      $t1, $t1, 0x20
    addiu      $t2, $t2, -0x1
    bnez       $t2, .L80027728
    addiu      $t8, $t8, 0x18
    bgez       $zero, .L80027F84
    nop
  .L800279CC:
    lui        $v0, (0x34FFFFFF >> 16)
    ori        $v0, $v0, (0x34FFFFFF & 0xFFFF)
    mtc2       $v0, $6
  .L800279D8:
    lw         $a0, 0x8($t8)
    nop
    sra        $v0, $a0, 16
    addiu      $v1, $v0, 0x1
    beqz       $v1, .L80027F74
    sll        $t7, $v0, 3
    addu       $t7, $t9, $t7
    andi       $t4, $a0, 0xFFFF
    sll        $a1, $t4, 3
    addu       $a1, $t9, $a1
    addiu      $v0, $t3, (0x1F800034 & 0xFFFF)
    addiu      $v1, $t3, (0x1F800048 & 0xFFFF)
    lw         $t4, 0x0($v0)
    lw         $t5, 0x4($v0)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v0)
    lw         $t5, 0xC($v0)
    lw         $t6, 0x10($v0)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lhu        $t4, 0x0($t1)
    lhu        $t5, 0x6($t1)
    lhu        $t6, 0xC($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x0($v1)
    sh         $t5, 0x6($v1)
    sh         $t6, 0xC($v1)
    lhu        $t4, 0x2($t1)
    lhu        $t5, 0x8($t1)
    lhu        $t6, 0xE($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x2($v1)
    sh         $t5, 0x8($v1)
    sh         $t6, 0xE($v1)
    lhu        $t4, 0x4($t1)
    lhu        $t5, 0xA($t1)
    lhu        $t6, 0x10($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x4($v1)
    sh         $t5, 0xA($v1)
    sh         $t6, 0x10($v1)
    lw         $t4, 0x0($v1)
    lw         $t5, 0x4($v1)
    ctc2       $t4, $8
    ctc2       $t5, $9
    lw         $t4, 0x8($v1)
    lw         $t5, 0xC($v1)
    lw         $t6, 0x10($v1)
    ctc2       $t4, $10
    ctc2       $t5, $11
    ctc2       $t6, $12
    addiu      $v0, $t3, (0x1F800000 & 0xFFFF)
    addiu      $v1, $t3, (0x1F800020 & 0xFFFF)
    lw         $t4, 0x0($v0)
    lw         $t5, 0x4($v0)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v0)
    lw         $t5, 0xC($v0)
    lw         $t6, 0x10($v0)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lhu        $t4, 0x0($t1)
    lhu        $t5, 0x6($t1)
    lhu        $t6, 0xC($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x0($v1)
    sh         $t5, 0x6($v1)
    sh         $t6, 0xC($v1)
    lhu        $t4, 0x2($t1)
    lhu        $t5, 0x8($t1)
    lhu        $t6, 0xE($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x2($v1)
    sh         $t5, 0x8($v1)
    sh         $t6, 0xE($v1)
    lhu        $t4, 0x4($t1)
    lhu        $t5, 0xA($t1)
    lhu        $t6, 0x10($t1)
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    nop
    nop
    MVMVA      1, 0, 3, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    sh         $t4, 0x4($v1)
    sh         $t5, 0xA($v1)
    sh         $t6, 0x10($v1)
    lw         $t4, 0x14($v0)
    lw         $t5, 0x18($v0)
    lw         $t6, 0x1C($v0)
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lhu        $t5, 0x18($t1)
    lhu        $t4, 0x14($t1)
    sll        $t5, $t5, 16
    or         $t4, $t4, $t5
    mtc2       $t4, $0
    lwc2       $1, 0x1C($t1)
    nop
    nop
    MVMVA      1, 0, 0, 0, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    ctc2       $t4, $5
    ctc2       $t5, $6
    ctc2       $t6, $7
    lw         $t4, 0x0($v1)
    lw         $t5, 0x4($v1)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x8($v1)
    lw         $t5, 0xC($v1)
    lw         $t6, 0x10($v1)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    addiu      $t4, $a1, 0x10
    sltu       $t4, $t7, $t4
    bnez       $t4, .L80027E34
    nop
  .L80027C94:
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $2
    mtc2       $t6, $3
    mtc2       $a0, $4
    mtc2       $s0, $5
    srl        $s3, $v1, 16
    srl        $s4, $t6, 16
    RTPT
    srl        $s5, $s0, 16
    sll        $s3, $s3, 3
    sll        $s4, $s4, 3
    sll        $s5, $s5, 3
    addu       $s3, $s2, $s3
    addu       $s4, $s2, $s4
    addu       $s5, $s2, $s5
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    lw         $t5, 0x0($s6)
    swc2       $12, 0x0($t0)
    swc2       $17, 0x4($t0)
    swc2       $13, 0x8($t0)
    cfc2       $t4, $31
    swc2       $18, 0xC($t0)
    and        $a2, $a2, $t4
    swc2       $14, 0x10($t0)
    swc2       $19, 0x14($t0)
    mfc2       $t4, $8
    lui        $s3, %hi(modelFadeValue)
    lw         $s3, %lo(modelFadeValue)($s3)
    nop
    beqz       $s3, .L80027D20
    nop
    mtc2       $s3, $8
    addu       $t4, $s3, $zero
  .L80027D20:
    lui        $at, (0x40000000 >> 16)
    and        $s3, $t5, $at
    bnez       $s3, .L80027D58
    addu       $s3, $t5, $zero
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $6
    beqz       $t4, .L80027D50
    nop
    NCDS
    bgez       $zero, .L80027D54
    nop
  .L80027D50:
    NCCS
  .L80027D54:
    mfc2       $s3, $22
  .L80027D58:
    nop
    sw         $s3, 0x0($s1)
    lw         $v0, 0x0($s4)
    lw         $v1, 0x4($s4)
    lw         $t5, 0x4($s6)
    nop
    lui        $at, (0x40000000 >> 16)
    and        $s3, $t5, $at
    bnez       $s3, .L80027DA8
    addu       $s3, $t5, $zero
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $6
    beqz       $t4, .L80027DA0
    nop
    NCDS
    bgez       $zero, .L80027DA4
    nop
  .L80027DA0:
    NCCS
  .L80027DA4:
    mfc2       $s3, $22
  .L80027DA8:
    nop
    sw         $s3, 0x4($s1)
    lw         $v0, 0x0($s5)
    lw         $v1, 0x4($s5)
    lw         $t5, 0x8($s6)
    nop
    lui        $at, (0x40000000 >> 16)
    and        $s3, $t5, $at
    bnez       $s3, .L80027DF8
    addu       $s3, $t5, $zero
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $t5, $6
    beqz       $t4, .L80027DF0
    nop
    NCDS
    bgez       $zero, .L80027DF4
    nop
  .L80027DF0:
    NCCS
  .L80027DF4:
    mfc2       $s3, $22
  .L80027DF8:
    nop
    sw         $s3, 0x8($s1)
    addiu      $a1, $a1, 0x18
    addiu      $t4, $a1, 0x10
    lw         $v0, 0x0($a1)
    lw         $v1, 0x4($a1)
    lw         $t5, 0x8($a1)
    lw         $t6, 0xC($a1)
    lw         $a0, 0x10($a1)
    lw         $s0, 0x14($a1)
    addiu      $s1, $s1, 0xC
    addiu      $s6, $s6, 0xC
    sltu       $t4, $t7, $t4
    beqz       $t4, .L80027C94
    addiu      $t0, $t0, 0x18
  .L80027E34:
    slt        $at, $t7, $a1
    bnez       $at, .L80027F74
    nop
    mtc2       $v0, $0
    mtc2       $v1, $1
    srl        $s3, $v1, 16
    sll        $s3, $s3, 3
    RTPS
    addu       $s3, $s2, $s3
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    lw         $s3, 0x0($s6)
    addiu      $a1, $a1, 0x8
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    mfc2       $t4, $8
    lui        $s4, %hi(modelFadeValue)
    lw         $s4, %lo(modelFadeValue)($s4)
    nop
    beqz       $s4, .L80027E94
    nop
    mtc2       $s4, $8
    addu       $t4, $s4, $zero
  .L80027E94:
    lui        $at, (0x40000000 >> 16)
    and        $s4, $s3, $at
    bnez       $s4, .L80027ECC
    addu       $s4, $s3, $zero
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $s4, $6
    beqz       $t4, .L80027EC4
    nop
    NCDS
    bgez       $zero, .L80027EC8
    nop
  .L80027EC4:
    NCCS
  .L80027EC8:
    mfc2       $s4, $22
  .L80027ECC:
    nop
    sw         $s4, 0x0($s1)
    addiu      $t0, $t0, 0x8
    addiu      $s6, $s6, 0x4
    addiu      $s1, $s1, 0x4
    slt        $at, $t7, $a1
    bnez       $at, .L80027F74
    and        $a2, $a2, $a0
    mtc2       $t5, $0
    mtc2       $t6, $1
    nop
    nop
    RTPS
    srl        $s3, $t6, 16
    sll        $s3, $s3, 3
    addu       $s3, $s2, $s3
    lw         $v0, 0x0($s3)
    lw         $v1, 0x4($s3)
    lw         $s3, 0x0($s6)
    swc2       $14, 0x0($t0)
    swc2       $19, 0x4($t0)
    cfc2       $a0, $31
    lui        $at, (0x40000000 >> 16)
    and        $s4, $s3, $at
    bnez       $s4, .L80027F5C
    addu       $s4, $s3, $zero
    mtc2       $v0, $0
    mtc2       $v1, $1
    mtc2       $s4, $6
    beqz       $t4, .L80027F54
    nop
    NCDS
    bgez       $zero, .L80027F58
    nop
  .L80027F54:
    NCCS
  .L80027F58:
    mfc2       $s4, $22
  .L80027F5C:
    nop
    sw         $s4, 0x0($s1)
    addiu      $t0, $t0, 0x8
    addiu      $s6, $s6, 0x4
    and        $a2, $a2, $a0
    addiu      $s1, $s1, 0x4
  .L80027F74:
    addiu      $t1, $t1, 0x20
    addiu      $t2, $t2, -0x1
    bnez       $t2, .L800279D8
    addiu      $t8, $t8, 0x18
  .L80027F84:
    lw         $s6, (0x1F800074 & 0xFFFF)($t3)
    lw         $s5, (0x1F800070 & 0xFFFF)($t3)
    lw         $s4, (0x1F80006C & 0xFFFF)($t3)
    lw         $s3, (0x1F800068 & 0xFFFF)($t3)
    lw         $s2, (0x1F800064 & 0xFFFF)($t3)
    lw         $s1, (0x1F800060 & 0xFFFF)($t3)
    lw         $s0, (0x1F80005C & 0xFFFF)($t3)
    jr         $ra
    addu       $v0, $a2, $zero
.size PIPE3D_TransformAnimatedInstanceVertices_S, . - PIPE3D_TransformAnimatedInstanceVertices_S

glabel DRAW_MFace3_S
    cfc2       $t0, $31
    lui        $t1, (0x60000 >> 16)
    and        $t0, $t0, $t1
    bnez       $t0, .L8002842C
    nop
    NCLIP
    mfc2       $t0, $24
    nop
    bgez       $t0, .L8002842C
    andi       $t1, $v0, 0x4
    beqz       $t1, .L80027FE8
    nop
    AVSZ3
    mfc2       $t6, $7
    j          .L80028014
    nop
  .L80027FE8:
    mfc2       $t0, $17
    mfc2       $t1, $18
    mfc2       $t2, $19
    slt        $t3, $t0, $t1
    bnez       $t3, .L80028004
    nop
    addu       $t1, $t0, $zero
  .L80028004:
    slt        $t3, $t1, $t2
    bnez       $t3, .L80028014
    sra        $t6, $t2, 2
    sra        $t6, $t1, 2
  .L80028014:
    andi       $t0, $v0, 0x2
    beqz       $t0, .L80028030
    nop
    lb         $t0, 0xB($v1)
    nop
    sll        $t0, $t0, 1
    add        $t6, $t6, $t0
  .L80028030:
    lw         $t0, 0x8C($fp)
    sll        $t6, $t6, 2
    add        $t6, $t6, $t0
    blez       $t6, .L8002842C
    slti       $t0, $t6, 0x3000
    beqz       $t0, .L8002842C
    andi       $t0, $v0, 0x1
    bnez       $t0, .L80028228
    andi       $t0, $v0, 0x2
    bnez       $t0, .L8002811C
    nop
    swc2       $12, 0x8($s0)
    swc2       $13, 0xC($s0)
    swc2       $14, 0x10($s0)
    andi       $t0, $v0, 0x8
    beqz       $t0, .L80028080
    nop
    sw         $v1, 0x4($s0)
    j          .L800280E0
    nop
  .L80028080:
    lw         $t0, 0x4C($fp)
    nop
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    mtc2       $v1, $6
    nop
    nop
    NCDS
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x4
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $22, 0x4($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    j          .L8002842C
    addi       $s0, $s0, 0x14
  .L800280E0:
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x4
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    j          .L8002842C
    addi       $s0, $s0, 0x14
  .L8002811C:
    swc2       $12, 0x8($s0)
    swc2       $13, 0x10($s0)
    swc2       $14, 0x18($s0)
    mfc2       $t0, $8
    nop
    bnez       $t0, .L800285F4
    andi       $t0, $v0, 0x8
    beqz       $t0, .L80028154
    nop
    lw         $t0, 0xC($v1)
    nop
    sw         $t0, 0x4($s0)
    j          .L800281D4
    nop
  .L80028154:
    lw         $t0, 0x4C($fp)
    nop
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    lw         $t0, 0xC($v1)
    nop
    mtc2       $t0, $6
    nop
    nop
    NCDS
    lw         $t0, 0x0($s5)
    lw         $t1, 0x0($s6)
    lw         $t2, 0x0($s7)
    sw         $t0, 0xC($s0)
    sw         $t1, 0x14($s0)
    sw         $t2, 0x1C($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x7
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $22, 0x4($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    j          .L8002842C
    addi       $s0, $s0, 0x20
  .L800281D4:
    lw         $t0, 0x0($s5)
    lw         $t1, 0x0($s6)
    lw         $t2, 0x0($s7)
    sw         $t0, 0xC($s0)
    sw         $t1, 0x14($s0)
    sw         $t2, 0x1C($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x7
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    j          .L8002842C
    addi       $s0, $s0, 0x20
  .L80028228:
    andi       $t0, $v0, 0x2
    bnez       $t0, .L8002835C
    mfc2       $t0, $8
    nop
    bnez       $t0, .L80028524
    lui        $t0, (0xE1000268 >> 16)
    beqz       $s3, .L800282D4
    ori        $t0, $t0, (0xE1000268 & 0xFFFF)
    sw         $t0, 0x4($s0)
    swc2       $12, 0xC($s0)
    swc2       $13, 0x14($s0)
    swc2       $14, 0x1C($s0)
    lw         $t0, 0x4C($fp)
    lw         $t1, 0x50($fp)
    lw         $t2, 0x54($fp)
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    lwc2       $2, 0x0($t1)
    lwc2       $3, 0x4($t1)
    lwc2       $4, 0x0($t2)
    lwc2       $5, 0x4($t2)
    mtc2       $v1, $6
    nop
    nop
    NCDT
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x7
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $20, 0x8($s0)
    swc2       $21, 0x10($s0)
    swc2       $22, 0x18($s0)
    lbu        $t0, 0xB($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0xB($s0)
    j          .L8002842C
    addi       $s0, $s0, 0x20
  .L800282D4:
    swc2       $12, 0x8($s0)
    swc2       $13, 0x10($s0)
    swc2       $14, 0x18($s0)
    lw         $t0, 0x4C($fp)
    lw         $t1, 0x50($fp)
    lw         $t2, 0x54($fp)
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    lwc2       $2, 0x0($t1)
    lwc2       $3, 0x4($t1)
    lwc2       $4, 0x0($t2)
    lwc2       $5, 0x4($t2)
    mtc2       $v1, $6
    nop
    nop
    NCDT
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x6
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $20, 0x4($s0)
    swc2       $21, 0xC($s0)
    swc2       $22, 0x14($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    j          .L8002842C
    addi       $s0, $s0, 0x1C
  .L8002835C:
    swc2       $12, 0x8($s0)
    swc2       $13, 0x14($s0)
    swc2       $14, 0x20($s0)
    mfc2       $t0, $8
    nop
    bnez       $t0, .L8002868C
    lw         $t0, 0x4C($fp)
    lw         $t1, 0x50($fp)
    lw         $t2, 0x54($fp)
    lui        $t3, (0x34000000 >> 16)
    lui        $t4, (0x2FFFFFF >> 16)
    ori        $t4, $t4, (0x2FFFFFF & 0xFFFF)
    and        $t0, $t0, $t4
    or         $t0, $t0, $t3
    sw         $t0, 0x4($s0)
    and        $t1, $t1, $t4
    or         $t1, $t1, $t3
    sw         $t1, 0x10($s0)
    and        $t2, $t2, $t4
    or         $t2, $t2, $t3
    sw         $t2, 0x1C($s0)
    lw         $t3, 0x80($fp)
    lw         $t0, 0x0($s5)
    lw         $t1, 0x0($s6)
    lw         $t2, 0x0($s7)
    beqz       $t3, .L800283DC
    srl        $t3, $t1, 16
    andi       $t3, $t3, 0xFF9F
    ori        $t3, $t3, 0x20
    andi       $t1, $t1, 0xFFFF
    sll        $t3, $t3, 16
    or         $t1, $t1, $t3
  .L800283DC:
    sw         $t0, 0xC($s0)
    sw         $t1, 0x18($s0)
    sw         $t2, 0x24($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x9
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    lw         $t3, 0x80($fp)
    addi       $s0, $s0, 0x28
    bnez       $t3, .L80028434
    nop
  .L8002842C:
    jr         $ra
    nop
  .L80028434:
    mtc2       $t3, $8
    lui        $t0, (0x808080 >> 16)
    ori        $t0, $t0, (0x808080 & 0xFFFF)
    mfc2       $t1, $12
    mfc2       $t2, $13
    mfc2       $t3, $14
    mtc2       $t0, $6
    sw         $t1, 0x8($s0)
    sw         $t2, 0x10($s0)
    sw         $t3, 0x18($s0)
    DPCS
    srl        $t0, $t1, 16
    sb         $t0, 0xD($s0)
    srl        $t0, $t2, 16
    sb         $t0, 0x15($s0)
    srl        $t0, $t3, 16
    sb         $t0, 0x1D($s0)
    andi       $t1, $t1, 0xFFFF
    andi       $t2, $t2, 0xFFFF
    andi       $t3, $t3, 0xFFFF
    slt        $at, $t2, $t1
    bnez       $at, .L800284A4
    nop
    slt        $at, $t3, $t1
    bnez       $at, .L800284B8
    nop
    bgez       $zero, .L800284BC
    andi       $t0, $t1, 0xFFC0
  .L800284A4:
    slt        $at, $t3, $t2
    bnez       $at, .L800284B8
    nop
    bgez       $zero, .L800284BC
    andi       $t0, $t2, 0xFFC0
  .L800284B8:
    andi       $t0, $t3, 0xFFC0
  .L800284BC:
    subu       $t1, $t1, $t0
    subu       $t2, $t2, $t0
    subu       $t3, $t3, $t0
    sb         $t1, 0xC($s0)
    sb         $t2, 0x14($s0)
    sb         $t3, 0x1C($s0)
    lw         $t1, 0x88($fp)
    srl        $t0, $t0, 6
    or         $t0, $t0, $t1
    sh         $t0, 0x16($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x7
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    mfc2       $t0, $22
    lui        $t1, (0x24808080 >> 16)
    ori        $t1, $t1, (0x24808080 & 0xFFFF)
    subu       $t0, $t1, $t0
    sw         $t0, 0x4($s0)
    j          .L8002842C
    addiu      $s0, $s0, 0x20
  .L80028524:
    cfc2       $t0, $21
    cfc2       $t1, $22
    cfc2       $t3, $23
    sw         $t0, 0x70($fp)
    sw         $t1, 0x74($fp)
    sw         $t3, 0x78($fp)
    lb         $t0, 0x7C($fp)
    lb         $t1, 0x7D($fp)
    lb         $t3, 0x7E($fp)
    sll        $t0, $t0, 4
    sll        $t1, $t1, 4
    sll        $t3, $t3, 4
    ctc2       $t0, $21
    ctc2       $t1, $22
    ctc2       $t3, $23
    lw         $t0, 0x4C($fp)
    lw         $t1, 0x50($fp)
    lw         $t2, 0x54($fp)
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    lwc2       $2, 0x0($t1)
    lwc2       $3, 0x4($t1)
    lwc2       $4, 0x0($t2)
    lwc2       $5, 0x4($t2)
    mtc2       $v1, $6
    nop
    nop
    NCDT
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x6
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    lw         $t1, 0x70($fp)
    lw         $t2, 0x74($fp)
    lw         $t3, 0x78($fp)
    swc2       $20, 0x4($s0)
    swc2       $21, 0xC($s0)
    swc2       $22, 0x14($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    ctc2       $t1, $21
    ctc2       $t2, $22
    ctc2       $t3, $23
    j          .L8002842C
    addi       $s0, $s0, 0x1C
  .L800285F4:
    lw         $t0, 0x4C($fp)
    nop
    lwc2       $0, 0x0($t0)
    lwc2       $1, 0x4($t0)
    lw         $t0, 0xC($v1)
    lui        $t1, (0xEFFFFFFF >> 16)
    lui        $t2, (0x2000000 >> 16)
    ori        $t1, $t1, (0xEFFFFFFF & 0xFFFF)
    or         $t0, $t2, $t0
    and        $t0, $t1, $t0
    mtc2       $t0, $6
    nop
    nop
    NCDS
    lw         $t0, 0x0($s5)
    lw         $t1, 0x0($s6)
    lw         $t2, 0x0($s7)
    lui        $t3, (0x200000 >> 16)
    or         $t1, $t3, $t1
    sw         $t0, 0xC($s0)
    sw         $t1, 0x14($s0)
    sw         $t2, 0x1C($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x7
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $22, 0x4($s0)
    lbu        $t0, 0x7($s0)
    nop
    or         $t0, $t0, $s3
    sb         $t0, 0x7($s0)
    j          .L8002871C
    addi       $s0, $s0, 0x20
  .L8002868C:
    lw         $t0, 0x4C($fp)
    lw         $t1, 0x50($fp)
    lw         $t2, 0x54($fp)
    lui        $t3, (0x36000000 >> 16)
    lui        $t4, (0xFFFFFF >> 16)
    ori        $t4, $t4, (0xFFFFFF & 0xFFFF)
    and        $t0, $t0, $t4
    or         $t0, $t0, $t3
    sw         $t0, 0x4($s0)
    and        $t1, $t1, $t4
    or         $t1, $t1, $t3
    sw         $t1, 0x10($s0)
    and        $t2, $t2, $t4
    or         $t2, $t2, $t3
    sw         $t2, 0x1C($s0)
    lw         $t0, 0x0($s5)
    lw         $t1, 0x0($s6)
    lw         $t2, 0x0($s7)
    lui        $t3, (0x200000 >> 16)
    or         $t1, $t3, $t1
    sw         $t0, 0xC($s0)
    sw         $t1, 0x18($s0)
    sw         $t2, 0x24($s0)
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x9
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    swc2       $12, 0x8($s0)
    swc2       $13, 0x14($s0)
    swc2       $14, 0x20($s0)
    addi       $s0, $s0, 0x28
  .L8002871C:
    lui        $t4, %hi(depthQBackColor)
    lw         $t4, %lo(depthQBackColor)($t4)
    nop
    mtc2       $t4, $6
    nop
    nop
    DPCS
    lui        $t1, (0xFFFFFF >> 16)
    ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    addu       $t0, $t6, $s1
    lw         $t3, 0x0($t0)
    ori        $t2, $zero, 0x6
    sw         $t3, 0x0($s0)
    and        $t3, $s0, $t1
    sb         $t2, 0x3($s0)
    sw         $t3, 0x0($t0)
    mfc2       $t0, $22
    lui        $t1, (0x30000000 >> 16)
    or         $t4, $t1, $t4
    sub        $t0, $t4, $t0
    sw         $t0, 0x4($s0)
    sw         $t0, 0xC($s0)
    sw         $t0, 0x14($s0)
    swc2       $12, 0x8($s0)
    swc2       $13, 0x10($s0)
    swc2       $14, 0x18($s0)
    j          .L8002842C
    addiu      $s0, $s0, 0x1C
.size DRAW_MFace3_S, . - DRAW_MFace3_S

glabel DRAW_SplitModel_S
    addiu      $sp, $sp, -0x12C
    sw         $ra, 0xF0($sp)
    sw         $fp, 0xEC($sp)
    sw         $s7, 0xE8($sp)
    sw         $s6, 0xE4($sp)
    sw         $s5, 0xE0($sp)
    sw         $s4, 0xDC($sp)
    sw         $s3, 0xD8($sp)
    sw         $s2, 0xD4($sp)
    sw         $s1, 0xD0($sp)
    sw         $s0, 0xCC($sp)
    lw         $s0, 0x13C($sp)
    lw         $s1, 0x140($sp)
    lw         $s2, 0x14($a0)
    lw         $t0, 0x10($a0)
    addu       $s3, $s2, $zero
    sll        $t1, $t0, 1
    addu       $t1, $t1, $t0
    sll        $t1, $t1, 2
    addu       $s3, $s3, $t1
    lw         $t1, 0x8($s0)
    lw         $s0, 0x4($s0)
    lui        $fp, (0x1F800054 >> 16)
    sw         $t1, (0x1F800024 & 0xFFFF)($fp)
    lui        $t1, %hi(depthQBackColor)
    lw         $t1, %lo(depthQBackColor)($t1)
    addu       $t0, $zero, $zero
    sw         $t0, (0x1F800090 & 0xFFFF)($fp)
    sw         $s3, (0x1F800020 & 0xFFFF)($fp)
    sw         $t1, (0x1F80007C & 0xFFFF)($fp)
    lui        $t1, %hi(modelFadeValue)
    lw         $t1, %lo(modelFadeValue)($t1)
    nop
    sw         $t1, (0x1F800080 & 0xFFFF)($fp)
    beqz       $t1, .L80028820
    nop
    addiu      $t1, $zero, 0x2
  .L80028820:
    sw         $t1, (0x1F800084 & 0xFFFF)($fp)
    lui        $t0, gameTrackerX_HI
    ori        $t0, $t0, gameTrackerX_LO
    lw         $t1, 0x4($t0)
    nop
    xori       $t1, $t1, 0x1
    sll        $t1, $t1, 4
    ori        $t1, $t1, 0x100
    sw         $t1, (0x1F800088 & 0xFFFF)($fp)
    lui        $t1, draw_belowSplit_HI
    ori        $t1, $t1, draw_belowSplit_LO
    lw         $s4, 0x0($t1)
    nop
    bnez       $s4, .L80028868
    lui        $t1, DRAW_SplitModel_S_1_HI
    ori        $t1, $t1, DRAW_SplitModel_S_1_LO
    sw         $t1, (0x1F800000 & 0xFFFF)($fp)
    j          .L80028874
  .L80028868:
    lui        $t1, DRAW_SplitModel_S_2_HI
    ori        $t1, $t1, DRAW_SplitModel_S_2_LO
    sw         $t1, (0x1F800000 & 0xFFFF)($fp)
  .L80028874:
    lui        $t1, DRAW_SplitModel_S_4_HI
    ori        $t1, $t1, DRAW_SplitModel_S_4_LO
    sw         $t1, (0x1F800004 & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_5_HI
    ori        $t1, $t1, DRAW_SplitModel_S_5_LO
    sw         $t1, (0x1F800008 & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_7_HI
    ori        $t1, $t1, DRAW_SplitModel_S_7_LO
    sw         $t1, (0x1F80000C & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_6_HI
    ori        $t1, $t1, DRAW_SplitModel_S_6_LO
    sw         $t1, (0x1F800010 & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_8_HI
    ori        $t1, $t1, DRAW_SplitModel_S_8_LO
    sw         $t1, (0x1F800014 & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_9_HI
    ori        $t1, $t1, DRAW_SplitModel_S_9_LO
    sw         $t1, (0x1F800018 & 0xFFFF)($fp)
    lui        $t1, DRAW_SplitModel_S_3_HI
    ori        $t1, $t1, DRAW_SplitModel_S_3_LO
    sw         $t1, (0x1F80001C & 0xFFFF)($fp)
    sh         $zero, (0x1F80002C & 0xFFFF)($fp)
    sh         $zero, (0x1F800034 & 0xFFFF)($fp)
    sh         $zero, (0x1F80003C & 0xFFFF)($fp)
    lw         $a1, 0x4($a0)
    lui        $a0, gNormalList_HI
    ori        $a0, $a0, gNormalList_LO
    lw         $t0, 0x0($a3)
    lw         $t1, 0x4($a3)
    lw         $t2, 0x8($a3)
    lw         $t3, 0xC($a3)
    ctc2       $t0, $0
    ctc2       $t1, $1
    ctc2       $t2, $2
    ctc2       $t3, $3
    lw         $t0, 0x10($a3)
    lw         $t1, 0x14($a3)
    lw         $t2, 0x18($a3)
    lw         $t3, 0x1C($a3)
    ctc2       $t0, $4
    ctc2       $t1, $5
    ctc2       $t2, $6
    ctc2       $t3, $7
    j          .L8002892C
    nop

glabel DRAW_SplitModel_S_1
    addi       $s2, $s2, 0xC
  .L8002892C:
    lw         $t1, (0x1F800020 & 0xFFFF)($fp)
    nop
    sltu       $t2, $s2, $t1
    beqz       $t2, .L8002A8D8
    nop
    lw         $t1, (0x1F800024 & 0xFFFF)($fp)
    nop
    sltu       $t2, $s0, $t1
    beqz       $t2, .L8002A8D8
    nop
    lbu        $v0, 0x7($s2)
    lw         $v1, 0x8($s2)
    andi       $t0, $v0, 0x10
    bnez       $t0, DRAW_SplitModel_S_1
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t7, $a2, $t0
    addu       $t8, $a2, $t1
    addu       $t9, $a2, $t2
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t8)
    lh         $t2, 0x4($t9)
    nop
    slt        $s7, $zero, $t2
    sll        $s7, $s7, 1
    slt        $t3, $zero, $t1
    or         $s7, $s7, $t3
    sll        $s7, $s7, 1
    slt        $t3, $zero, $t0
    or         $s7, $s7, $t3
    sw         $zero, (0x1F80008C & 0xFFFF)($fp)
    lui        $t0, (0x1F800000 >> 16)
    sll        $t1, $s7, 2
    addu       $t0, $t0, $t1
    lw         $t1, (0x1F800000 & 0xFFFF)($t0)
    nop
    jr         $t1
    nop

glabel DRAW_SplitModel_S_2
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    ori        $s3, $zero, 0x2
    j          .L800289E8
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    
glabel DRAW_SplitModel_S_3
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
  .L800289E8:
    lwc2       $0, 0x0($t7)
    lwc2       $1, 0x4($t7)
    lwc2       $2, 0x0($t8)
    lwc2       $3, 0x4($t8)
    lwc2       $4, 0x0($t9)
    lwc2       $5, 0x4($t9)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80028A3C
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800058 & 0xFFFF)
    addi       $s6, $fp, (0x1F80005C & 0xFFFF)
    addi       $s7, $fp, (0x1F800060 & 0xFFFF)
  .L80028A3C:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L80028B08
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80028AF4
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L80028B1C
    nop
  .L80028AF4:
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L80028B1C
    nop
  .L80028B08:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
  .L80028B1C:
    jal        DRAW_MFace3_S
    nop
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_4
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t8)
    lh         $t2, 0x0($t7)
    lh         $t3, 0x0($t8)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028B64
    nop
    break      7
  .L80028B64:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028B7C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028B7C
    nop
    break      6
  .L80028B7C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800030 & 0xFFFF)($fp)
    lh         $t2, 0x2($t7)
    lh         $t3, 0x2($t8)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028BBC
    nop
    break      7
  .L80028BBC:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028BD4
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028BD4
    nop
    break      6
  .L80028BD4:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800032 & 0xFFFF)($fp)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t9)
    lh         $t2, 0x0($t7)
    lh         $t3, 0x0($t9)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028C1C
    nop
    break      7
  .L80028C1C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028C34
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028C34
    nop
    break      6
  .L80028C34:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800038 & 0xFFFF)($fp)
    lh         $t2, 0x2($t7)
    lh         $t3, 0x2($t9)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028C74
    nop
    break      7
  .L80028C74:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028C8C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028C8C
    nop
    break      6
  .L80028C8C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80003A & 0xFFFF)($fp)
    lwc2       $0, 0x0($t7)
    lwc2       $1, 0x4($t7)
    lwc2       $2, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $3, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $4, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80003C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80028E78
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    srl        $s6, $s6, 16
    sh         $s6, (0x1F800046 & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800058 & 0xFFFF)
    addi       $s6, $fp, (0x1F800044 & 0xFFFF)
    addi       $s7, $fp, (0x1F800048 & 0xFFFF)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t8)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800058 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005C & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028D38
    nop
    break      7
  .L80028D38:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028D50
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028D50
    nop
    break      6
  .L80028D50:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800044 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800059 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005D & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028D90
    nop
    break      7
  .L80028D90:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028DA8
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028DA8
    nop
    break      6
  .L80028DA8:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800045 & 0xFFFF)($fp)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t9)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800058 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800060 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028DF8
    nop
    break      7
  .L80028DF8:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028E10
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028E10
    nop
    break      6
  .L80028E10:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800048 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800059 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800061 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80028E50
    nop
    break      7
  .L80028E50:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80028E68
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80028E68
    nop
    break      6
  .L80028E68:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800049 & 0xFFFF)($fp)
  .L80028E78:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L80028F44
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80028F30
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L80028F60
    nop
  .L80028F30:
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L80028F60
    nop
  .L80028F44:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L80028F60:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    beqz       $s4, DRAW_SplitModel_S_1
    ori        $s3, $zero, 0x0
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    lwc2       $0, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $1, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $2, 0x0($t8)
    lwc2       $3, 0x4($t8)
    lwc2       $4, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80003C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80005A & 0xFFFF)($fp)
    lw         $t3, (0x1F800050 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800044 & 0xFFFF)
    addi       $s6, $fp, (0x1F80005C & 0xFFFF)
    addi       $s7, $fp, (0x1F800048 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    lwc2       $0, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80003C & 0xFFFF)($fp)
    lwc2       $2, 0x0($t8)
    lwc2       $3, 0x4($t8)
    lwc2       $4, 0x0($t9)
    lwc2       $5, 0x4($t9)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80005A & 0xFFFF)($fp)
    lw         $t3, (0x1F800054 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800048 & 0xFFFF)
    addi       $s6, $fp, (0x1F80005C & 0xFFFF)
    addi       $s7, $fp, (0x1F800060 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_5
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t7)
    lh         $t2, 0x0($t8)
    lh         $t3, 0x0($t7)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029048
    nop
    break      7
  .L80029048:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029060
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029060
    nop
    break      6
  .L80029060:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800028 & 0xFFFF)($fp)
    lh         $t2, 0x2($t8)
    lh         $t3, 0x2($t7)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L800290A0
    nop
    break      7
  .L800290A0:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L800290B8
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L800290B8
    nop
    break      6
  .L800290B8:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80002A & 0xFFFF)($fp)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t9)
    lh         $t2, 0x0($t8)
    lh         $t3, 0x0($t9)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029100
    nop
    break      7
  .L80029100:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029118
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029118
    nop
    break      6
  .L80029118:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800038 & 0xFFFF)($fp)
    lh         $t2, 0x2($t8)
    lh         $t3, 0x2($t9)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029158
    nop
    break      7
  .L80029158:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029170
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029170
    nop
    break      6
  .L80029170:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80003A & 0xFFFF)($fp)
    lwc2       $0, 0x0($t8)
    lwc2       $1, 0x4($t8)
    lwc2       $2, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $3, (0x1F80003C & 0xFFFF)($fp)
    lwc2       $4, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80002C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80029364
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    srl        $s5, $s5, 16
    sh         $s5, (0x1F80005E & 0xFFFF)($fp)
    srl        $s6, $s6, 16
    sh         $s6, (0x1F80004A & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F80005C & 0xFFFF)
    addi       $s6, $fp, (0x1F800048 & 0xFFFF)
    addi       $s7, $fp, (0x1F800040 & 0xFFFF)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t7)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F80005C & 0xFFFF)($fp)
    lbu        $t3, (0x1F800058 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029224
    nop
    break      7
  .L80029224:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002923C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002923C
    nop
    break      6
  .L8002923C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800040 & 0xFFFF)($fp)
    lbu        $t2, (0x1F80005D & 0xFFFF)($fp)
    lbu        $t3, (0x1F800059 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002927C
    nop
    break      7
  .L8002927C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029294
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029294
    nop
    break      6
  .L80029294:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800041 & 0xFFFF)($fp)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t9)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F80005C & 0xFFFF)($fp)
    lbu        $t3, (0x1F800060 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L800292E4
    nop
    break      7
  .L800292E4:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L800292FC
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L800292FC
    nop
    break      6
  .L800292FC:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800048 & 0xFFFF)($fp)
    lbu        $t2, (0x1F80005D & 0xFFFF)($fp)
    lbu        $t3, (0x1F800061 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002933C
    nop
    break      7
  .L8002933C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029354
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029354
    nop
    break      6
  .L80029354:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800049 & 0xFFFF)($fp)
  .L80029364:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L80029430
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L8002941C
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    sw         $t1, (0x1F80004C & 0xFFFF)($fp)
    sw         $t2, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002944C
    nop
  .L8002941C:
    sw         $t1, (0x1F80004C & 0xFFFF)($fp)
    sw         $t2, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002944C
    nop
  .L80029430:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L8002944C:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    beqz       $s4, DRAW_SplitModel_S_1
    ori        $s3, $zero, 0x0
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    lwc2       $0, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80003C & 0xFFFF)($fp)
    lwc2       $2, 0x0($t9)
    lwc2       $3, 0x4($t9)
    lwc2       $4, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80002C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80005E & 0xFFFF)($fp)
    lhu        $t2, (0x1F80004A & 0xFFFF)($fp)
    lw         $t3, (0x1F800050 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800048 & 0xFFFF)
    addi       $s6, $fp, (0x1F800060 & 0xFFFF)
    addi       $s7, $fp, (0x1F800040 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    lui        $t0, (0x1F800000 >> 16)
    lwc2       $0, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $2, 0x0($t9)
    lwc2       $3, 0x4($t9)
    lwc2       $4, 0x0($t7)
    lwc2       $5, 0x4($t7)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80004A & 0xFFFF)($fp)
    lhu        $t2, (0x1F800062 & 0xFFFF)($fp)
    lw         $t3, (0x1F800054 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800040 & 0xFFFF)
    addi       $s6, $fp, (0x1F800060 & 0xFFFF)
    addi       $s7, $fp, (0x1F800058 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_6
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t7)
    lh         $t2, 0x0($t9)
    lh         $t3, 0x0($t7)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029548
    nop
    break      7
  .L80029548:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029560
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029560
    nop
    break      6
  .L80029560:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800028 & 0xFFFF)($fp)
    lh         $t2, 0x2($t9)
    lh         $t3, 0x2($t7)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L800295A0
    nop
    break      7
  .L800295A0:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L800295B8
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L800295B8
    nop
    break      6
  .L800295B8:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80002A & 0xFFFF)($fp)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t8)
    lh         $t2, 0x0($t9)
    lh         $t3, 0x0($t8)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029600
    nop
    break      7
  .L80029600:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029618
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029618
    nop
    break      6
  .L80029618:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800030 & 0xFFFF)($fp)
    lh         $t2, 0x2($t9)
    lh         $t3, 0x2($t8)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029658
    nop
    break      7
  .L80029658:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029670
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029670
    nop
    break      6
  .L80029670:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800032 & 0xFFFF)($fp)
    lwc2       $0, 0x0($t9)
    lwc2       $1, 0x4($t9)
    lwc2       $2, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $3, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $4, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $5, (0x1F800034 & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80029864
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    srl        $s5, $s5, 16
    sh         $s5, (0x1F800062 & 0xFFFF)($fp)
    srl        $s6, $s6, 16
    sh         $s6, (0x1F800042 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800060 & 0xFFFF)
    addi       $s6, $fp, (0x1F800040 & 0xFFFF)
    addi       $s7, $fp, (0x1F800044 & 0xFFFF)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t7)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800060 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800058 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029724
    nop
    break      7
  .L80029724:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002973C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002973C
    nop
    break      6
  .L8002973C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800040 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800061 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800059 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002977C
    nop
    break      7
  .L8002977C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029794
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029794
    nop
    break      6
  .L80029794:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800041 & 0xFFFF)($fp)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t8)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800060 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005C & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L800297E4
    nop
    break      7
  .L800297E4:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L800297FC
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L800297FC
    nop
    break      6
  .L800297FC:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800044 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800061 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005D & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002983C
    nop
    break      7
  .L8002983C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029854
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029854
    nop
    break      6
  .L80029854:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800045 & 0xFFFF)($fp)
  .L80029864:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L80029934
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80029920
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    nop
    sw         $t2, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t1, (0x1F800054 & 0xFFFF)($fp)
    j          .L80029950
    nop
  .L80029920:
    sw         $t2, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t1, (0x1F800054 & 0xFFFF)($fp)
    j          .L80029950
    nop
  .L80029934:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L80029950:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    beqz       $s4, DRAW_SplitModel_S_1
    ori        $s3, $zero, 0x0
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    lwc2       $0, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $2, 0x0($t7)
    lwc2       $3, 0x4($t7)
    lwc2       $4, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $5, (0x1F800034 & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F800062 & 0xFFFF)($fp)
    lhu        $t2, (0x1F800042 & 0xFFFF)($fp)
    lw         $t3, (0x1F800050 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800040 & 0xFFFF)
    addi       $s6, $fp, (0x1F800058 & 0xFFFF)
    addi       $s7, $fp, (0x1F800044 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    lwc2       $0, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $1, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $2, 0x0($t7)
    lwc2       $3, 0x4($t7)
    lwc2       $4, 0x0($t8)
    lwc2       $5, 0x4($t8)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F800042 & 0xFFFF)($fp)
    lhu        $t2, (0x1F80005A & 0xFFFF)($fp)
    lw         $t3, (0x1F800054 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800044 & 0xFFFF)
    addi       $s6, $fp, (0x1F800058 & 0xFFFF)
    addi       $s7, $fp, (0x1F80005C & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F80004C & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_7
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t9)
    lh         $t2, 0x0($t8)
    lh         $t3, 0x0($t9)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029A48
    nop
    break      7
  .L80029A48:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029A60
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029A60
    nop
    break      6
  .L80029A60:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800030 & 0xFFFF)($fp)
    lh         $t2, 0x2($t8)
    lh         $t3, 0x2($t9)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029AA0
    nop
    break      7
  .L80029AA0:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029AB8
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029AB8
    nop
    break      6
  .L80029AB8:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800032 & 0xFFFF)($fp)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t9)
    lh         $t2, 0x0($t7)
    lh         $t3, 0x0($t9)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029B00
    nop
    break      7
  .L80029B00:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029B18
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029B18
    nop
    break      6
  .L80029B18:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800028 & 0xFFFF)($fp)
    lh         $t2, 0x2($t7)
    lh         $t3, 0x2($t9)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029B58
    nop
    break      7
  .L80029B58:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029B70
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029B70
    nop
    break      6
  .L80029B70:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80002A & 0xFFFF)($fp)
    lwc2       $0, 0x0($t7)
    lwc2       $1, 0x4($t7)
    lwc2       $2, 0x0($t8)
    lwc2       $3, 0x4($t8)
    lwc2       $4, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $5, (0x1F800034 & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80029D54
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800058 & 0xFFFF)
    addi       $s6, $fp, (0x1F80005C & 0xFFFF)
    addi       $s7, $fp, (0x1F800044 & 0xFFFF)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t9)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F80005C & 0xFFFF)($fp)
    lbu        $t3, (0x1F800060 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029C14
    nop
    break      7
  .L80029C14:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029C2C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029C2C
    nop
    break      6
  .L80029C2C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800044 & 0xFFFF)($fp)
    lbu        $t2, (0x1F80005D & 0xFFFF)($fp)
    lbu        $t3, (0x1F800061 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029C6C
    nop
    break      7
  .L80029C6C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029C84
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029C84
    nop
    break      6
  .L80029C84:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800045 & 0xFFFF)($fp)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t9)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800058 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800060 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029CD4
    nop
    break      7
  .L80029CD4:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029CEC
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029CEC
    nop
    break      6
  .L80029CEC:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800040 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800059 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800061 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029D2C
    nop
    break      7
  .L80029D2C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029D44
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029D44
    nop
    break      6
  .L80029D44:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800041 & 0xFFFF)($fp)
  .L80029D54:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L80029E20
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L80029E0C
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t1, (0x1F800054 & 0xFFFF)($fp)
    j          .L80029E3C
    nop
  .L80029E0C:
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t1, (0x1F800050 & 0xFFFF)($fp)
    sw         $t1, (0x1F800054 & 0xFFFF)($fp)
    j          .L80029E3C
    nop
  .L80029E20:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L80029E3C:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lwc2       $0, 0x0($t7)
    lwc2       $1, 0x4($t7)
    lwc2       $2, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $3, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $4, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80002C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80005E & 0xFFFF)($fp)
    lw         $t3, (0x1F80004C & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800058 & 0xFFFF)
    addi       $s6, $fp, (0x1F800044 & 0xFFFF)
    addi       $s7, $fp, (0x1F800040 & 0xFFFF)
    sh         $t1, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    beqz       $s4, DRAW_SplitModel_S_1
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    lwc2       $0, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $2, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $3, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $4, 0x0($t9)
    lwc2       $5, 0x4($t9)
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    nop
    RTPT
    lhu        $t1, (0x1F80005A & 0xFFFF)($fp)
    lhu        $t2, (0x1F80005E & 0xFFFF)($fp)
    lw         $t3, (0x1F800054 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800040 & 0xFFFF)
    addi       $s6, $fp, (0x1F800044 & 0xFFFF)
    addi       $s7, $fp, (0x1F800060 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    ori        $s3, $zero, 0x0
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_8
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t8)
    lh         $t2, 0x0($t7)
    lh         $t3, 0x0($t8)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029F24
    nop
    break      7
  .L80029F24:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029F3C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029F3C
    nop
    break      6
  .L80029F3C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800028 & 0xFFFF)($fp)
    lh         $t2, 0x2($t7)
    lh         $t3, 0x2($t8)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029F7C
    nop
    break      7
  .L80029F7C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029F94
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029F94
    nop
    break      6
  .L80029F94:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80002A & 0xFFFF)($fp)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t8)
    lh         $t2, 0x0($t9)
    lh         $t3, 0x0($t8)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L80029FDC
    nop
    break      7
  .L80029FDC:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L80029FF4
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L80029FF4
    nop
    break      6
  .L80029FF4:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800038 & 0xFFFF)($fp)
    lh         $t2, 0x2($t9)
    lh         $t3, 0x2($t8)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A034
    nop
    break      7
  .L8002A034:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A04C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A04C
    nop
    break      6
  .L8002A04C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80003A & 0xFFFF)($fp)
    lwc2       $0, 0x0($t9)
    lwc2       $1, 0x4($t9)
    lwc2       $2, 0x0($t7)
    lwc2       $3, 0x4($t7)
    lwc2       $4, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80002C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L8002A240
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    srl        $s5, $s5, 16
    sh         $s5, (0x1F800062 & 0xFFFF)($fp)
    srl        $s6, $s6, 16
    sh         $s6, (0x1F80005A & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800060 & 0xFFFF)
    addi       $s6, $fp, (0x1F800058 & 0xFFFF)
    addi       $s7, $fp, (0x1F800040 & 0xFFFF)
    lh         $t0, 0x4($t7)
    lh         $t1, 0x4($t8)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800058 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005C & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A100
    nop
    break      7
  .L8002A100:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A118
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A118
    nop
    break      6
  .L8002A118:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800040 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800059 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005D & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A158
    nop
    break      7
  .L8002A158:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A170
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A170
    nop
    break      6
  .L8002A170:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800041 & 0xFFFF)($fp)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t8)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800060 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005C & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A1C0
    nop
    break      7
  .L8002A1C0:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A1D8
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A1D8
    nop
    break      6
  .L8002A1D8:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800048 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800061 & 0xFFFF)($fp)
    lbu        $t3, (0x1F80005D & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A218
    nop
    break      7
  .L8002A218:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A230
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A230
    nop
    break      6
  .L8002A230:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800049 & 0xFFFF)($fp)
  .L8002A240:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L8002A310
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L8002A2FC
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    nop
    sw         $t2, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002A32C
    nop
  .L8002A2FC:
    sw         $t2, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002A32C
    nop
  .L8002A310:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L8002A32C:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lwc2       $0, 0x0($t9)
    lwc2       $1, 0x4($t9)
    lwc2       $2, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $3, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $4, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80003C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F800062 & 0xFFFF)($fp)
    lhu        $t2, (0x1F80005A & 0xFFFF)($fp)
    lw         $t3, (0x1F80004C & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800060 & 0xFFFF)
    addi       $s6, $fp, (0x1F800040 & 0xFFFF)
    addi       $s7, $fp, (0x1F800048 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    beqz       $s4, DRAW_SplitModel_S_1
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    lwc2       $0, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $1, (0x1F80003C & 0xFFFF)($fp)
    lwc2       $2, (0x1F800028 & 0xFFFF)($fp)
    lwc2       $3, (0x1F80002C & 0xFFFF)($fp)
    lwc2       $4, 0x0($t8)
    lwc2       $5, 0x4($t8)
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    nop
    RTPT
    lhu        $t1, (0x1F800062 & 0xFFFF)($fp)
    lhu        $t2, (0x1F800042 & 0xFFFF)($fp)
    lw         $t3, (0x1F800050 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800048 & 0xFFFF)
    addi       $s6, $fp, (0x1F800040 & 0xFFFF)
    addi       $s7, $fp, (0x1F80005C & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    ori        $s3, $zero, 0x0
    j          .L8002892C
    addi       $s2, $s2, 0xC
    
glabel DRAW_SplitModel_S_9
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t7)
    lh         $t2, 0x0($t9)
    lh         $t3, 0x0($t7)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A41C
    nop
    break      7
  .L8002A41C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A434
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A434
    nop
    break      6
  .L8002A434:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800038 & 0xFFFF)($fp)
    lh         $t2, 0x2($t9)
    lh         $t3, 0x2($t7)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A474
    nop
    break      7
  .L8002A474:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A48C
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A48C
    nop
    break      6
  .L8002A48C:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F80003A & 0xFFFF)($fp)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t7)
    lh         $t2, 0x0($t8)
    lh         $t3, 0x0($t7)
    sub        $t1, $t0, $t1
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A4D4
    nop
    break      7
  .L8002A4D4:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A4EC
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A4EC
    nop
    break      6
  .L8002A4EC:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800030 & 0xFFFF)($fp)
    lh         $t2, 0x2($t8)
    lh         $t3, 0x2($t7)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A52C
    nop
    break      7
  .L8002A52C:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A544
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A544
    nop
    break      6
  .L8002A544:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sh         $t2, (0x1F800032 & 0xFFFF)($fp)
    lwc2       $0, 0x0($t8)
    lwc2       $1, 0x4($t8)
    lwc2       $2, 0x0($t9)
    lwc2       $3, 0x4($t9)
    lwc2       $4, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $5, (0x1F80003C & 0xFFFF)($fp)
    nop
    nop
    RTPT
    andi       $t1, $v0, 0x2
    beqz       $t1, .L8002A738
    nop
    lw         $s5, 0x0($v1)
    lw         $s6, 0x4($v1)
    lw         $s7, 0x8($v1)
    sw         $s5, (0x1F800058 & 0xFFFF)($fp)
    sw         $s6, (0x1F80005C & 0xFFFF)($fp)
    sw         $s7, (0x1F800060 & 0xFFFF)($fp)
    srl        $s5, $s5, 16
    sh         $s5, (0x1F80005E & 0xFFFF)($fp)
    srl        $s6, $s6, 16
    sh         $s6, (0x1F800062 & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F80005C & 0xFFFF)
    addi       $s6, $fp, (0x1F800060 & 0xFFFF)
    addi       $s7, $fp, (0x1F800048 & 0xFFFF)
    lh         $t0, 0x4($t9)
    lh         $t1, 0x4($t7)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F800060 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800058 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A5F8
    nop
    break      7
  .L8002A5F8:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A610
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A610
    nop
    break      6
  .L8002A610:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800048 & 0xFFFF)($fp)
    lbu        $t2, (0x1F800061 & 0xFFFF)($fp)
    lbu        $t3, (0x1F800059 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A650
    nop
    break      7
  .L8002A650:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A668
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A668
    nop
    break      6
  .L8002A668:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800049 & 0xFFFF)($fp)
    lh         $t0, 0x4($t8)
    lh         $t1, 0x4($t7)
    nop
    sub        $t1, $t0, $t1
    lbu        $t2, (0x1F80005C & 0xFFFF)($fp)
    lbu        $t3, (0x1F800058 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A6B8
    nop
    break      7
  .L8002A6B8:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A6D0
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A6D0
    nop
    break      6
  .L8002A6D0:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800044 & 0xFFFF)($fp)
    lbu        $t2, (0x1F80005D & 0xFFFF)($fp)
    lbu        $t3, (0x1F800059 & 0xFFFF)($fp)
    nop
    sub        $t3, $t3, $t2
    mult       $t3, $t0
    mflo       $t3
    nop
    nop
    div        $zero, $t3, $t1
    bnez       $t1, .L8002A710
    nop
    break      7
  .L8002A710:
    addiu      $at, $zero, -0x1
    bne        $t1, $at, .L8002A728
    lui        $at, (0x80000000 >> 16)
    bne        $t3, $at, .L8002A728
    nop
    break      6
  .L8002A728:
    mflo       $t4
    nop
    add        $t2, $t2, $t4
    sb         $t2, (0x1F800045 & 0xFFFF)($fp)
  .L8002A738:
    andi       $t1, $v0, 0x1
    beqz       $t1, .L8002A804
    nop
    lhu        $t3, 0x0($s2)
    lhu        $t4, 0x2($s2)
    lhu        $t5, 0x4($s2)
    sll        $t0, $t3, 3
    addu       $t0, $t0, $a1
    lhu        $t0, 0x6($t0)
    sll        $t1, $t4, 3
    addu       $t1, $t1, $a1
    lhu        $t1, 0x6($t1)
    sll        $t2, $t5, 3
    addu       $t2, $t2, $a1
    lhu        $t2, 0x6($t2)
    sll        $t0, $t0, 3
    sll        $t1, $t1, 3
    sll        $t2, $t2, 3
    addu       $t0, $t0, $a0
    addu       $t1, $t1, $a0
    addu       $t2, $t2, $a0
    sw         $t0, (0x1F800064 & 0xFFFF)($fp)
    sw         $t1, (0x1F800068 & 0xFFFF)($fp)
    sw         $t2, (0x1F80006C & 0xFFFF)($fp)
    andi       $t1, $v0, 0x2
    beqz       $t1, .L8002A7F0
    nop
    lhu        $t0, 0x0($s2)
    lhu        $t1, 0x2($s2)
    lhu        $t2, 0x4($s2)
    addiu      $t3, $zero, 0x1080
    add        $t3, $t3, $a2
    sll        $t0, $t0, 2
    addu       $t0, $t0, $t3
    lw         $t0, 0x0($t0)
    sll        $t1, $t1, 2
    addu       $t1, $t1, $t3
    lw         $t1, 0x0($t1)
    sll        $t2, $t2, 2
    addu       $t2, $t2, $t3
    lw         $t2, 0x0($t2)
    sw         $t1, (0x1F80004C & 0xFFFF)($fp)
    sw         $t2, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002A820
    nop
  .L8002A7F0:
    sw         $t1, (0x1F80004C & 0xFFFF)($fp)
    sw         $t2, (0x1F800050 & 0xFFFF)($fp)
    sw         $t2, (0x1F800054 & 0xFFFF)($fp)
    j          .L8002A820
    nop
  .L8002A804:
    lbu        $t0, 0x6($s2)
    nop
    sll        $t0, $t0, 3
    addu       $t0, $t0, $a0
    sw         $t0, (0x1F80004C & 0xFFFF)($fp)
    sw         $t0, (0x1F800050 & 0xFFFF)($fp)
    sw         $t0, (0x1F800054 & 0xFFFF)($fp)
  .L8002A820:
    jal        DRAW_MFace3_S
    lw         $s3, (0x1F800084 & 0xFFFF)($fp)
    lwc2       $0, 0x0($t8)
    lwc2       $1, 0x4($t8)
    lwc2       $2, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $3, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $4, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $5, (0x1F800034 & 0xFFFF)($fp)
    nop
    nop
    RTPT
    lhu        $t1, (0x1F80005E & 0xFFFF)($fp)
    lhu        $t2, (0x1F800062 & 0xFFFF)($fp)
    lw         $t3, (0x1F80004C & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F80005C & 0xFFFF)
    addi       $s6, $fp, (0x1F800048 & 0xFFFF)
    addi       $s7, $fp, (0x1F800044 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    nop
    beqz       $s4, DRAW_SplitModel_S_1
    lw         $t0, (0x1F800090 & 0xFFFF)($fp)
    lwc2       $0, (0x1F800030 & 0xFFFF)($fp)
    lwc2       $1, (0x1F800034 & 0xFFFF)($fp)
    lwc2       $2, (0x1F800038 & 0xFFFF)($fp)
    lwc2       $3, (0x1F80003C & 0xFFFF)($fp)
    lwc2       $4, 0x0($t7)
    lwc2       $5, 0x4($t7)
    sw         $t0, (0x1F80008C & 0xFFFF)($fp)
    nop
    RTPT
    lhu        $t1, (0x1F80005E & 0xFFFF)($fp)
    lhu        $t2, (0x1F80004A & 0xFFFF)($fp)
    lw         $t3, (0x1F80004C & 0xFFFF)($fp)
    addi       $s5, $fp, (0x1F800044 & 0xFFFF)
    addi       $s6, $fp, (0x1F800048 & 0xFFFF)
    addi       $s7, $fp, (0x1F800058 & 0xFFFF)
    sh         $t1, 0x2($s5)
    sh         $t2, 0x2($s6)
    sw         $t3, (0x1F800054 & 0xFFFF)($fp)
    jal        DRAW_MFace3_S
    ori        $s3, $zero, 0x2
    j          .L8002892C
    addi       $s2, $s2, 0xC
  .L8002A8D8:
    addu       $v0, $s0, $zero
    lw         $ra, 0xF0($sp)
    lw         $fp, 0xEC($sp)
    lw         $s7, 0xE8($sp)
    lw         $s6, 0xE4($sp)
    lw         $s5, 0xE0($sp)
    lw         $s4, 0xDC($sp)
    lw         $s3, 0xD8($sp)
    lw         $s2, 0xD4($sp)
    lw         $s1, 0xD0($sp)
    lw         $s0, 0xCC($sp)
    addiu      $sp, $sp, 0x12C
    jr         $ra
    nop
.size DRAW_SplitModel_S, . - DRAW_SplitModel_S
