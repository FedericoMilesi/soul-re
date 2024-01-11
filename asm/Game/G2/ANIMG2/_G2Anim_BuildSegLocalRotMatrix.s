.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_BuildSegLocalRotMatrix
/* 84B68 80094368 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 84B6C 8009436C 21188000 */  addu       $v1, $a0, $zero
/* 84B70 80094370 1800BFAF */  sw         $ra, 0x18($sp)
/* 84B74 80094374 16006294 */  lhu        $v0, 0x16($v1)
/* 84B78 80094378 00000000 */  nop
/* 84B7C 8009437C 05004010 */  beqz       $v0, .L80094394
/* 84B80 80094380 FF0F063C */   lui       $a2, (0xFFF0FFF >> 16)
/* 84B84 80094384 27E7010C */  jal        func_80079C9C
/* 84B88 80094388 00000000 */   nop
/* 84B8C 8009438C EE500208 */  j          .L800943B8
/* 84B90 80094390 00000000 */   nop
.L80094394:
/* 84B94 80094394 FF0FC634 */  ori        $a2, $a2, (0xFFF0FFF & 0xFFFF)
/* 84B98 80094398 1000A427 */  addiu      $a0, $sp, 0x10
/* 84B9C 8009439C 04006294 */  lhu        $v0, 0x4($v1)
/* 84BA0 800943A0 0000638C */  lw         $v1, 0x0($v1)
/* 84BA4 800943A4 FF0F4230 */  andi       $v0, $v0, 0xFFF
/* 84BA8 800943A8 24186600 */  and        $v1, $v1, $a2
/* 84BAC 800943AC 040082A4 */  sh         $v0, 0x4($a0)
/* 84BB0 800943B0 D8E2010C */  jal        func_80078B60
/* 84BB4 800943B4 1000A3AF */   sw        $v1, 0x10($sp)
.L800943B8:
/* 84BB8 800943B8 1800BF8F */  lw         $ra, 0x18($sp)
/* 84BBC 800943BC 00000000 */  nop
/* 84BC0 800943C0 0800E003 */  jr         $ra
/* 84BC4 800943C4 2000BD27 */   addiu     $sp, $sp, 0x20
.size _G2Anim_BuildSegLocalRotMatrix, . - _G2Anim_BuildSegLocalRotMatrix
