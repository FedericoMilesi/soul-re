.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C5274
/* B5A74 800C5274 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B5A78 800C5278 2000B2AF */  sw         $s2, 0x20($sp)
/* B5A7C 800C527C 21908000 */  addu       $s2, $a0, $zero
/* B5A80 800C5280 FFFF0424 */  addiu      $a0, $zero, -0x1
/* B5A84 800C5284 2C00BFAF */  sw         $ra, 0x2C($sp)
/* B5A88 800C5288 2800B4AF */  sw         $s4, 0x28($sp)
/* B5A8C 800C528C 2400B3AF */  sw         $s3, 0x24($sp)
/* B5A90 800C5290 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B5A94 800C5294 5EF2020C */  jal        func_800BC978
/* B5A98 800C5298 1800B0AF */   sw        $s0, 0x18($sp)
/* B5A9C 800C529C 3C00143C */  lui        $s4, (0x3C0000 >> 16)
/* B5AA0 800C52A0 0D80133C */  lui        $s3, %hi(CD_comstr)
/* B5AA4 800C52A4 A8E97326 */  addiu      $s3, $s3, %lo(CD_comstr)
/* B5AA8 800C52A8 0D80113C */  lui        $s1, %hi(CD_intstr + 0x238)
/* B5AAC 800C52AC 60EC3126 */  addiu      $s1, $s1, %lo(CD_intstr + 0x238)
/* B5AB0 800C52B0 0D80103C */  lui        $s0, %hi(CD_intstr)
/* B5AB4 800C52B4 28EA1026 */  addiu      $s0, $s0, %lo(CD_intstr)
/* B5AB8 800C52B8 C0034224 */  addiu      $v0, $v0, 0x3C0
/* B5ABC 800C52BC 0E80013C */  lui        $at, %hi(StStartFrame + 0x5C)
/* B5AC0 800C52C0 A0FD22AC */  sw         $v0, %lo(StStartFrame + 0x5C)($at)
/* B5AC4 800C52C4 0180023C */  lui        $v0, %hi(D_80012C9C)
/* B5AC8 800C52C8 9C2C4224 */  addiu      $v0, $v0, %lo(D_80012C9C)
/* B5ACC 800C52CC 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B5AD0 800C52D0 A4FD20AC */  sw         $zero, %lo(StStartFrame + 0x60)($at)
/* B5AD4 800C52D4 0E80013C */  lui        $at, %hi(StStartFrame + 0x64)
/* B5AD8 800C52D8 A8FD22AC */  sw         $v0, %lo(StStartFrame + 0x64)($at)
.L800C52DC:
/* B5ADC 800C52DC 5EF2020C */  jal        func_800BC978
/* B5AE0 800C52E0 FFFF0424 */   addiu     $a0, $zero, -0x1
/* B5AE4 800C52E4 0E80033C */  lui        $v1, %hi(StStartFrame + 0x5C)
/* B5AE8 800C52E8 A0FD638C */  lw         $v1, %lo(StStartFrame + 0x5C)($v1)
/* B5AEC 800C52EC 00000000 */  nop
/* B5AF0 800C52F0 2A186200 */  slt        $v1, $v1, $v0
/* B5AF4 800C52F4 0A006014 */  bnez       $v1, .L800C5320
/* B5AF8 800C52F8 00000000 */   nop
/* B5AFC 800C52FC 0E80023C */  lui        $v0, %hi(StStartFrame + 0x60)
/* B5B00 800C5300 A4FD428C */  lw         $v0, %lo(StStartFrame + 0x60)($v0)
/* B5B04 800C5304 00000000 */  nop
/* B5B08 800C5308 21184000 */  addu       $v1, $v0, $zero
/* B5B0C 800C530C 01004224 */  addiu      $v0, $v0, 0x1
/* B5B10 800C5310 2A188302 */  slt        $v1, $s4, $v1
/* B5B14 800C5314 0E80013C */  lui        $at, %hi(StStartFrame + 0x60)
/* B5B18 800C5318 1B006010 */  beqz       $v1, .L800C5388
/* B5B1C 800C531C A4FD22AC */   sw        $v0, %lo(StStartFrame + 0x60)($at)
.L800C5320:
/* B5B20 800C5320 0180043C */  lui        $a0, %hi(D_80012B90)
/* B5B24 800C5324 9901030C */  jal        func_800C0664
/* B5B28 800C5328 902B8424 */   addiu     $a0, $a0, %lo(D_80012B90)
/* B5B2C 800C532C 00002492 */  lbu        $a0, 0x0($s1)
/* B5B30 800C5330 01002292 */  lbu        $v0, 0x1($s1)
/* B5B34 800C5334 0E80053C */  lui        $a1, %hi(StStartFrame + 0x64)
/* B5B38 800C5338 A8FDA58C */  lw         $a1, %lo(StStartFrame + 0x64)($a1)
/* B5B3C 800C533C 80100200 */  sll        $v0, $v0, 2
/* B5B40 800C5340 21105000 */  addu       $v0, $v0, $s0
/* B5B44 800C5344 80200400 */  sll        $a0, $a0, 2
/* B5B48 800C5348 0000438C */  lw         $v1, 0x0($v0)
/* B5B4C 800C534C 0D80023C */  lui        $v0, %hi(CD_com)
/* B5B50 800C5350 A1E94290 */  lbu        $v0, %lo(CD_com)($v0)
/* B5B54 800C5354 21209000 */  addu       $a0, $a0, $s0
/* B5B58 800C5358 80100200 */  sll        $v0, $v0, 2
/* B5B5C 800C535C 21105300 */  addu       $v0, $v0, $s3
/* B5B60 800C5360 1000A3AF */  sw         $v1, 0x10($sp)
/* B5B64 800C5364 0000468C */  lw         $a2, 0x0($v0)
/* B5B68 800C5368 0000878C */  lw         $a3, 0x0($a0)
/* B5B6C 800C536C 0180043C */  lui        $a0, %hi(D_80012BA0)
/* B5B70 800C5370 06D1010C */  jal        printf
/* B5B74 800C5374 A02B8424 */   addiu     $a0, $a0, %lo(D_80012BA0)
/* B5B78 800C5378 A113030C */  jal        func_800C4E84
/* B5B7C 800C537C 00000000 */   nop
/* B5B80 800C5380 E3140308 */  j          .L800C538C
/* B5B84 800C5384 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800C5388:
/* B5B88 800C5388 21100000 */  addu       $v0, $zero, $zero
.L800C538C:
/* B5B8C 800C538C 0B004014 */  bnez       $v0, .L800C53BC
/* B5B90 800C5390 FFFF0224 */   addiu     $v0, $zero, -0x1
/* B5B94 800C5394 0D80023C */  lui        $v0, %hi(CD_intstr + 0x264)
/* B5B98 800C5398 8CEC428C */  lw         $v0, %lo(CD_intstr + 0x264)($v0)
/* B5B9C 800C539C 00000000 */  nop
/* B5BA0 800C53A0 0000428C */  lw         $v0, 0x0($v0)
/* B5BA4 800C53A4 0001033C */  lui        $v1, (0x1000000 >> 16)
/* B5BA8 800C53A8 24104300 */  and        $v0, $v0, $v1
/* B5BAC 800C53AC 03004010 */  beqz       $v0, .L800C53BC
/* B5BB0 800C53B0 21100000 */   addu      $v0, $zero, $zero
/* B5BB4 800C53B4 C9FF4012 */  beqz       $s2, .L800C52DC
/* B5BB8 800C53B8 01000224 */   addiu     $v0, $zero, 0x1
.L800C53BC:
/* B5BBC 800C53BC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* B5BC0 800C53C0 2800B48F */  lw         $s4, 0x28($sp)
/* B5BC4 800C53C4 2400B38F */  lw         $s3, 0x24($sp)
/* B5BC8 800C53C8 2000B28F */  lw         $s2, 0x20($sp)
/* B5BCC 800C53CC 1C00B18F */  lw         $s1, 0x1C($sp)
/* B5BD0 800C53D0 1800B08F */  lw         $s0, 0x18($sp)
/* B5BD4 800C53D4 0800E003 */  jr         $ra
/* B5BD8 800C53D8 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800C5274, . - func_800C5274
