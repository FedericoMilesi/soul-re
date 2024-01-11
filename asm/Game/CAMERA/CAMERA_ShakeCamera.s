.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_ShakeCamera
/* BF84 8001B784 21308000 */  addu       $a2, $a0, $zero
/* BF88 8001B788 E000C28C */  lw         $v0, 0xE0($a2)
/* BF8C 8001B78C 00000000 */  nop
/* BF90 8001B790 34004018 */  blez       $v0, .L8001B864
/* BF94 8001B794 00000000 */   nop
/* BF98 8001B798 E400C294 */  lhu        $v0, 0xE4($a2)
/* BF9C 8001B79C E4AB8527 */  addiu      $a1, $gp, %gp_rel(camera_shakeOffset)
/* BFA0 8001B7A0 0F004230 */  andi       $v0, $v0, 0xF
/* BFA4 8001B7A4 C0100200 */  sll        $v0, $v0, 3
/* BFA8 8001B7A8 21104500 */  addu       $v0, $v0, $a1
/* BFAC 8001B7AC 00004384 */  lh         $v1, 0x0($v0)
/* BFB0 8001B7B0 E600C284 */  lh         $v0, 0xE6($a2)
/* BFB4 8001B7B4 00000000 */  nop
/* BFB8 8001B7B8 18006200 */  mult       $v1, $v0
/* BFBC 8001B7BC E400C294 */  lhu        $v0, 0xE4($a2)
/* BFC0 8001B7C0 0000C394 */  lhu        $v1, 0x0($a2)
/* BFC4 8001B7C4 0F004230 */  andi       $v0, $v0, 0xF
/* BFC8 8001B7C8 C0100200 */  sll        $v0, $v0, 3
/* BFCC 8001B7CC 21104500 */  addu       $v0, $v0, $a1
/* BFD0 8001B7D0 12380000 */  mflo       $a3
/* BFD4 8001B7D4 03230700 */  sra        $a0, $a3, 12
/* BFD8 8001B7D8 21186400 */  addu       $v1, $v1, $a0
/* BFDC 8001B7DC 0000C3A4 */  sh         $v1, 0x0($a2)
/* BFE0 8001B7E0 02004384 */  lh         $v1, 0x2($v0)
/* BFE4 8001B7E4 E600C284 */  lh         $v0, 0xE6($a2)
/* BFE8 8001B7E8 00000000 */  nop
/* BFEC 8001B7EC 18006200 */  mult       $v1, $v0
/* BFF0 8001B7F0 E400C294 */  lhu        $v0, 0xE4($a2)
/* BFF4 8001B7F4 0200C394 */  lhu        $v1, 0x2($a2)
/* BFF8 8001B7F8 0F004230 */  andi       $v0, $v0, 0xF
/* BFFC 8001B7FC C0100200 */  sll        $v0, $v0, 3
/* C000 8001B800 21104500 */  addu       $v0, $v0, $a1
/* C004 8001B804 12380000 */  mflo       $a3
/* C008 8001B808 03230700 */  sra        $a0, $a3, 12
/* C00C 8001B80C 21186400 */  addu       $v1, $v1, $a0
/* C010 8001B810 0200C3A4 */  sh         $v1, 0x2($a2)
/* C014 8001B814 04004384 */  lh         $v1, 0x4($v0)
/* C018 8001B818 E600C284 */  lh         $v0, 0xE6($a2)
/* C01C 8001B81C 00000000 */  nop
/* C020 8001B820 18006200 */  mult       $v1, $v0
/* C024 8001B824 0400C294 */  lhu        $v0, 0x4($a2)
/* C028 8001B828 12380000 */  mflo       $a3
/* C02C 8001B82C 031B0700 */  sra        $v1, $a3, 12
/* C030 8001B830 21104300 */  addu       $v0, $v0, $v1
/* C034 8001B834 0400C2A4 */  sh         $v0, 0x4($a2)
/* C038 8001B838 E000C28C */  lw         $v0, 0xE0($a2)
/* C03C 8001B83C 08C0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x240)($gp)
/* C040 8001B840 00000000 */  nop
/* C044 8001B844 23104300 */  subu       $v0, $v0, $v1
/* C048 8001B848 02004104 */  bgez       $v0, .L8001B854
/* C04C 8001B84C E000C2AC */   sw        $v0, 0xE0($a2)
/* C050 8001B850 E000C0AC */  sw         $zero, 0xE0($a2)
.L8001B854:
/* C054 8001B854 E400C294 */  lhu        $v0, 0xE4($a2)
/* C058 8001B858 00000000 */  nop
/* C05C 8001B85C 01004224 */  addiu      $v0, $v0, 0x1
/* C060 8001B860 E400C2A4 */  sh         $v0, 0xE4($a2)
.L8001B864:
/* C064 8001B864 0800E003 */  jr         $ra
/* C068 8001B868 00000000 */   nop
.size CAMERA_ShakeCamera, . - CAMERA_ShakeCamera
