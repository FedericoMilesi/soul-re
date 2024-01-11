.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_FsetRXX
/* B7088 800C6888 0700C014 */  bnez       $a2, .L800C68A8
/* B708C 800C688C 40100400 */   sll       $v0, $a0, 1
/* B7090 800C6890 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7094 800C6894 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7098 800C6898 00000000 */  nop
/* B709C 800C689C 21104300 */  addu       $v0, $v0, $v1
/* B70A0 800C68A0 311A0308 */  j          .L800C68C4
/* B70A4 800C68A4 000045A4 */   sh        $a1, 0x0($v0)
.L800C68A8:
/* B70A8 800C68A8 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B70AC 800C68AC 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
/* B70B0 800C68B0 0D80033C */  lui        $v1, %hi(_spu_mem_mode_plus)
/* B70B4 800C68B4 84ED638C */  lw         $v1, %lo(_spu_mem_mode_plus)($v1)
/* B70B8 800C68B8 21104400 */  addu       $v0, $v0, $a0
/* B70BC 800C68BC 06186500 */  srlv       $v1, $a1, $v1
/* B70C0 800C68C0 000043A4 */  sh         $v1, 0x0($v0)
.L800C68C4:
/* B70C4 800C68C4 0800E003 */  jr         $ra
/* B70C8 800C68C8 00000000 */   nop
.size _spu_FsetRXX, . - _spu_FsetRXX
