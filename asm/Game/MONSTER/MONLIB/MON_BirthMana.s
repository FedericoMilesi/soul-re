.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_BirthMana
/* 74BA4 800843A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 74BA8 800843A8 1800B0AF */  sw         $s0, 0x18($sp)
/* 74BAC 800843AC 21808000 */  addu       $s0, $a0, $zero
/* 74BB0 800843B0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 74BB4 800843B4 4000028E */  lw         $v0, 0x40($s0)
/* 74BB8 800843B8 00000000 */  nop
/* 74BBC 800843BC 23004010 */  beqz       $v0, .L8008444C
/* 74BC0 800843C0 00000000 */   nop
/* 74BC4 800843C4 6C01028E */  lw         $v0, 0x16C($s0)
/* 74BC8 800843C8 00000000 */  nop
/* 74BCC 800843CC 65014280 */  lb         $v0, 0x165($v0)
/* 74BD0 800843D0 00000000 */  nop
/* 74BD4 800843D4 19004228 */  slti       $v0, $v0, 0x19
/* 74BD8 800843D8 1C004010 */  beqz       $v0, .L8008444C
/* 74BDC 800843DC 00000000 */   nop
/* 74BE0 800843E0 3AF2020C */  jal        rand
/* 74BE4 800843E4 00000000 */   nop
/* 74BE8 800843E8 EB51033C */  lui        $v1, (0x51EB851F >> 16)
/* 74BEC 800843EC 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
/* 74BF0 800843F0 18004300 */  mult       $v0, $v1
/* 74BF4 800843F4 4000078E */  lw         $a3, 0x40($s0)
/* 74BF8 800843F8 0A000324 */  addiu      $v1, $zero, 0xA
/* 74BFC 800843FC 1400A3AF */  sw         $v1, 0x14($sp)
/* 74C00 80084400 C31F0200 */  sra        $v1, $v0, 31
/* 74C04 80084404 2000E724 */  addiu      $a3, $a3, 0x20
/* 74C08 80084408 10400000 */  mfhi       $t0
/* 74C0C 8008440C 43210800 */  sra        $a0, $t0, 5
/* 74C10 80084410 23208300 */  subu       $a0, $a0, $v1
/* 74C14 80084414 40180400 */  sll        $v1, $a0, 1
/* 74C18 80084418 21186400 */  addu       $v1, $v1, $a0
/* 74C1C 8008441C C0180300 */  sll        $v1, $v1, 3
/* 74C20 80084420 21186400 */  addu       $v1, $v1, $a0
/* 74C24 80084424 80180300 */  sll        $v1, $v1, 2
/* 74C28 80084428 23204300 */  subu       $a0, $v0, $v1
/* 74C2C 8008442C 50008228 */  slti       $v0, $a0, 0x50
/* 74C30 80084430 01004238 */  xori       $v0, $v0, 0x1
/* 74C34 80084434 1000A2AF */  sw         $v0, 0x10($sp)
/* 74C38 80084438 1400E58C */  lw         $a1, 0x14($a3)
/* 74C3C 8008443C 1800E68C */  lw         $a2, 0x18($a3)
/* 74C40 80084440 1C00E78C */  lw         $a3, 0x1C($a3)
/* 74C44 80084444 4BAA010C */  jal        PHYSOB_BirthCollectible
/* 74C48 80084448 21200002 */   addu      $a0, $s0, $zero
.L8008444C:
/* 74C4C 8008444C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 74C50 80084450 1800B08F */  lw         $s0, 0x18($sp)
/* 74C54 80084454 0800E003 */  jr         $ra
/* 74C58 80084458 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_BirthMana, . - MON_BirthMana
