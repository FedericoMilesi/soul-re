.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ApplyExternalLocalForces
/* 8AF58 8009A758 1000A88F */  lw         $t0, 0x10($sp)
/* 8AF5C 8009A75C 21480000 */  addu       $t1, $zero, $zero
/* 8AF60 8009A760 080000AD */  sw         $zero, 0x8($t0)
/* 8AF64 8009A764 040000AD */  sw         $zero, 0x4($t0)
/* 8AF68 8009A768 6300E018 */  blez       $a3, .L8009A8F8
/* 8AF6C 8009A76C 000000AD */   sw        $zero, 0x0($t0)
.L8009A770:
/* 8AF70 8009A770 1000C284 */  lh         $v0, 0x10($a2)
/* 8AF74 8009A774 00000000 */  nop
/* 8AF78 8009A778 5B004010 */  beqz       $v0, .L8009A8E8
/* 8AF7C 8009A77C 00000000 */   nop
/* 8AF80 8009A780 0000C38C */  lw         $v1, 0x0($a2)
/* 8AF84 8009A784 00000000 */  nop
/* 8AF88 8009A788 0A006014 */  bnez       $v1, .L8009A7B4
/* 8AF8C 8009A78C 00000000 */   nop
/* 8AF90 8009A790 0000028D */  lw         $v0, 0x0($t0)
/* 8AF94 8009A794 0400C38C */  lw         $v1, 0x4($a2)
/* 8AF98 8009A798 00000000 */  nop
/* 8AF9C 8009A79C 21104300 */  addu       $v0, $v0, $v1
/* 8AFA0 8009A7A0 000002AD */  sw         $v0, 0x0($t0)
/* 8AFA4 8009A7A4 0400028D */  lw         $v0, 0x4($t0)
/* 8AFA8 8009A7A8 0800C38C */  lw         $v1, 0x8($a2)
/* 8AFAC 8009A7AC F9690208 */  j          .L8009A7E4
/* 8AFB0 8009A7B0 23104300 */   subu      $v0, $v0, $v1
.L8009A7B4:
/* 8AFB4 8009A7B4 01000224 */  addiu      $v0, $zero, 0x1
/* 8AFB8 8009A7B8 10006214 */  bne        $v1, $v0, .L8009A7FC
/* 8AFBC 8009A7BC 00000000 */   nop
/* 8AFC0 8009A7C0 0000028D */  lw         $v0, 0x0($t0)
/* 8AFC4 8009A7C4 0400C38C */  lw         $v1, 0x4($a2)
/* 8AFC8 8009A7C8 00000000 */  nop
/* 8AFCC 8009A7CC 21104300 */  addu       $v0, $v0, $v1
/* 8AFD0 8009A7D0 000002AD */  sw         $v0, 0x0($t0)
/* 8AFD4 8009A7D4 0400028D */  lw         $v0, 0x4($t0)
/* 8AFD8 8009A7D8 0800C38C */  lw         $v1, 0x8($a2)
/* 8AFDC 8009A7DC 00000000 */  nop
/* 8AFE0 8009A7E0 21104300 */  addu       $v0, $v0, $v1
.L8009A7E4:
/* 8AFE4 8009A7E4 040002AD */  sw         $v0, 0x4($t0)
/* 8AFE8 8009A7E8 0800028D */  lw         $v0, 0x8($t0)
/* 8AFEC 8009A7EC 0C00C38C */  lw         $v1, 0xC($a2)
/* 8AFF0 8009A7F0 00000000 */  nop
/* 8AFF4 8009A7F4 21104300 */  addu       $v0, $v0, $v1
/* 8AFF8 8009A7F8 080002AD */  sw         $v0, 0x8($t0)
.L8009A7FC:
/* 8AFFC 8009A7FC 0000C38C */  lw         $v1, 0x0($a2)
/* 8B000 8009A800 02000224 */  addiu      $v0, $zero, 0x2
/* 8B004 8009A804 15006214 */  bne        $v1, $v0, .L8009A85C
/* 8B008 8009A808 00000000 */   nop
/* 8B00C 8009A80C 0000028D */  lw         $v0, 0x0($t0)
/* 8B010 8009A810 0400C38C */  lw         $v1, 0x4($a2)
/* 8B014 8009A814 00000000 */  nop
/* 8B018 8009A818 21104300 */  addu       $v0, $v0, $v1
/* 8B01C 8009A81C 000002AD */  sw         $v0, 0x0($t0)
/* 8B020 8009A820 0400028D */  lw         $v0, 0x4($t0)
/* 8B024 8009A824 0800C38C */  lw         $v1, 0x8($a2)
/* 8B028 8009A828 00000000 */  nop
/* 8B02C 8009A82C 23104300 */  subu       $v0, $v0, $v1
/* 8B030 8009A830 040002AD */  sw         $v0, 0x4($t0)
/* 8B034 8009A834 0800028D */  lw         $v0, 0x8($t0)
/* 8B038 8009A838 0C00C38C */  lw         $v1, 0xC($a2)
/* 8B03C 8009A83C 00000000 */  nop
/* 8B040 8009A840 21104300 */  addu       $v0, $v0, $v1
/* 8B044 8009A844 080002AD */  sw         $v0, 0x8($t0)
/* 8B048 8009A848 1000C294 */  lhu        $v0, 0x10($a2)
/* 8B04C 8009A84C 00000000 */  nop
/* 8B050 8009A850 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 8B054 8009A854 3A6A0208 */  j          .L8009A8E8
/* 8B058 8009A858 1000C2A4 */   sh        $v0, 0x10($a2)
.L8009A85C:
/* 8B05C 8009A85C 1000C584 */  lh         $a1, 0x10($a2)
/* 8B060 8009A860 0400C28C */  lw         $v0, 0x4($a2)
/* 8B064 8009A864 00000000 */  nop
/* 8B068 8009A868 18004500 */  mult       $v0, $a1
/* 8B06C 8009A86C 12180000 */  mflo       $v1
/* 8B070 8009A870 02006104 */  bgez       $v1, .L8009A87C
/* 8B074 8009A874 00000000 */   nop
/* 8B078 8009A878 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8009A87C:
/* 8B07C 8009A87C 0800C28C */  lw         $v0, 0x8($a2)
/* 8B080 8009A880 00000000 */  nop
/* 8B084 8009A884 18004500 */  mult       $v0, $a1
/* 8B088 8009A888 03130300 */  sra        $v0, $v1, 12
/* 8B08C 8009A88C 12200000 */  mflo       $a0
/* 8B090 8009A890 02008104 */  bgez       $a0, .L8009A89C
/* 8B094 8009A894 0400C2AC */   sw        $v0, 0x4($a2)
/* 8B098 8009A898 FF0F8424 */  addiu      $a0, $a0, 0xFFF
.L8009A89C:
/* 8B09C 8009A89C 0C00C28C */  lw         $v0, 0xC($a2)
/* 8B0A0 8009A8A0 00000000 */  nop
/* 8B0A4 8009A8A4 18004500 */  mult       $v0, $a1
/* 8B0A8 8009A8A8 03130400 */  sra        $v0, $a0, 12
/* 8B0AC 8009A8AC 12180000 */  mflo       $v1
/* 8B0B0 8009A8B0 02006104 */  bgez       $v1, .L8009A8BC
/* 8B0B4 8009A8B4 0800C2AC */   sw        $v0, 0x8($a2)
/* 8B0B8 8009A8B8 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8009A8BC:
/* 8B0BC 8009A8BC 0400C28C */  lw         $v0, 0x4($a2)
/* 8B0C0 8009A8C0 031B0300 */  sra        $v1, $v1, 12
/* 8B0C4 8009A8C4 08004014 */  bnez       $v0, .L8009A8E8
/* 8B0C8 8009A8C8 0C00C3AC */   sw        $v1, 0xC($a2)
/* 8B0CC 8009A8CC 0800C28C */  lw         $v0, 0x8($a2)
/* 8B0D0 8009A8D0 00000000 */  nop
/* 8B0D4 8009A8D4 04004014 */  bnez       $v0, .L8009A8E8
/* 8B0D8 8009A8D8 00000000 */   nop
/* 8B0DC 8009A8DC 02006014 */  bnez       $v1, .L8009A8E8
/* 8B0E0 8009A8E0 00000000 */   nop
/* 8B0E4 8009A8E4 1000C0A4 */  sh         $zero, 0x10($a2)
.L8009A8E8:
/* 8B0E8 8009A8E8 01002925 */  addiu      $t1, $t1, 0x1
/* 8B0EC 8009A8EC 2A102701 */  slt        $v0, $t1, $a3
/* 8B0F0 8009A8F0 9FFF4014 */  bnez       $v0, .L8009A770
/* 8B0F4 8009A8F4 1400C624 */   addiu     $a2, $a2, 0x14
.L8009A8F8:
/* 8B0F8 8009A8F8 0400028D */  lw         $v0, 0x4($t0)
/* 8B0FC 8009A8FC 00000000 */  nop
/* 8B100 8009A900 23100200 */  negu       $v0, $v0
/* 8B104 8009A904 0800E003 */  jr         $ra
/* 8B108 8009A908 040002AD */   sw        $v0, 0x4($t0)
.size ApplyExternalLocalForces, . - ApplyExternalLocalForces
