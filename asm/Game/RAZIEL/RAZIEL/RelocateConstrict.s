.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocateConstrict
/* A2D74 800B2574 54FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x424)($gp)
/* A2D78 800B2578 58FA80AF */  sw         $zero, %gp_rel(Raziel + 0x428)($gp)
/* A2D7C 800B257C 5CFA80AF */  sw         $zero, %gp_rel(Raziel + 0x42C)($gp)
/* A2D80 800B2580 02004230 */  andi       $v0, $v0, 0x2
/* A2D84 800B2584 23004010 */  beqz       $v0, .L800B2614
/* A2D88 800B2588 21388000 */   addu      $a3, $a0, $zero
/* A2D8C 800B258C 21300000 */  addu       $a2, $zero, $zero
/* A2D90 800B2590 80280600 */  sll        $a1, $a2, 2
.L800B2594:
/* A2D94 800B2594 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2D98 800B2598 0000E394 */  lhu        $v1, 0x0($a3)
/* A2D9C 800B259C 2120A400 */  addu       $a0, $a1, $a0
/* A2DA0 800B25A0 00008294 */  lhu        $v0, 0x0($a0)
/* A2DA4 800B25A4 00000000 */  nop
/* A2DA8 800B25A8 21104300 */  addu       $v0, $v0, $v1
/* A2DAC 800B25AC 000082A4 */  sh         $v0, 0x0($a0)
/* A2DB0 800B25B0 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2DB4 800B25B4 0200E394 */  lhu        $v1, 0x2($a3)
/* A2DB8 800B25B8 2120A400 */  addu       $a0, $a1, $a0
/* A2DBC 800B25BC 02008294 */  lhu        $v0, 0x2($a0)
/* A2DC0 800B25C0 00000000 */  nop
/* A2DC4 800B25C4 21104300 */  addu       $v0, $v0, $v1
/* A2DC8 800B25C8 020082A4 */  sh         $v0, 0x2($a0)
/* A2DCC 800B25CC 44FA828F */  lw         $v0, %gp_rel(Raziel + 0x414)($gp)
/* A2DD0 800B25D0 00000000 */  nop
/* A2DD4 800B25D4 2128A200 */  addu       $a1, $a1, $v0
/* A2DD8 800B25D8 0000A384 */  lh         $v1, 0x0($a1)
/* A2DDC 800B25DC 58FA828F */  lw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2DE0 800B25E0 00000000 */  nop
/* A2DE4 800B25E4 21104300 */  addu       $v0, $v0, $v1
/* A2DE8 800B25E8 58FA82AF */  sw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2DEC 800B25EC 0200A384 */  lh         $v1, 0x2($a1)
/* A2DF0 800B25F0 5CFA828F */  lw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2DF4 800B25F4 0100C624 */  addiu      $a2, $a2, 0x1
/* A2DF8 800B25F8 21104300 */  addu       $v0, $v0, $v1
/* A2DFC 800B25FC 5CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2E00 800B2600 2000C228 */  slti       $v0, $a2, 0x20
/* A2E04 800B2604 E3FF4014 */  bnez       $v0, .L800B2594
/* A2E08 800B2608 80280600 */   sll       $a1, $a2, 2
.L800B260C:
/* A2E0C 800B260C 0800E003 */  jr         $ra
/* A2E10 800B2610 00000000 */   nop
.L800B2614:
/* A2E14 800B2614 4AFA8287 */  lh         $v0, %gp_rel(Raziel + 0x41A)($gp)
/* A2E18 800B2618 00000000 */  nop
/* A2E1C 800B261C 01004624 */  addiu      $a2, $v0, 0x1
/* A2E20 800B2620 20000224 */  addiu      $v0, $zero, 0x20
/* A2E24 800B2624 0200C214 */  bne        $a2, $v0, .L800B2630
/* A2E28 800B2628 00000000 */   nop
/* A2E2C 800B262C 21300000 */  addu       $a2, $zero, $zero
.L800B2630:
/* A2E30 800B2630 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2E34 800B2634 00000000 */  nop
/* A2E38 800B2638 F4FFC210 */  beq        $a2, $v0, .L800B260C
/* A2E3C 800B263C 20000824 */   addiu     $t0, $zero, 0x20
/* A2E40 800B2640 80280600 */  sll        $a1, $a2, 2
.L800B2644:
/* A2E44 800B2644 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2E48 800B2648 0000E394 */  lhu        $v1, 0x0($a3)
/* A2E4C 800B264C 2120A400 */  addu       $a0, $a1, $a0
/* A2E50 800B2650 00008294 */  lhu        $v0, 0x0($a0)
/* A2E54 800B2654 00000000 */  nop
/* A2E58 800B2658 21104300 */  addu       $v0, $v0, $v1
/* A2E5C 800B265C 000082A4 */  sh         $v0, 0x0($a0)
/* A2E60 800B2660 44FA848F */  lw         $a0, %gp_rel(Raziel + 0x414)($gp)
/* A2E64 800B2664 0200E394 */  lhu        $v1, 0x2($a3)
/* A2E68 800B2668 2120A400 */  addu       $a0, $a1, $a0
/* A2E6C 800B266C 02008294 */  lhu        $v0, 0x2($a0)
/* A2E70 800B2670 00000000 */  nop
/* A2E74 800B2674 21104300 */  addu       $v0, $v0, $v1
/* A2E78 800B2678 020082A4 */  sh         $v0, 0x2($a0)
/* A2E7C 800B267C 44FA828F */  lw         $v0, %gp_rel(Raziel + 0x414)($gp)
/* A2E80 800B2680 00000000 */  nop
/* A2E84 800B2684 2128A200 */  addu       $a1, $a1, $v0
/* A2E88 800B2688 0000A384 */  lh         $v1, 0x0($a1)
/* A2E8C 800B268C 58FA828F */  lw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2E90 800B2690 00000000 */  nop
/* A2E94 800B2694 21104300 */  addu       $v0, $v0, $v1
/* A2E98 800B2698 58FA82AF */  sw         $v0, %gp_rel(Raziel + 0x428)($gp)
/* A2E9C 800B269C 0200A384 */  lh         $v1, 0x2($a1)
/* A2EA0 800B26A0 5CFA828F */  lw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2EA4 800B26A4 0100C624 */  addiu      $a2, $a2, 0x1
/* A2EA8 800B26A8 21104300 */  addu       $v0, $v0, $v1
/* A2EAC 800B26AC 5CFA82AF */  sw         $v0, %gp_rel(Raziel + 0x42C)($gp)
/* A2EB0 800B26B0 0200C814 */  bne        $a2, $t0, .L800B26BC
/* A2EB4 800B26B4 00000000 */   nop
/* A2EB8 800B26B8 21300000 */  addu       $a2, $zero, $zero
.L800B26BC:
/* A2EBC 800B26BC 48FA8287 */  lh         $v0, %gp_rel(Raziel + 0x418)($gp)
/* A2EC0 800B26C0 00000000 */  nop
/* A2EC4 800B26C4 DFFFC214 */  bne        $a2, $v0, .L800B2644
/* A2EC8 800B26C8 80280600 */   sll       $a1, $a2, 2
/* A2ECC 800B26CC 0800E003 */  jr         $ra
/* A2ED0 800B26D0 00000000 */   nop
.size RelocateConstrict, . - RelocateConstrict
