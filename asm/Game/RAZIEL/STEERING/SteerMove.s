.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SteerMove
/* 93150 800A2950 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 93154 800A2954 0500A014 */  bnez       $a1, .L800A296C
/* 93158 800A2958 1000BFAF */   sw        $ra, 0x10($sp)
/* 9315C 800A295C B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 93160 800A2960 00000000 */  nop
/* 93164 800A2964 21004010 */  beqz       $v0, .L800A29EC
/* 93168 800A2968 00000000 */   nop
.L800A296C:
/* 9316C 800A296C B4F98287 */  lh         $v0, %gp_rel(Raziel + 0x384)($gp)
/* 93170 800A2970 B4F98397 */  lhu        $v1, %gp_rel(Raziel + 0x384)($gp)
/* 93174 800A2974 04004104 */  bgez       $v0, .L800A2988
/* 93178 800A2978 23100300 */   negu      $v0, $v1
/* 9317C 800A297C BCF982A7 */  sh         $v0, %gp_rel(Raziel + 0x38C)($gp)
/* 93180 800A2980 638A0208 */  j          .L800A298C
/* 93184 800A2984 00000000 */   nop
.L800A2988:
/* 93188 800A2988 BCF983A7 */  sh         $v1, %gp_rel(Raziel + 0x38C)($gp)
.L800A298C:
/* 9318C 800A298C BCF98387 */  lh         $v1, %gp_rel(Raziel + 0x38C)($gp)
/* 93190 800A2990 00000000 */  nop
/* 93194 800A2994 01036228 */  slti       $v0, $v1, 0x301
/* 93198 800A2998 07004014 */  bnez       $v0, .L800A29B8
/* 9319C 800A299C 70000224 */   addiu     $v0, $zero, 0x70
/* 931A0 800A29A0 21106000 */  addu       $v0, $v1, $zero
/* 931A4 800A29A4 02004104 */  bgez       $v0, .L800A29B0
/* 931A8 800A29A8 00000000 */   nop
/* 931AC 800A29AC 03004224 */  addiu      $v0, $v0, 0x3
.L800A29B0:
/* 931B0 800A29B0 83100200 */  sra        $v0, $v0, 2
/* 931B4 800A29B4 70004224 */  addiu      $v0, $v0, 0x70
.L800A29B8:
/* 931B8 800A29B8 BCF982A7 */  sh         $v0, %gp_rel(Raziel + 0x38C)($gp)
/* 931BC 800A29BC BCF98387 */  lh         $v1, %gp_rel(Raziel + 0x38C)($gp)
/* 931C0 800A29C0 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 931C4 800A29C4 00000000 */  nop
/* 931C8 800A29C8 18006200 */  mult       $v1, $v0
/* 931CC 800A29CC 78008424 */  addiu      $a0, $a0, 0x78
/* 931D0 800A29D0 B6F98587 */  lh         $a1, %gp_rel(Raziel + 0x386)($gp)
/* 931D4 800A29D4 12380000 */  mflo       $a3
/* 931D8 800A29D8 00310700 */  sll        $a2, $a3, 4
/* 931DC 800A29DC 53E8000C */  jal        AngleMoveToward
/* 931E0 800A29E0 03340600 */   sra       $a2, $a2, 16
/* 931E4 800A29E4 7C8A0208 */  j          .L800A29F0
/* 931E8 800A29E8 00000000 */   nop
.L800A29EC:
/* 931EC 800A29EC BCF980A7 */  sh         $zero, %gp_rel(Raziel + 0x38C)($gp)
.L800A29F0:
/* 931F0 800A29F0 1000BF8F */  lw         $ra, 0x10($sp)
/* 931F4 800A29F4 00000000 */  nop
/* 931F8 800A29F8 0800E003 */  jr         $ra
/* 931FC 800A29FC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SteerMove, . - SteerMove
