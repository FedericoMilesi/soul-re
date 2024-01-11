.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razInitWallCrawlSteering
/* 938A8 800A30A8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 938AC 800A30AC 1800B0AF */  sw         $s0, 0x18($sp)
/* 938B0 800A30B0 21808000 */  addu       $s0, $a0, $zero
/* 938B4 800A30B4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 938B8 800A30B8 C8011126 */  addiu      $s1, $s0, 0x1C8
/* 938BC 800A30BC 21202002 */  addu       $a0, $s1, $zero
/* 938C0 800A30C0 01000524 */  addiu      $a1, $zero, 0x1
/* 938C4 800A30C4 2000BFAF */  sw         $ra, 0x20($sp)
/* 938C8 800A30C8 5641020C */  jal        G2Anim_EnableController
/* 938CC 800A30CC 26000624 */   addiu     $a2, $zero, 0x26
/* 938D0 800A30D0 C2FE0224 */  addiu      $v0, $zero, -0x13E
/* 938D4 800A30D4 1000A0A7 */  sh         $zero, 0x10($sp)
/* 938D8 800A30D8 1200A0A7 */  sh         $zero, 0x12($sp)
/* 938DC 800A30DC 1400A2A7 */  sh         $v0, 0x14($sp)
/* 938E0 800A30E0 60000296 */  lhu        $v0, 0x60($s0)
/* 938E4 800A30E4 21202002 */  addu       $a0, $s1, $zero
/* 938E8 800A30E8 3E014224 */  addiu      $v0, $v0, 0x13E
/* 938EC 800A30EC 600002A6 */  sh         $v0, 0x60($s0)
/* 938F0 800A30F0 68000296 */  lhu        $v0, 0x68($s0)
/* 938F4 800A30F4 4000038E */  lw         $v1, 0x40($s0)
/* 938F8 800A30F8 3E014224 */  addiu      $v0, $v0, 0x13E
/* 938FC 800A30FC 680002A6 */  sh         $v0, 0x68($s0)
/* 93900 800A3100 1C00628C */  lw         $v0, 0x1C($v1)
/* 93904 800A3104 01000524 */  addiu      $a1, $zero, 0x1
/* 93908 800A3108 3E014224 */  addiu      $v0, $v0, 0x13E
/* 9390C 800A310C 1C0062AC */  sw         $v0, 0x1C($v1)
/* 93910 800A3110 4400038E */  lw         $v1, 0x44($s0)
/* 93914 800A3114 26000624 */  addiu      $a2, $zero, 0x26
/* 93918 800A3118 1C00628C */  lw         $v0, 0x1C($v1)
/* 9391C 800A311C 1000A727 */  addiu      $a3, $sp, 0x10
/* 93920 800A3120 3E014224 */  addiu      $v0, $v0, 0x13E
/* 93924 800A3124 7D42020C */  jal        G2Anim_SetController_Vector
/* 93928 800A3128 1C0062AC */   sw        $v0, 0x1C($v1)
/* 9392C 800A312C 21202002 */  addu       $a0, $s1, $zero
/* 93930 800A3130 21280000 */  addu       $a1, $zero, $zero
/* 93934 800A3134 5641020C */  jal        G2Anim_EnableController
/* 93938 800A3138 0E000624 */   addiu     $a2, $zero, 0xE
/* 9393C 800A313C 74000296 */  lhu        $v0, 0x74($s0)
/* 93940 800A3140 21202002 */  addu       $a0, $s1, $zero
/* 93944 800A3144 1000A2A7 */  sh         $v0, 0x10($sp)
/* 93948 800A3148 76000296 */  lhu        $v0, 0x76($s0)
/* 9394C 800A314C 21280000 */  addu       $a1, $zero, $zero
/* 93950 800A3150 1200A2A7 */  sh         $v0, 0x12($sp)
/* 93954 800A3154 78000296 */  lhu        $v0, 0x78($s0)
/* 93958 800A3158 08000624 */  addiu      $a2, $zero, 0x8
/* 9395C 800A315C 5641020C */  jal        G2Anim_EnableController
/* 93960 800A3160 1400A2A7 */   sh        $v0, 0x14($sp)
/* 93964 800A3164 21202002 */  addu       $a0, $s1, $zero
/* 93968 800A3168 21280000 */  addu       $a1, $zero, $zero
/* 9396C 800A316C 08000624 */  addiu      $a2, $zero, 0x8
/* 93970 800A3170 6F42020C */  jal        G2Anim_SetControllerAngleOrder
/* 93974 800A3174 01000724 */   addiu     $a3, $zero, 0x1
/* 93978 800A3178 21202002 */  addu       $a0, $s1, $zero
/* 9397C 800A317C 21280000 */  addu       $a1, $zero, $zero
/* 93980 800A3180 08000624 */  addiu      $a2, $zero, 0x8
/* 93984 800A3184 7D42020C */  jal        G2Anim_SetController_Vector
/* 93988 800A3188 1000A727 */   addiu     $a3, $sp, 0x10
/* 9398C 800A318C 21202002 */  addu       $a0, $s1, $zero
/* 93990 800A3190 0E000524 */  addiu      $a1, $zero, 0xE
/* 93994 800A3194 5641020C */  jal        G2Anim_EnableController
/* 93998 800A3198 2130A000 */   addu      $a2, $a1, $zero
/* 9399C 800A319C 21202002 */  addu       $a0, $s1, $zero
/* 939A0 800A31A0 32000524 */  addiu      $a1, $zero, 0x32
/* 939A4 800A31A4 5641020C */  jal        G2Anim_EnableController
/* 939A8 800A31A8 4C000624 */   addiu     $a2, $zero, 0x4C
/* 939AC 800A31AC 21202002 */  addu       $a0, $s1, $zero
/* 939B0 800A31B0 3A000524 */  addiu      $a1, $zero, 0x3A
/* 939B4 800A31B4 5641020C */  jal        G2Anim_EnableController
/* 939B8 800A31B8 4C000624 */   addiu     $a2, $zero, 0x4C
/* 939BC 800A31BC C8FC8227 */  addiu      $v0, $gp, %gp_rel(ExtraRotData)
/* 939C0 800A31C0 040040A4 */  sh         $zero, 0x4($v0)
/* 939C4 800A31C4 020040A4 */  sh         $zero, 0x2($v0)
/* 939C8 800A31C8 2000BF8F */  lw         $ra, 0x20($sp)
/* 939CC 800A31CC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 939D0 800A31D0 1800B08F */  lw         $s0, 0x18($sp)
/* 939D4 800A31D4 D0FC82AF */  sw         $v0, %gp_rel(ExtraRot)($gp)
/* 939D8 800A31D8 C8FC80A7 */  sh         $zero, %gp_rel(ExtraRotData)($gp)
/* 939DC 800A31DC 0800E003 */  jr         $ra
/* 939E0 800A31E0 2800BD27 */   addiu     $sp, $sp, 0x28
.size razInitWallCrawlSteering, . - razInitWallCrawlSteering
