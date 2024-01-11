.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razApplyMotion
/* 972BC 800A6ABC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 972C0 800A6AC0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 972C4 800A6AC4 21888000 */  addu       $s1, $a0, $zero
/* 972C8 800A6AC8 1800B0AF */  sw         $s0, 0x18($sp)
/* 972CC 800A6ACC 2180A000 */  addu       $s0, $a1, $zero
/* 972D0 800A6AD0 1000A427 */  addiu      $a0, $sp, 0x10
/* 972D4 800A6AD4 21280000 */  addu       $a1, $zero, $zero
/* 972D8 800A6AD8 2000BFAF */  sw         $ra, 0x20($sp)
/* 972DC 800A6ADC 2EF2020C */  jal        func_800BC8B8
/* 972E0 800A6AE0 06000624 */   addiu     $a2, $zero, 0x6
/* 972E4 800A6AE4 52000016 */  bnez       $s0, .L800A6C30
/* 972E8 800A6AE8 02000524 */   addiu     $a1, $zero, 0x2
/* 972EC 800A6AEC 0000248E */  lw         $a0, 0x0($s1)
/* 972F0 800A6AF0 4154020C */  jal        G2Instance_GetKeylist
/* 972F4 800A6AF4 EC019024 */   addiu     $s0, $a0, 0x1EC
/* 972F8 800A6AF8 2400038E */  lw         $v1, 0x24($s0)
/* 972FC 800A6AFC 00000000 */  nop
/* 97300 800A6B00 03006214 */  bne        $v1, $v0, .L800A6B10
/* 97304 800A6B04 C4FF0224 */   addiu     $v0, $zero, -0x3C
/* 97308 800A6B08 E19A0208 */  j          .L800A6B84
/* 9730C 800A6B0C 1200A2A7 */   sh        $v0, 0x12($sp)
.L800A6B10:
/* 97310 800A6B10 0000248E */  lw         $a0, 0x0($s1)
/* 97314 800A6B14 4154020C */  jal        G2Instance_GetKeylist
/* 97318 800A6B18 7C000524 */   addiu     $a1, $zero, 0x7C
/* 9731C 800A6B1C 2400038E */  lw         $v1, 0x24($s0)
/* 97320 800A6B20 00000000 */  nop
/* 97324 800A6B24 03006214 */  bne        $v1, $v0, .L800A6B34
/* 97328 800A6B28 DDFF0224 */   addiu     $v0, $zero, -0x23
/* 9732C 800A6B2C E19A0208 */  j          .L800A6B84
/* 97330 800A6B30 1200A2A7 */   sh        $v0, 0x12($sp)
.L800A6B34:
/* 97334 800A6B34 0000248E */  lw         $a0, 0x0($s1)
/* 97338 800A6B38 4154020C */  jal        G2Instance_GetKeylist
/* 9733C 800A6B3C 7B000524 */   addiu     $a1, $zero, 0x7B
/* 97340 800A6B40 2400038E */  lw         $v1, 0x24($s0)
/* 97344 800A6B44 00000000 */  nop
/* 97348 800A6B48 04006214 */  bne        $v1, $v0, .L800A6B5C
/* 9734C 800A6B4C 21280000 */   addu      $a1, $zero, $zero
/* 97350 800A6B50 F0FF0224 */  addiu      $v0, $zero, -0x10
/* 97354 800A6B54 E19A0208 */  j          .L800A6B84
/* 97358 800A6B58 1200A2A7 */   sh        $v0, 0x12($sp)
.L800A6B5C:
/* 9735C 800A6B5C 0000248E */  lw         $a0, 0x0($s1)
/* 97360 800A6B60 22000624 */  addiu      $a2, $zero, 0x22
/* 97364 800A6B64 E541020C */  jal        G2Anim_IsControllerActive
/* 97368 800A6B68 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 9736C 800A6B6C 05004010 */  beqz       $v0, .L800A6B84
/* 97370 800A6B70 21280000 */   addu      $a1, $zero, $zero
/* 97374 800A6B74 0000248E */  lw         $a0, 0x0($s1)
/* 97378 800A6B78 22000624 */  addiu      $a2, $zero, 0x22
/* 9737C 800A6B7C 8D41020C */  jal        G2Anim_DisableController
/* 97380 800A6B80 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A6B84:
/* 97384 800A6B84 1200A287 */  lh         $v0, 0x12($sp)
/* 97388 800A6B88 00000000 */  nop
/* 9738C 800A6B8C 29004010 */  beqz       $v0, .L800A6C34
/* 97390 800A6B90 21280000 */   addu      $a1, $zero, $zero
/* 97394 800A6B94 0000248E */  lw         $a0, 0x0($s1)
/* 97398 800A6B98 22000624 */  addiu      $a2, $zero, 0x22
/* 9739C 800A6B9C E541020C */  jal        G2Anim_IsControllerActive
/* 973A0 800A6BA0 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 973A4 800A6BA4 05004014 */  bnez       $v0, .L800A6BBC
/* 973A8 800A6BA8 21280000 */   addu      $a1, $zero, $zero
/* 973AC 800A6BAC 0000248E */  lw         $a0, 0x0($s1)
/* 973B0 800A6BB0 22000624 */  addiu      $a2, $zero, 0x22
/* 973B4 800A6BB4 5641020C */  jal        G2Anim_EnableController
/* 973B8 800A6BB8 C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A6BBC:
/* 973BC 800A6BBC 0000228E */  lw         $v0, 0x0($s1)
/* 973C0 800A6BC0 00000000 */  nop
/* 973C4 800A6BC4 FC01508C */  lw         $s0, 0x1FC($v0)
/* 973C8 800A6BC8 F058020C */  jal        G2Timer_GetFrameTime
/* 973CC 800A6BCC 00000000 */   nop
/* 973D0 800A6BD0 00140200 */  sll        $v0, $v0, 16
/* 973D4 800A6BD4 1200A387 */  lh         $v1, 0x12($sp)
/* 973D8 800A6BD8 03140200 */  sra        $v0, $v0, 16
/* 973DC 800A6BDC 18006200 */  mult       $v1, $v0
/* 973E0 800A6BE0 12180000 */  mflo       $v1
/* 973E4 800A6BE4 00000000 */  nop
/* 973E8 800A6BE8 00000000 */  nop
/* 973EC 800A6BEC 18007000 */  mult       $v1, $s0
/* 973F0 800A6BF0 EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 973F4 800A6BF4 12800000 */  mflo       $s0
/* 973F8 800A6BF8 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 973FC 800A6BFC 03131000 */  sra        $v0, $s0, 12
/* 97400 800A6C00 18004300 */  mult       $v0, $v1
/* 97404 800A6C04 21280000 */  addu       $a1, $zero, $zero
/* 97408 800A6C08 22000624 */  addiu      $a2, $zero, 0x22
/* 9740C 800A6C0C C3871000 */  sra        $s0, $s0, 31
/* 97410 800A6C10 10180000 */  mfhi       $v1
/* 97414 800A6C14 43110300 */  sra        $v0, $v1, 5
/* 97418 800A6C18 23105000 */  subu       $v0, $v0, $s0
/* 9741C 800A6C1C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 97420 800A6C20 0000248E */  lw         $a0, 0x0($s1)
/* 97424 800A6C24 1000A727 */  addiu      $a3, $sp, 0x10
/* 97428 800A6C28 7D42020C */  jal        G2Anim_SetController_Vector
/* 9742C 800A6C2C C8018424 */   addiu     $a0, $a0, 0x1C8
.L800A6C30:
/* 97430 800A6C30 1200A287 */  lh         $v0, 0x12($sp)
.L800A6C34:
/* 97434 800A6C34 2000BF8F */  lw         $ra, 0x20($sp)
/* 97438 800A6C38 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9743C 800A6C3C 1800B08F */  lw         $s0, 0x18($sp)
/* 97440 800A6C40 23100200 */  negu       $v0, $v0
/* 97444 800A6C44 0800E003 */  jr         $ra
/* 97448 800A6C48 2800BD27 */   addiu     $sp, $sp, 0x28
.size razApplyMotion, . - razApplyMotion
