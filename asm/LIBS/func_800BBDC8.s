.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBDC8
/* AC5C8 800BBDC8 0004033C */  lui        $v1, (0x4000002 >> 16)
/* AC5CC 800BBDCC 0D80023C */  lui        $v0, %hi(GEnv + 0x108)
/* AC5D0 800BBDD0 14DB428C */  lw         $v0, %lo(GEnv + 0x108)($v0)
/* AC5D4 800BBDD4 02006334 */  ori        $v1, $v1, (0x4000002 & 0xFFFF)
/* AC5D8 800BBDD8 000043AC */  sw         $v1, 0x0($v0)
/* AC5DC 800BBDDC 0D80023C */  lui        $v0, %hi(GEnv + 0x10C)
/* AC5E0 800BBDE0 18DB428C */  lw         $v0, %lo(GEnv + 0x10C)($v0)
/* AC5E4 800BBDE4 00000000 */  nop
/* AC5E8 800BBDE8 000044AC */  sw         $a0, 0x0($v0)
/* AC5EC 800BBDEC 0D80023C */  lui        $v0, %hi(GEnv + 0x110)
/* AC5F0 800BBDF0 1CDB428C */  lw         $v0, %lo(GEnv + 0x110)($v0)
/* AC5F4 800BBDF4 0001033C */  lui        $v1, (0x1000401 >> 16)
/* AC5F8 800BBDF8 000040AC */  sw         $zero, 0x0($v0)
/* AC5FC 800BBDFC 0D80023C */  lui        $v0, %hi(GEnv + 0x114)
/* AC600 800BBE00 20DB428C */  lw         $v0, %lo(GEnv + 0x114)($v0)
/* AC604 800BBE04 01046334 */  ori        $v1, $v1, (0x1000401 & 0xFFFF)
/* AC608 800BBE08 0800E003 */  jr         $ra
/* AC60C 800BBE0C 000043AC */   sw        $v1, 0x0($v0)
.size func_800BBDC8, . - func_800BBDC8
