.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_Instance
/* A68AC 800B60AC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A68B0 800B60B0 1400B1AF */  sw         $s1, 0x14($sp)
/* A68B4 800B60B4 21888000 */  addu       $s1, $a0, $zero
/* A68B8 800B60B8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A68BC 800B60BC 2198A000 */  addu       $s3, $a1, $zero
/* A68C0 800B60C0 1800B2AF */  sw         $s2, 0x18($sp)
/* A68C4 800B60C4 21900000 */  addu       $s2, $zero, $zero
/* A68C8 800B60C8 2000BFAF */  sw         $ra, 0x20($sp)
/* A68CC 800B60CC 50D5020C */  jal        SAVE_SaveableInstance
/* A68D0 800B60D0 1000B0AF */   sw        $s0, 0x10($sp)
/* A68D4 800B60D4 21184000 */  addu       $v1, $v0, $zero
/* A68D8 800B60D8 7A006010 */  beqz       $v1, .L800B62C4
/* A68DC 800B60DC 00000000 */   nop
/* A68E0 800B60E0 1800228E */  lw         $v0, 0x18($s1)
/* A68E4 800B60E4 00000000 */  nop
/* A68E8 800B60E8 04004230 */  andi       $v0, $v0, 0x4
/* A68EC 800B60EC 18004010 */  beqz       $v0, .L800B6150
/* A68F0 800B60F0 01000224 */   addiu     $v0, $zero, 0x1
/* A68F4 800B60F4 B8D8020C */  jal        SAVE_DeleteInstance
/* A68F8 800B60F8 21202002 */   addu      $a0, $s1, $zero
/* A68FC 800B60FC 21202002 */  addu       $a0, $s1, $zero
/* A6900 800B6100 92D1000C */  jal        INSTANCE_Query
/* A6904 800B6104 18000524 */   addiu     $a1, $zero, 0x18
/* A6908 800B6108 21804000 */  addu       $s0, $v0, $zero
/* A690C 800B610C 6D000012 */  beqz       $s0, .L800B62C4
/* A6910 800B6110 00000000 */   nop
/* A6914 800B6114 0000058E */  lw         $a1, 0x0($s0)
/* A6918 800B6118 E1D4020C */  jal        SAVE_GetSavedBlock
/* A691C 800B611C 05000424 */   addiu     $a0, $zero, 0x5
/* A6920 800B6120 21204000 */  addu       $a0, $v0, $zero
/* A6924 800B6124 67008010 */  beqz       $a0, .L800B62C4
/* A6928 800B6128 00000000 */   nop
/* A692C 800B612C 3C002296 */  lhu        $v0, 0x3C($s1)
/* A6930 800B6130 00000000 */  nop
/* A6934 800B6134 020082A4 */  sh         $v0, 0x2($a0)
/* A6938 800B6138 0400058E */  lw         $a1, 0x4($s0)
/* A693C 800B613C 0000068E */  lw         $a2, 0x0($s0)
/* A6940 800B6140 02E5010C */  jal        memcpy
/* A6944 800B6144 04008424 */   addiu     $a0, $a0, 0x4
/* A6948 800B6148 B1D80208 */  j          .L800B62C4
/* A694C 800B614C 00000000 */   nop
.L800B6150:
/* A6950 800B6150 14006214 */  bne        $v1, $v0, .L800B61A4
/* A6954 800B6154 02000224 */   addiu     $v0, $zero, 0x2
/* A6958 800B6158 B8D8020C */  jal        SAVE_DeleteInstance
/* A695C 800B615C 21202002 */   addu      $a0, $s1, $zero
/* A6960 800B6160 21202002 */  addu       $a0, $s1, $zero
/* A6964 800B6164 92D1000C */  jal        INSTANCE_Query
/* A6968 800B6168 18000524 */   addiu     $a1, $zero, 0x18
/* A696C 800B616C 21804000 */  addu       $s0, $v0, $zero
/* A6970 800B6170 02000012 */  beqz       $s0, .L800B617C
/* A6974 800B6174 01000424 */   addiu     $a0, $zero, 0x1
/* A6978 800B6178 0000128E */  lw         $s2, 0x0($s0)
.L800B617C:
/* A697C 800B617C E1D4020C */  jal        SAVE_GetSavedBlock
/* A6980 800B6180 21284002 */   addu      $a1, $s2, $zero
/* A6984 800B6184 4F004010 */  beqz       $v0, .L800B62C4
/* A6988 800B6188 21202002 */   addu      $a0, $s1, $zero
/* A698C 800B618C 21286002 */  addu       $a1, $s3, $zero
/* A6990 800B6190 21304000 */  addu       $a2, $v0, $zero
/* A6994 800B6194 8BD5020C */  jal        SAVE_UpdateSavedIntro
/* A6998 800B6198 21380002 */   addu      $a3, $s0, $zero
/* A699C 800B619C B1D80208 */  j          .L800B62C4
/* A69A0 800B61A0 00000000 */   nop
.L800B61A4:
/* A69A4 800B61A4 14006214 */  bne        $v1, $v0, .L800B61F8
/* A69A8 800B61A8 03000224 */   addiu     $v0, $zero, 0x3
/* A69AC 800B61AC B8D8020C */  jal        SAVE_DeleteInstance
/* A69B0 800B61B0 21202002 */   addu      $a0, $s1, $zero
/* A69B4 800B61B4 21202002 */  addu       $a0, $s1, $zero
/* A69B8 800B61B8 92D1000C */  jal        INSTANCE_Query
/* A69BC 800B61BC 18000524 */   addiu     $a1, $zero, 0x18
/* A69C0 800B61C0 21804000 */  addu       $s0, $v0, $zero
/* A69C4 800B61C4 02000012 */  beqz       $s0, .L800B61D0
/* A69C8 800B61C8 07000424 */   addiu     $a0, $zero, 0x7
/* A69CC 800B61CC 0000128E */  lw         $s2, 0x0($s0)
.L800B61D0:
/* A69D0 800B61D0 E1D4020C */  jal        SAVE_GetSavedBlock
/* A69D4 800B61D4 21284002 */   addu      $a1, $s2, $zero
/* A69D8 800B61D8 3A004010 */  beqz       $v0, .L800B62C4
/* A69DC 800B61DC 21202002 */   addu      $a0, $s1, $zero
/* A69E0 800B61E0 21286002 */  addu       $a1, $s3, $zero
/* A69E4 800B61E4 21304000 */  addu       $a2, $v0, $zero
/* A69E8 800B61E8 CED5020C */  jal        SAVE_UpdateSavedIntroWithIntro
/* A69EC 800B61EC 21380002 */   addu      $a3, $s0, $zero
/* A69F0 800B61F0 B1D80208 */  j          .L800B62C4
/* A69F4 800B61F4 00000000 */   nop
.L800B61F8:
/* A69F8 800B61F8 32006214 */  bne        $v1, $v0, .L800B62C4
/* A69FC 800B61FC 00000000 */   nop
/* A6A00 800B6200 B8D8020C */  jal        SAVE_DeleteInstance
/* A6A04 800B6204 21202002 */   addu      $a0, $s1, $zero
/* A6A08 800B6208 08000424 */  addiu      $a0, $zero, 0x8
/* A6A0C 800B620C E1D4020C */  jal        SAVE_GetSavedBlock
/* A6A10 800B6210 21280000 */   addu      $a1, $zero, $zero
/* A6A14 800B6214 21804000 */  addu       $s0, $v0, $zero
/* A6A18 800B6218 2A000012 */  beqz       $s0, .L800B62C4
/* A6A1C 800B621C 21202002 */   addu      $a0, $s1, $zero
/* A6A20 800B6220 21280000 */  addu       $a1, $zero, $zero
/* A6A24 800B6224 6BF4000C */  jal        SCRIPT_GetMultiSpline
/* A6A28 800B6228 2130A000 */   addu      $a2, $a1, $zero
/* A6A2C 800B622C 21284000 */  addu       $a1, $v0, $zero
/* A6A30 800B6230 2400A010 */  beqz       $a1, .L800B62C4
/* A6A34 800B6234 0001033C */   lui       $v1, (0x1000000 >> 16)
/* A6A38 800B6238 80022296 */  lhu        $v0, 0x280($s1)
/* A6A3C 800B623C 00000000 */  nop
/* A6A40 800B6240 7FFE4430 */  andi       $a0, $v0, 0xFE7F
/* A6A44 800B6244 1400228E */  lw         $v0, 0x14($s1)
/* A6A48 800B6248 00000000 */  nop
/* A6A4C 800B624C 24104300 */  and        $v0, $v0, $v1
/* A6A50 800B6250 03004010 */  beqz       $v0, .L800B6260
/* A6A54 800B6254 800224A6 */   sh        $a0, 0x280($s1)
/* A6A58 800B6258 80008234 */  ori        $v0, $a0, 0x80
/* A6A5C 800B625C 800222A6 */  sh         $v0, 0x280($s1)
.L800B6260:
/* A6A60 800B6260 1400228E */  lw         $v0, 0x14($s1)
/* A6A64 800B6264 0002033C */  lui        $v1, (0x2000000 >> 16)
/* A6A68 800B6268 24104300 */  and        $v0, $v0, $v1
/* A6A6C 800B626C 06004010 */  beqz       $v0, .L800B6288
/* A6A70 800B6270 08000224 */   addiu     $v0, $zero, 0x8
/* A6A74 800B6274 80022296 */  lhu        $v0, 0x280($s1)
/* A6A78 800B6278 00000000 */  nop
/* A6A7C 800B627C 00014234 */  ori        $v0, $v0, 0x100
/* A6A80 800B6280 800222A6 */  sh         $v0, 0x280($s1)
/* A6A84 800B6284 08000224 */  addiu      $v0, $zero, 0x8
.L800B6288:
/* A6A88 800B6288 000002A2 */  sb         $v0, 0x0($s0)
/* A6A8C 800B628C 3C002296 */  lhu        $v0, 0x3C($s1)
/* A6A90 800B6290 00000000 */  nop
/* A6A94 800B6294 020002A6 */  sh         $v0, 0x2($s0)
/* A6A98 800B6298 80022296 */  lhu        $v0, 0x280($s1)
/* A6A9C 800B629C 21202002 */  addu       $a0, $s1, $zero
/* A6AA0 800B62A0 7CCD000C */  jal        INSTANCE_GetSplineFrameNumber
/* A6AA4 800B62A4 040002A6 */   sh        $v0, 0x4($s0)
/* A6AA8 800B62A8 060002A6 */  sh         $v0, 0x6($s0)
/* A6AAC 800B62AC 84022296 */  lhu        $v0, 0x284($s1)
/* A6AB0 800B62B0 00000000 */  nop
/* A6AB4 800B62B4 080002A6 */  sh         $v0, 0x8($s0)
/* A6AB8 800B62B8 86022296 */  lhu        $v0, 0x286($s1)
/* A6ABC 800B62BC 00000000 */  nop
/* A6AC0 800B62C0 0A0002A6 */  sh         $v0, 0xA($s0)
.L800B62C4:
/* A6AC4 800B62C4 2000BF8F */  lw         $ra, 0x20($sp)
/* A6AC8 800B62C8 1C00B38F */  lw         $s3, 0x1C($sp)
/* A6ACC 800B62CC 1800B28F */  lw         $s2, 0x18($sp)
/* A6AD0 800B62D0 1400B18F */  lw         $s1, 0x14($sp)
/* A6AD4 800B62D4 1000B08F */  lw         $s0, 0x10($sp)
/* A6AD8 800B62D8 0800E003 */  jr         $ra
/* A6ADC 800B62DC 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_Instance, . - SAVE_Instance
