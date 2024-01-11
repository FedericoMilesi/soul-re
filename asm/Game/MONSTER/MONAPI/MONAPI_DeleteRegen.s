.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONAPI_DeleteRegen
/* 6FB40 8007F340 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 6FB44 8007F344 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FB48 8007F348 1000BFAF */  sw         $ra, 0x10($sp)
/* 6FB4C 8007F34C 0E006290 */  lbu        $v0, 0xE($v1)
/* 6FB50 8007F350 08008524 */  addiu      $a1, $a0, 0x8
/* 6FB54 8007F354 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 6FB58 8007F358 0E0062A0 */  sb         $v0, 0xE($v1)
/* 6FB5C 8007F35C 40A8838F */  lw         $v1, %gp_rel(GlobalSave)($gp)
/* 6FB60 8007F360 F0FF8224 */  addiu      $v0, $a0, -0x10
/* 6FB64 8007F364 23104300 */  subu       $v0, $v0, $v1
/* 6FB68 8007F368 0E006680 */  lb         $a2, 0xE($v1)
/* 6FB6C 8007F36C C3100200 */  sra        $v0, $v0, 3
/* 6FB70 8007F370 2330C200 */  subu       $a2, $a2, $v0
/* 6FB74 8007F374 02E5010C */  jal        memcpy
/* 6FB78 8007F378 C0300600 */   sll       $a2, $a2, 3
/* 6FB7C 8007F37C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6FB80 8007F380 00000000 */  nop
/* 6FB84 8007F384 0800E003 */  jr         $ra
/* 6FB88 8007F388 1800BD27 */   addiu     $sp, $sp, 0x18
.size MONAPI_DeleteRegen, . - MONAPI_DeleteRegen
