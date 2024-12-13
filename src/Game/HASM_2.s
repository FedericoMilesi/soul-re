.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"

glabel COLLIDE_NearestPointOnLine_S
    lw         $t0, 0x0($a1)
    lhu        $t1, 0x4($a1)
    lw         $t2, 0x0($a2)
    lhu        $t3, 0x4($a2)
    lw         $t8, 0x0($a3)
    lhu        $t9, 0x4($a3)
    srl        $t4, $t0, 16
    andi       $t5, $t0, 0xFFFF
    srl        $t6, $t2, 16
    andi       $t7, $t2, 0xFFFF
    sll        $v0, $t8, 16
    or         $v0, $v0, $t1
    sll        $v1, $t9, 16
    srl        $t8, $t8, 16
    or         $v1, $v1, $t8
    ctc2       $t0, $0
    ctc2       $v0, $1
    ctc2       $v1, $2
    subu       $t7, $t7, $t5
    subu       $t8, $t6, $t4
    subu       $t9, $t3, $t1
    sll        $v0, $t8, 16
    andi       $v1, $t7, 0xFFFF
    or         $v0, $v0, $v1
    ctc2       $v0, $3
    ctc2       $t9, $4
    mtc2       $v0, $0
    mtc2       $t9, $1
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    mfc2       $a1, $25
    mfc2       $a2, $26
    mfc2       $a3, $27
    sub        $a1, $a1, $a2
    beqz       $a3, .L80078290
    sll        $a1, $a1, 12
    neg        $a1, $a1
    div        $zero, $a1, $a3
    mtc2       $t7, $9
    mtc2       $t8, $10
    mtc2       $t9, $11
    mflo       $v0
  .L80078290:
    sltiu      $a1, $v0, 0x1001
    bnez       $a1, .L800782BC
    nop
    bgtz       $v0, .L800782B0
    nop
    sw         $t0, 0x0($a0)
    jr         $ra
    sh         $t1, 0x4($a0)
  .L800782B0:
    sw         $t2, 0x0($a0)
    jr         $ra
    sh         $t3, 0x4($a0)
  .L800782BC:
    mtc2       $v0, $8
    nop
    nop
    GPF        1
    mfc2       $t7, $9
    mfc2       $t8, $10
    mfc2       $t9, $11
    add        $t7, $t5, $t7
    add        $t8, $t4, $t8
    add        $t9, $t1, $t9
    sh         $t7, 0x0($a0)
    sh         $t8, 0x2($a0)
    jr         $ra
    sh         $t9, 0x4($a0)
.size COLLIDE_NearestPointOnLine_S, . - COLLIDE_NearestPointOnLine_S

glabel COLLIDE_IntersectLineAndPlane_S
    lw         $v0, 0x0($a1)
    lhu        $t2, 0x4($a1)
    lw         $t4, 0x0($a2)
    lhu        $t6, 0x4($a2)
    srl        $t1, $v0, 16
    andi       $t0, $v0, 0xFFFF
    srl        $t5, $t4, 16
    andi       $t4, $t4, 0xFFFF
    subu       $t4, $t4, $t0
    subu       $t5, $t5, $t1
    subu       $t6, $t6, $t2
    sll        $v1, $t4, 16
    or         $t7, $t2, $v1
    sll        $v1, $t6, 16
    andi       $a1, $t5, 0xFFFF
    or         $a1, $v1, $a1
    lwc2       $0, 0x0($a3)
    lwc2       $1, 0x4($a3)
    ctc2       $v0, $0
    ctc2       $t7, $1
    ctc2       $a1, $2
    lw         $t9, 0x10($sp)
    nop
    MVMVA      1, 0, 0, 3, 0
    mfc2       $v0, $25
    mfc2       $v1, $26
    subu       $t7, $v0, $t9
    beqz       $v1, .L800783C4
    sll        $t7, $t7, 12
    negu       $v0, $t7
    div        $zero, $v0, $v1
    mtc2       $t4, $9
    mtc2       $t5, $10
    mtc2       $t6, $11
    mflo       $t7
    sltiu      $v0, $t7, 0x1001
    beqz       $v0, .L800783C4
    nop
    mtc2       $t7, $8
    addiu      $v0, $zero, 0x1
    nop
    GPF        1
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    addu       $t0, $t0, $t4
    sh         $t0, 0x0($a0)
    addu       $t1, $t1, $t5
    sh         $t1, 0x2($a0)
    addu       $t2, $t2, $t6
    jr         $ra
    sh         $t2, 0x4($a0)
  .L800783C4:
    jr         $ra
    addu       $v0, $zero, $zero
.size COLLIDE_IntersectLineAndPlane_S, . - COLLIDE_IntersectLineAndPlane_S

glabel COLLIDE_NearestPointOnPlane_S
    lw         $t3, 0x0($a3)
    lh         $t5, 0x4($a3)
    lw         $t0, 0x0($a1)
    lh         $t2, 0x4($a1)
    ctc2       $t3, $0
    ctc2       $t5, $1
    mtc2       $t0, $0
    mtc2       $t2, $1
    sra        $t1, $t0, 16
    nop
    MVMVA      1, 0, 0, 3, 0
    sll        $t0, $t0, 16
    sra        $t0, $t0, 16
    mfc2       $t4, $25
    nop
    sub        $t4, $a2, $t4
    mtc2       $t4, $8
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    sra        $t4, $t3, 16
    nop
    GPF        1
    sll        $t3, $t3, 16
    sra        $t3, $t3, 16
    mfc2       $t0, $9
    mfc2       $t1, $10
    mfc2       $t2, $11
    add        $t0, $t0, $t3
    add        $t1, $t1, $t4
    add        $t2, $t2, $t5
    sh         $t0, 0x0($a0)
    sh         $t1, 0x2($a0)
    jr         $ra
    sh         $t2, 0x4($a0)
.size COLLIDE_NearestPointOnPlane_S, . - COLLIDE_NearestPointOnPlane_S

glabel func_80078458
    lw         $a0, 0x24($s0)
    andi       $v0, $s2, 0x10
    beqz       $v0, .L80078490
    lw         $s6, 0x0($s7)
    nop
    lw         $s6, 0x48($s6)
    lh         $v0, 0x2($s0)
    nop
    sll        $v0, $v0, 2
    add        $s6, $s6, $v0
    lh         $s6, 0x10($s6)
    lw         $v0, 0x38($s7)
    nop
    sub        $s6, $v0, $s6
  .L80078490:
    andi       $v0, $s2, 0x4
    addiu      $s4, $a0, 0x4
    lw         $s5, 0x0($a0)
    lw         $t1, 0x28($s0)
    lw         $fp, 0x0($s7)
    nop
    lw         $v1, 0x40($fp)
    lw         $fp, 0x1C($fp)
    beqz       $v0, .L800787F4
    lw         $t0, 0x2C($s0)
    beqz       $t1, .L8007870C
    lui        $v0, gameTrackerX_HI
    ori        $v0, $v0, gameTrackerX_LO
    lw         $a3, 0x8($v0)
    nop
    srl        $a2, $a3, 16
    andi       $a3, $a3, 0xFFFF
    addiu      $v0, $zero, 0x3E8
    beq        $a3, $v0, .L80078524
    nop
    sll        $a3, $a3, 12
    divu       $zero, $a3, $v0
    bnez       $v0, .L800784F4
    nop
    break      7
  .L800784F4:
    mflo       $a3
    nop
    bnez       $a3, .L80078508
    nop
    addiu      $a3, $zero, 0x1
  .L80078508:
    beqz       $a2, .L80078518
    nop
    addiu      $v0, $zero, 0x1000
    sub        $a3, $v0, $a3
  .L80078518:
    addu       $a2, $v1, $zero
    bgez       $zero, .L80078534
    nop
  .L80078524:
    addu       $a3, $zero, $zero
    beqz       $a2, .L80078534
    nop
    addu       $a2, $v1, $zero
  .L80078534:
    lh         $t2, 0x2($t0)
    lh         $v0, 0x0($t0)
    add        $t2, $t2, $s3
    slt        $at, $t2, $s5
    bnez       $at, .L80078550
    sll        $t3, $v0, 1
    sub        $t2, $t2, $s5
  .L80078550:
    add        $t3, $t3, $v0
    sll        $t3, $t3, 2
    add        $t3, $t3, $fp
    beqz       $a3, .L80078618
    nop
    sll        $v0, $v0, 1
    add        $v0, $v0, $a2
    lh         $t6, 0x0($v0)
    nop
    andi       $t4, $t6, 0x1F
    sll        $t4, $t4, 3
    andi       $t5, $t6, 0x3E0
    srl        $t5, $t5, 2
    andi       $t6, $t6, 0x7C00
    srl        $t6, $t6, 7
    lh         $t9, 0x6($t3)
    mtc2       $a3, $8
    andi       $t7, $t9, 0x1F
    sll        $t7, $t7, 3
    andi       $t8, $t9, 0x3E0
    srl        $t8, $t8, 2
    andi       $t9, $t9, 0x7C00
    srl        $t9, $t9, 7
    sub        $t4, $t4, $t7
    sll        $t4, $t4, 4
    mtc2       $t4, $9
    sub        $t5, $t5, $t8
    sll        $t5, $t5, 4
    mtc2       $t5, $10
    sub        $t6, $t6, $t9
    sll        $t6, $t6, 4
    mtc2       $t6, $11
    sll        $t7, $t7, 4
    mtc2       $t7, $25
    sll        $t8, $t8, 4
    mtc2       $t8, $26
    sll        $t9, $t9, 4
    mtc2       $t9, $27
    nop
    nop
    GPL        1
    mfc2       $t4, $22
    nop
    srl        $t5, $t4, 8
    andi       $t5, $t5, 0xFF
    srl        $t6, $t4, 16
    andi       $t6, $t6, 0xFF
    andi       $t4, $t4, 0xFF
    bgez       $zero, .L8007864C
    nop
  .L80078618:
    beqz       $a2, .L8007862C
    sll        $v0, $v0, 1
    add        $v0, $v0, $a2
    bgez       $zero, .L80078630
    lh         $t6, 0x0($v0)
  .L8007862C:
    lh         $t6, 0x6($t3)
  .L80078630:
    nop
    andi       $t4, $t6, 0x1F
    sll        $t4, $t4, 3
    andi       $t5, $t6, 0x3E0
    srl        $t5, $t5, 2
    andi       $t6, $t6, 0x7C00
    srl        $t6, $t6, 7
  .L8007864C:
    sll        $v0, $t2, 1
    add        $v0, $v0, $t2
    add        $t2, $s4, $v0
    lb         $t7, 0x0($t2)
    lb         $t8, 0x1($t2)
    lb         $t9, 0x2($t2)
    andi       $v0, $s2, 0x10
    beqz       $v0, .L8007868C
    lh         $v1, 0x4($t3)
    nop
    slt        $at, $s6, $v1
    beqz       $at, .L8007868C
    nop
    addu       $t7, $zero, $zero
    addu       $t8, $zero, $zero
    addu       $t9, $zero, $zero
  .L8007868C:
    beqz       $a2, .L800786AC
    addiu      $v0, $zero, 0x100
    bnez       $a3, .L800786AC
    and        $v0, $s2, $v0
    beqz       $v0, .L800786AC
    addu       $v0, $t7, $zero
    addu       $t7, $t9, $zero
    addu       $t9, $v0, $zero
  .L800786AC:
    add        $t4, $t4, $t7
    andi       $t7, $t4, 0xFF00
    beqz       $t7, .L800786C8
    add        $t5, $t5, $t8
    bgez       $t4, .L800786C8
    addi       $t4, $zero, 0xFF
    addu       $t4, $zero, $zero
  .L800786C8:
    andi       $t8, $t5, 0xFF00
    beqz       $t8, .L800786E0
    add        $t6, $t6, $t9
    bgez       $t5, .L800786E0
    addi       $t5, $zero, 0xFF
    addu       $t5, $zero, $zero
  .L800786E0:
    andi       $t9, $t6, 0xFF00
    beqz       $t9, .L800786F8
    sb         $t4, 0x8($t3)
    bgez       $t6, .L800786F8
    addi       $t6, $zero, 0xFF
    addu       $t6, $zero, $zero
  .L800786F8:
    sb         $t5, 0x9($t3)
    sb         $t6, 0xA($t3)
    addi       $t1, $t1, -0x1
    bnez       $t1, .L80078534
    addi       $t0, $t0, 0x4
  .L8007870C:
    lw         $t1, 0x30($s0)
    nop
    beqz       $t1, .L80078948
    lw         $t0, 0x34($s0)
  .L8007871C:
    nop
    lh         $s4, 0x2($t0)
    lh         $s5, 0x4($t0)
    sll        $v0, $s4, 1
    add        $s4, $s4, $v0
    sll        $s4, $s4, 2
    add        $s4, $s4, $fp
    sll        $v0, $s5, 1
    add        $s5, $s5, $v0
    sll        $s5, $s5, 2
    add        $s5, $s5, $fp
    lw         $t4, 0x8($s4)
    lw         $t7, 0x8($s5)
    sll        $t6, $t4, 8
    srl        $t6, $t6, 24
    sll        $t5, $t4, 16
    srl        $t5, $t5, 24
    andi       $t4, $t4, 0xFF
    lh         $v0, 0x6($t0)
    sll        $t9, $t7, 8
    srl        $t9, $t9, 24
    sll        $t8, $t7, 16
    srl        $t8, $t8, 24
    andi       $t7, $t7, 0xFF
    sub        $t7, $t7, $t4
    sub        $t8, $t8, $t5
    sub        $t9, $t9, $t6
    mtc2       $v0, $8
    mtc2       $t7, $9
    mtc2       $t8, $10
    mtc2       $t9, $11
    nop
    nop
    GPF        1
    lh         $t3, 0x0($t0)
    nop
    sll        $v0, $t3, 1
    add        $t3, $t3, $v0
    sll        $t3, $t3, 2
    add        $t3, $t3, $fp
    mfc2       $t7, $9
    mfc2       $t8, $10
    mfc2       $t9, $11
    add        $t4, $t4, $t7
    add        $t5, $t5, $t8
    add        $t6, $t6, $t9
    sb         $t4, 0x8($t3)
    sb         $t5, 0x9($t3)
    sb         $t6, 0xA($t3)
    addi       $t1, $t1, -0x1
    bnez       $t1, .L8007871C
    addi       $t0, $t0, 0x8
    bgez       $zero, .L80078948
    nop
  .L800787F4:
    andi       $v0, $s2, 0x8
    beqz       $v0, .L80078948
    nop
    beqz       $t1, .L80078878
  .L80078804:
    lh         $t2, 0x8($t0)
    lh         $t3, 0x0($t0)
    add        $t2, $t2, $s3
    slt        $at, $t2, $s5
    bnez       $at, .L80078820
    sll        $v0, $t3, 1
    sub        $t2, $t2, $s5
  .L80078820:
    lh         $t4, 0x2($t0)
    lh         $t5, 0x4($t0)
    lh         $t6, 0x6($t0)
    add        $t3, $t3, $v0
    sll        $t3, $t3, 2
    add        $t3, $t3, $fp
    sll        $v0, $t2, 2
    sll        $t2, $t2, 1
    add        $v0, $v0, $t2
    add        $t2, $s4, $v0
    lh         $t7, 0x0($t2)
    lh         $t8, 0x2($t2)
    lh         $t9, 0x4($t2)
    add        $t4, $t4, $t7
    add        $t5, $t5, $t8
    add        $t6, $t6, $t9
    sh         $t4, 0x0($t3)
    sh         $t5, 0x2($t3)
    sh         $t6, 0x4($t3)
    addi       $t1, $t1, -0x1
    bnez       $t1, .L80078804
    addi       $t0, $t0, 0xA
  .L80078878:
    lw         $t1, 0x30($s0)
    nop
    beqz       $t1, .L80078948
    lw         $t0, 0x34($s0)
  .L80078888:
    nop
    lh         $s4, 0x2($t0)
    lh         $s5, 0x4($t0)
    sll        $v0, $s4, 1
    add        $s4, $s4, $v0
    sll        $s4, $s4, 2
    add        $s4, $s4, $fp
    sll        $v0, $s5, 1
    add        $s5, $s5, $v0
    sll        $s5, $s5, 2
    add        $s5, $s5, $fp
    lw         $t4, 0x0($s4)
    lw         $t7, 0x0($s5)
    lh         $t6, 0x4($s4)
    lh         $t9, 0x4($s5)
    srl        $t5, $t4, 16
    andi       $t4, $t4, 0xFFFF
    srl        $t8, $t7, 16
    andi       $t9, $t9, 0xFFFF
    lh         $v0, 0x6($t0)
    sub        $t7, $t7, $t4
    sub        $t8, $t8, $t5
    sub        $t9, $t9, $t6
    mtc2       $v0, $8
    mtc2       $t7, $9
    mtc2       $t8, $10
    mtc2       $t9, $11
    nop
    nop
    GPF        1
    lh         $t3, 0x0($t0)
    nop
    sll        $v0, $t3, 1
    add        $t3, $t3, $v0
    sll        $t3, $t3, 2
    add        $t3, $t3, $fp
    mfc2       $t7, $9
    mfc2       $t8, $10
    mfc2       $t9, $11
    add        $t4, $t4, $t7
    add        $t5, $t5, $t8
    add        $t6, $t6, $t9
    sh         $t4, 0x0($t3)
    sh         $t5, 0x2($t3)
    sh         $t6, 0x4($t3)
    addi       $t1, $t1, -0x1
    bnez       $t1, .L80078888
    addi       $t0, $t0, 0x8
  .L80078948:
    jr         $ra
    nop
.size func_80078458, . - func_80078458

glabel VM_ProcessVMObjectSetColor_S
    lui        $v0, (0x1F800024 >> 16)
    sw         $ra, (0x1F800000 & 0xFFFF)($v0)
    sw         $s0, (0x1F800004 & 0xFFFF)($v0)
    sw         $s1, (0x1F800008 & 0xFFFF)($v0)
    sw         $s2, (0x1F80000C & 0xFFFF)($v0)
    sw         $s3, (0x1F800010 & 0xFFFF)($v0)
    sw         $s4, (0x1F800014 & 0xFFFF)($v0)
    sw         $s5, (0x1F800018 & 0xFFFF)($v0)
    sw         $s6, (0x1F80001C & 0xFFFF)($v0)
    sw         $s7, (0x1F800020 & 0xFFFF)($v0)
    sw         $fp, (0x1F800024 & 0xFFFF)($v0)
    addu       $s0, $a1, $zero
    addu       $s7, $a0, $zero
    lw         $s2, 0x0($s0)
    lw         $s3, 0xC($s0)
    jal        func_80078458
    nop
    lui        $v0, (0x1F800018 >> 16)
    lw         $ra, (0x1F800000 & 0xFFFF)($v0)
    lw         $s0, (0x1F800004 & 0xFFFF)($v0)
    lw         $s1, (0x1F800008 & 0xFFFF)($v0)
    lw         $s2, (0x1F80000C & 0xFFFF)($v0)
    lw         $s3, (0x1F800010 & 0xFFFF)($v0)
    lw         $s4, (0x1F800014 & 0xFFFF)($v0)
    lw         $s6, (0x1F80001C & 0xFFFF)($v0)
    lw         $s7, (0x1F800020 & 0xFFFF)($v0)
    lw         $fp, (0x1F800024 & 0xFFFF)($v0)
    jr         $ra
    lw         $s5, (0x1F800018 & 0xFFFF)($v0)
.size VM_ProcessVMObjectSetColor_S, . - VM_ProcessVMObjectSetColor_S

glabel VM_ProcessVMObjectList_S
    lui        $v0, (0x1F800024 >> 16)
    sw         $ra, (0x1F800000 & 0xFFFF)($v0)
    sw         $s0, (0x1F800004 & 0xFFFF)($v0)
    sw         $s1, (0x1F800008 & 0xFFFF)($v0)
    sw         $s2, (0x1F80000C & 0xFFFF)($v0)
    sw         $s3, (0x1F800010 & 0xFFFF)($v0)
    sw         $s4, (0x1F800014 & 0xFFFF)($v0)
    sw         $s5, (0x1F800018 & 0xFFFF)($v0)
    sw         $s6, (0x1F80001C & 0xFFFF)($v0)
    sw         $s7, (0x1F800020 & 0xFFFF)($v0)
    sw         $fp, (0x1F800024 & 0xFFFF)($v0)
    lw         $s1, 0x8($a0)
    lw         $s0, 0xC($a0)
    beqz       $s1, .L80078A58
    addu       $s7, $a0, $zero
  .L80078A00:
    lw         $s2, 0x0($s0)
    lw         $s3, 0xC($s0)
    andi       $v0, $s2, 0x2
    bnez       $v0, .L80078A4C
    nop
    lw         $a0, 0x24($s0)
    nop
    lw         $s4, 0x0($a0)
    addiu      $s3, $s3, 0x1
    slt        $at, $s3, $s4
    bnez       $at, .L80078A34
    nop
    addu       $s3, $zero, $zero
  .L80078A34:
    jal        BSP_SphereIntersectsViewVolume_S
    addi       $a0, $s0, 0x10
    beqz       $v0, .L80078A4C
    sw         $s3, 0xC($s0)
    jal        func_80078458
    nop
  .L80078A4C:
    addi       $s1, $s1, -0x1
    bnez       $s1, .L80078A00
    addi       $s0, $s0, 0x3C
  .L80078A58:
    lui        $v0, (0x1F800018 >> 16)
    lw         $ra, (0x1F800000 & 0xFFFF)($v0)
    lw         $s0, (0x1F800004 & 0xFFFF)($v0)
    lw         $s1, (0x1F800008 & 0xFFFF)($v0)
    lw         $s2, (0x1F80000C & 0xFFFF)($v0)
    lw         $s3, (0x1F800010 & 0xFFFF)($v0)
    lw         $s4, (0x1F800014 & 0xFFFF)($v0)
    lw         $s6, (0x1F80001C & 0xFFFF)($v0)
    lw         $s7, (0x1F800020 & 0xFFFF)($v0)
    lw         $fp, (0x1F800024 & 0xFFFF)($v0)
    jr         $ra
    lw         $s5, (0x1F800018 & 0xFFFF)($v0)
.size VM_ProcessVMObjectList_S, . - VM_ProcessVMObjectList_S

glabel BSP_SphereIntersectsViewVolume_S
    lw         $t4, 0x8($a1)
    lw         $t5, 0xC($a1)
    ctc2       $t4, $0
    ctc2       $t5, $1
    lw         $t4, 0x10($a1)
    lw         $t5, 0x14($a1)
    lw         $t6, 0x18($a1)
    ctc2       $t4, $2
    ctc2       $t5, $3
    ctc2       $t6, $4
    lwc2       $0, 0x0($a0)
    lwc2       $1, 0x4($a0)
    lhu        $a2, 0x6($a0)
    lw         $v0, 0x48($a1)
    MVMVA      1, 0, 0, 3, 0
    lw         $t7, 0x64($a1)
    negu       $a3, $a2
    mfc2       $t0, $25
    mfc2       $t1, $26
    mfc2       $t2, $27
    subu       $t0, $t0, $v0
    slt        $v0, $a3, $t0
    beqz       $v0, .L80078B58
    addu       $v1, $t7, $a2
    lw         $t8, 0x4C($a1)
    slt        $v0, $t0, $v1
    beqz       $v0, .L80078B58
    subu       $v1, $t1, $t8
    lw         $t9, 0x50($a1)
    slt        $v0, $a3, $v1
    beqz       $v0, .L80078B58
    subu       $v1, $t2, $t9
    slt        $v0, $a3, $v1
    beqz       $v0, .L80078B58
    nop
    lw         $t4, 0x28($a1)
    lw         $t5, 0x2C($a1)
    lw         $t6, 0x30($a1)
    ctc2       $t4, $0
    ctc2       $t5, $1
    ctc2       $t6, $2
    lw         $v1, 0x54($a1)
    nop
    MVMVA      1, 0, 0, 3, 0
    lw         $a0, 0x58($a1)
    mfc2       $t0, $25
    mfc2       $t1, $26
    subu       $v0, $t0, $v1
    slt        $v0, $a3, $v0
    beqz       $v0, .L80078B58
    subu       $v1, $t1, $a0
    slt        $v0, $a3, $v1
  .L80078B58:
    jr         $ra
    nop
.size BSP_SphereIntersectsViewVolume_S, . - BSP_SphereIntersectsViewVolume_S

glabel RotMatrixZYX
    lh         $t9, 0x4($a0)
    lh         $t8, 0x2($a0)
    lh         $t7, 0x0($a0)
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    andi       $t0, $t9, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t5, 0x0($t0)
    lh         $t2, 0x800($t0)
    andi       $t3, $t9, 0x800
    beqz       $t3, .L80078B9C
    nop
    neg        $t5, $t5
    neg        $t2, $t2
  .L80078B9C:
    or         $t4, $t8, $t7
    beqz       $t4, .L80078CC8
    nop
    andi       $t0, $t8, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t4, 0x0($t0)
    lh         $t1, 0x800($t0)
    andi       $t3, $t8, 0x800
    beqz       $t3, .L80078BD0
    nop
    neg        $t1, $t1
    neg        $t4, $t4
  .L80078BD0:
    andi       $t0, $t7, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t3, 0x0($t0)
    lh         $t0, 0x800($t0)
    andi       $t6, $t7, 0x800
    beqz       $t6, .L80078BF8
    nop
    neg        $t3, $t3
    neg        $t0, $t0
  .L80078BF8:
    mtc2       $t1, $9
    mtc2       $t2, $10
    mtc2       $t5, $11
    mtc2       $t0, $8
    mult       $t1, $t2
    nop
    GPF        1
    negu       $a0, $t4
    sh         $a0, 0xC($a1)
    mfc2       $t6, $10
    mfc2       $a0, $9
    mfc2       $t7, $11
    sh         $a0, 0x10($a1)
    mflo       $v0
    mtc2       $t1, $9
    mtc2       $t2, $10
    mtc2       $t5, $11
    mtc2       $t3, $8
    mult       $t1, $t5
    nop
    GPF        1
    sra        $v0, $v0, 12
    sh         $v0, 0x0($a1)
    mfc2       $a0, $9
    mfc2       $t8, $10
    mfc2       $t9, $11
    sh         $a0, 0xE($a1)
    mflo       $v0
    mtc2       $t6, $9
    mtc2       $t7, $10
    mtc2       $t8, $11
    mtc2       $t4, $8
    mult       $t9, $t4
    nop
    GPF        1
    sra        $v0, $v0, 12
    sh         $v0, 0x6($a1)
    mfc2       $a0, $9
    mfc2       $t0, $10
    mfc2       $t1, $11
    mflo       $v0
    sra        $v0, $v0, 12
    sub        $t2, $t1, $t7
    add        $t3, $a0, $t9
    add        $t4, $v0, $t6
    sub        $t5, $t0, $t8
    sh         $t2, 0x2($a1)
    sh         $t3, 0x4($a1)
    sh         $t4, 0x8($a1)
    sh         $t5, 0xA($a1)
    jr         $ra
    nop
  .L80078CC8:
    sll        $t5, $t5, 16
    neg        $t0, $t5
    andi       $t1, $t2, 0xFFFF
    or         $t0, $t0, $t1
    addiu      $t3, $zero, 0x1000
    sw         $t0, 0x0($a1)
    sw         $t5, 0x4($a1)
    sw         $t1, 0x8($a1)
    sw         $zero, 0xC($a1)
    jr         $ra
    sh         $t3, 0x10($a1)
.size RotMatrixZYX, . - RotMatrixZYX

glabel RotMatrix
    lh         $t9, 0x4($a0)
    lh         $t8, 0x2($a0)
    lh         $t7, 0x0($a0)
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    andi       $t0, $t9, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t5, 0x0($t0)
    lh         $t2, 0x800($t0)
    andi       $t3, $t9, 0x800
    beqz       $t3, .L80078D30
    nop
    neg        $t5, $t5
    neg        $t2, $t2
  .L80078D30:
    or         $t4, $t8, $t7
    beqz       $t4, .L80078CC8
    nop
    andi       $t0, $t8, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t4, 0x0($t0)
    lh         $t1, 0x800($t0)
    andi       $t3, $t8, 0x800
    beqz       $t3, .L80078D64
    nop
    neg        $t1, $t1
    neg        $t4, $t4
  .L80078D64:
    andi       $t0, $t7, 0x7FF
    sll        $t0, $t0, 1
    addu       $t0, $t0, $v1
    lh         $t3, 0x0($t0)
    lh         $t0, 0x800($t0)
    andi       $t6, $t7, 0x800
    beqz       $t6, .L80078D8C
    nop
    neg        $t3, $t3
    neg        $t0, $t0
  .L80078D8C:
    mtc2       $t1, $9
    mtc2       $t2, $10
    mtc2       $t5, $11
    mtc2       $t0, $8
    mult       $t1, $t2
    nop
    GPF        1
    sh         $t4, 0x4($a1)
    mfc2       $t6, $10
    mfc2       $a0, $9
    mfc2       $t7, $11
    sh         $a0, 0x10($a1)
    mflo       $v0
    mtc2       $t1, $9
    mtc2       $t2, $10
    mtc2       $t5, $11
    mtc2       $t3, $8
    mult       $t1, $t5
    nop
    GPF        1
    sra        $v0, $v0, 12
    sh         $v0, 0x0($a1)
    mfc2       $a0, $9
    mfc2       $t8, $10
    mfc2       $t9, $11
    neg        $a0, $a0
    sh         $a0, 0xA($a1)
    mflo       $v0
    mtc2       $t6, $9
    mtc2       $t7, $10
    mtc2       $t8, $11
    mtc2       $t4, $8
    mult       $t9, $t4
    nop
    GPF        1
    sra        $v0, $v0, 12
    neg        $v0, $v0
    sh         $v0, 0x2($a1)
    mfc2       $a0, $9
    mfc2       $t0, $10
    mfc2       $t1, $11
    mflo       $v0
    sra        $v0, $v0, 12
    add        $t2, $t1, $t7
    sub        $t3, $t9, $a0
    sub        $t4, $t6, $v0
    add        $t5, $t0, $t8
    sh         $t2, 0x6($a1)
    sh         $t3, 0xC($a1)
    sh         $t4, 0x8($a1)
    sh         $t5, 0xE($a1)
    jr         $ra
    nop
.size RotMatrix, . - RotMatrix

glabel RotMatrixX
    andi       $v0, $a0, 0x7FF
    sll        $v0, $v0, 1
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    add        $v1, $v1, $v0
    lh         $v0, 0x800($v1)
    lh         $v1, 0x0($v1)
    andi       $a0, $a0, 0x800
    beqz       $a0, .L80078E90
    nop
    neg        $v0, $v0
    neg        $v1, $v1
  .L80078E90:
    lh         $t0, 0x6($a1)
    lw         $t1, 0x8($a1)
    mtc2       $v0, $8
    mtc2       $t0, $9
    sra        $t2, $t1, 16
    sll        $t1, $t1, 16
    sra        $t1, $t1, 16
    mtc2       $t1, $10
    mtc2       $t2, $11
    lw         $t3, 0xC($a1)
    nop
    GPF        1
    lh         $t5, 0x10($a1)
    sra        $t4, $t3, 16
    sll        $t3, $t3, 16
    sra        $t3, $t3, 16
    mfc2       $t6, $9
    mfc2       $t7, $10
    mfc2       $t8, $11
    mtc2       $v1, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    nop
    nop
    GPF        1
    mfc2       $a0, $9
    mfc2       $at, $10
    mfc2       $a2, $11
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    sub        $t6, $t6, $a0
    nop
    GPF        1
    sub        $t7, $t7, $at
    sub        $t8, $t8, $a2
    sll        $t8, $t8, 16
    andi       $t7, $t7, 0xFFFF
    or         $t7, $t7, $t8
    mfc2       $t0, $9
    mfc2       $t1, $10
    mfc2       $t2, $11
    mtc2       $v0, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    nop
    nop
    GPF        1
    sh         $t6, 0x6($a1)
    sw         $t7, 0x8($a1)
    mfc2       $t3, $9
    mfc2       $t4, $10
    mfc2       $t5, $11
    add        $t0, $t0, $t3
    add        $t1, $t1, $t4
    add        $t2, $t2, $t5
    sll        $t1, $t1, 16
    andi       $t0, $t0, 0xFFFF
    or         $t0, $t0, $t1
    sw         $t0, 0xC($a1)
    sh         $t2, 0x10($a1)
    jr         $ra
    nop
.size RotMatrixX, . - RotMatrixX

glabel RotMatrixY
    andi       $v0, $a0, 0x7FF
    sll        $v0, $v0, 1
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    add        $v1, $v1, $v0
    lh         $v0, 0x800($v1)
    lh         $v1, 0x0($v1)
    andi       $a0, $a0, 0x800
    beqz       $a0, .L80078FC4
    nop
    neg        $v0, $v0
    neg        $v1, $v1
  .L80078FC4:
    lh         $t2, 0x4($a1)
    lw         $t0, 0x0($a1)
    mtc2       $v0, $8
    mtc2       $t2, $11
    sra        $t1, $t0, 16
    sll        $t0, $t0, 16
    sra        $t0, $t0, 16
    mtc2       $t0, $9
    mtc2       $t1, $10
    lw         $t3, 0xC($a1)
    nop
    GPF        1
    lh         $t5, 0x10($a1)
    sra        $t4, $t3, 16
    sll        $t3, $t3, 16
    sra        $t3, $t3, 16
    mfc2       $t6, $9
    mfc2       $t7, $10
    mfc2       $t8, $11
    mtc2       $v1, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    nop
    nop
    GPF        1
    mfc2       $a0, $9
    mfc2       $at, $10
    mfc2       $a2, $11
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    add        $t6, $t6, $a0
    nop
    GPF        1
    add        $t7, $t7, $at
    add        $t8, $t8, $a2
    sll        $t7, $t7, 16
    andi       $t6, $t6, 0xFFFF
    or         $t6, $t6, $t7
    mfc2       $t0, $9
    mfc2       $t1, $10
    mfc2       $t2, $11
    mtc2       $v0, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    nop
    nop
    GPF        1
    sw         $t6, 0x0($a1)
    sh         $t8, 0x4($a1)
    mfc2       $t3, $9
    mfc2       $t4, $10
    mfc2       $t5, $11
    sub        $t0, $t3, $t0
    sub        $t1, $t4, $t1
    sub        $t2, $t5, $t2
    sll        $t1, $t1, 16
    andi       $t0, $t0, 0xFFFF
    or         $t0, $t0, $t1
    sw         $t0, 0xC($a1)
    sh         $t2, 0x10($a1)
    jr         $ra
    nop
.size RotMatrixY, . - RotMatrixY

glabel RotMatrixZ
    andi       $v0, $a0, 0x7FF
    sll        $v0, $v0, 1
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    add        $v1, $v1, $v0
    lh         $v0, 0x800($v1)
    lh         $v1, 0x0($v1)
    andi       $a0, $a0, 0x800
    beqz       $a0, .L800790F8
    nop
    neg        $v0, $v0
    neg        $v1, $v1
  .L800790F8:
    lw         $t0, 0x0($a1)
    lw         $t2, 0x4($a1)
    sra        $t1, $t0, 16
    sll        $t0, $t0, 16
    sra        $t0, $t0, 16
    sra        $t3, $t2, 16
    sll        $t2, $t2, 16
    sra        $t2, $t2, 16
    mtc2       $v0, $8
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    lw         $t4, 0x8($a1)
    nop
    GPF        1
    sra        $t5, $t4, 16
    sll        $t4, $t4, 16
    sra        $t4, $t4, 16
    mfc2       $t6, $9
    mfc2       $t7, $10
    mfc2       $t8, $11
    mtc2       $v1, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    nop
    nop
    GPF        1
    mfc2       $a0, $9
    mfc2       $at, $10
    mfc2       $a2, $11
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    sub        $t6, $t6, $a0
    nop
    GPF        1
    sub        $t7, $t7, $at
    sub        $t8, $t8, $a2
    sll        $t7, $t7, 16
    andi       $t6, $t6, 0xFFFF
    or         $t6, $t6, $t7
    mfc2       $t0, $9
    mfc2       $t1, $10
    mfc2       $t2, $11
    mtc2       $v0, $8
    mtc2       $t3, $9
    mtc2       $t4, $10
    mtc2       $t5, $11
    andi       $t8, $t8, 0xFFFF
    nop
    GPF        1
    sw         $t6, 0x0($a1)
    mfc2       $t3, $9
    mfc2       $t4, $10
    mfc2       $t5, $11
    add        $t0, $t0, $t3
    add        $t1, $t1, $t4
    add        $t2, $t2, $t5
    sll        $t0, $t0, 16
    or         $t8, $t8, $t0
    sll        $t2, $t2, 16
    andi       $t1, $t1, 0xFFFF
    or         $t1, $t1, $t2
    sw         $t8, 0x4($a1)
    sw         $t1, 0x8($a1)
    jr         $ra
    nop
.size RotMatrixZ, . - RotMatrixZ

glabel ApplyMatrix_S
    lw         $t0, 0x0($a0)
    lw         $t1, 0x4($a0)
    lw         $t2, 0x8($a0)
    lw         $t3, 0xC($a0)
    lhu        $t4, 0x10($a0)
    ctc2       $t0, $0
    ctc2       $t1, $1
    ctc2       $t2, $2
    ctc2       $t3, $3
    ctc2       $t4, $4
    lwc2       $0, 0x0($a1)
    lwc2       $1, 0x4($a1)
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    addu       $v0, $a2, $zero
    swc2       $25, 0x0($a2)
    swc2       $26, 0x4($a2)
    jr         $ra
    swc2       $27, 0x8($a2)
.size ApplyMatrix_S, . - ApplyMatrix_S

glabel ScaleMatrix
    lw         $t0, 0x0($a0)
    lw         $t2, 0x4($a0)
    lw         $t4, 0x8($a0)
    lw         $t6, 0xC($a0)
    sra        $t1, $t0, 16
    sll        $t0, $t0, 16
    sra        $t0, $t0, 16
    mtc2       $t0, $9
    lw         $v0, 0x0($a1)
    sra        $t3, $t2, 16
    mtc2       $t3, $10
    sra        $t7, $t6, 16
    sll        $t6, $t6, 16
    sra        $t6, $t6, 16
    mtc2       $t6, $11
    mtc2       $v0, $8
    sra        $t5, $t4, 16
    nop
    GPF        1
    lw         $v0, 0x4($a1)
    sll        $t4, $t4, 16
    sra        $t4, $t4, 16
    mfc2       $t0, $9
    mfc2       $t3, $10
    mfc2       $t6, $11
    mtc2       $v0, $8
    mtc2       $t1, $9
    mtc2       $t4, $10
    mtc2       $t7, $11
    sh         $t0, 0x0($a0)
    nop
    GPF        1
    lh         $t8, 0x10($a0)
    lw         $v0, 0x8($a1)
    sh         $t3, 0x6($a0)
    sll        $t2, $t2, 16
    sra        $t2, $t2, 16
    mfc2       $t1, $9
    mfc2       $t4, $10
    mfc2       $t7, $11
    mtc2       $v0, $8
    mtc2       $t2, $9
    mtc2       $t5, $10
    mtc2       $t8, $11
    addu       $v0, $a0, $zero
    nop
    GPF        1
    sh         $t6, 0xC($a0)
    sh         $t1, 0x2($a0)
    sh         $t4, 0x8($a0)
    sh         $t7, 0xE($a0)
    mfc2       $t2, $9
    mfc2       $t5, $10
    mfc2       $t8, $11
    sh         $t2, 0x4($a0)
    sh         $t5, 0xA($a0)
    jr         $ra
    sh         $t8, 0x10($a0)
.size ScaleMatrix, . - ScaleMatrix

glabel rsin
    andi       $v0, $a0, 0x7FF
    sll        $v0, $v0, 1
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    add        $v1, $v1, $v0
    lh         $v0, 0x0($v1)
    andi       $a0, $a0, 0x800
    beqz       $a0, .L80079368
    nop
    neg        $v0, $v0
  .L80079368:
    jr         $ra
    nop
.size rsin, . - rsin

glabel rcos
    andi       $v0, $a0, 0x7FF
    sll        $v0, $v0, 1
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    add        $v1, $v1, $v0
    lh         $v0, 0x800($v1)
    andi       $a0, $a0, 0x800
    beqz       $a0, .L80079398
    nop
    neg        $v0, $v0
  .L80079398:
    jr         $ra
    nop
.size rcos, . - rcos

glabel MATH3D_racos_S
    addiu      $v0, $zero, 0x200
    addiu      $t2, $zero, 0x100
    lui        $v1, ecostable_HI
    ori        $v1, $v1, ecostable_LO
    bgez       $a0, .L800793BC
    addu       $t3, $a0, $zero
    neg        $t3, $a0
  .L800793BC:
    sll        $t0, $v0, 1
    add        $t0, $t0, $v1
    lh         $t1, 0x800($t0)
    addu       $t4, $t2, $zero
    sub        $t5, $t1, $t3
    beqz       $t5, .L800793EC
    nop
    bgez       $t5, .L800793E4
    sra        $t2, $t2, 1
    neg        $t4, $t4
  .L800793E4:
    bnez       $t2, .L800793BC
    add        $v0, $v0, $t4
  .L800793EC:
    bgez       $a0, .L800793F8
    addiu      $v1, $zero, 0x800
    sub        $v0, $v1, $v0
  .L800793F8:
    jr         $ra
    nop
.size MATH3D_racos_S, . - MATH3D_racos_S

glabel SetGp
    jr         $ra
    addu       $gp, $a0, $zero
.size SetGp, . - SetGp

glabel memcpy
    beqz       $a2, .L800794B8
    addu       $v0, $a0, $zero
    or         $t0, $a0, $a1
    or         $t0, $t0, $a2
    andi       $t0, $t0, 0x3
    bnez       $t0, .L800794A0
    nop
  .L80079424:
    lw         $t0, 0x0($a1)
    addi       $a1, $a1, 0x4
    addi       $a0, $a0, 0x4
    addi       $a2, $a2, -0x4
    andi       $t1, $a2, 0x1F
    bnez       $t1, .L80079424
    sw         $t0, -0x4($a0)
    beqz       $a2, .L800794B8
    nop
  .L80079448:
    lw         $t0, 0x0($a1)
    lw         $t1, 0x4($a1)
    lw         $t2, 0x8($a1)
    lw         $t3, 0xC($a1)
    lw         $t4, 0x10($a1)
    lw         $t5, 0x14($a1)
    lw         $t6, 0x18($a1)
    lw         $t7, 0x1C($a1)
    addi       $a2, $a2, -0x20
    addi       $a1, $a1, 0x20
    sw         $t0, 0x0($a0)
    sw         $t1, 0x4($a0)
    sw         $t2, 0x8($a0)
    sw         $t3, 0xC($a0)
    sw         $t4, 0x10($a0)
    sw         $t5, 0x14($a0)
    sw         $t6, 0x18($a0)
    sw         $t7, 0x1C($a0)
    bnez       $a2, .L80079448
    addi       $a0, $a0, 0x20
    jr         $ra
    nop
  .L800794A0:
    lbu        $t0, 0x0($a1)
    addi       $a1, $a1, 0x1
    addi       $a2, $a2, -0x1
    addi       $a0, $a0, 0x1
    bnez       $a2, .L800794A0
    sb         $t0, -0x1($a0)
  .L800794B8:
    jr         $ra
    nop
.size memcpy, . - memcpy

glabel BSP_MarkVisibleLeaves_S
    lw         $v0, 0x64($a1)
    lui        $t0, (0x1F8000B8 >> 16)
    sw         $s0, (0x1F800098 & 0xFFFF)($t0)
    sw         $s1, (0x1F80009C & 0xFFFF)($t0)
    sw         $s2, (0x1F8000A0 & 0xFFFF)($t0)
    sw         $s3, (0x1F8000A4 & 0xFFFF)($t0)
    sw         $s4, (0x1F8000A8 & 0xFFFF)($t0)
    sw         $s5, (0x1F8000AC & 0xFFFF)($t0)
    sw         $s6, (0x1F8000B0 & 0xFFFF)($t0)
    sw         $s7, (0x1F8000B4 & 0xFFFF)($t0)
    sw         $fp, (0x1F8000B8 & 0xFFFF)($t0)
    sw         $ra, (0x1F8000BC & 0xFFFF)($t0)
    lui        $s2, %hi(depthQFogFar)
    lw         $s2, %lo(depthQFogFar)($s2)
    addu       $s4, $t0, $zero
    addu       $s5, $a0, $zero
    addu       $s6, $a1, $zero
    addu       $fp, $a2, $zero
    addi       $s0, $s4, (0x1F8000C0 & 0xFFFF)
    sw         $s0, 0x0($s0)
    slt        $at, $s2, $v0
    bnez       $at, .L80079520
    addi       $s7, $fp, 0x4
    addu       $s2, $v0, $zero
  .L80079520:
    addi       $v0, $s6, 0x8
    addi       $v1, $s4, (0x1F800000 & 0xFFFF)
    addi       $t0, $zero, 0x40
  .L8007952C:
    lw         $t6, 0x0($v0)
    lw         $t7, 0x4($v0)
    lw         $t8, 0x8($v0)
    lw         $t9, 0xC($v0)
    sw         $t6, 0x0($v1)
    sw         $t7, 0x4($v1)
    sw         $t8, 0x8($v1)
    sw         $t9, 0xC($v1)
    addi       $v0, $v0, 0x10
    addi       $t0, $t0, -0x10
    bnez       $t0, .L8007952C
    addi       $v1, $v1, 0x10
    lw         $t0, (0x1F800000 & 0xFFFF)($s4)
    lw         $t1, (0x1F800004 & 0xFFFF)($s4)
    lw         $t2, (0x1F800008 & 0xFFFF)($s4)
    lw         $t3, (0x1F80000C & 0xFFFF)($s4)
    lhu        $t4, (0x1F800010 & 0xFFFF)($s4)
    lw         $t5, 0x0($s6)
    lh         $t6, 0x4($s6)
    ctc2       $t0, $0
    ctc2       $t1, $1
    ctc2       $t2, $2
    ctc2       $t3, $3
    ctc2       $t4, $4
    mtc2       $t5, $0
    mtc2       $t6, $1
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    lw         $t0, (0x1F800020 & 0xFFFF)($s4)
    lw         $t1, (0x1F800024 & 0xFFFF)($s4)
    lw         $t2, (0x1F800028 & 0xFFFF)($s4)
    swc2       $25, (0x1F800060 & 0xFFFF)($s4)
    swc2       $26, (0x1F800064 & 0xFFFF)($s4)
    swc2       $27, (0x1F800068 & 0xFFFF)($s4)
    ctc2       $t0, $0
    ctc2       $t1, $1
    ctc2       $t2, $2
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    sw         $t5, (0x1F800040 & 0xFFFF)($s4)
    sh         $t6, (0x1F800044 & 0xFFFF)($s4)
    lw         $t1, 0x68($s6)
    lw         $t2, 0x74($s6)
    swc2       $25, (0x1F80006C & 0xFFFF)($s4)
    swc2       $26, (0x1F800070 & 0xFFFF)($s4)
    sll        $t0, $s2, 15
    div        $zero, $t0, $t1
    mtc2       $s2, $1
    lw         $t4, 0x0($t2)
    lw         $t5, 0x4($t2)
    lw         $t6, 0x8($t2)
    lw         $t7, 0xC($t2)
    lhu        $t8, 0x10($t2)
    mflo       $v0
    ctc2       $t4, $0
    ctc2       $t5, $1
    ctc2       $t6, $2
    ctc2       $t7, $3
    ctc2       $t8, $4
    lw         $t0, 0xA0($s6)
    lw         $t1, 0xA8($s6)
    lw         $t2, 0xA4($s6)
    lw         $t3, 0xAC($s6)
    addi       $t0, $t0, -0xA0
    mult       $t0, $v0
    lui        $v1, (0xFFFF0000 >> 16)
    addi       $t1, $t1, -0x78
    mflo       $t0
    nop
    nop
    mult       $t1, $v0
    addi       $t2, $t2, -0xA0
    sra        $t0, $t0, 15
    andi       $t0, $t0, 0xFFFF
    mflo       $t1
    nop
    nop
    mult       $t2, $v0
    addi       $t3, $t3, -0x78
    sll        $t1, $t1, 1
    and        $t1, $t1, $v1
    mflo       $t2
    nop
    nop
    mult       $t3, $v0
    sra        $t2, $t2, 15
    andi       $t2, $t2, 0xFFFF
    mflo       $t3
    sll        $t3, $t3, 1
    and        $t3, $t3, $v1
    or         $t7, $t0, $t1
    mtc2       $t7, $0
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    or         $t7, $t2, $t1
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    mtc2       $t7, $0
    sh         $t4, (0x1F800046 & 0xFFFF)($s4)
    sh         $t5, (0x1F800048 & 0xFFFF)($s4)
    sh         $t6, (0x1F80004A & 0xFFFF)($s4)
    MVMVA      1, 0, 0, 3, 0
    or         $t7, $t2, $t3
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    mtc2       $t7, $0
    sh         $t4, (0x1F80004C & 0xFFFF)($s4)
    sh         $t5, (0x1F80004E & 0xFFFF)($s4)
    sh         $t6, (0x1F800050 & 0xFFFF)($s4)
    MVMVA      1, 0, 0, 3, 0
    or         $t7, $t0, $t3
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    mtc2       $t7, $0
    sh         $t4, (0x1F800074 & 0xFFFF)($s4)
    sh         $t5, (0x1F800076 & 0xFFFF)($s4)
    sh         $t6, (0x1F800078 & 0xFFFF)($s4)
    MVMVA      1, 0, 0, 3, 0
    mfc2       $t4, $9
    mfc2       $t5, $10
    mfc2       $t6, $11
    lui        $t7, gameTrackerX_HI
    ori        $t7, $t7, gameTrackerX_LO
    sh         $t4, (0x1F80007A & 0xFFFF)($s4)
    sh         $t5, (0x1F80007C & 0xFFFF)($s4)
    sh         $t6, (0x1F80007E & 0xFFFF)($s4)
    lh         $v1, 0x8($t7)
    lh         $v0, 0xA($t7)
    addiu      $at, $zero, 0x3E8
    beq        $v1, $at, .L80079758
    addi       $a2, $zero, 0x2
    bgez       $zero, .L80079764
    nop
  .L80079758:
    beqz       $v0, .L80079764
    addu       $a2, $zero, $zero
    addi       $a2, $a2, 0x1
  .L80079764:
    lw         $v0, (0x1F800000 & 0xFFFF)($s4)
    lw         $v1, (0x1F800004 & 0xFFFF)($s4)
    lw         $t6, (0x1F800008 & 0xFFFF)($s4)
    lw         $t7, (0x1F80000C & 0xFFFF)($s4)
    lhu        $t8, (0x1F800010 & 0xFFFF)($s4)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    ctc2       $t7, $3
    ctc2       $t8, $4
    lw         $s1, 0x0($s5)
    addi       $s0, $s0, 0x4
  .L80079794:
    addi       $s0, $s0, -0x4
    lw         $t0, 0x0($s1)
    lw         $t1, 0x4($s1)
    mtc2       $t0, $0
    mtc2       $t1, $1
    sra        $t0, $t1, 16
    nop
    MVMVA      1, 0, 0, 3, 0
    neg        $t0, $t0
    lw         $v0, (0x1F800060 & 0xFFFF)($s4)
    lw         $t4, (0x1F800064 & 0xFFFF)($s4)
    lw         $t5, (0x1F800068 & 0xFFFF)($s4)
    addiu      $at, $zero, 0x2
    bne        $a2, $at, .L800797D4
    nop
    addi       $t0, $t0, -0x800
  .L800797D4:
    mfc2       $t1, $25
    mfc2       $t2, $26
    mfc2       $t3, $27
    sub        $t1, $t1, $v0
    slt        $at, $t0, $t1
    beqz       $at, .L80079A3C
    sub        $v0, $t2, $t4
    slt        $at, $t0, $v0
    beqz       $at, .L80079A3C
    sub        $v1, $t3, $t5
    slt        $at, $t0, $v1
    beqz       $at, .L80079A3C
    nop
    lw         $v0, (0x1F800020 & 0xFFFF)($s4)
    lw         $v1, (0x1F800024 & 0xFFFF)($s4)
    lw         $t6, (0x1F800028 & 0xFFFF)($s4)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    lw         $t4, (0x1F80006C & 0xFFFF)($s4)
    lw         $t5, (0x1F800070 & 0xFFFF)($s4)
    mfc2       $t1, $25
    mfc2       $t2, $26
    sub        $v0, $t1, $t4
    slt        $at, $t0, $v0
    beqz       $at, .L80079A14
    sub        $v1, $t2, $t5
    slt        $at, $t0, $v1
    beqz       $at, .L80079A14
    nop
    lh         $v0, 0xE($s1)
    nop
    andi       $v0, $v0, 0x1
    beqz       $v0, .L80079A0C
    nop
    beqz       $a2, .L80079878
    addi       $t4, $s1, 0x28
    addi       $t4, $s1, 0x24
  .L80079878:
    lw         $t4, 0x0($t4)
    lw         $v0, (0x1F800040 & 0xFFFF)($s4)
    lw         $v1, (0x1F800044 & 0xFFFF)($s4)
    lw         $t6, (0x1F800048 & 0xFFFF)($s4)
    lw         $t7, (0x1F80004C & 0xFFFF)($s4)
    lhu        $t8, (0x1F800050 & 0xFFFF)($s4)
    lw         $t1, 0x8($s1)
    lw         $t2, 0xC($s1)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    ctc2       $t7, $3
    ctc2       $t8, $4
    mtc2       $t1, $0
    mtc2       $t2, $1
    lw         $v0, 0x10($s1)
    nop
    MVMVA      1, 0, 0, 3, 0
    sra        $t5, $t4, 16
    sll        $t4, $t4, 16
    sra        $t4, $t4, 16
    lw         $a3, 0x14($s1)
    lw         $t9, 0x18($s1)
    mfc2       $t1, $25
    mfc2       $t2, $26
    mfc2       $t3, $27
    sub        $t1, $t1, $v0
    bltz       $t1, .L8007997C
    nop
    beqz       $t9, .L80079968
    neg        $t0, $t1
    slt        $at, $t4, $t1
    beqz       $at, .L80079960
    sub        $v0, $t2, $t0
    slt        $at, $t4, $v0
    beqz       $at, .L80079960
    sub        $v1, $t3, $t0
    slt        $at, $t4, $v1
    beqz       $at, .L80079960
    nop
    lw         $v0, (0x1F800074 & 0xFFFF)($s4)
    lw         $v1, (0x1F800078 & 0xFFFF)($s4)
    lw         $t6, (0x1F80007C & 0xFFFF)($s4)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    mfc2       $t1, $25
    mfc2       $t2, $26
    sub        $v0, $t1, $t0
    slt        $at, $t4, $v0
    beqz       $at, .L80079960
    sub        $v1, $t2, $t0
    slt        $at, $t4, $v1
    bnez       $at, .L80079968
    nop
  .L80079960:
    sw         $t9, 0x4($s0)
    addi       $s0, $s0, 0x4
  .L80079968:
    beqz       $a3, .L80079A14
    nop
    sw         $a3, 0x4($s0)
    bgez       $zero, .L80079A14
    addi       $s0, $s0, 0x4
  .L8007997C:
    beqz       $a3, .L800799F8
    neg        $t0, $t1
    slt        $at, $t1, $t5
    beqz       $at, .L800799F0
    sub        $v0, $t2, $t0
    slt        $at, $v0, $t5
    beqz       $at, .L800799F0
    sub        $v1, $t3, $t0
    slt        $at, $v1, $t5
    beqz       $at, .L800799F0
    nop
    lw         $v0, (0x1F800074 & 0xFFFF)($s4)
    lw         $v1, (0x1F800078 & 0xFFFF)($s4)
    lw         $t6, (0x1F80007C & 0xFFFF)($s4)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    nop
    nop
    MVMVA      1, 0, 0, 3, 0
    mfc2       $t1, $25
    mfc2       $t2, $26
    sub        $v0, $t1, $t0
    slt        $at, $v0, $t5
    beqz       $at, .L800799F0
    sub        $v1, $t2, $t0
    slt        $at, $v1, $t5
    bnez       $at, .L800799F8
    nop
  .L800799F0:
    sw         $a3, 0x4($s0)
    addi       $s0, $s0, 0x4
  .L800799F8:
    beqz       $t9, .L80079A14
    nop
    sw         $t9, 0x4($s0)
    bgez       $zero, .L80079A14
    addi       $s0, $s0, 0x4
  .L80079A0C:
    sw         $s1, 0x0($s7)
    addi       $s7, $s7, 0x4
  .L80079A14:
    lw         $v0, (0x1F800000 & 0xFFFF)($s4)
    lw         $v1, (0x1F800004 & 0xFFFF)($s4)
    lw         $t6, (0x1F800008 & 0xFFFF)($s4)
    lw         $t7, (0x1F80000C & 0xFFFF)($s4)
    lhu        $t8, (0x1F800010 & 0xFFFF)($s4)
    ctc2       $v0, $0
    ctc2       $v1, $1
    ctc2       $t6, $2
    ctc2       $t7, $3
    ctc2       $t8, $4
  .L80079A3C:
    lw         $s1, 0x0($s0)
    nop
    bne        $s1, $s0, .L80079794
    nop
    sub        $v0, $s7, $fp
    addi       $v0, $v0, -0x4
    sra        $v0, $v0, 2
    sw         $v0, 0x0($fp)
    addu       $t0, $s4, $zero
    lw         $ra, (0x1F8000BC & 0xFFFF)($t0)
    lw         $s0, (0x1F800098 & 0xFFFF)($t0)
    lw         $s1, (0x1F80009C & 0xFFFF)($t0)
    lw         $s2, (0x1F8000A0 & 0xFFFF)($t0)
    lw         $s3, (0x1F8000A4 & 0xFFFF)($t0)
    lw         $s4, (0x1F8000A8 & 0xFFFF)($t0)
    lw         $s5, (0x1F8000AC & 0xFFFF)($t0)
    lw         $s6, (0x1F8000B0 & 0xFFFF)($t0)
    lw         $s7, (0x1F8000B4 & 0xFFFF)($t0)
    lw         $fp, (0x1F8000B8 & 0xFFFF)($t0)
    jr         $ra
    nop
.size BSP_MarkVisibleLeaves_S, . - BSP_MarkVisibleLeaves_S

glabel G2Quat_FromMatrix_S
    lh         $t0, 0x0($a1)
    lh         $t1, 0x8($a1)
    lh         $t2, 0x10($a1)
    addi       $sp, $sp, -0x28
    sw         $ra, 0x10($sp)
    sw         $s0, 0x14($sp)
    sw         $s1, 0x18($sp)
    addu       $s0, $a0, $zero
    add        $a0, $t0, $t1
    add        $a0, $a0, $t2
    blez       $a0, .L80079B4C
    addu       $s1, $a1, $zero
    jal        MATH3D_FastSqrt
    addi       $a0, $a0, 0x1000
    lui        $t0, (0x800000 >> 16)
    div        $zero, $t0, $v0
    lh         $t0, 0xE($s1)
    lh         $t1, 0xA($s1)
    lh         $t2, 0x4($s1)
    lh         $t3, 0xC($s1)
    lh         $t4, 0x6($s1)
    lh         $t5, 0x2($s1)
    sra        $v1, $v0, 1
    sh         $v1, 0x6($s0)
    sub        $t0, $t0, $t1
    sub        $t2, $t2, $t3
    sub        $t4, $t4, $t5
    mtc2       $t0, $9
    mtc2       $t2, $10
    mtc2       $t4, $11
    mflo       $v0
    mtc2       $v0, $8
    nop
    nop
    GPF        1
    addu       $a0, $s0, $zero
    lw         $ra, 0x10($sp)
    lw         $s0, 0x14($sp)
    lw         $s1, 0x18($sp)
    mfc2       $t0, $9
    mfc2       $t2, $10
    mfc2       $t4, $11
    sh         $t0, 0x0($a0)
    sh         $t2, 0x2($a0)
    sh         $t4, 0x4($a0)
    jr         $ra
    addi       $sp, $sp, 0x28
  .L80079B4C:
    sw         $s2, 0x1C($sp)
    sw         $s3, 0x20($sp)
    sw         $s4, 0x24($sp)
    addi       $s2, $zero, 0x0
    addi       $s3, $zero, 0x2
    addi       $s4, $zero, 0x4
    addu       $t3, $t0, $zero
    addu       $t4, $t1, $zero
    slt        $at, $t0, $t1
    beqz       $at, .L80079B90
    addu       $t5, $t2, $zero
    addi       $s2, $zero, 0x2
    addi       $s3, $zero, 0x4
    addi       $s4, $zero, 0x0
    addu       $t3, $t1, $zero
    addu       $t4, $t2, $zero
    addu       $t5, $t0, $zero
  .L80079B90:
    slt        $at, $t3, $t2
    beqz       $at, .L80079BB4
    nop
    addi       $s2, $zero, 0x4
    addi       $s3, $zero, 0x0
    addi       $s4, $zero, 0x2
    addu       $t3, $t2, $zero
    addu       $t4, $t0, $zero
    addu       $t5, $t1, $zero
  .L80079BB4:
    add        $a0, $t4, $t5
    sub        $a0, $t3, $a0
    jal        MATH3D_FastSqrt
    addi       $a0, $a0, 0x1000
    lui        $t0, (0x800000 >> 16)
    div        $zero, $t0, $v0
    sra        $v1, $v0, 1
    add        $a0, $s0, $s2
    sh         $v1, 0x0($a0)
    sll        $t0, $s2, 1
    add        $t0, $t0, $s1
    add        $t0, $t0, $s2
    sll        $t1, $s3, 1
    add        $t1, $t1, $s1
    add        $t1, $t1, $s3
    sll        $t2, $s4, 1
    add        $t2, $t2, $s1
    add        $t2, $t2, $s4
    add        $t3, $t0, $s3
    add        $t4, $t0, $s4
    add        $t5, $t1, $s2
    add        $t6, $t1, $s4
    add        $t7, $t2, $s2
    add        $t8, $t2, $s3
    lh         $t6, 0x0($t6)
    lh         $t8, 0x0($t8)
    lh         $t3, 0x0($t3)
    lh         $t5, 0x0($t5)
    lh         $t4, 0x0($t4)
    lh         $t7, 0x0($t7)
    sub        $t0, $t8, $t6
    add        $t1, $t5, $t3
    add        $t2, $t7, $t4
    mflo       $v0
    mtc2       $v0, $8
    mtc2       $t0, $9
    mtc2       $t1, $10
    mtc2       $t2, $11
    nop
    nop
    GPF        1
    addu       $a0, $s0, $zero
    lw         $ra, 0x10($sp)
    lw         $s0, 0x14($sp)
    lw         $s1, 0x18($sp)
    lw         $s2, 0x1C($sp)
    mfc2       $t0, $9
    mfc2       $t1, $10
    mfc2       $t2, $11
    sh         $t0, 0x6($a0)
    add        $s3, $s3, $a0
    add        $s4, $s4, $a0
    sh         $t1, 0x0($s3)
    sh         $t2, 0x0($s4)
    lw         $s3, 0x20($sp)
    lw         $s4, 0x24($sp)
    jr         $ra
    addi       $sp, $sp, 0x28
.size G2Quat_FromMatrix_S, . - G2Quat_FromMatrix_S

glabel G2Quat_ToMatrix_S
    lh         $t6, 0x0($a0)
    lh         $t9, 0x6($a0)
    lh         $t7, 0x2($a0)
    lh         $t8, 0x4($a0)
    sll        $v0, $t6, 1
    mtc2       $v0, $8
    mtc2       $t6, $9
    mtc2       $t9, $10
    mtc2       $t7, $11
    nop
    nop
    GPF        1
    addiu      $a0, $zero, 0x1000
    sll        $v0, $t7, 1
    mfc2       $t0, $25
    mfc2       $t1, $26
    mfc2       $t2, $27
    mtc2       $v0, $8
    mtc2       $t7, $9
    mtc2       $t9, $10
    mtc2       $t8, $11
    nop
    nop
    GPF        1
    sll        $v0, $t8, 1
    mfc2       $t3, $25
    mfc2       $t4, $26
    mfc2       $t5, $27
    mtc2       $v0, $8
    mtc2       $t8, $9
    mtc2       $t9, $10
    mtc2       $t6, $11
    nop
    nop
    GPF        1
    add        $v1, $t5, $t1
    add        $v0, $t0, $t3
    sub        $v0, $a0, $v0
    sh         $v1, 0xE($a1)
    sh         $v0, 0x10($a1)
    mfc2       $t6, $25
    mfc2       $t7, $26
    mfc2       $t8, $27
    add        $v0, $t3, $t6
    sub        $v0, $a0, $v0
    sub        $v1, $t2, $t7
    sh         $v0, 0x0($a1)
    sh         $v1, 0x2($a1)
    add        $v0, $t8, $t4
    add        $v1, $t2, $t7
    sh         $v0, 0x4($a1)
    sh         $v1, 0x6($a1)
    add        $v0, $t0, $t6
    sub        $v0, $a0, $v0
    sub        $v1, $t5, $t1
    sh         $v0, 0x8($a1)
    sh         $v1, 0xA($a1)
    sub        $v0, $t8, $t4
    jr         $ra
    sh         $v0, 0xC($a1)
.size G2Quat_ToMatrix_S, . - G2Quat_ToMatrix_S

glabel G2Quat_FromEuler_S
    lh         $t0, 0x0($a1)
    lh         $t2, 0x2($a1)
    lh         $t4, 0x4($a1)
    lh         $a1, 0x6($a1)
    lui        $t8, ecostable_HI
    ori        $t8, $t8, ecostable_LO
    andi       $v0, $a1, 0x1
    beqz       $v0, .L80079DB8
    addu       $v1, $t0, $zero
    addu       $t0, $t4, $zero
    addu       $t4, $v1, $zero
  .L80079DB8:
    andi       $v0, $a1, 0x4
    beqz       $v0, .L80079DC8
    sra        $t0, $t0, 1
    neg        $t2, $t2
  .L80079DC8:
    sra        $t2, $t2, 1
    sra        $t4, $t4, 1
    andi       $t1, $t0, 0x7FF
    sll        $t1, $t1, 1
    addu       $t1, $t1, $t8
    andi       $t3, $t0, 0x800
    lh         $t0, 0x0($t1)
    lh         $t1, 0x800($t1)
    beqz       $t3, .L80079DF8
    nop
    neg        $t0, $t0
    neg        $t1, $t1
  .L80079DF8:
    andi       $t3, $t2, 0x7FF
    sll        $t3, $t3, 1
    addu       $t3, $t3, $t8
    andi       $t5, $t2, 0x800
    lh         $t2, 0x0($t3)
    lh         $t3, 0x800($t3)
    beqz       $t5, .L80079E20
    nop
    neg        $t2, $t2
    neg        $t3, $t3
  .L80079E20:
    andi       $t5, $t4, 0x7FF
    sll        $t5, $t5, 1
    addu       $t5, $t5, $t8
    andi       $t8, $t4, 0x800
    lh         $t4, 0x0($t5)
    lh         $t5, 0x800($t5)
    beqz       $t8, .L80079E48
    nop
    neg        $t4, $t4
    neg        $t5, $t5
  .L80079E48:
    mtc2       $t1, $8
    mtc2       $t5, $9
    mtc2       $t4, $10
    nop
    nop
    GPF        1
    mfc2       $t6, $9
    mfc2       $t7, $10
    mtc2       $t0, $8
    mtc2       $t5, $9
    mtc2       $t4, $10
    nop
    nop
    GPF        1
    andi       $v1, $a1, 0x18
    sra        $v1, $v1, 2
    andi       $v0, $a1, 0x2
    mfc2       $t8, $9
    mfc2       $t9, $10
    beqz       $v0, .L80079F20
    add        $t0, $t7, $t8
    sub        $t5, $t6, $t9
    mtc2       $t3, $8
    mtc2       $t0, $9
    mtc2       $t5, $10
    nop
    nop
    GPF        1
    andi       $a1, $a1, 0x4
    sra        $a1, $a1, 1
    add        $t1, $t6, $t9
    sub        $t4, $t7, $t8
    mfc2       $t0, $9
    mfc2       $t5, $10
    mtc2       $t2, $8
    mtc2       $t1, $9
    mtc2       $t4, $10
    nop
    nop
    GPF        1
    add        $t8, $v1, $a1
    addi       $t8, $t8, 0x2
    slti       $at, $t8, 0x5
    bnez       $at, .L80079F00
    sub        $t9, $v1, $a1
    addi       $t8, $t8, -0x6
  .L80079F00:
    addi       $t9, $t9, 0x4
    slti       $at, $t9, 0x5
    bnez       $at, .L80079F14
    mfc2       $t1, $9
    addi       $t9, $t9, -0x6
  .L80079F14:
    mfc2       $t4, $10
    bgez       $zero, .L80079FC8
    nop
  .L80079F20:
    mtc2       $t3, $8
    mtc2       $t8, $9
    mtc2       $t9, $10
    mtc2       $t7, $11
    mult       $t3, $t6
    nop
    GPF        0
    andi       $a1, $a1, 0x4
    sra        $a1, $a1, 1
    mfc2       $t0, $25
    mfc2       $t1, $26
    mfc2       $t4, $27
    mflo       $t5
    mtc2       $t2, $8
    mtc2       $t7, $9
    mtc2       $t6, $10
    mtc2       $t8, $11
    mult       $t2, $t9
    nop
    GPF        0
    add        $t8, $v1, $a1
    addi       $t8, $t8, 0x2
    slti       $at, $t8, 0x5
    bnez       $at, .L80079F88
    sub        $t9, $v1, $a1
    addi       $t8, $t8, -0x6
  .L80079F88:
    addi       $t9, $t9, 0x4
    slti       $at, $t9, 0x5
    bnez       $at, .L80079F9C
    mfc2       $t2, $25
    addi       $t9, $t9, -0x6
  .L80079F9C:
    mfc2       $t3, $26
    mfc2       $t6, $27
    mflo       $t7
    sub        $t0, $t0, $t2
    add        $t1, $t1, $t3
    sub        $t4, $t4, $t6
    add        $t5, $t5, $t7
    sra        $t0, $t0, 12
    sra        $t1, $t1, 12
    sra        $t4, $t4, 12
    sra        $t5, $t5, 12
  .L80079FC8:
    add        $v1, $v1, $a0
    add        $t8, $t8, $a0
    beqz       $a1, .L80079FDC
    add        $t9, $t9, $a0
    neg        $t1, $t1
  .L80079FDC:
    sh         $t0, 0x0($v1)
    sh         $t1, 0x0($t8)
    sh         $t4, 0x0($t9)
    jr         $ra
    sh         $t5, 0x6($a0)
.size G2Quat_FromEuler_S, . - G2Quat_FromEuler_S
