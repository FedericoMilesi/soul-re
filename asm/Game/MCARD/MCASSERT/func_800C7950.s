.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C7950
/* B8150 800C7950 C0000A24 */  addiu      $t2, $zero, 0xC0
/* B8154 800C7954 08004001 */  jr         $t2
/* B8158 800C7958 03000924 */   addiu     $t1, $zero, 0x3
/* B815C 800C795C 00000000 */  nop
glabel func_800C7960
/* B8160 800C7960 C0000A24 */  addiu      $t2, $zero, 0xC0
/* B8164 800C7964 08004001 */  jr         $t2
/* B8168 800C7968 02000924 */   addiu     $t1, $zero, 0x2
/* B816C 800C796C 00000000 */  nop
glabel func_800C7970
/* B8170 800C7970 801F023C */  lui        $v0, (0x1F801120 >> 16)
/* B8174 800C7974 20114234 */  ori        $v0, $v0, (0x1F801120 & 0xFFFF)
/* B8178 800C7978 00004294 */  lhu        $v0, 0x0($v0)
/* B817C 800C797C 0E80013C */  lui        $at, %hi(_waitTime)
/* B8180 800C7980 3CFE24AC */  sw         $a0, %lo(_waitTime)($at)
/* B8184 800C7984 0E80013C */  lui        $at, %hi(D_800DFE40)
/* B8188 800C7988 0800E003 */  jr         $ra
/* B818C 800C798C 40FE22AC */   sw        $v0, %lo(D_800DFE40)($at)
.size func_800C7950, . - func_800C7950
