.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerSwim
/* 93494 800A2C94 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 93498 800A2C98 1000B0AF */  sw         $s0, 0x10($sp)
/* 9349C 800A2C9C 21808000 */  addu       $s0, $a0, $zero
/* 934A0 800A2CA0 B0F9848F */  lw         $a0, %gp_rel(Raziel + 0x380)($gp)
/* 934A4 800A2CA4 1400BFAF */  sw         $ra, 0x14($sp)
/* 934A8 800A2CA8 D0E4010C */  jal        rsin
/* 934AC 800A2CAC 00000000 */   nop
/* 934B0 800A2CB0 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 934B4 800A2CB4 00000000 */  nop
/* 934B8 800A2CB8 40190300 */  sll        $v1, $v1, 5
/* 934BC 800A2CBC 022B0300 */  srl        $a1, $v1, 12
/* 934C0 800A2CC0 1800A200 */  mult       $a1, $v0
/* 934C4 800A2CC4 12180000 */  mflo       $v1
/* 934C8 800A2CC8 02006104 */  bgez       $v1, .L800A2CD4
/* 934CC 800A2CCC 00000000 */   nop
/* 934D0 800A2CD0 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800A2CD4:
/* 934D4 800A2CD4 78000296 */  lhu        $v0, 0x78($s0)
/* 934D8 800A2CD8 031B0300 */  sra        $v1, $v1, 12
/* 934DC 800A2CDC 23104300 */  subu       $v0, $v0, $v1
/* 934E0 800A2CE0 780002A6 */  sh         $v0, 0x78($s0)
/* 934E4 800A2CE4 B0F9848F */  lw         $a0, %gp_rel(Raziel + 0x380)($gp)
/* 934E8 800A2CE8 DCE4010C */  jal        rcos
/* 934EC 800A2CEC 00000000 */   nop
/* 934F0 800A2CF0 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* 934F4 800A2CF4 30000524 */  addiu      $a1, $zero, 0x30
/* 934F8 800A2CF8 18006500 */  mult       $v1, $a1
/* 934FC 800A2CFC 21204000 */  addu       $a0, $v0, $zero
/* 93500 800A2D00 11000224 */  addiu      $v0, $zero, 0x11
/* 93504 800A2D04 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* 93508 800A2D08 12300000 */  mflo       $a2
/* 9350C 800A2D0C 03006214 */  bne        $v1, $v0, .L800A2D1C
/* 93510 800A2D10 022B0600 */   srl       $a1, $a2, 12
/* 93514 800A2D14 0A008104 */  bgez       $a0, .L800A2D40
/* 93518 800A2D18 00000000 */   nop
.L800A2D1C:
/* 9351C 800A2D1C 1800A400 */  mult       $a1, $a0
/* 93520 800A2D20 12180000 */  mflo       $v1
/* 93524 800A2D24 02006104 */  bgez       $v1, .L800A2D30
/* 93528 800A2D28 00000000 */   nop
/* 9352C 800A2D2C FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L800A2D30:
/* 93530 800A2D30 40FB8297 */  lhu        $v0, %gp_rel(Raziel + 0x510)($gp)
/* 93534 800A2D34 031B0300 */  sra        $v1, $v1, 12
/* 93538 800A2D38 23104300 */  subu       $v0, $v0, $v1
/* 9353C 800A2D3C 40FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x510)($gp)
.L800A2D40:
/* 93540 800A2D40 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* 93544 800A2D44 00000000 */  nop
/* 93548 800A2D48 01084228 */  slti       $v0, $v0, 0x801
/* 9354C 800A2D4C 02004014 */  bnez       $v0, .L800A2D58
/* 93550 800A2D50 00080224 */   addiu     $v0, $zero, 0x800
/* 93554 800A2D54 40FB82A7 */  sh         $v0, %gp_rel(Raziel + 0x510)($gp)
.L800A2D58:
/* 93558 800A2D58 40FB8287 */  lh         $v0, %gp_rel(Raziel + 0x510)($gp)
/* 9355C 800A2D5C 00000000 */  nop
/* 93560 800A2D60 02004104 */  bgez       $v0, .L800A2D6C
/* 93564 800A2D64 00000000 */   nop
/* 93568 800A2D68 40FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x510)($gp)
.L800A2D6C:
/* 9356C 800A2D6C 1400BF8F */  lw         $ra, 0x14($sp)
/* 93570 800A2D70 1000B08F */  lw         $s0, 0x10($sp)
/* 93574 800A2D74 44FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x514)($gp)
/* 93578 800A2D78 42FB80A7 */  sh         $zero, %gp_rel(Raziel + 0x512)($gp)
/* 9357C 800A2D7C 0800E003 */  jr         $ra
/* 93580 800A2D80 1800BD27 */   addiu     $sp, $sp, 0x18
.size SteerSwim, . - SteerSwim
