.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800B69F8
/* A71F8 800B69F8 0D80023C */  lui        $v0, %hi(debugSoundMenu)
/* A71FC 800B69FC AC204224 */  addiu      $v0, $v0, %lo(debugSoundMenu)
/* A7200 800B6A00 0E80033C */  lui        $v1, %hi(D_800DFE74)
/* A7204 800B6A04 74FE6324 */  addiu      $v1, $v1, %lo(D_800DFE74)
.L800B6A08:
/* A7208 800B6A08 000040AC */  sw         $zero, 0x0($v0)
/* A720C 800B6A0C 04004224 */  addiu      $v0, $v0, 0x4
/* A7210 800B6A10 2B084300 */  sltu       $at, $v0, $v1
/* A7214 800B6A14 FCFF2014 */  bnez       $at, .L800B6A08
/* A7218 800B6A18 00000000 */   nop
/* A721C 800B6A1C 0D80023C */  lui        $v0, %hi(_ramsize)
/* A7220 800B6A20 E409428C */  lw         $v0, %lo(_ramsize)($v0)
/* A7224 800B6A24 00000000 */  nop
/* A7228 800B6A28 F8FF4220 */  addi       $v0, $v0, -0x8 # handwritten instruction
/* A722C 800B6A2C 0080083C */  lui        $t0, %hi(D_80000004)
/* A7230 800B6A30 25E84800 */  or         $sp, $v0, $t0
/* A7234 800B6A34 0E80043C */  lui        $a0, %hi(D_800DFE74)
/* A7238 800B6A38 74FE8424 */  addiu      $a0, $a0, %lo(D_800DFE74)
/* A723C 800B6A3C C0200400 */  sll        $a0, $a0, 3
/* A7240 800B6A40 C2200400 */  srl        $a0, $a0, 3
/* A7244 800B6A44 0D80033C */  lui        $v1, %hi(_stacksize)
/* A7248 800B6A48 E809638C */  lw         $v1, %lo(_stacksize)($v1)
/* A724C 800B6A4C 00000000 */  nop
/* A7250 800B6A50 23284300 */  subu       $a1, $v0, $v1
/* A7254 800B6A54 2328A400 */  subu       $a1, $a1, $a0
/* A7258 800B6A58 0D80013C */  lui        $at, %hi(__heapsize)
/* A725C 800B6A5C 58C825AC */  sw         $a1, %lo(__heapsize)($at)
/* A7260 800B6A60 25208800 */  or         $a0, $a0, $t0
/* A7264 800B6A64 0D80013C */  lui        $at, %hi(__heapbase)
/* A7268 800B6A68 54C824AC */  sw         $a0, %lo(__heapbase)($at)
/* A726C 800B6A6C 0D80013C */  lui        $at, %hi(__ra_temp)
/* A7270 800B6A70 84743FAC */  sw         $ra, %lo(__ra_temp)($at)
/* A7274 800B6A74 0D801C3C */  lui        $gp, (0x800D0000 >> 16)
/* A7278 800B6A78 98759C27 */  addiu      $gp, $gp, 0x7598
/* A727C 800B6A7C 21F0A003 */  addu       $fp, $sp, $zero
/* A7280 800B6A80 D901030C */  jal        func_800C0764
/* A7284 800B6A84 04008420 */   addi      $a0, $a0, %lo(D_80000004) # handwritten instruction
/* A7288 800B6A88 0D801F3C */  lui        $ra, %hi(__ra_temp)
/* A728C 800B6A8C 8474FF8F */  lw         $ra, %lo(__ra_temp)($ra)
/* A7290 800B6A90 00000000 */  nop
/* A7294 800B6A94 0059020C */  jal        main
/* A7298 800B6A98 00000000 */   nop
/* A729C 800B6A9C 4D000000 */  break      0, 1
.size func_800B69F8, . - func_800B69F8
