.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_UpdateFamilyStreamUnitID
/* 25FA8 800357A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 25FAC 800357AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 25FB0 800357B0 21888000 */  addu       $s1, $a0, $zero
/* 25FB4 800357B4 1800BFAF */  sw         $ra, 0x18($sp)
/* 25FB8 800357B8 1000B0AF */  sw         $s0, 0x10($sp)
/* 25FBC 800357BC 4C01308E */  lw         $s0, 0x14C($s1)
/* 25FC0 800357C0 00000000 */  nop
/* 25FC4 800357C4 09000012 */  beqz       $s0, .L800357EC
/* 25FC8 800357C8 00000000 */   nop
.L800357CC:
/* 25FCC 800357CC 3800228E */  lw         $v0, 0x38($s1)
/* 25FD0 800357D0 21200002 */  addu       $a0, $s0, $zero
/* 25FD4 800357D4 EAD5000C */  jal        INSTANCE_UpdateFamilyStreamUnitID
/* 25FD8 800357D8 380002AE */   sw        $v0, 0x38($s0)
/* 25FDC 800357DC 5001108E */  lw         $s0, 0x150($s0)
/* 25FE0 800357E0 00000000 */  nop
/* 25FE4 800357E4 F9FF0016 */  bnez       $s0, .L800357CC
/* 25FE8 800357E8 00000000 */   nop
.L800357EC:
/* 25FEC 800357EC 1800BF8F */  lw         $ra, 0x18($sp)
/* 25FF0 800357F0 1400B18F */  lw         $s1, 0x14($sp)
/* 25FF4 800357F4 1000B08F */  lw         $s0, 0x10($sp)
/* 25FF8 800357F8 0800E003 */  jr         $ra
/* 25FFC 800357FC 2000BD27 */   addiu     $sp, $sp, 0x20
.size INSTANCE_UpdateFamilyStreamUnitID, . - INSTANCE_UpdateFamilyStreamUnitID
