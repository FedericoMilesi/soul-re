.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2AnimController_Destroy
/* 824EC 80091CEC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 824F0 80091CF0 21288000 */  addu       $a1, $a0, $zero
/* 824F4 80091CF4 1400BFAF */  sw         $ra, 0x14($sp)
/* 824F8 80091CF8 1000B0AF */  sw         $s0, 0x10($sp)
.L80091CFC:
/* 824FC 80091CFC 78F58427 */  addiu      $a0, $gp, %gp_rel(_controllerPool)
/* 82500 80091D00 0000B094 */  lhu        $s0, 0x0($a1)
/* 82504 80091D04 F857020C */  jal        G2PoolMem_Free
/* 82508 80091D08 00000000 */   nop
/* 8250C 80091D0C 84F5838F */  lw         $v1, %gp_rel(_controllerPool + 0xC)($gp)
/* 82510 80091D10 C0101000 */  sll        $v0, $s0, 3
/* 82514 80091D14 21105000 */  addu       $v0, $v0, $s0
/* 82518 80091D18 80100200 */  sll        $v0, $v0, 2
/* 8251C 80091D1C 21286200 */  addu       $a1, $v1, $v0
/* 82520 80091D20 2B186500 */  sltu       $v1, $v1, $a1
/* 82524 80091D24 05006010 */  beqz       $v1, .L80091D3C
/* 82528 80091D28 00000000 */   nop
/* 8252C 80091D2C 0200A290 */  lbu        $v0, 0x2($a1)
/* 82530 80091D30 00000000 */  nop
/* 82534 80091D34 F1FF4010 */  beqz       $v0, .L80091CFC
/* 82538 80091D38 00000000 */   nop
.L80091D3C:
/* 8253C 80091D3C 1400BF8F */  lw         $ra, 0x14($sp)
/* 82540 80091D40 1000B08F */  lw         $s0, 0x10($sp)
/* 82544 80091D44 2110A000 */  addu       $v0, $a1, $zero
/* 82548 80091D48 0800E003 */  jr         $ra
/* 8254C 80091D4C 1800BD27 */   addiu     $sp, $sp, 0x18
.size _G2AnimController_Destroy, . - _G2AnimController_Destroy
