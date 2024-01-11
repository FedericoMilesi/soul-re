.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckForDevStation
/* 295D4 80038DD4 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 295D8 80038DD8 1880023C */  lui        $v0, (0x80180000 >> 16)
/* 295DC 80038DDC 0000A2AF */  sw         $v0, 0x0($sp)
/* 295E0 80038DE0 3880023C */  lui        $v0, (0x80380000 >> 16)
/* 295E4 80038DE4 0400A2AF */  sw         $v0, 0x4($sp)
/* 295E8 80038DE8 0000A28F */  lw         $v0, 0x0($sp)
/* 295EC 80038DEC 3412033C */  lui        $v1, (0x12345678 >> 16)
/* 295F0 80038DF0 000040AC */  sw         $zero, 0x0($v0)
/* 295F4 80038DF4 0400A28F */  lw         $v0, 0x4($sp)
/* 295F8 80038DF8 78566334 */  ori        $v1, $v1, (0x12345678 & 0xFFFF)
/* 295FC 80038DFC 000043AC */  sw         $v1, 0x0($v0)
/* 29600 80038E00 0000A28F */  lw         $v0, 0x0($sp)
/* 29604 80038E04 0400A38F */  lw         $v1, 0x4($sp)
/* 29608 80038E08 0000448C */  lw         $a0, 0x0($v0)
/* 2960C 80038E0C 0000628C */  lw         $v0, 0x0($v1)
/* 29610 80038E10 00000000 */  nop
/* 29614 80038E14 04008214 */  bne        $a0, $v0, .L80038E28
/* 29618 80038E18 01000224 */   addiu     $v0, $zero, 0x1
/* 2961C 80038E1C 84BC80AF */  sw         $zero, %gp_rel(devstation)($gp)
/* 29620 80038E20 8BE30008 */  j          .L80038E2C
/* 29624 80038E24 00000000 */   nop
.L80038E28:
/* 29628 80038E28 84BC82AF */  sw         $v0, %gp_rel(devstation)($gp)
.L80038E2C:
/* 2962C 80038E2C 0800E003 */  jr         $ra
/* 29630 80038E30 0800BD27 */   addiu     $sp, $sp, 0x8
.size CheckForDevStation, . - CheckForDevStation
