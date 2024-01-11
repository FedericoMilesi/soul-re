.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CD_getsector
/* B5BDC 800C53DC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x220)
/* B5BE0 800C53E0 48EC428C */  lw         $v0, %lo(CD_intstr + 0x220)($v0)
/* B5BE4 800C53E4 0200063C */  lui        $a2, (0x20943 >> 16)
/* B5BE8 800C53E8 000040A0 */  sb         $zero, 0x0($v0)
/* B5BEC 800C53EC 0D80033C */  lui        $v1, %hi(CD_intstr + 0x22C)
/* B5BF0 800C53F0 54EC638C */  lw         $v1, %lo(CD_intstr + 0x22C)($v1)
/* B5BF4 800C53F4 80000224 */  addiu      $v0, $zero, 0x80
/* B5BF8 800C53F8 000062A0 */  sb         $v0, 0x0($v1)
/* B5BFC 800C53FC 0D80023C */  lui        $v0, %hi(CD_intstr + 0x254)
/* B5C00 800C5400 7CEC428C */  lw         $v0, %lo(CD_intstr + 0x254)($v0)
/* B5C04 800C5404 4309C634 */  ori        $a2, $a2, (0x20943 & 0xFFFF)
/* B5C08 800C5408 000046AC */  sw         $a2, 0x0($v0)
/* B5C0C 800C540C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x230)
/* B5C10 800C5410 58EC638C */  lw         $v1, %lo(CD_intstr + 0x230)($v1)
/* B5C14 800C5414 23130224 */  addiu      $v0, $zero, 0x1323
/* B5C18 800C5418 000062AC */  sw         $v0, 0x0($v1)
/* B5C1C 800C541C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x258)
/* B5C20 800C5420 80EC638C */  lw         $v1, %lo(CD_intstr + 0x258)($v1)
/* B5C24 800C5424 00000000 */  nop
/* B5C28 800C5428 0000628C */  lw         $v0, 0x0($v1)
/* B5C2C 800C542C 00000000 */  nop
/* B5C30 800C5430 00804234 */  ori        $v0, $v0, 0x8000
/* B5C34 800C5434 000062AC */  sw         $v0, 0x0($v1)
/* B5C38 800C5438 0D80023C */  lui        $v0, %hi(CD_intstr + 0x25C)
/* B5C3C 800C543C 84EC428C */  lw         $v0, %lo(CD_intstr + 0x25C)($v0)
/* B5C40 800C5440 00000000 */  nop
/* B5C44 800C5444 000044AC */  sw         $a0, 0x0($v0)
/* B5C48 800C5448 0100023C */  lui        $v0, (0x10000 >> 16)
/* B5C4C 800C544C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x260)
/* B5C50 800C5450 88EC638C */  lw         $v1, %lo(CD_intstr + 0x260)($v1)
/* B5C54 800C5454 2528A200 */  or         $a1, $a1, $v0
/* B5C58 800C5458 000065AC */  sw         $a1, 0x0($v1)
/* B5C5C 800C545C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x220)
/* B5C60 800C5460 48EC638C */  lw         $v1, %lo(CD_intstr + 0x220)($v1)
/* B5C64 800C5464 00000000 */  nop
.L800C5468:
/* B5C68 800C5468 00006290 */  lbu        $v0, 0x0($v1)
/* B5C6C 800C546C 00000000 */  nop
/* B5C70 800C5470 40004230 */  andi       $v0, $v0, 0x40
/* B5C74 800C5474 FCFF4010 */  beqz       $v0, .L800C5468
/* B5C78 800C5478 0011023C */   lui       $v0, (0x11000000 >> 16)
/* B5C7C 800C547C 0D80033C */  lui        $v1, %hi(CD_intstr + 0x264)
/* B5C80 800C5480 8CEC638C */  lw         $v1, %lo(CD_intstr + 0x264)($v1)
/* B5C84 800C5484 00000000 */  nop
/* B5C88 800C5488 000062AC */  sw         $v0, 0x0($v1)
/* B5C8C 800C548C 0D80043C */  lui        $a0, %hi(CD_intstr + 0x264)
/* B5C90 800C5490 8CEC848C */  lw         $a0, %lo(CD_intstr + 0x264)($a0)
/* B5C94 800C5494 00000000 */  nop
/* B5C98 800C5498 0000828C */  lw         $v0, 0x0($a0)
/* B5C9C 800C549C 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B5CA0 800C54A0 24104300 */  and        $v0, $v0, $v1
/* B5CA4 800C54A4 07004010 */  beqz       $v0, .L800C54C4
/* B5CA8 800C54A8 21188000 */   addu      $v1, $a0, $zero
/* B5CAC 800C54AC 0001043C */  lui        $a0, (0x1000000 >> 16)
.L800C54B0:
/* B5CB0 800C54B0 0000628C */  lw         $v0, 0x0($v1)
/* B5CB4 800C54B4 00000000 */  nop
/* B5CB8 800C54B8 24104400 */  and        $v0, $v0, $a0
/* B5CBC 800C54BC FCFF4014 */  bnez       $v0, .L800C54B0
/* B5CC0 800C54C0 00000000 */   nop
.L800C54C4:
/* B5CC4 800C54C4 0D80033C */  lui        $v1, %hi(CD_intstr + 0x230)
/* B5CC8 800C54C8 58EC638C */  lw         $v1, %lo(CD_intstr + 0x230)($v1)
/* B5CCC 800C54CC 25130224 */  addiu      $v0, $zero, 0x1325
/* B5CD0 800C54D0 000062AC */  sw         $v0, 0x0($v1)
/* B5CD4 800C54D4 0800E003 */  jr         $ra
/* B5CD8 800C54D8 21100000 */   addu      $v0, $zero, $zero
.size CD_getsector, . - CD_getsector
