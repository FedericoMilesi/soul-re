.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSetAnimation
/* 62CE4 800724E4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 62CE8 800724E8 2400B3AF */  sw         $s3, 0x24($sp)
/* 62CEC 800724EC 2198C000 */  addu       $s3, $a2, $zero
/* 62CF0 800724F0 FF00A330 */  andi       $v1, $a1, 0xFF
/* 62CF4 800724F4 21286002 */  addu       $a1, $s3, $zero
/* 62CF8 800724F8 2800B4AF */  sw         $s4, 0x28($sp)
/* 62CFC 800724FC 21A0E000 */  addu       $s4, $a3, $zero
/* 62D00 80072500 40100300 */  sll        $v0, $v1, 1
/* 62D04 80072504 21104300 */  addu       $v0, $v0, $v1
/* 62D08 80072508 00110200 */  sll        $v0, $v0, 4
/* 62D0C 8007250C 1800B0AF */  sw         $s0, 0x18($sp)
/* 62D10 80072510 4000B08F */  lw         $s0, 0x40($sp)
/* 62D14 80072514 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62D18 80072518 2000B2AF */  sw         $s2, 0x20($sp)
/* 62D1C 8007251C 21908200 */  addu       $s2, $a0, $v0
/* 62D20 80072520 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 62D24 80072524 4154020C */  jal        G2Instance_GetKeylist
/* 62D28 80072528 1C00B1AF */   sw        $s1, 0x1C($sp)
/* 62D2C 8007252C 21204002 */  addu       $a0, $s2, $zero
/* 62D30 80072530 21280000 */  addu       $a1, $zero, $zero
/* 62D34 80072534 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62D38 80072538 21884000 */   addu      $s1, $v0, $zero
/* 62D3C 8007253C 21204002 */  addu       $a0, $s2, $zero
/* 62D40 80072540 21282002 */  addu       $a1, $s1, $zero
/* 62D44 80072544 21306002 */  addu       $a2, $s3, $zero
/* 62D48 80072548 21388002 */  addu       $a3, $s4, $zero
/* 62D4C 8007254C 40101000 */  sll        $v0, $s0, 1
/* 62D50 80072550 21105000 */  addu       $v0, $v0, $s0
/* 62D54 80072554 C0100200 */  sll        $v0, $v0, 3
/* 62D58 80072558 21105000 */  addu       $v0, $v0, $s0
/* 62D5C 8007255C 80140200 */  sll        $v0, $v0, 18
/* 62D60 80072560 03140200 */  sra        $v0, $v0, 16
/* 62D64 80072564 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 62D68 80072568 1000A2AF */   sw        $v0, 0x10($sp)
/* 62D6C 8007256C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 62D70 80072570 2800B48F */  lw         $s4, 0x28($sp)
/* 62D74 80072574 2400B38F */  lw         $s3, 0x24($sp)
/* 62D78 80072578 2000B28F */  lw         $s2, 0x20($sp)
/* 62D7C 8007257C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62D80 80072580 1800B08F */  lw         $s0, 0x18($sp)
/* 62D84 80072584 0800E003 */  jr         $ra
/* 62D88 80072588 3000BD27 */   addiu     $sp, $sp, 0x30
.size G2EmulationInstanceSetAnimation, . - G2EmulationInstanceSetAnimation
