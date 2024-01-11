.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _padInitDirSeq
/* B3838 800C3038 0C80023C */  lui        $v0, %hi(func_800C306C)
/* B383C 800C303C 6C304224 */  addiu      $v0, $v0, %lo(func_800C306C)
/* B3840 800C3040 0D80013C */  lui        $at, %hi(_padFuncSendAuto)
/* B3844 800C3044 1CE922AC */  sw         $v0, %lo(_padFuncSendAuto)($at)
/* B3848 800C3048 0C80023C */  lui        $v0, %hi(func_800C34C0)
/* B384C 800C304C C0344224 */  addiu      $v0, $v0, %lo(func_800C34C0)
/* B3850 800C3050 0D80013C */  lui        $at, %hi(_padFuncChkEng)
/* B3854 800C3054 20E922AC */  sw         $v0, %lo(_padFuncChkEng)($at)
/* B3858 800C3058 0C80023C */  lui        $v0, %hi(func_800C317C)
/* B385C 800C305C 7C314224 */  addiu      $v0, $v0, %lo(func_800C317C)
/* B3860 800C3060 0D80013C */  lui        $at, %hi(_padFuncRecvAuto)
/* B3864 800C3064 0800E003 */  jr         $ra
/* B3868 800C3068 24E922AC */   sw        $v0, %lo(_padFuncRecvAuto)($at)
.size _padInitDirSeq, . - _padInitDirSeq
