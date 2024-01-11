.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7A30
/* B8230 800C7A30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B8234 800C7A34 1000B0AF */  sw         $s0, 0x10($sp)
/* B8238 800C7A38 0D80023C */  lui        $v0, %hi(_padFuncSendAuto)
/* B823C 800C7A3C 1CE9428C */  lw         $v0, %lo(_padFuncSendAuto)($v0)
/* B8240 800C7A40 1400BFAF */  sw         $ra, 0x14($sp)
/* B8244 800C7A44 09F84000 */  jalr       $v0
/* B8248 800C7A48 21808000 */   addu      $s0, $a0, $zero
/* B824C 800C7A4C 21200002 */  addu       $a0, $s0, $zero
/* B8250 800C7A50 3C00038E */  lw         $v1, 0x3C($s0)
/* B8254 800C7A54 FEFF0524 */  addiu      $a1, $zero, -0x2
/* B8258 800C7A58 0D80013C */  lui        $at, %hi(_spu_rev_param + 0x2D8)
/* B825C 800C7A5C C4F422AC */  sw         $v0, %lo(_spu_rev_param + 0x2D8)($at)
/* B8260 800C7A60 BB0A030C */  jal        func_800C2AEC
/* B8264 800C7A64 000060A0 */   sb        $zero, 0x0($v1)
/* B8268 800C7A68 1400BF8F */  lw         $ra, 0x14($sp)
/* B826C 800C7A6C 1000B08F */  lw         $s0, 0x10($sp)
/* B8270 800C7A70 0800E003 */  jr         $ra
/* B8274 800C7A74 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C7A30, . - func_800C7A30
