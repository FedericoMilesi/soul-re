.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SpuQuit
/* B08F0 800C00F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B08F4 800C00F4 0D80033C */  lui        $v1, %hi(_spu_isCalled)
/* B08F8 800C00F8 4CED638C */  lw         $v1, %lo(_spu_isCalled)($v1)
/* B08FC 800C00FC 01000224 */  addiu      $v0, $zero, 0x1
/* B0900 800C0100 14006214 */  bne        $v1, $v0, .L800C0154
/* B0904 800C0104 1000BFAF */   sw        $ra, 0x10($sp)
/* B0908 800C0108 0D80013C */  lui        $at, %hi(_spu_isCalled)
/* B090C 800C010C A5FC020C */  jal        EnterCriticalSection
/* B0910 800C0110 4CED20AC */   sw        $zero, %lo(_spu_isCalled)($at)
/* B0914 800C0114 21200000 */  addu       $a0, $zero, $zero
/* B0918 800C0118 0D80013C */  lui        $at, %hi(_spu_transferCallback)
/* B091C 800C011C 94ED20AC */  sw         $zero, %lo(_spu_transferCallback)($at)
/* B0920 800C0120 0D80013C */  lui        $at, %hi(_spu_IRQCallback)
/* B0924 800C0124 B41B030C */  jal        _SpuDataCallback
/* B0928 800C0128 98ED20AC */   sw        $zero, %lo(_spu_IRQCallback)($at)
/* B092C 800C012C 0D80043C */  lui        $a0, %hi(_spu_EVdma)
/* B0930 800C0130 E4EC848C */  lw         $a0, %lo(_spu_EVdma)($a0)
/* B0934 800C0134 11FD020C */  jal        CloseEvent
/* B0938 800C0138 00000000 */   nop
/* B093C 800C013C 0D80043C */  lui        $a0, %hi(_spu_EVdma)
/* B0940 800C0140 E4EC848C */  lw         $a0, %lo(_spu_EVdma)($a0)
/* B0944 800C0144 DDFC020C */  jal        DisableEvent
/* B0948 800C0148 00000000 */   nop
/* B094C 800C014C 11FC020C */  jal        ExitCriticalSection
/* B0950 800C0150 00000000 */   nop
.L800C0154:
/* B0954 800C0154 1000BF8F */  lw         $ra, 0x10($sp)
/* B0958 800C0158 1800BD27 */  addiu      $sp, $sp, 0x18
/* B095C 800C015C 0800E003 */  jr         $ra
/* B0960 800C0160 00000000 */   nop
/* B0964 800C0164 00000000 */  nop
/* B0968 800C0168 00000000 */  nop
/* B096C 800C016C 00000000 */  nop
.size SpuQuit, . - SpuQuit
