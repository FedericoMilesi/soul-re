.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_DeleteBlock
/* A6820 800B6020 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6824 800B6024 1400BFAF */  sw         $ra, 0x14($sp)
/* A6828 800B6028 1000B0AF */  sw         $s0, 0x10($sp)
/* A682C 800B602C 01008290 */  lbu        $v0, 0x1($a0)
/* A6830 800B6030 00000000 */  nop
/* A6834 800B6034 80800200 */  sll        $s0, $v0, 2
/* A6838 800B6038 44A8828F */  lw         $v0, %gp_rel(numbufferedIntros)($gp)
/* A683C 800B603C 00000000 */  nop
/* A6840 800B6040 10004010 */  beqz       $v0, .L800B6084
/* A6844 800B6044 21289000 */   addu      $a1, $a0, $s0
/* A6848 800B6048 21380000 */  addu       $a3, $zero, $zero
/* A684C 800B604C ECFD8627 */  addiu      $a2, $gp, %gp_rel(bufferSavedIntroArray)
.L800B6050:
/* A6850 800B6050 0000C38C */  lw         $v1, 0x0($a2)
/* A6854 800B6054 00000000 */  nop
/* A6858 800B6058 03006414 */  bne        $v1, $a0, .L800B6068
/* A685C 800B605C 2B108300 */   sltu      $v0, $a0, $v1
/* A6860 800B6060 1DD80208 */  j          .L800B6074
/* A6864 800B6064 0000C0AC */   sw        $zero, 0x0($a2)
.L800B6068:
/* A6868 800B6068 02004010 */  beqz       $v0, .L800B6074
/* A686C 800B606C 23107000 */   subu      $v0, $v1, $s0
/* A6870 800B6070 0000C2AC */  sw         $v0, 0x0($a2)
.L800B6074:
/* A6874 800B6074 0100E724 */  addiu      $a3, $a3, 0x1
/* A6878 800B6078 4000E228 */  slti       $v0, $a3, 0x40
/* A687C 800B607C F4FF4014 */  bnez       $v0, .L800B6050
/* A6880 800B6080 0400C624 */   addiu     $a2, $a2, 0x4
.L800B6084:
/* A6884 800B6084 E4FD868F */  lw         $a2, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6888 800B6088 BD01030C */  jal        func_800C06F4
/* A688C 800B608C 2330C500 */   subu      $a2, $a2, $a1
/* A6890 800B6090 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6894 800B6094 1400BF8F */  lw         $ra, 0x14($sp)
/* A6898 800B6098 23105000 */  subu       $v0, $v0, $s0
/* A689C 800B609C 1000B08F */  lw         $s0, 0x10($sp)
/* A68A0 800B60A0 E4FD82AF */  sw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A68A4 800B60A4 0800E003 */  jr         $ra
/* A68A8 800B60A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_DeleteBlock, . - SAVE_DeleteBlock
