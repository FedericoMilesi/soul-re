.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysicsDefaultGravityResponse
/* 65E98 80075698 5C008294 */  lhu        $v0, 0x5C($a0)
/* 65E9C 8007569C 0400A394 */  lhu        $v1, 0x4($a1)
/* 65EA0 800756A0 00000000 */  nop
/* 65EA4 800756A4 21104300 */  addu       $v0, $v0, $v1
/* 65EA8 800756A8 5C0082A4 */  sh         $v0, 0x5C($a0)
/* 65EAC 800756AC 5E008294 */  lhu        $v0, 0x5E($a0)
/* 65EB0 800756B0 0600A394 */  lhu        $v1, 0x6($a1)
/* 65EB4 800756B4 00000000 */  nop
/* 65EB8 800756B8 21104300 */  addu       $v0, $v0, $v1
/* 65EBC 800756BC 5E0082A4 */  sh         $v0, 0x5E($a0)
/* 65EC0 800756C0 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 65EC4 800756C4 00000000 */  nop
/* 65EC8 800756C8 0B008214 */  bne        $a0, $v0, .L800756F8
/* 65ECC 800756CC 00000000 */   nop
/* 65ED0 800756D0 0800A284 */  lh         $v0, 0x8($a1)
/* 65ED4 800756D4 00000000 */  nop
/* 65ED8 800756D8 81004228 */  slti       $v0, $v0, 0x81
/* 65EDC 800756DC 06004014 */  bnez       $v0, .L800756F8
/* 65EE0 800756E0 00000000 */   nop
/* 65EE4 800756E4 60008294 */  lhu        $v0, 0x60($a0)
/* 65EE8 800756E8 00000000 */  nop
/* 65EEC 800756EC 80004224 */  addiu      $v0, $v0, 0x80
/* 65EF0 800756F0 0800E003 */  jr         $ra
/* 65EF4 800756F4 600082A4 */   sh        $v0, 0x60($a0)
.L800756F8:
/* 65EF8 800756F8 60008294 */  lhu        $v0, 0x60($a0)
/* 65EFC 800756FC 0800A394 */  lhu        $v1, 0x8($a1)
/* 65F00 80075700 00000000 */  nop
/* 65F04 80075704 21104300 */  addu       $v0, $v0, $v1
/* 65F08 80075708 0800E003 */  jr         $ra
/* 65F0C 8007570C 600082A4 */   sh        $v0, 0x60($a0)
.size PhysicsDefaultGravityResponse, . - PhysicsDefaultGravityResponse
