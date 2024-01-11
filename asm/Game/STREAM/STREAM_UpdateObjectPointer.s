.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_UpdateObjectPointer
/* 4AE7C 8005A67C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4AE80 8005A680 1800B2AF */  sw         $s2, 0x18($sp)
/* 4AE84 8005A684 21908000 */  addu       $s2, $a0, $zero
/* 4AE88 8005A688 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4AE8C 8005A68C 2198A000 */  addu       $s3, $a1, $zero
/* 4AE90 8005A690 2000B4AF */  sw         $s4, 0x20($sp)
/* 4AE94 8005A694 21A0C000 */  addu       $s4, $a2, $zero
/* 4AE98 8005A698 1000B0AF */  sw         $s0, 0x10($sp)
/* 4AE9C 8005A69C C8BD9027 */  addiu      $s0, $gp, %gp_rel(gameTrackerX)
/* 4AEA0 8005A6A0 1400B1AF */  sw         $s1, 0x14($sp)
/* 4AEA4 8005A6A4 2400BFAF */  sw         $ra, 0x24($sp)
/* 4AEA8 8005A6A8 E862010C */  jal        FindObjectInTracker
/* 4AEAC 8005A6AC 23887202 */   subu      $s1, $s3, $s2
/* 4AEB0 8005A6B0 21404000 */  addu       $t0, $v0, $zero
/* 4AEB4 8005A6B4 86000011 */  beqz       $t0, .L8005A8D0
/* 4AEB8 8005A6B8 21380000 */   addu      $a3, $zero, $zero
/* 4AEBC 8005A6BC 1C000281 */  lb         $v0, 0x1C($t0)
/* 4AEC0 8005A6C0 00000000 */  nop
/* 4AEC4 8005A6C4 2A004018 */  blez       $v0, .L8005A770
/* 4AEC8 8005A6C8 100013AD */   sw        $s3, 0x10($t0)
/* 4AECC 8005A6CC 21485402 */  addu       $t1, $s2, $s4
/* 4AED0 8005A6D0 21100701 */  addu       $v0, $t0, $a3
.L8005A6D4:
/* 4AED4 8005A6D4 1D004380 */  lb         $v1, 0x1D($v0)
/* 4AED8 8005A6D8 00000000 */  nop
/* 4AEDC 8005A6DC C0100300 */  sll        $v0, $v1, 3
/* 4AEE0 8005A6E0 21104300 */  addu       $v0, $v0, $v1
/* 4AEE4 8005A6E4 4400038E */  lw         $v1, 0x44($s0)
/* 4AEE8 8005A6E8 80100200 */  sll        $v0, $v0, 2
/* 4AEEC 8005A6EC 21104300 */  addu       $v0, $v0, $v1
/* 4AEF0 8005A6F0 1000468C */  lw         $a2, 0x10($v0)
/* 4AEF4 8005A6F4 00000000 */  nop
/* 4AEF8 8005A6F8 1800C010 */  beqz       $a2, .L8005A75C
/* 4AEFC 8005A6FC 00000000 */   nop
/* 4AF00 8005A700 0A00C284 */  lh         $v0, 0xA($a2)
/* 4AF04 8005A704 00000000 */  nop
/* 4AF08 8005A708 14004018 */  blez       $v0, .L8005A75C
/* 4AF0C 8005A70C 21280000 */   addu      $a1, $zero, $zero
.L8005A710:
/* 4AF10 8005A710 1000C28C */  lw         $v0, 0x10($a2)
/* 4AF14 8005A714 80180500 */  sll        $v1, $a1, 2
/* 4AF18 8005A718 21186200 */  addu       $v1, $v1, $v0
/* 4AF1C 8005A71C 0000648C */  lw         $a0, 0x0($v1)
/* 4AF20 8005A720 00000000 */  nop
/* 4AF24 8005A724 2B109200 */  sltu       $v0, $a0, $s2
/* 4AF28 8005A728 07004014 */  bnez       $v0, .L8005A748
/* 4AF2C 8005A72C 2B102401 */   sltu      $v0, $t1, $a0
/* 4AF30 8005A730 05004014 */  bnez       $v0, .L8005A748
/* 4AF34 8005A734 00000000 */   nop
/* 4AF38 8005A738 02008010 */  beqz       $a0, .L8005A744
/* 4AF3C 8005A73C 21100000 */   addu      $v0, $zero, $zero
/* 4AF40 8005A740 21109100 */  addu       $v0, $a0, $s1
.L8005A744:
/* 4AF44 8005A744 000062AC */  sw         $v0, 0x0($v1)
.L8005A748:
/* 4AF48 8005A748 0A00C284 */  lh         $v0, 0xA($a2)
/* 4AF4C 8005A74C 0100A524 */  addiu      $a1, $a1, 0x1
/* 4AF50 8005A750 2A10A200 */  slt        $v0, $a1, $v0
/* 4AF54 8005A754 EEFF4014 */  bnez       $v0, .L8005A710
/* 4AF58 8005A758 00000000 */   nop
.L8005A75C:
/* 4AF5C 8005A75C 1C000281 */  lb         $v0, 0x1C($t0)
/* 4AF60 8005A760 0100E724 */  addiu      $a3, $a3, 0x1
/* 4AF64 8005A764 2A10E200 */  slt        $v0, $a3, $v0
/* 4AF68 8005A768 DAFF4014 */  bnez       $v0, .L8005A6D4
/* 4AF6C 8005A76C 21100701 */   addu      $v0, $t0, $a3
.L8005A770:
/* 4AF70 8005A770 21204002 */  addu       $a0, $s2, $zero
/* 4AF74 8005A774 3FF9000C */  jal        OBTABLE_ChangeObjectAccessPointers
/* 4AF78 8005A778 21286002 */   addu      $a1, $s3, $zero
/* 4AF7C 8005A77C 0000628E */  lw         $v0, 0x0($s3)
/* 4AF80 8005A780 0008033C */  lui        $v1, (0x8000000 >> 16)
/* 4AF84 8005A784 24104300 */  and        $v0, $v0, $v1
/* 4AF88 8005A788 0B004010 */  beqz       $v0, .L8005A7B8
/* 4AF8C 8005A78C 00000000 */   nop
/* 4AF90 8005A790 3C00668E */  lw         $a2, 0x3C($s3)
/* 4AF94 8005A794 00000000 */  nop
/* 4AF98 8005A798 0700C010 */  beqz       $a2, .L8005A7B8
/* 4AF9C 8005A79C 00000000 */   nop
/* 4AFA0 8005A7A0 4000648E */  lw         $a0, 0x40($s3)
/* 4AFA4 8005A7A4 00000000 */  nop
/* 4AFA8 8005A7A8 03008010 */  beqz       $a0, .L8005A7B8
/* 4AFAC 8005A7AC 00000000 */   nop
/* 4AFB0 8005A7B0 22F3010C */  jal        RELMOD_RelocModulePointers
/* 4AFB4 8005A7B4 21282002 */   addu      $a1, $s1, $zero
.L8005A7B8:
/* 4AFB8 8005A7B8 3400028E */  lw         $v0, 0x34($s0)
/* 4AFBC 8005A7BC 00000000 */  nop
/* 4AFC0 8005A7C0 0400508C */  lw         $s0, 0x4($v0)
/* 4AFC4 8005A7C4 00000000 */  nop
/* 4AFC8 8005A7C8 42000012 */  beqz       $s0, .L8005A8D4
/* 4AFCC 8005A7CC 21206002 */   addu      $a0, $s3, $zero
.L8005A7D0:
/* 4AFD0 8005A7D0 1C00028E */  lw         $v0, 0x1C($s0)
/* 4AFD4 8005A7D4 00000000 */  nop
/* 4AFD8 8005A7D8 2D005214 */  bne        $v0, $s2, .L8005A890
/* 4AFDC 8005A7DC 00000000 */   nop
/* 4AFE0 8005A7E0 0001028E */  lw         $v0, 0x100($s0)
/* 4AFE4 8005A7E4 00000000 */  nop
/* 4AFE8 8005A7E8 26004010 */  beqz       $v0, .L8005A884
/* 4AFEC 8005A7EC 1C0013AE */   sw        $s3, 0x1C($s0)
/* 4AFF0 8005A7F0 08006286 */  lh         $v0, 0x8($s3)
/* 4AFF4 8005A7F4 00000000 */  nop
/* 4AFF8 8005A7F8 22004018 */  blez       $v0, .L8005A884
/* 4AFFC 8005A7FC 21380000 */   addu      $a3, $zero, $zero
/* 4B000 8005A800 2130E000 */  addu       $a2, $a3, $zero
.L8005A804:
/* 4B004 8005A804 0001038E */  lw         $v1, 0x100($s0)
/* 4B008 8005A808 00000000 */  nop
/* 4B00C 8005A80C 2110C300 */  addu       $v0, $a2, $v1
/* 4B010 8005A810 0400428C */  lw         $v0, 0x4($v0)
/* 4B014 8005A814 00000000 */  nop
/* 4B018 8005A818 13004018 */  blez       $v0, .L8005A868
/* 4B01C 8005A81C 21280000 */   addu      $a1, $zero, $zero
/* 4B020 8005A820 2110C300 */  addu       $v0, $a2, $v1
.L8005A824:
/* 4B024 8005A824 0000438C */  lw         $v1, 0x0($v0)
/* 4B028 8005A828 C0100500 */  sll        $v0, $a1, 3
/* 4B02C 8005A82C 21104300 */  addu       $v0, $v0, $v1
/* 4B030 8005A830 0400448C */  lw         $a0, 0x4($v0)
/* 4B034 8005A834 00000000 */  nop
/* 4B038 8005A838 02008010 */  beqz       $a0, .L8005A844
/* 4B03C 8005A83C 21180000 */   addu      $v1, $zero, $zero
/* 4B040 8005A840 21189100 */  addu       $v1, $a0, $s1
.L8005A844:
/* 4B044 8005A844 040043AC */  sw         $v1, 0x4($v0)
/* 4B048 8005A848 0001038E */  lw         $v1, 0x100($s0)
/* 4B04C 8005A84C C0100700 */  sll        $v0, $a3, 3
/* 4B050 8005A850 21104300 */  addu       $v0, $v0, $v1
/* 4B054 8005A854 0400428C */  lw         $v0, 0x4($v0)
/* 4B058 8005A858 0100A524 */  addiu      $a1, $a1, 0x1
/* 4B05C 8005A85C 2A10A200 */  slt        $v0, $a1, $v0
/* 4B060 8005A860 F0FF4014 */  bnez       $v0, .L8005A824
/* 4B064 8005A864 2110C300 */   addu      $v0, $a2, $v1
.L8005A868:
/* 4B068 8005A868 1C00028E */  lw         $v0, 0x1C($s0)
/* 4B06C 8005A86C 00000000 */  nop
/* 4B070 8005A870 08004284 */  lh         $v0, 0x8($v0)
/* 4B074 8005A874 0100E724 */  addiu      $a3, $a3, 0x1
/* 4B078 8005A878 2A10E200 */  slt        $v0, $a3, $v0
/* 4B07C 8005A87C E1FF4014 */  bnez       $v0, .L8005A804
/* 4B080 8005A880 0800C624 */   addiu     $a2, $a2, 0x8
.L8005A884:
/* 4B084 8005A884 21200002 */  addu       $a0, $s0, $zero
/* 4B088 8005A888 6AF9000C */  jal        OBTABLE_RelocateInstanceObject
/* 4B08C 8005A88C 21282002 */   addu      $a1, $s1, $zero
.L8005A890:
/* 4B090 8005A890 2400038E */  lw         $v1, 0x24($s0)
/* 4B094 8005A894 00000000 */  nop
/* 4B098 8005A898 2B107200 */  sltu       $v0, $v1, $s2
/* 4B09C 8005A89C 08004014 */  bnez       $v0, .L8005A8C0
/* 4B0A0 8005A8A0 21105402 */   addu      $v0, $s2, $s4
/* 4B0A4 8005A8A4 2B104300 */  sltu       $v0, $v0, $v1
/* 4B0A8 8005A8A8 05004014 */  bnez       $v0, .L8005A8C0
/* 4B0AC 8005A8AC 00000000 */   nop
/* 4B0B0 8005A8B0 02006010 */  beqz       $v1, .L8005A8BC
/* 4B0B4 8005A8B4 21100000 */   addu      $v0, $zero, $zero
/* 4B0B8 8005A8B8 21107100 */  addu       $v0, $v1, $s1
.L8005A8BC:
/* 4B0BC 8005A8BC 240002AE */  sw         $v0, 0x24($s0)
.L8005A8C0:
/* 4B0C0 8005A8C0 0800108E */  lw         $s0, 0x8($s0)
/* 4B0C4 8005A8C4 00000000 */  nop
/* 4B0C8 8005A8C8 C1FF0016 */  bnez       $s0, .L8005A7D0
/* 4B0CC 8005A8CC 00000000 */   nop
.L8005A8D0:
/* 4B0D0 8005A8D0 21206002 */  addu       $a0, $s3, $zero
.L8005A8D4:
/* 4B0D4 8005A8D4 51F9000C */  jal        OBTABLE_RelocateObjectTune
/* 4B0D8 8005A8D8 21282002 */   addu      $a1, $s1, $zero
/* 4B0DC 8005A8DC 2C00628E */  lw         $v0, 0x2C($s3)
/* 4B0E0 8005A8E0 0020033C */  lui        $v1, (0x20000000 >> 16)
/* 4B0E4 8005A8E4 24104300 */  and        $v0, $v0, $v1
/* 4B0E8 8005A8E8 04004010 */  beqz       $v0, .L8005A8FC
/* 4B0EC 8005A8EC 21204002 */   addu      $a0, $s2, $zero
/* 4B0F0 8005A8F0 21286002 */  addu       $a1, $s3, $zero
/* 4B0F4 8005A8F4 1313010C */  jal        FX_RelocateFXPointers
/* 4B0F8 8005A8F8 21308002 */   addu      $a2, $s4, $zero
.L8005A8FC:
/* 4B0FC 8005A8FC 2400BF8F */  lw         $ra, 0x24($sp)
/* 4B100 8005A900 2000B48F */  lw         $s4, 0x20($sp)
/* 4B104 8005A904 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4B108 8005A908 1800B28F */  lw         $s2, 0x18($sp)
/* 4B10C 8005A90C 1400B18F */  lw         $s1, 0x14($sp)
/* 4B110 8005A910 1000B08F */  lw         $s0, 0x10($sp)
/* 4B114 8005A914 0800E003 */  jr         $ra
/* 4B118 8005A918 2800BD27 */   addiu     $sp, $sp, 0x28
.size STREAM_UpdateObjectPointer, . - STREAM_UpdateObjectPointer
