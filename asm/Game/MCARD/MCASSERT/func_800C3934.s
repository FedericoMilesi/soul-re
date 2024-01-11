.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C3934
/* B4134 800C3934 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B4138 800C3938 1000BFAF */  sw         $ra, 0x10($sp)
/* B413C 800C393C 46008390 */  lbu        $v1, 0x46($a0)
/* B4140 800C3940 03000224 */  addiu      $v0, $zero, 0x3
/* B4144 800C3944 11006210 */  beq        $v1, $v0, .L800C398C
/* B4148 800C3948 04006228 */   slti      $v0, $v1, 0x4
/* B414C 800C394C 05004010 */  beqz       $v0, .L800C3964
/* B4150 800C3950 02000224 */   addiu     $v0, $zero, 0x2
/* B4154 800C3954 08006210 */  beq        $v1, $v0, .L800C3978
/* B4158 800C3958 00000000 */   nop
/* B415C 800C395C 730E0308 */  j          .L800C39CC
/* B4160 800C3960 00000000 */   nop
.L800C3964:
/* B4164 800C3964 04000224 */  addiu      $v0, $zero, 0x4
/* B4168 800C3968 0D006210 */  beq        $v1, $v0, .L800C39A0
/* B416C 800C396C 00000000 */   nop
/* B4170 800C3970 730E0308 */  j          .L800C39CC
/* B4174 800C3974 00000000 */   nop
.L800C3978:
/* B4178 800C3978 47008590 */  lbu        $a1, 0x47($a0)
/* B417C 800C397C D50F030C */  jal        func_800C3F54
/* B4180 800C3980 00000000 */   nop
/* B4184 800C3984 730E0308 */  j          .L800C39CC
/* B4188 800C3988 00000000 */   nop
.L800C398C:
/* B418C 800C398C 47008590 */  lbu        $a1, 0x47($a0)
/* B4190 800C3990 DD0F030C */  jal        func_800C3F74
/* B4194 800C3994 00000000 */   nop
/* B4198 800C3998 730E0308 */  j          .L800C39CC
/* B419C 800C399C 00000000 */   nop
.L800C39A0:
/* B41A0 800C39A0 48008290 */  lbu        $v0, 0x48($a0)
/* B41A4 800C39A4 00000000 */  nop
/* B41A8 800C39A8 06004014 */  bnez       $v0, .L800C39C4
/* B41AC 800C39AC 00000000 */   nop
/* B41B0 800C39B0 47008590 */  lbu        $a1, 0x47($a0)
/* B41B4 800C39B4 E50F030C */  jal        func_800C3F94
/* B41B8 800C39B8 00000000 */   nop
/* B41BC 800C39BC 730E0308 */  j          .L800C39CC
/* B41C0 800C39C0 00000000 */   nop
.L800C39C4:
/* B41C4 800C39C4 ED0F030C */  jal        func_800C3FB4
/* B41C8 800C39C8 00000000 */   nop
.L800C39CC:
/* B41CC 800C39CC 1000BF8F */  lw         $ra, 0x10($sp)
/* B41D0 800C39D0 1800BD27 */  addiu      $sp, $sp, 0x18
/* B41D4 800C39D4 0800E003 */  jr         $ra
/* B41D8 800C39D8 00000000 */   nop
.size func_800C3934, . - func_800C3934
