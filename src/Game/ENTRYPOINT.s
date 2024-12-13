.include "macro.inc"

.set noat
.set noreorder

.section .data

__initialised:
    .word 0

__heapbase:
    .word 0

__heapsize:
    .word 0

__text:
    .word main_TEXT_START

__textlen:
    .word main_TEXT_SIZE

__data:
    .word main_DATA_START

__datalen:
    .word main_DATA_SIZE

__bss:
    .word main_BSS_START

__bsslen:
    .word main_BSS_SIZE

.section .sbss

__ra_temp:
    .space 0x04

.section .text, "ax"

glabel __SN_ENTRY_POINT
    lui        $v0, %hi(main_SBSS_START)
    addiu      $v0, $v0, %lo(main_SBSS_START)
    lui        $v1, %hi(main_BSS_END)
    addiu      $v1, $v1, %lo(main_BSS_END)
  .L800B6A08:
    sw         $zero, 0x0($v0)
    addiu      $v0, $v0, 0x4
    sltu       $at, $v0, $v1
    bnez       $at, .L800B6A08
    nop
    lui        $v0, %hi(_ramsize)
    lw         $v0, %lo(_ramsize)($v0)
    nop
    addi       $v0, $v0, -0x8
    lui        $t0, 0x8000
    or         $sp, $v0, $t0
    lui        $a0, %hi(main_BSS_END)
    addiu      $a0, $a0, %lo(main_BSS_END)
    sll        $a0, $a0, 3
    srl        $a0, $a0, 3
    lui        $v1, %hi(_stacksize)
    lw         $v1, %lo(_stacksize)($v1)
    nop
    subu       $a1, $v0, $v1
    subu       $a1, $a1, $a0
    lui        $at, %hi(__heapsize)
    sw         $a1, %lo(__heapsize)($at)
    or         $a0, $a0, $t0
    lui        $at, %hi(__heapbase)
    sw         $a0, %lo(__heapbase)($at)
    lui        $at, %hi(__ra_temp)
    sw         $ra, %lo(__ra_temp)($at)
    lui        $gp, %hi(_gp)
    addiu      $gp, $gp, %lo(_gp)
    addu       $fp, $sp, $zero
    jal        InitHeap
    addi       $a0, $a0, 4
    lui        $ra, %hi(__ra_temp)
    lw         $ra, %lo(__ra_temp)($ra)
    nop
    jal        main
    nop
    break      0, 1
.size __SN_ENTRY_POINT, . - __SN_ENTRY_POINT

glabel __main
    lui        $t0, %hi(__initialised)
    lw         $t0, %lo(__initialised)($t0)
    addiu      $sp, $sp, -0x10
    sw         $s0, 0x4($sp)
    sw         $s1, 0x8($sp)
    sw         $ra, 0xC($sp)
    bnez       $t0, .L800B6AC8
    addiu      $t0, $zero, 0x1
    lui        $at, %hi(__initialised)
    sw         $t0, %lo(__initialised)($at)
  .L800B6AC8:
    lw         $ra, 0xC($sp)
    lw         $s1, 0x8($sp)
    lw         $s0, 0x4($sp)
    addiu      $sp, $sp, 0x10
    jr         $ra
    nop
.size __main, . - __main
