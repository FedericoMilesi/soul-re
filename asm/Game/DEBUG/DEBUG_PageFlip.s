.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_PageFlip
/* 4FA4 800147A4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4FA8 800147A8 21200000 */  addu       $a0, $zero, $zero
/* 4FAC 800147AC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 4FB0 800147B0 0FE9020C */  jal        func_800BA43C
/* 4FB4 800147B4 2800B0AF */   sw        $s0, 0x28($sp)
/* 4FB8 800147B8 5EF2020C */  jal        func_800BC978
/* 4FBC 800147BC 21200000 */   addu      $a0, $zero, $zero
/* 4FC0 800147C0 5EF2020C */  jal        func_800BC978
/* 4FC4 800147C4 21200000 */   addu      $a0, $zero, $zero
/* 4FC8 800147C8 5EF2020C */  jal        func_800BC978
/* 4FCC 800147CC 21200000 */   addu      $a0, $zero, $zero
/* 4FD0 800147D0 5EF2020C */  jal        func_800BC978
/* 4FD4 800147D4 21200000 */   addu      $a0, $zero, $zero
/* 4FD8 800147D8 5EF2020C */  jal        func_800BC978
/* 4FDC 800147DC 21200000 */   addu      $a0, $zero, $zero
/* 4FE0 800147E0 D1E8020C */  jal        func_800BA344
/* 4FE4 800147E4 21200000 */   addu      $a0, $zero, $zero
/* 4FE8 800147E8 C3E6020C */  jal        func_800B9B0C
/* 4FEC 800147EC 21200000 */   addu      $a0, $zero, $zero
/* 4FF0 800147F0 24C0000C */  jal        ResetPrimPool
/* 4FF4 800147F4 00000000 */   nop
/* 4FF8 800147F8 9CBF908F */  lw         $s0, %gp_rel(gameTrackerX + 0x1D4)($gp)
/* 4FFC 800147FC 88BC8427 */  addiu      $a0, $gp, %gp_rel(draw)
/* 5000 80014800 F8BD80AF */  sw         $zero, %gp_rel(gameTrackerX + 0x30)($gp)
/* 5004 80014804 38EA020C */  jal        func_800BA8E0
/* 5008 80014808 00000000 */   nop
/* 500C 8001480C 000C0524 */  addiu      $a1, $zero, 0xC00
/* 5010 80014810 DAE9020C */  jal        func_800BA768
/* 5014 80014814 21200002 */   addu      $a0, $s0, $zero
/* 5018 80014818 0FE9020C */  jal        func_800BA43C
/* 501C 8001481C 21200000 */   addu      $a0, $zero, $zero
/* 5020 80014820 1000A427 */  addiu      $a0, $sp, 0x10
/* 5024 80014824 05000224 */  addiu      $v0, $zero, 0x5
/* 5028 80014828 1300A2A3 */  sb         $v0, 0x13($sp)
/* 502C 8001482C 28000224 */  addiu      $v0, $zero, 0x28
/* 5030 80014830 1700A2A3 */  sb         $v0, 0x17($sp)
/* 5034 80014834 20000224 */  addiu      $v0, $zero, 0x20
/* 5038 80014838 0E000524 */  addiu      $a1, $zero, 0xE
/* 503C 8001483C 1400A2A3 */  sb         $v0, 0x14($sp)
/* 5040 80014840 1500A2A3 */  sb         $v0, 0x15($sp)
/* 5044 80014844 1600A2A3 */  sb         $v0, 0x16($sp)
/* 5048 80014848 F0B98297 */  lhu        $v0, %gp_rel(fontTracker + 0x604)($gp)
/* 504C 8001484C FF010324 */  addiu      $v1, $zero, 0x1FF
/* 5050 80014850 1800A0A7 */  sh         $zero, 0x18($sp)
/* 5054 80014854 1A00A5A7 */  sh         $a1, 0x1A($sp)
/* 5058 80014858 1C00A3A7 */  sh         $v1, 0x1C($sp)
/* 505C 8001485C 1E00A5A7 */  sh         $a1, 0x1E($sp)
/* 5060 80014860 2000A0A7 */  sh         $zero, 0x20($sp)
/* 5064 80014864 2400A3A7 */  sh         $v1, 0x24($sp)
/* 5068 80014868 FEFF4224 */  addiu      $v0, $v0, -0x2
/* 506C 8001486C 2200A2A7 */  sh         $v0, 0x22($sp)
/* 5070 80014870 05EA020C */  jal        func_800BA814
/* 5074 80014874 2600A2A7 */   sh        $v0, 0x26($sp)
/* 5078 80014878 18B6000C */  jal        FONT_Flush
/* 507C 8001487C 00000000 */   nop
/* 5080 80014880 1CEA020C */  jal        func_800BA870
/* 5084 80014884 21200002 */   addu      $a0, $s0, $zero
/* 5088 80014888 0FE9020C */  jal        func_800BA43C
/* 508C 8001488C 21200000 */   addu      $a0, $zero, $zero
/* 5090 80014890 ECBE848F */  lw         $a0, %gp_rel(gameTrackerX + 0x124)($gp)
/* 5094 80014894 68EA020C */  jal        func_800BA9A0
/* 5098 80014898 00000000 */   nop
/* 509C 8001489C 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 50A0 800148A0 2800B08F */  lw         $s0, 0x28($sp)
/* 50A4 800148A4 0800E003 */  jr         $ra
/* 50A8 800148A8 3000BD27 */   addiu     $sp, $sp, 0x30
.size DEBUG_PageFlip, . - DEBUG_PageFlip
