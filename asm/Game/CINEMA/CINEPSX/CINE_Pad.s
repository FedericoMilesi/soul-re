.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CINE_Pad
/* A7C5C 800B745C 05008014 */  bnez       $a0, .L800B7474
/* A7C60 800B7460 0D80023C */   lui       $v0, %hi(readGPBuffer2 + 0x2)
/* A7C64 800B7464 0D80023C */  lui        $v0, %hi(readGPBuffer1 + 0x2)
/* A7C68 800B7468 8E304294 */  lhu        $v0, %lo(readGPBuffer1 + 0x2)($v0)
/* A7C6C 800B746C 0800E003 */  jr         $ra
/* A7C70 800B7470 00000000 */   nop
.L800B7474:
/* A7C74 800B7474 D6304294 */  lhu        $v0, %lo(readGPBuffer2 + 0x2)($v0)
/* A7C78 800B7478 0800E003 */  jr         $ra
/* A7C7C 800B747C 00000000 */   nop
.size CINE_Pad, . - CINE_Pad
