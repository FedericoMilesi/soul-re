.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBD88
/* AC588 800BBD88 FFFFA624 */  addiu      $a2, $a1, -0x1
/* AC58C 800BBD8C 0D80033C */  lui        $v1, %hi(GEnv + 0x108)
/* AC590 800BBD90 14DB638C */  lw         $v1, %lo(GEnv + 0x108)($v1)
/* AC594 800BBD94 0004023C */  lui        $v0, (0x4000000 >> 16)
/* AC598 800BBD98 0900A010 */  beqz       $a1, .L800BBDC0
/* AC59C 800BBD9C 000062AC */   sw        $v0, 0x0($v1)
/* AC5A0 800BBDA0 FFFF0524 */  addiu      $a1, $zero, -0x1
.L800BBDA4:
/* AC5A4 800BBDA4 0000838C */  lw         $v1, 0x0($a0)
/* AC5A8 800BBDA8 04008424 */  addiu      $a0, $a0, 0x4
/* AC5AC 800BBDAC 0D80023C */  lui        $v0, %hi(GEnv + 0x104)
/* AC5B0 800BBDB0 10DB428C */  lw         $v0, %lo(GEnv + 0x104)($v0)
/* AC5B4 800BBDB4 FFFFC624 */  addiu      $a2, $a2, -0x1
/* AC5B8 800BBDB8 FAFFC514 */  bne        $a2, $a1, .L800BBDA4
/* AC5BC 800BBDBC 000043AC */   sw        $v1, 0x0($v0)
.L800BBDC0:
/* AC5C0 800BBDC0 0800E003 */  jr         $ra
/* AC5C4 800BBDC4 21100000 */   addu      $v0, $zero, $zero
.size func_800BBD88, . - func_800BBD88
