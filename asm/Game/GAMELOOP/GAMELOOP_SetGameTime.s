.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GAMELOOP_SetGameTime
/* 1E664 8002DE64 21288000 */  addu       $a1, $a0, $zero
/* 1E668 8002DE68 EB51023C */  lui        $v0, (0x51EB851F >> 16)
/* 1E66C 8002DE6C 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
/* 1E670 8002DE70 1800A200 */  mult       $a1, $v0
/* 1E674 8002DE74 C3170500 */  sra        $v0, $a1, 31
/* 1E678 8002DE78 10300000 */  mfhi       $a2
/* 1E67C 8002DE7C 43190600 */  sra        $v1, $a2, 5
/* 1E680 8002DE80 23186200 */  subu       $v1, $v1, $v0
/* 1E684 8002DE84 00210300 */  sll        $a0, $v1, 4
/* 1E688 8002DE88 23208300 */  subu       $a0, $a0, $v1
/* 1E68C 8002DE8C 80200400 */  sll        $a0, $a0, 2
/* 1E690 8002DE90 40100300 */  sll        $v0, $v1, 1
/* 1E694 8002DE94 21104300 */  addu       $v0, $v0, $v1
/* 1E698 8002DE98 C0100200 */  sll        $v0, $v0, 3
/* 1E69C 8002DE9C 21104300 */  addu       $v0, $v0, $v1
/* 1E6A0 8002DEA0 80100200 */  sll        $v0, $v0, 2
/* 1E6A4 8002DEA4 2310A200 */  subu       $v0, $a1, $v0
/* 1E6A8 8002DEA8 21188200 */  addu       $v1, $a0, $v0
/* 1E6AC 8002DEAC 30FD6324 */  addiu      $v1, $v1, -0x2D0
/* 1E6B0 8002DEB0 03006104 */  bgez       $v1, .L8002DEC0
/* 1E6B4 8002DEB4 40110300 */   sll       $v0, $v1, 5
/* 1E6B8 8002DEB8 A0056324 */  addiu      $v1, $v1, 0x5A0
/* 1E6BC 8002DEBC 40110300 */  sll        $v0, $v1, 5
.L8002DEC0:
/* 1E6C0 8002DEC0 23104300 */  subu       $v0, $v0, $v1
/* 1E6C4 8002DEC4 80100200 */  sll        $v0, $v0, 2
/* 1E6C8 8002DEC8 21104300 */  addu       $v0, $v0, $v1
/* 1E6CC 8002DECC 00190200 */  sll        $v1, $v0, 4
/* 1E6D0 8002DED0 23186200 */  subu       $v1, $v1, $v0
/* 1E6D4 8002DED4 E8BF828F */  lw         $v0, %gp_rel(gameTrackerX + 0x220)($gp)
/* 1E6D8 8002DED8 40190300 */  sll        $v1, $v1, 5
/* 1E6DC 8002DEDC 1A006200 */  div        $zero, $v1, $v0
/* 1E6E0 8002DEE0 12180000 */  mflo       $v1
/* 1E6E4 8002DEE4 E2BF85A7 */  sh         $a1, %gp_rel(gameTrackerX + 0x21A)($gp)
/* 1E6E8 8002DEE8 00C083AF */  sw         $v1, %gp_rel(gameTrackerX + 0x238)($gp)
/* 1E6EC 8002DEEC F8BF83AF */  sw         $v1, %gp_rel(gameTrackerX + 0x230)($gp)
/* 1E6F0 8002DEF0 0800E003 */  jr         $ra
/* 1E6F4 8002DEF4 00000000 */   nop
.size GAMELOOP_SetGameTime, . - GAMELOOP_SetGameTime
