.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel setRC2wait
/* B8170 800C7970 801F023C */  lui        $v0, (0x1F801120 >> 16)
/* B8174 800C7974 20114234 */  ori        $v0, $v0, (0x1F801120 & 0xFFFF)
/* B8178 800C7978 00004294 */  lhu        $v0, 0x0($v0)
/* B817C 800C797C 0E80013C */  lui        $at, %hi(_waitTime)
/* B8180 800C7980 3CFE24AC */  sw         $a0, %lo(_waitTime)($at)
/* B8184 800C7984 0E80013C */  lui        $at, %hi(D_800DFE40)
/* B8188 800C7988 0800E003 */  jr         $ra
/* B818C 800C798C 40FE22AC */   sw        $v0, %lo(D_800DFE40)($at)
.size setRC2wait, . - setRC2wait
