.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdRead
/* B6424 800C5C24 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B6428 800C5C28 2000B4AF */  sw         $s4, 0x20($sp)
/* B642C 800C5C2C 21A08000 */  addu       $s4, $a0, $zero
/* B6430 800C5C30 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B6434 800C5C34 2198A000 */  addu       $s3, $a1, $zero
/* B6438 800C5C38 1000B0AF */  sw         $s0, 0x10($sp)
/* B643C 800C5C3C 0D80103C */  lui        $s0, %hi(CD_intstr + 0x298)
/* B6440 800C5C40 C0EC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x298)
/* B6444 800C5C44 2400BFAF */  sw         $ra, 0x24($sp)
/* B6448 800C5C48 1800B2AF */  sw         $s2, 0x18($sp)
/* B644C 800C5C4C 1400B1AF */  sw         $s1, 0x14($sp)
/* B6450 800C5C50 0000028E */  lw         $v0, 0x0($s0)
/* B6454 800C5C54 00000000 */  nop
/* B6458 800C5C58 11004010 */  beqz       $v0, .L800C5CA0
/* B645C 800C5C5C 2190C000 */   addu      $s2, $a2, $zero
/* B6460 800C5C60 5EF2020C */  jal        VSync
/* B6464 800C5C64 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6468 800C5C68 0000038E */  lw         $v1, 0x0($s0)
/* B646C 800C5C6C 00000000 */  nop
/* B6470 800C5C70 0B006010 */  beqz       $v1, .L800C5CA0
/* B6474 800C5C74 21884000 */   addu      $s1, $v0, $zero
.L800C5C78:
/* B6478 800C5C78 5EF2020C */  jal        VSync
/* B647C 800C5C7C FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6480 800C5C80 23105100 */  subu       $v0, $v0, $s1
/* B6484 800C5C84 7900422C */  sltiu      $v0, $v0, 0x79
/* B6488 800C5C88 11004010 */  beqz       $v0, .L800C5CD0
/* B648C 800C5C8C 00000000 */   nop
/* B6490 800C5C90 0000028E */  lw         $v0, 0x0($s0)
/* B6494 800C5C94 00000000 */  nop
/* B6498 800C5C98 F7FF4014 */  bnez       $v0, .L800C5C78
/* B649C 800C5C9C 00000000 */   nop
.L800C5CA0:
/* B64A0 800C5CA0 0D80043C */  lui        $a0, %hi(CD_intstr + 0x274)
/* B64A4 800C5CA4 9CEC8424 */  addiu      $a0, $a0, %lo(CD_intstr + 0x274)
/* B64A8 800C5CA8 0C0092AC */  sw         $s2, 0xC($a0)
/* B64AC 800C5CAC 0C00828C */  lw         $v0, 0xC($a0)
/* B64B0 800C5CB0 00000000 */  nop
/* B64B4 800C5CB4 30004330 */  andi       $v1, $v0, 0x30
/* B64B8 800C5CB8 0D006010 */  beqz       $v1, .L800C5CF0
/* B64BC 800C5CBC 20000224 */   addiu     $v0, $zero, 0x20
/* B64C0 800C5CC0 0E006210 */  beq        $v1, $v0, .L800C5CFC
/* B64C4 800C5CC4 46020224 */   addiu     $v0, $zero, 0x246
/* B64C8 800C5CC8 42170308 */  j          .L800C5D08
/* B64CC 800C5CCC 00000000 */   nop
.L800C5CD0:
/* B64D0 800C5CD0 0D80103C */  lui        $s0, %hi(CD_intstr + 0x29C)
/* B64D4 800C5CD4 C4EC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x29C)
/* B64D8 800C5CD8 0000048E */  lw         $a0, 0x0($s0)
/* B64DC 800C5CDC 46F8020C */  jal        CdSyncCallback
/* B64E0 800C5CE0 D8FF1026 */   addiu     $s0, $s0, -0x28
/* B64E4 800C5CE4 240000AE */  sw         $zero, 0x24($s0)
/* B64E8 800C5CE8 28170308 */  j          .L800C5CA0
/* B64EC 800C5CEC 00000000 */   nop
.L800C5CF0:
/* B64F0 800C5CF0 00020224 */  addiu      $v0, $zero, 0x200
/* B64F4 800C5CF4 45170308 */  j          .L800C5D14
/* B64F8 800C5CF8 100082AC */   sw        $v0, 0x10($a0)
.L800C5CFC:
/* B64FC 800C5CFC 49020224 */  addiu      $v0, $zero, 0x249
/* B6500 800C5D00 45170308 */  j          .L800C5D14
/* B6504 800C5D04 100082AC */   sw        $v0, 0x10($a0)
.L800C5D08:
/* B6508 800C5D08 0D80033C */  lui        $v1, %hi(CD_intstr + 0x274)
/* B650C 800C5D0C 9CEC6324 */  addiu      $v1, $v1, %lo(CD_intstr + 0x274)
/* B6510 800C5D10 100062AC */  sw         $v0, 0x10($v1)
.L800C5D14:
/* B6514 800C5D14 0D80103C */  lui        $s0, %hi(CD_intstr + 0x274)
/* B6518 800C5D18 9CEC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x274)
/* B651C 800C5D1C 0C00028E */  lw         $v0, 0xC($s0)
/* B6520 800C5D20 21200000 */  addu       $a0, $zero, $zero
/* B6524 800C5D24 20004234 */  ori        $v0, $v0, 0x20
/* B6528 800C5D28 0C0002AE */  sw         $v0, 0xC($s0)
/* B652C 800C5D2C 040013AE */  sw         $s3, 0x4($s0)
/* B6530 800C5D30 46F8020C */  jal        CdSyncCallback
/* B6534 800C5D34 000014AE */   sw        $s4, 0x0($s0)
/* B6538 800C5D38 21200000 */  addu       $a0, $zero, $zero
/* B653C 800C5D3C 4BF8020C */  jal        CdReadyCallback
/* B6540 800C5D40 280002AE */   sw        $v0, 0x28($s0)
/* B6544 800C5D44 0D80033C */  lui        $v1, %hi(CD_read_dma_mode)
/* B6548 800C5D48 40E4638C */  lw         $v1, %lo(CD_read_dma_mode)($v1)
/* B654C 800C5D4C 2C0002AE */  sw         $v0, 0x2C($s0)
/* B6550 800C5D50 01006330 */  andi       $v1, $v1, 0x1
/* B6554 800C5D54 04006010 */  beqz       $v1, .L800C5D68
/* B6558 800C5D58 00000000 */   nop
/* B655C 800C5D5C 4FF9020C */  jal        CdDataCallback
/* B6560 800C5D60 21200000 */   addu      $a0, $zero, $zero
/* B6564 800C5D64 300002AE */  sw         $v0, 0x30($s0)
.L800C5D68:
/* B6568 800C5D68 5EF2020C */  jal        VSync
/* B656C 800C5D6C FFFF0424 */   addiu     $a0, $zero, -0x1
/* B6570 800C5D70 1C0002AE */  sw         $v0, 0x1C($s0)
/* B6574 800C5D74 03F8020C */  jal        CdStatus
/* B6578 800C5D78 00000000 */   nop
/* B657C 800C5D7C E0004230 */  andi       $v0, $v0, 0xE0
/* B6580 800C5D80 04004010 */  beqz       $v0, .L800C5D94
/* B6584 800C5D84 09000424 */   addiu     $a0, $zero, 0x9
/* B6588 800C5D88 21280000 */  addu       $a1, $zero, $zero
/* B658C 800C5D8C ECF8020C */  jal        CdControlB
/* B6590 800C5D90 21300000 */   addu      $a2, $zero, $zero
.L800C5D94:
/* B6594 800C5D94 8F16030C */  jal        func_800C5A3C
/* B6598 800C5D98 21200000 */   addu      $a0, $zero, $zero
/* B659C 800C5D9C 2A100200 */  slt        $v0, $zero, $v0
/* B65A0 800C5DA0 2400BF8F */  lw         $ra, 0x24($sp)
/* B65A4 800C5DA4 2000B48F */  lw         $s4, 0x20($sp)
/* B65A8 800C5DA8 1C00B38F */  lw         $s3, 0x1C($sp)
/* B65AC 800C5DAC 1800B28F */  lw         $s2, 0x18($sp)
/* B65B0 800C5DB0 1400B18F */  lw         $s1, 0x14($sp)
/* B65B4 800C5DB4 1000B08F */  lw         $s0, 0x10($sp)
/* B65B8 800C5DB8 0800E003 */  jr         $ra
/* B65BC 800C5DBC 2800BD27 */   addiu     $sp, $sp, 0x28
.size CdRead, . - CdRead
