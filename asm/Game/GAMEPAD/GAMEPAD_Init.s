.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMEPAD_Init
/* 22128 80031928 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2212C 8003192C F4BA8427 */  addiu      $a0, $gp, %gp_rel(readGPBuffer1)
/* 22130 80031930 3CBB8527 */  addiu      $a1, $gp, %gp_rel(readGPBuffer2)
/* 22134 80031934 1000BFAF */  sw         $ra, 0x10($sp)
/* 22138 80031938 12F5020C */  jal        PadInitDirect
/* 2213C 8003193C 00000000 */   nop
/* 22140 80031940 AAF6020C */  jal        PadStartCom
/* 22144 80031944 00000000 */   nop
/* 22148 80031948 08C6000C */  jal        GAMEPAD_Detect
/* 2214C 8003194C 00000000 */   nop
/* 22150 80031950 60BB8427 */  addiu      $a0, $gp, %gp_rel(gDummyCommand)
/* 22154 80031954 21280000 */  addu       $a1, $zero, $zero
/* 22158 80031958 2EF2020C */  jal        memset
/* 2215C 8003195C 10000624 */   addiu     $a2, $zero, 0x10
/* 22160 80031960 F4BA8427 */  addiu      $a0, $gp, %gp_rel(readGPBuffer1)
/* 22164 80031964 21280000 */  addu       $a1, $zero, $zero
/* 22168 80031968 2EF2020C */  jal        memset
/* 2216C 8003196C 22000624 */   addiu     $a2, $zero, 0x22
/* 22170 80031970 3CBB8427 */  addiu      $a0, $gp, %gp_rel(readGPBuffer2)
/* 22174 80031974 21280000 */  addu       $a1, $zero, $zero
/* 22178 80031978 2EF2020C */  jal        memset
/* 2217C 8003197C 22000624 */   addiu     $a2, $zero, 0x22
/* 22180 80031980 1000BF8F */  lw         $ra, 0x10($sp)
/* 22184 80031984 FFFF0234 */  ori        $v0, $zero, 0xFFFF
/* 22188 80031988 F6BA82A7 */  sh         $v0, %gp_rel(readGPBuffer1 + 0x2)($gp)
/* 2218C 8003198C F4BA80A3 */  sb         $zero, %gp_rel(readGPBuffer1)($gp)
/* 22190 80031990 3EBB82A7 */  sh         $v0, %gp_rel(readGPBuffer2 + 0x2)($gp)
/* 22194 80031994 3CBB80A3 */  sb         $zero, %gp_rel(readGPBuffer2)($gp)
/* 22198 80031998 D2BA82A7 */  sh         $v0, %gp_rel(gpbuffer1 + 0x2)($gp)
/* 2219C 8003199C D0BA80A3 */  sb         $zero, %gp_rel(gpbuffer1)($gp)
/* 221A0 800319A0 1ABB82A7 */  sh         $v0, %gp_rel(gpbuffer2 + 0x2)($gp)
/* 221A4 800319A4 18BB80A3 */  sb         $zero, %gp_rel(gpbuffer2)($gp)
/* 221A8 800319A8 0800E003 */  jr         $ra
/* 221AC 800319AC 1800BD27 */   addiu     $sp, $sp, 0x18
.size GAMEPAD_Init, . - GAMEPAD_Init
