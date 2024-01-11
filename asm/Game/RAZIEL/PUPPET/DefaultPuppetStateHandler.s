.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DefaultPuppetStateHandler
/* 8B750 8009AF50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8B754 8009AF54 1400B1AF */  sw         $s1, 0x14($sp)
/* 8B758 8009AF58 21888000 */  addu       $s1, $a0, $zero
/* 8B75C 8009AF5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 8B760 8009AF60 2180A000 */  addu       $s0, $a1, $zero
/* 8B764 8009AF64 1800B2AF */  sw         $s2, 0x18($sp)
/* 8B768 8009AF68 2190C000 */  addu       $s2, $a2, $zero
/* 8B76C 8009AF6C C0201000 */  sll        $a0, $s0, 3
/* 8B770 8009AF70 21209000 */  addu       $a0, $a0, $s0
/* 8B774 8009AF74 C0200400 */  sll        $a0, $a0, 3
/* 8B778 8009AF78 23209000 */  subu       $a0, $a0, $s0
/* 8B77C 8009AF7C 80200400 */  sll        $a0, $a0, 2
/* 8B780 8009AF80 21209100 */  addu       $a0, $a0, $s1
/* 8B784 8009AF84 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8B788 8009AF88 39C3010C */  jal        PeekMessageQueue
/* 8B78C 8009AF8C 0C008424 */   addiu     $a0, $a0, 0xC
/* 8B790 8009AF90 21284000 */  addu       $a1, $v0, $zero
/* 8B794 8009AF94 9500A010 */  beqz       $a1, .L8009B1EC
/* 8B798 8009AF98 0400023C */   lui       $v0, (0x40020 >> 16)
/* 8B79C 8009AF9C 0000A38C */  lw         $v1, 0x0($a1)
/* 8B7A0 8009AFA0 20004234 */  ori        $v0, $v0, (0x40020 & 0xFFFF)
/* 8B7A4 8009AFA4 71006210 */  beq        $v1, $v0, .L8009B16C
/* 8B7A8 8009AFA8 2A104300 */   slt       $v0, $v0, $v1
/* 8B7AC 8009AFAC 25004014 */  bnez       $v0, .L8009B044
/* 8B7B0 8009AFB0 0001023C */   lui       $v0, (0x1000001 >> 16)
/* 8B7B4 8009AFB4 0080023C */  lui        $v0, (0x80000020 >> 16)
/* 8B7B8 8009AFB8 20004234 */  ori        $v0, $v0, (0x80000020 & 0xFFFF)
/* 8B7BC 8009AFBC 8B006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B7C0 8009AFC0 2A104300 */   slt       $v0, $v0, $v1
/* 8B7C4 8009AFC4 10004014 */  bnez       $v0, .L8009B008
/* 8B7C8 8009AFC8 0400023C */   lui       $v0, (0x4000B >> 16)
/* 8B7CC 8009AFCC 0080023C */  lui        $v0, (0x80000008 >> 16)
/* 8B7D0 8009AFD0 08004234 */  ori        $v0, $v0, (0x80000008 & 0xFFFF)
/* 8B7D4 8009AFD4 85006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B7D8 8009AFD8 2A104300 */   slt       $v0, $v0, $v1
/* 8B7DC 8009AFDC 05004014 */  bnez       $v0, .L8009AFF4
/* 8B7E0 8009AFE0 0080023C */   lui       $v0, (0x80000010 >> 16)
/* 8B7E4 8009AFE4 81006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B7E8 8009AFE8 21202002 */   addu      $a0, $s1, $zero
/* 8B7EC 8009AFEC 796C0208 */  j          .L8009B1E4
/* 8B7F0 8009AFF0 21280002 */   addu      $a1, $s0, $zero
.L8009AFF4:
/* 8B7F4 8009AFF4 10004234 */  ori        $v0, $v0, (0x80000010 & 0xFFFF)
/* 8B7F8 8009AFF8 7C006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B7FC 8009AFFC 21202002 */   addu      $a0, $s1, $zero
/* 8B800 8009B000 796C0208 */  j          .L8009B1E4
/* 8B804 8009B004 21280002 */   addu      $a1, $s0, $zero
.L8009B008:
/* 8B808 8009B008 0B004234 */  ori        $v0, $v0, (0x4000B & 0xFFFF)
/* 8B80C 8009B00C 40006210 */  beq        $v1, $v0, .L8009B110
/* 8B810 8009B010 2A104300 */   slt       $v0, $v0, $v1
/* 8B814 8009B014 06004014 */  bnez       $v0, .L8009B030
/* 8B818 8009B018 0400023C */   lui       $v0, (0x4000A >> 16)
/* 8B81C 8009B01C 0A004234 */  ori        $v0, $v0, (0x4000A & 0xFFFF)
/* 8B820 8009B020 35006210 */  beq        $v1, $v0, .L8009B0F8
/* 8B824 8009B024 21202002 */   addu      $a0, $s1, $zero
/* 8B828 8009B028 796C0208 */  j          .L8009B1E4
/* 8B82C 8009B02C 21280002 */   addu      $a1, $s0, $zero
.L8009B030:
/* 8B830 8009B030 0F004234 */  ori        $v0, $v0, (0x4000F & 0xFFFF)
/* 8B834 8009B034 3D006210 */  beq        $v1, $v0, .L8009B12C
/* 8B838 8009B038 21202002 */   addu      $a0, $s1, $zero
/* 8B83C 8009B03C 796C0208 */  j          .L8009B1E4
/* 8B840 8009B040 21280002 */   addu      $a1, $s0, $zero
.L8009B044:
/* 8B844 8009B044 01004234 */  ori        $v0, $v0, (0x1000001 & 0xFFFF)
/* 8B848 8009B048 68006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B84C 8009B04C 2A104300 */   slt       $v0, $v0, $v1
/* 8B850 8009B050 12004014 */  bnez       $v0, .L8009B09C
/* 8B854 8009B054 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 8B858 8009B058 1000023C */  lui        $v0, (0x100009 >> 16)
/* 8B85C 8009B05C 09004234 */  ori        $v0, $v0, (0x100009 & 0xFFFF)
/* 8B860 8009B060 62006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B864 8009B064 2A104300 */   slt       $v0, $v0, $v1
/* 8B868 8009B068 07004014 */  bnez       $v0, .L8009B088
/* 8B86C 8009B06C 8000023C */   lui       $v0, (0x800027 >> 16)
/* 8B870 8009B070 1000023C */  lui        $v0, (0x100004 >> 16)
/* 8B874 8009B074 04004234 */  ori        $v0, $v0, (0x100004 & 0xFFFF)
/* 8B878 8009B078 1A006210 */  beq        $v1, $v0, .L8009B0E4
/* 8B87C 8009B07C 21202002 */   addu      $a0, $s1, $zero
/* 8B880 8009B080 796C0208 */  j          .L8009B1E4
/* 8B884 8009B084 21280002 */   addu      $a1, $s0, $zero
.L8009B088:
/* 8B888 8009B088 27004234 */  ori        $v0, $v0, (0x800027 & 0xFFFF)
/* 8B88C 8009B08C 3F006210 */  beq        $v1, $v0, .L8009B18C
/* 8B890 8009B090 21202002 */   addu      $a0, $s1, $zero
/* 8B894 8009B094 796C0208 */  j          .L8009B1E4
/* 8B898 8009B098 21280002 */   addu      $a1, $s0, $zero
.L8009B09C:
/* 8B89C 8009B09C 53006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B8A0 8009B0A0 2A104300 */   slt       $v0, $v0, $v1
/* 8B8A4 8009B0A4 07004014 */  bnez       $v0, .L8009B0C4
/* 8B8A8 8009B0A8 0010023C */   lui       $v0, (0x10002001 >> 16)
/* 8B8AC 8009B0AC 0104023C */  lui        $v0, (0x4010200 >> 16)
/* 8B8B0 8009B0B0 00024234 */  ori        $v0, $v0, (0x4010200 & 0xFFFF)
/* 8B8B4 8009B0B4 4D006210 */  beq        $v1, $v0, .L8009B1EC
/* 8B8B8 8009B0B8 21202002 */   addu      $a0, $s1, $zero
/* 8B8BC 8009B0BC 796C0208 */  j          .L8009B1E4
/* 8B8C0 8009B0C0 21280002 */   addu      $a1, $s0, $zero
.L8009B0C4:
/* 8B8C4 8009B0C4 01204234 */  ori        $v0, $v0, (0x10002001 & 0xFFFF)
/* 8B8C8 8009B0C8 42006210 */  beq        $v1, $v0, .L8009B1D4
/* 8B8CC 8009B0CC 0010023C */   lui       $v0, (0x10002002 >> 16)
/* 8B8D0 8009B0D0 02204234 */  ori        $v0, $v0, (0x10002002 & 0xFFFF)
/* 8B8D4 8009B0D4 3B006210 */  beq        $v1, $v0, .L8009B1C4
/* 8B8D8 8009B0D8 21202002 */   addu      $a0, $s1, $zero
/* 8B8DC 8009B0DC 796C0208 */  j          .L8009B1E4
/* 8B8E0 8009B0E0 21280002 */   addu      $a1, $s0, $zero
.L8009B0E4:
/* 8B8E4 8009B0E4 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 8B8E8 8009B0E8 139B020C */  jal        razResetMotion
/* 8B8EC 8009B0EC 00000000 */   nop
/* 8B8F0 8009B0F0 7B6C0208 */  j          .L8009B1EC
/* 8B8F4 8009B0F4 00000000 */   nop
.L8009B0F8:
/* 8B8F8 8009B0F8 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 8B8FC 8009B0FC 0400A58C */  lw         $a1, 0x4($a1)
/* 8B900 8009B100 E270010C */  jal        STREAM_SetInstancePosition
/* 8B904 8009B104 00000000 */   nop
/* 8B908 8009B108 7B6C0208 */  j          .L8009B1EC
/* 8B90C 8009B10C 00000000 */   nop
.L8009B110:
/* 8B910 8009B110 36000016 */  bnez       $s0, .L8009B1EC
/* 8B914 8009B114 00000000 */   nop
/* 8B918 8009B118 0400A28C */  lw         $v0, 0x4($a1)
/* 8B91C 8009B11C F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 8B920 8009B120 04004294 */  lhu        $v0, 0x4($v0)
/* 8B924 8009B124 7B6C0208 */  j          .L8009B1EC
/* 8B928 8009B128 780062A4 */   sh        $v0, 0x78($v1)
.L8009B12C:
/* 8B92C 8009B12C 0400A38C */  lw         $v1, 0x4($a1)
/* 8B930 8009B130 CCF9828F */  lw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 8B934 8009B134 00006484 */  lh         $a0, 0x0($v1)
/* 8B938 8009B138 02006684 */  lh         $a2, 0x2($v1)
/* 8B93C 8009B13C 04006584 */  lh         $a1, 0x4($v1)
/* 8B940 8009B140 10004234 */  ori        $v0, $v0, 0x10
/* 8B944 8009B144 CCF982AF */  sw         $v0, %gp_rel(Raziel + 0x39C)($gp)
/* 8B948 8009B148 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B94C 8009B14C 0200033C */  lui        $v1, (0x20000 >> 16)
/* 8B950 8009B150 25104300 */  or         $v0, $v0, $v1
/* 8B954 8009B154 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B958 8009B158 10FA8227 */  addiu      $v0, $gp, %gp_rel(Raziel + 0x3E0)
/* 8B95C 8009B15C 10FA84AF */  sw         $a0, %gp_rel(Raziel + 0x3E0)($gp)
/* 8B960 8009B160 040046AC */  sw         $a2, 0x4($v0)
/* 8B964 8009B164 7B6C0208 */  j          .L8009B1EC
/* 8B968 8009B168 080045AC */   sw        $a1, 0x8($v0)
.L8009B16C:
/* 8B96C 8009B16C 1F000016 */  bnez       $s0, .L8009B1EC
/* 8B970 8009B170 00000000 */   nop
/* 8B974 8009B174 F4BD848F */  lw         $a0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 8B978 8009B178 0400A58C */  lw         $a1, 0x4($a1)
/* 8B97C 8009B17C 8E3F020C */  jal        G2Anim_SetSpeedAdjustment
/* 8B980 8009B180 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 8B984 8009B184 7B6C0208 */  j          .L8009B1EC
/* 8B988 8009B188 00000000 */   nop
.L8009B18C:
/* 8B98C 8009B18C 07004012 */  beqz       $s2, .L8009B1AC
/* 8B990 8009B190 F7FF0324 */   addiu     $v1, $zero, -0x9
/* 8B994 8009B194 C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B998 8009B198 00000000 */  nop
/* 8B99C 8009B19C 08004234 */  ori        $v0, $v0, 0x8
/* 8B9A0 8009B1A0 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B9A4 8009B1A4 7B6C0208 */  j          .L8009B1EC
/* 8B9A8 8009B1A8 00000000 */   nop
.L8009B1AC:
/* 8B9AC 8009B1AC C8FD828F */  lw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B9B0 8009B1B0 00000000 */  nop
/* 8B9B4 8009B1B4 24104300 */  and        $v0, $v0, $v1
/* 8B9B8 8009B1B8 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 8B9BC 8009B1BC 7B6C0208 */  j          .L8009B1EC
/* 8B9C0 8009B1C0 00000000 */   nop
.L8009B1C4:
/* 8B9C4 8009B1C4 E395020C */  jal        razMaterialShift
/* 8B9C8 8009B1C8 00000000 */   nop
/* 8B9CC 8009B1CC 7B6C0208 */  j          .L8009B1EC
/* 8B9D0 8009B1D0 00000000 */   nop
.L8009B1D4:
/* 8B9D4 8009B1D4 9F95020C */  jal        razSpectralShift
/* 8B9D8 8009B1D8 00000000 */   nop
/* 8B9DC 8009B1DC 7B6C0208 */  j          .L8009B1EC
/* 8B9E0 8009B1E0 00000000 */   nop
.L8009B1E4:
/* 8B9E4 8009B1E4 B9BF020C */  jal        DefaultStateHandler
/* 8B9E8 8009B1E8 21304002 */   addu      $a2, $s2, $zero
.L8009B1EC:
/* 8B9EC 8009B1EC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 8B9F0 8009B1F0 1800B28F */  lw         $s2, 0x18($sp)
/* 8B9F4 8009B1F4 1400B18F */  lw         $s1, 0x14($sp)
/* 8B9F8 8009B1F8 1000B08F */  lw         $s0, 0x10($sp)
/* 8B9FC 8009B1FC 0800E003 */  jr         $ra
/* 8BA00 8009B200 2000BD27 */   addiu     $sp, $sp, 0x20
.size DefaultPuppetStateHandler, . - DefaultPuppetStateHandler
