.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleSetCameraTilt
/* EAC8 8001E2C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* EACC 8001E2CC 1000BFAF */  sw         $ra, 0x10($sp)
/* EAD0 8001E2D0 0400A28C */  lw         $v0, 0x4($a1)
/* EAD4 8001E2D4 1B008010 */  beqz       $a0, .L8001E344
/* EAD8 8001E2D8 0BB6063C */   lui       $a2, (0xB60B60B7 >> 16)
/* EADC 8001E2DC B760C634 */  ori        $a2, $a2, (0xB60B60B7 & 0xFFFF)
/* EAE0 8001E2E0 23200200 */  negu       $a0, $v0
/* EAE4 8001E2E4 18008600 */  mult       $a0, $a2
/* EAE8 8001E2E8 C31F0400 */  sra        $v1, $a0, 31
/* EAEC 8001E2EC 10380000 */  mfhi       $a3
/* EAF0 8001E2F0 2110E400 */  addu       $v0, $a3, $a0
/* EAF4 8001E2F4 03120200 */  sra        $v0, $v0, 8
/* EAF8 8001E2F8 23104300 */  subu       $v0, $v0, $v1
/* EAFC 8001E2FC 40180200 */  sll        $v1, $v0, 1
/* EB00 8001E300 21186200 */  addu       $v1, $v1, $v0
/* EB04 8001E304 00110300 */  sll        $v0, $v1, 4
/* EB08 8001E308 23104300 */  subu       $v0, $v0, $v1
/* EB0C 8001E30C C0100200 */  sll        $v0, $v0, 3
/* EB10 8001E310 23108200 */  subu       $v0, $a0, $v0
/* EB14 8001E314 02004104 */  bgez       $v0, .L8001E320
/* EB18 8001E318 00000000 */   nop
/* EB1C 8001E31C 68014224 */  addiu      $v0, $v0, 0x168
.L8001E320:
/* EB20 8001E320 002B0200 */  sll        $a1, $v0, 12
/* EB24 8001E324 1800A600 */  mult       $a1, $a2
/* EB28 8001E328 90AC8427 */  addiu      $a0, $gp, %gp_rel(theCamera)
/* EB2C 8001E32C 10380000 */  mfhi       $a3
/* EB30 8001E330 2110E500 */  addu       $v0, $a3, $a1
/* EB34 8001E334 03120200 */  sra        $v0, $v0, 8
/* EB38 8001E338 C32F0500 */  sra        $a1, $a1, 31
/* EB3C 8001E33C 7E5B000C */  jal        CAMERA_Adjust_tilt
/* EB40 8001E340 23284500 */   subu      $a1, $v0, $a1
.L8001E344:
/* EB44 8001E344 1000BF8F */  lw         $ra, 0x10($sp)
/* EB48 8001E348 01000224 */  addiu      $v0, $zero, 0x1
/* EB4C 8001E34C 0800E003 */  jr         $ra
/* EB50 8001E350 1800BD27 */   addiu     $sp, $sp, 0x18
.size SIGNAL_HandleSetCameraTilt, . - SIGNAL_HandleSetCameraTilt
