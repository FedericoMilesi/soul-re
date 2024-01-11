.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerTurn
/* 930BC 800A28BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 930C0 800A28C0 0500A014 */  bnez       $a1, .L800A28D8
/* 930C4 800A28C4 1000BFAF */   sw        $ra, 0x10($sp)
/* 930C8 800A28C8 B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 930CC 800A28CC 00000000 */  nop
/* 930D0 800A28D0 1A004010 */  beqz       $v0, .L800A293C
/* 930D4 800A28D4 00000000 */   nop
.L800A28D8:
/* 930D8 800A28D8 B4F98387 */  lh         $v1, %gp_rel(Raziel + 0x384)($gp)
/* 930DC 800A28DC 00080224 */  addiu      $v0, $zero, 0x800
/* 930E0 800A28E0 0A006214 */  bne        $v1, $v0, .L800A290C
/* 930E4 800A28E4 00000000 */   nop
/* 930E8 800A28E8 78008284 */  lh         $v0, 0x78($a0)
/* 930EC 800A28EC B6F98387 */  lh         $v1, %gp_rel(Raziel + 0x386)($gp)
/* 930F0 800A28F0 00000000 */  nop
/* 930F4 800A28F4 23104300 */  subu       $v0, $v0, $v1
/* 930F8 800A28F8 B6F98397 */  lhu        $v1, %gp_rel(Raziel + 0x386)($gp)
/* 930FC 800A28FC 0200401C */  bgtz       $v0, .L800A2908
/* 93100 800A2900 01006224 */   addiu     $v0, $v1, 0x1
/* 93104 800A2904 FFFF6224 */  addiu      $v0, $v1, -0x1
.L800A2908:
/* 93108 800A2908 B6F982A7 */  sh         $v0, %gp_rel(Raziel + 0x386)($gp)
.L800A290C:
/* 9310C 800A290C BCF98387 */  lh         $v1, %gp_rel(Raziel + 0x38C)($gp)
/* 93110 800A2910 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 93114 800A2914 00000000 */  nop
/* 93118 800A2918 18006200 */  mult       $v1, $v0
/* 9311C 800A291C 78008424 */  addiu      $a0, $a0, 0x78
/* 93120 800A2920 B6F98587 */  lh         $a1, %gp_rel(Raziel + 0x386)($gp)
/* 93124 800A2924 12380000 */  mflo       $a3
/* 93128 800A2928 00310700 */  sll        $a2, $a3, 4
/* 9312C 800A292C 53E8000C */  jal        AngleMoveToward
/* 93130 800A2930 03340600 */   sra       $a2, $a2, 16
/* 93134 800A2934 508A0208 */  j          .L800A2940
/* 93138 800A2938 00000000 */   nop
.L800A293C:
/* 9313C 800A293C BCF980A7 */  sh         $zero, %gp_rel(Raziel + 0x38C)($gp)
.L800A2940:
/* 93140 800A2940 1000BF8F */  lw         $ra, 0x10($sp)
/* 93144 800A2944 00000000 */  nop
/* 93148 800A2948 0800E003 */  jr         $ra
/* 9314C 800A294C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SteerTurn, . - SteerTurn
