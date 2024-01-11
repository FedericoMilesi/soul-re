.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_FiDMA
/* B6C64 800C6464 0D80023C */  lui        $v0, %hi(_spu_IRQCallback + 0x14)
/* B6C68 800C6468 ACED428C */  lw         $v0, %lo(_spu_IRQCallback + 0x14)($v0)
/* B6C6C 800C646C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B6C70 800C6470 03004014 */  bnez       $v0, .L800C6480
/* B6C74 800C6474 1000BFAF */   sw        $ra, 0x10($sp)
/* B6C78 800C6478 861A030C */  jal        _spu_Fw1ts
/* B6C7C 800C647C 00000000 */   nop
.L800C6480:
/* B6C80 800C6480 0D80043C */  lui        $a0, %hi(_spu_RXX)
/* B6C84 800C6484 5CED848C */  lw         $a0, %lo(_spu_RXX)($a0)
/* B6C88 800C6488 00000000 */  nop
/* B6C8C 800C648C AA018294 */  lhu        $v0, 0x1AA($a0)
/* B6C90 800C6490 00000000 */  nop
/* B6C94 800C6494 CFFF4230 */  andi       $v0, $v0, 0xFFCF
/* B6C98 800C6498 AA0182A4 */  sh         $v0, 0x1AA($a0)
/* B6C9C 800C649C AA018294 */  lhu        $v0, 0x1AA($a0)
/* B6CA0 800C64A0 00000000 */  nop
/* B6CA4 800C64A4 30004230 */  andi       $v0, $v0, 0x30
/* B6CA8 800C64A8 0A004010 */  beqz       $v0, .L800C64D4
/* B6CAC 800C64AC 21180000 */   addu      $v1, $zero, $zero
/* B6CB0 800C64B0 01006324 */  addiu      $v1, $v1, 0x1
.L800C64B4:
/* B6CB4 800C64B4 010F622C */  sltiu      $v0, $v1, 0xF01
/* B6CB8 800C64B8 06004010 */  beqz       $v0, .L800C64D4
/* B6CBC 800C64BC 00000000 */   nop
/* B6CC0 800C64C0 AA018294 */  lhu        $v0, 0x1AA($a0)
/* B6CC4 800C64C4 00000000 */  nop
/* B6CC8 800C64C8 30004230 */  andi       $v0, $v0, 0x30
/* B6CCC 800C64CC F9FF4014 */  bnez       $v0, .L800C64B4
/* B6CD0 800C64D0 01006324 */   addiu     $v1, $v1, 0x1
.L800C64D4:
/* B6CD4 800C64D4 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B6CD8 800C64D8 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B6CDC 800C64DC 00000000 */  nop
/* B6CE0 800C64E0 08004010 */  beqz       $v0, .L800C6504
/* B6CE4 800C64E4 00F0043C */   lui       $a0, (0xF0000009 >> 16)
/* B6CE8 800C64E8 0D80023C */  lui        $v0, %hi(_spu_transferCallback)
/* B6CEC 800C64EC 94ED428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
/* B6CF0 800C64F0 00000000 */  nop
/* B6CF4 800C64F4 09F84000 */  jalr       $v0
/* B6CF8 800C64F8 00000000 */   nop
/* B6CFC 800C64FC 44190308 */  j          .L800C6510
/* B6D00 800C6500 00000000 */   nop
.L800C6504:
/* B6D04 800C6504 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
/* B6D08 800C6508 AD15030C */  jal        DeliverEvent
/* B6D0C 800C650C 20000524 */   addiu     $a1, $zero, 0x20
.L800C6510:
/* B6D10 800C6510 1000BF8F */  lw         $ra, 0x10($sp)
/* B6D14 800C6514 1800BD27 */  addiu      $sp, $sp, 0x18
/* B6D18 800C6518 0800E003 */  jr         $ra
/* B6D1C 800C651C 00000000 */   nop
.size _spu_FiDMA, . - _spu_FiDMA
