.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C306C
/* B386C 800C306C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3870 800C3070 1000B0AF */  sw         $s0, 0x10($sp)
/* B3874 800C3074 21808000 */  addu       $s0, $a0, $zero
/* B3878 800C3078 1400BFAF */  sw         $ra, 0x14($sp)
/* B387C 800C307C 3C00028E */  lw         $v0, 0x3C($s0)
/* B3880 800C3080 00000000 */  nop
/* B3884 800C3084 00004390 */  lbu        $v1, 0x0($v0)
/* B3888 800C3088 F3000224 */  addiu      $v0, $zero, 0xF3
/* B388C 800C308C 12006214 */  bne        $v1, $v0, .L800C30D8
/* B3890 800C3090 00000000 */   nop
/* B3894 800C3094 E8000292 */  lbu        $v0, 0xE8($s0)
/* B3898 800C3098 00000000 */  nop
/* B389C 800C309C 24004010 */  beqz       $v0, .L800C3130
/* B38A0 800C30A0 FF000224 */   addiu     $v0, $zero, 0xFF
/* B38A4 800C30A4 46000392 */  lbu        $v1, 0x46($s0)
/* B38A8 800C30A8 00000000 */  nop
/* B38AC 800C30AC 1F006210 */  beq        $v1, $v0, .L800C312C
/* B38B0 800C30B0 02000224 */   addiu     $v0, $zero, 0x2
/* B38B4 800C30B4 49000392 */  lbu        $v1, 0x49($s0)
/* B38B8 800C30B8 00000000 */  nop
/* B38BC 800C30BC 06006214 */  bne        $v1, $v0, .L800C30D8
/* B38C0 800C30C0 00000000 */   nop
/* B38C4 800C30C4 0D80023C */  lui        $v0, %hi(_padFuncClrInfo)
/* B38C8 800C30C8 08E9428C */  lw         $v0, %lo(_padFuncClrInfo)($v0)
/* B38CC 800C30CC 00000000 */  nop
/* B38D0 800C30D0 09F84000 */  jalr       $v0
/* B38D4 800C30D4 21200002 */   addu      $a0, $s0, $zero
.L800C30D8:
/* B38D8 800C30D8 46000392 */  lbu        $v1, 0x46($s0)
/* B38DC 800C30DC 01000224 */  addiu      $v0, $zero, 0x1
/* B38E0 800C30E0 0D006210 */  beq        $v1, $v0, .L800C3118
/* B38E4 800C30E4 02006228 */   slti      $v0, $v1, 0x2
/* B38E8 800C30E8 05004010 */  beqz       $v0, .L800C3100
/* B38EC 800C30EC FE000224 */   addiu     $v0, $zero, 0xFE
/* B38F0 800C30F0 1E006010 */  beqz       $v1, .L800C316C
/* B38F4 800C30F4 21100000 */   addu      $v0, $zero, $zero
/* B38F8 800C30F8 500C0308 */  j          .L800C3140
/* B38FC 800C30FC 00000000 */   nop
.L800C3100:
/* B3900 800C3100 0A006210 */  beq        $v1, $v0, .L800C312C
/* B3904 800C3104 FF000224 */   addiu     $v0, $zero, 0xFF
/* B3908 800C3108 18006210 */  beq        $v1, $v0, .L800C316C
/* B390C 800C310C 21100000 */   addu      $v0, $zero, $zero
/* B3910 800C3110 500C0308 */  j          .L800C3140
/* B3914 800C3114 00000000 */   nop
.L800C3118:
/* B3918 800C3118 21200002 */  addu       $a0, $s0, $zero
/* B391C 800C311C C80F030C */  jal        func_800C3F20
/* B3920 800C3120 01000524 */   addiu     $a1, $zero, 0x1
/* B3924 800C3124 5B0C0308 */  j          .L800C316C
/* B3928 800C3128 21100000 */   addu      $v0, $zero, $zero
.L800C312C:
/* B392C 800C312C 21200002 */  addu       $a0, $s0, $zero
.L800C3130:
/* B3930 800C3130 C80F030C */  jal        func_800C3F20
/* B3934 800C3134 21280000 */   addu      $a1, $zero, $zero
/* B3938 800C3138 5B0C0308 */  j          .L800C316C
/* B393C 800C313C 21100000 */   addu      $v0, $zero, $zero
.L800C3140:
/* B3940 800C3140 1400028E */  lw         $v0, 0x14($s0)
/* B3944 800C3144 00000000 */  nop
/* B3948 800C3148 05004010 */  beqz       $v0, .L800C3160
/* B394C 800C314C 00000000 */   nop
/* B3950 800C3150 09F84000 */  jalr       $v0
/* B3954 800C3154 21200002 */   addu      $a0, $s0, $zero
/* B3958 800C3158 5B0C0308 */  j          .L800C316C
/* B395C 800C315C 21100000 */   addu      $v0, $zero, $zero
.L800C3160:
/* B3960 800C3160 4D0D030C */  jal        func_800C3534
/* B3964 800C3164 21200002 */   addu      $a0, $s0, $zero
/* B3968 800C3168 21100000 */  addu       $v0, $zero, $zero
.L800C316C:
/* B396C 800C316C 1400BF8F */  lw         $ra, 0x14($sp)
/* B3970 800C3170 1000B08F */  lw         $s0, 0x10($sp)
/* B3974 800C3174 0800E003 */  jr         $ra
/* B3978 800C3178 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C306C, . - func_800C306C
