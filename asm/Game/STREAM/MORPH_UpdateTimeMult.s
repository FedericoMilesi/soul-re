.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_UpdateTimeMult
/* 4D09C 8005C89C E8030224 */  addiu      $v0, $zero, 0x3E8
/* 4D0A0 8005C8A0 D0BD8487 */  lh         $a0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4D0A4 8005C8A4 D0BD8397 */  lhu        $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4D0A8 8005C8A8 4B008210 */  beq        $a0, $v0, .L8005C9D8
/* 4D0AC 8005C8AC 00000000 */   nop
/* 4D0B0 8005C8B0 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4D0B4 8005C8B4 00000000 */  nop
/* 4D0B8 8005C8B8 07004010 */  beqz       $v0, .L8005C8D8
/* 4D0BC 8005C8BC 12FD6224 */   addiu     $v0, $v1, -0x2EE
/* 4D0C0 8005C8C0 21184000 */  addu       $v1, $v0, $zero
/* 4D0C4 8005C8C4 00140200 */  sll        $v0, $v0, 16
/* 4D0C8 8005C8C8 09004104 */  bgez       $v0, .L8005C8F0
/* 4D0CC 8005C8CC 6210023C */   lui       $v0, (0x10624DD3 >> 16)
/* 4D0D0 8005C8D0 3C720108 */  j          .L8005C8F0
/* 4D0D4 8005C8D4 21180000 */   addu      $v1, $zero, $zero
.L8005C8D8:
/* 4D0D8 8005C8D8 FB008228 */  slti       $v0, $a0, 0xFB
/* 4D0DC 8005C8DC 02004014 */  bnez       $v0, .L8005C8E8
/* 4D0E0 8005C8E0 FA000224 */   addiu     $v0, $zero, 0xFA
/* 4D0E4 8005C8E4 FA000324 */  addiu      $v1, $zero, 0xFA
.L8005C8E8:
/* 4D0E8 8005C8E8 23184300 */  subu       $v1, $v0, $v1
/* 4D0EC 8005C8EC 6210023C */  lui        $v0, (0x10624DD3 >> 16)
.L8005C8F0:
/* 4D0F0 8005C8F0 D34D4234 */  ori        $v0, $v0, (0x10624DD3 & 0xFFFF)
/* 4D0F4 8005C8F4 001C0300 */  sll        $v1, $v1, 16
/* 4D0F8 8005C8F8 03190300 */  sra        $v1, $v1, 4
/* 4D0FC 8005C8FC 18006200 */  mult       $v1, $v0
/* 4D100 8005C900 C31F0300 */  sra        $v1, $v1, 31
/* 4D104 8005C904 10100000 */  mfhi       $v0
/* 4D108 8005C908 03110200 */  sra        $v0, $v0, 4
/* 4D10C 8005C90C 23104300 */  subu       $v0, $v0, $v1
/* 4D110 8005C910 00140200 */  sll        $v0, $v0, 16
/* 4D114 8005C914 0CC0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x244)($gp)
/* 4D118 8005C918 03140200 */  sra        $v0, $v0, 16
/* 4D11C 8005C91C 18006200 */  mult       $v1, $v0
/* 4D120 8005C920 12100000 */  mflo       $v0
/* 4D124 8005C924 00110200 */  sll        $v0, $v0, 4
/* 4D128 8005C928 03140200 */  sra        $v0, $v0, 16
/* 4D12C 8005C92C 14C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x24C)($gp)
/* 4D130 8005C930 02004014 */  bnez       $v0, .L8005C93C
/* 4D134 8005C934 01000224 */   addiu     $v0, $zero, 0x1
/* 4D138 8005C938 14C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x24C)($gp)
.L8005C93C:
/* 4D13C 8005C93C D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4D140 8005C940 D0BD8397 */  lhu        $v1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4D144 8005C944 08004014 */  bnez       $v0, .L8005C968
/* 4D148 8005C948 00140300 */   sll       $v0, $v1, 16
/* 4D14C 8005C94C 12FD6224 */  addiu      $v0, $v1, -0x2EE
/* 4D150 8005C950 21184000 */  addu       $v1, $v0, $zero
/* 4D154 8005C954 00140200 */  sll        $v0, $v0, 16
/* 4D158 8005C958 0A004104 */  bgez       $v0, .L8005C984
/* 4D15C 8005C95C 6210023C */   lui       $v0, (0x10624DD3 >> 16)
/* 4D160 8005C960 61720108 */  j          .L8005C984
/* 4D164 8005C964 21180000 */   addu      $v1, $zero, $zero
.L8005C968:
/* 4D168 8005C968 03140200 */  sra        $v0, $v0, 16
/* 4D16C 8005C96C FB004228 */  slti       $v0, $v0, 0xFB
/* 4D170 8005C970 02004014 */  bnez       $v0, .L8005C97C
/* 4D174 8005C974 FA000224 */   addiu     $v0, $zero, 0xFA
/* 4D178 8005C978 FA000324 */  addiu      $v1, $zero, 0xFA
.L8005C97C:
/* 4D17C 8005C97C 23184300 */  subu       $v1, $v0, $v1
/* 4D180 8005C980 6210023C */  lui        $v0, (0x10624DD3 >> 16)
.L8005C984:
/* 4D184 8005C984 D34D4234 */  ori        $v0, $v0, (0x10624DD3 & 0xFFFF)
/* 4D188 8005C988 001C0300 */  sll        $v1, $v1, 16
/* 4D18C 8005C98C 03190300 */  sra        $v1, $v1, 4
/* 4D190 8005C990 18006200 */  mult       $v1, $v0
/* 4D194 8005C994 C31F0300 */  sra        $v1, $v1, 31
/* 4D198 8005C998 10100000 */  mfhi       $v0
/* 4D19C 8005C99C 03110200 */  sra        $v0, $v0, 4
/* 4D1A0 8005C9A0 23104300 */  subu       $v0, $v0, $v1
/* 4D1A4 8005C9A4 00140200 */  sll        $v0, $v0, 16
/* 4D1A8 8005C9A8 0CC0838F */  lw         $v1, %gp_rel(gameTrackerX + 0x244)($gp)
/* 4D1AC 8005C9AC 03140200 */  sra        $v0, $v0, 16
/* 4D1B0 8005C9B0 18006200 */  mult       $v1, $v0
/* 4D1B4 8005C9B4 12100000 */  mflo       $v0
/* 4D1B8 8005C9B8 00110200 */  sll        $v0, $v0, 4
/* 4D1BC 8005C9BC 03140200 */  sra        $v0, $v0, 16
/* 4D1C0 8005C9C0 10C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x248)($gp)
/* 4D1C4 8005C9C4 02004014 */  bnez       $v0, .L8005C9D0
/* 4D1C8 8005C9C8 01000224 */   addiu     $v0, $zero, 0x1
/* 4D1CC 8005C9CC 10C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x248)($gp)
.L8005C9D0:
/* 4D1D0 8005C9D0 0800E003 */  jr         $ra
/* 4D1D4 8005C9D4 00000000 */   nop
.L8005C9D8:
/* 4D1D8 8005C9D8 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4D1DC 8005C9DC 00000000 */  nop
/* 4D1E0 8005C9E0 06004014 */  bnez       $v0, .L8005C9FC
/* 4D1E4 8005C9E4 00000000 */   nop
/* 4D1E8 8005C9E8 0CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x244)($gp)
/* 4D1EC 8005C9EC 10C080AF */  sw         $zero, %gp_rel(gameTrackerX + 0x248)($gp)
/* 4D1F0 8005C9F0 14C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x24C)($gp)
/* 4D1F4 8005C9F4 0800E003 */  jr         $ra
/* 4D1F8 8005C9F8 00000000 */   nop
.L8005C9FC:
/* 4D1FC 8005C9FC 0CC0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x244)($gp)
/* 4D200 8005CA00 14C080AF */  sw         $zero, %gp_rel(gameTrackerX + 0x24C)($gp)
/* 4D204 8005CA04 10C082AF */  sw         $v0, %gp_rel(gameTrackerX + 0x248)($gp)
/* 4D208 8005CA08 0800E003 */  jr         $ra
/* 4D20C 8005CA0C 00000000 */   nop
.size MORPH_UpdateTimeMult, . - MORPH_UpdateTimeMult
