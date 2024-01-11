.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Instance_BuildTransforms
/* 8584C 8009504C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 85850 80095050 1000BFAF */  sw         $ra, 0x10($sp)
/* 85854 80095054 1C00838C */  lw         $v1, 0x1C($a0)
/* 85858 80095058 00000000 */  nop
/* 8585C 8009505C 1000628C */  lw         $v0, 0x10($v1)
/* 85860 80095060 00000000 */  nop
/* 85864 80095064 0A004010 */  beqz       $v0, .L80095090
/* 85868 80095068 00000000 */   nop
/* 8586C 8009506C 2C00628C */  lw         $v0, 0x2C($v1)
/* 85870 80095070 0040033C */  lui        $v1, (0x40000000 >> 16)
/* 85874 80095074 24104300 */  and        $v0, $v0, $v1
/* 85878 80095078 05004014 */  bnez       $v0, .L80095090
/* 8587C 8009507C 00000000 */   nop
/* 85880 80095080 6B55020C */  jal        _G2Instance_BuildAnimatedTransforms
/* 85884 80095084 00000000 */   nop
/* 85888 80095088 26540208 */  j          .L80095098
/* 8588C 8009508C 00000000 */   nop
.L80095090:
/* 85890 80095090 9D56020C */  jal        _G2Instance_BuildNonAnimatedTransforms
/* 85894 80095094 00000000 */   nop
.L80095098:
/* 85898 80095098 1000BF8F */  lw         $ra, 0x10($sp)
/* 8589C 8009509C 00000000 */  nop
/* 858A0 800950A0 0800E003 */  jr         $ra
/* 858A4 800950A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Instance_BuildTransforms, . - G2Instance_BuildTransforms
