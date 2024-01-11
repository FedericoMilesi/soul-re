.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_FsetRXXa
/* B70CC 800C68CC 0D80023C */  lui        $v0, %hi(_spu_mem_mode)
/* B70D0 800C68D0 80ED428C */  lw         $v0, %lo(_spu_mem_mode)($v0)
/* B70D4 800C68D4 00000000 */  nop
/* B70D8 800C68D8 10004010 */  beqz       $v0, .L800C691C
/* B70DC 800C68DC 21308000 */   addu      $a2, $a0, $zero
/* B70E0 800C68E0 0D80043C */  lui        $a0, %hi(_spu_mem_mode_unit)
/* B70E4 800C68E4 88ED848C */  lw         $a0, %lo(_spu_mem_mode_unit)($a0)
/* B70E8 800C68E8 00000000 */  nop
/* B70EC 800C68EC 1B00A400 */  divu       $zero, $a1, $a0
/* B70F0 800C68F0 02008014 */  bnez       $a0, .L800C68FC
/* B70F4 800C68F4 00000000 */   nop
/* B70F8 800C68F8 0D000700 */  break      7
.L800C68FC:
/* B70FC 800C68FC 10100000 */  mfhi       $v0
/* B7100 800C6900 06004010 */  beqz       $v0, .L800C691C
/* B7104 800C6904 00000000 */   nop
/* B7108 800C6908 0D80023C */  lui        $v0, %hi(_spu_mem_mode_unitM)
/* B710C 800C690C 8CED428C */  lw         $v0, %lo(_spu_mem_mode_unitM)($v0)
/* B7110 800C6910 2128A400 */  addu       $a1, $a1, $a0
/* B7114 800C6914 27100200 */  nor        $v0, $zero, $v0
/* B7118 800C6918 2428A200 */  and        $a1, $a1, $v0
.L800C691C:
/* B711C 800C691C 0D80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
/* B7120 800C6920 84ED428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
/* B7124 800C6924 00000000 */  nop
/* B7128 800C6928 06384500 */  srlv       $a3, $a1, $v0
/* B712C 800C692C FEFF0224 */  addiu      $v0, $zero, -0x2
/* B7130 800C6930 0600C210 */  beq        $a2, $v0, .L800C694C
/* B7134 800C6934 2118E000 */   addu      $v1, $a3, $zero
/* B7138 800C6938 FFFF0224 */  addiu      $v0, $zero, -0x1
/* B713C 800C693C 0500C214 */  bne        $a2, $v0, .L800C6954
/* B7140 800C6940 2110A000 */   addu      $v0, $a1, $zero
/* B7144 800C6944 5A1A0308 */  j          .L800C6968
/* B7148 800C6948 FFFF6230 */   andi      $v0, $v1, 0xFFFF
.L800C694C:
/* B714C 800C694C 5A1A0308 */  j          .L800C6968
/* B7150 800C6950 2110A000 */   addu      $v0, $a1, $zero
.L800C6954:
/* B7154 800C6954 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B7158 800C6958 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
/* B715C 800C695C 40180600 */  sll        $v1, $a2, 1
/* B7160 800C6960 21186400 */  addu       $v1, $v1, $a0
/* B7164 800C6964 000067A4 */  sh         $a3, 0x0($v1)
.L800C6968:
/* B7168 800C6968 0800E003 */  jr         $ra
/* B716C 800C696C 00000000 */   nop
.size _spu_FsetRXXa, . - _spu_FsetRXXa
