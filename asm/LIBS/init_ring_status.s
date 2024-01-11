.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel init_ring_status
/* B80D8 800C78D8 0A00A010 */  beqz       $a1, .L800C7904
/* B80DC 800C78DC 21300000 */   addu      $a2, $zero, $zero
.L800C78E0:
/* B80E0 800C78E0 2110C400 */  addu       $v0, $a2, $a0
/* B80E4 800C78E4 0100C624 */  addiu      $a2, $a2, 0x1
/* B80E8 800C78E8 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B80EC 800C78EC 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B80F0 800C78F0 40110200 */  sll        $v0, $v0, 5
/* B80F4 800C78F4 21186200 */  addu       $v1, $v1, $v0
/* B80F8 800C78F8 2B10C500 */  sltu       $v0, $a2, $a1
/* B80FC 800C78FC F8FF4014 */  bnez       $v0, .L800C78E0
/* B8100 800C7900 000060AC */   sw        $zero, 0x0($v1)
.L800C7904:
/* B8104 800C7904 0800E003 */  jr         $ra
/* B8108 800C7908 00000000 */   nop
/* B810C 800C790C 00000000 */  nop
/* B8110 800C7910 00000000 */  nop
/* B8114 800C7914 00000000 */  nop
.size init_ring_status, . - init_ring_status
