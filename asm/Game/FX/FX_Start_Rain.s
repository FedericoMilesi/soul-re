.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_Start_Rain
/* 3D958 8004D158 EB51023C */  lui        $v0, (0x51EB851F >> 16)
/* 3D95C 8004D15C 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
/* 3D960 8004D160 80220400 */  sll        $a0, $a0, 10
/* 3D964 8004D164 18008200 */  mult       $a0, $v0
/* 3D968 8004D168 C3270400 */  sra        $a0, $a0, 31
/* 3D96C 8004D16C 10180000 */  mfhi       $v1
/* 3D970 8004D170 43110300 */  sra        $v0, $v1, 5
/* 3D974 8004D174 23104400 */  subu       $v0, $v0, $a0
/* 3D978 8004D178 769A82A7 */  sh         $v0, %gp_rel(rain_amount)($gp)
/* 3D97C 8004D17C 00140200 */  sll        $v0, $v0, 16
/* 3D980 8004D180 02004014 */  bnez       $v0, .L8004D18C
/* 3D984 8004D184 00000000 */   nop
/* 3D988 8004D188 789A80A7 */  sh         $zero, %gp_rel(current_rain_fade)($gp)
.L8004D18C:
/* 3D98C 8004D18C 0800E003 */  jr         $ra
/* 3D990 8004D190 00000000 */   nop
.size FX_Start_Rain, . - FX_Start_Rain
