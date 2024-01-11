.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C596C
/* B616C 800C596C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B6170 800C5970 1000B0AF */  sw         $s0, 0x10($sp)
/* B6174 800C5974 0D80103C */  lui        $s0, %hi(CD_intstr + 0x274)
/* B6178 800C5978 9CEC1026 */  addiu      $s0, $s0, %lo(CD_intstr + 0x274)
/* B617C 800C597C 1400BFAF */  sw         $ra, 0x14($sp)
/* B6180 800C5980 1000028E */  lw         $v0, 0x10($s0)
/* B6184 800C5984 0800038E */  lw         $v1, 0x8($s0)
/* B6188 800C5988 80100200 */  sll        $v0, $v0, 2
/* B618C 800C598C 21186200 */  addu       $v1, $v1, $v0
/* B6190 800C5990 080003AE */  sw         $v1, 0x8($s0)
/* B6194 800C5994 1400028E */  lw         $v0, 0x14($s0)
/* B6198 800C5998 00000000 */  nop
/* B619C 800C599C FFFF4224 */  addiu      $v0, $v0, -0x1
/* B61A0 800C59A0 140002AE */  sw         $v0, 0x14($s0)
/* B61A4 800C59A4 2000028E */  lw         $v0, 0x20($s0)
/* B61A8 800C59A8 00000000 */  nop
/* B61AC 800C59AC 01004224 */  addiu      $v0, $v0, 0x1
/* B61B0 800C59B0 200002AE */  sw         $v0, 0x20($s0)
/* B61B4 800C59B4 1400028E */  lw         $v0, 0x14($s0)
/* B61B8 800C59B8 00000000 */  nop
/* B61BC 800C59BC 1B004014 */  bnez       $v0, .L800C5A2C
/* B61C0 800C59C0 00000000 */   nop
/* B61C4 800C59C4 2C00048E */  lw         $a0, 0x2C($s0)
/* B61C8 800C59C8 4BF8020C */  jal        CdReadyCallback
/* B61CC 800C59CC 00000000 */   nop
/* B61D0 800C59D0 0D80023C */  lui        $v0, %hi(CD_read_dma_mode)
/* B61D4 800C59D4 40E4428C */  lw         $v0, %lo(CD_read_dma_mode)($v0)
/* B61D8 800C59D8 00000000 */  nop
/* B61DC 800C59DC 01004230 */  andi       $v0, $v0, 0x1
/* B61E0 800C59E0 04004010 */  beqz       $v0, .L800C59F4
/* B61E4 800C59E4 00000000 */   nop
/* B61E8 800C59E8 3000048E */  lw         $a0, 0x30($s0)
/* B61EC 800C59EC 4FF9020C */  jal        CdDataCallback
/* B61F0 800C59F0 00000000 */   nop
.L800C59F4:
/* B61F4 800C59F4 0C80043C */  lui        $a0, %hi(DeliverEvent + 0x10)
/* B61F8 800C59F8 46F8020C */  jal        CdSyncCallback
/* B61FC 800C59FC C4568424 */   addiu     $a0, $a0, %lo(DeliverEvent + 0x10)
/* B6200 800C5A00 09000424 */  addiu      $a0, $zero, 0x9
/* B6204 800C5A04 9FF8020C */  jal        CdControlF
/* B6208 800C5A08 21280000 */   addu      $a1, $zero, $zero
/* B620C 800C5A0C 0D80033C */  lui        $v1, %hi(CD_cbread)
/* B6210 800C5A10 3CE4638C */  lw         $v1, %lo(CD_cbread)($v1)
/* B6214 800C5A14 01000224 */  addiu      $v0, $zero, 0x1
/* B6218 800C5A18 04006010 */  beqz       $v1, .L800C5A2C
/* B621C 800C5A1C 240002AE */   sw        $v0, 0x24($s0)
/* B6220 800C5A20 3400058E */  lw         $a1, 0x34($s0)
/* B6224 800C5A24 09F86000 */  jalr       $v1
/* B6228 800C5A28 02000424 */   addiu     $a0, $zero, 0x2
.L800C5A2C:
/* B622C 800C5A2C 1400BF8F */  lw         $ra, 0x14($sp)
/* B6230 800C5A30 1000B08F */  lw         $s0, 0x10($sp)
/* B6234 800C5A34 0800E003 */  jr         $ra
/* B6238 800C5A38 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800C596C, . - func_800C596C
