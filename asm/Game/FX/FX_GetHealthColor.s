.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetHealthColor
/* 3D8D0 8004D0D0 0400801C */  bgtz       $a0, .L8004D0E4
/* 3D8D4 8004D0D4 0D80023C */   lui       $v0, %hi(D_800CA43C)
/* 3D8D8 8004D0D8 3CA4438C */  lw         $v1, %lo(D_800CA43C)($v0)
/* 3D8DC 8004D0DC 46340108 */  j          .L8004D118
/* 3D8E0 8004D0E0 FCFF023C */   lui       $v0, (0xFFFCFCFC >> 16)
.L8004D0E4:
/* 3D8E4 8004D0E4 0600822C */  sltiu      $v0, $a0, 0x6
/* 3D8E8 8004D0E8 08004010 */  beqz       $v0, .L8004D10C
/* 3D8EC 8004D0EC 0D80033C */   lui       $v1, %hi(D_800CA43C)
/* 3D8F0 8004D0F0 3CA46324 */  addiu      $v1, $v1, %lo(D_800CA43C)
/* 3D8F4 8004D0F4 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 3D8F8 8004D0F8 80100200 */  sll        $v0, $v0, 2
/* 3D8FC 8004D0FC 21104300 */  addu       $v0, $v0, $v1
/* 3D900 8004D100 0000438C */  lw         $v1, 0x0($v0)
/* 3D904 8004D104 46340108 */  j          .L8004D118
/* 3D908 8004D108 FCFF023C */   lui       $v0, (0xFFFCFCFC >> 16)
.L8004D10C:
/* 3D90C 8004D10C 0D80023C */  lui        $v0, %hi(D_800CA450)
/* 3D910 8004D110 50A4438C */  lw         $v1, %lo(D_800CA450)($v0)
/* 3D914 8004D114 FCFF023C */  lui        $v0, (0xFFFCFCFC >> 16)
.L8004D118:
/* 3D918 8004D118 FCFC4234 */  ori        $v0, $v0, (0xFFFCFCFC & 0xFFFF)
/* 3D91C 8004D11C 0800E003 */  jr         $ra
/* 3D920 8004D120 24106200 */   and       $v0, $v1, $v0
.size FX_GetHealthColor, . - FX_GetHealthColor
