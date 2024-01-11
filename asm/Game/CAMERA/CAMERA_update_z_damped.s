.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_update_z_damped
/* A234 80019A34 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A238 80019A38 2138A000 */  addu       $a3, $a1, $zero
/* A23C 80019A3C 2140C000 */  addu       $t0, $a2, $zero
/* A240 80019A40 1800A5A7 */  sh         $a1, 0x18($sp)
/* A244 80019A44 002C0500 */  sll        $a1, $a1, 16
/* A248 80019A48 032C0500 */  sra        $a1, $a1, 16
/* A24C 80019A4C 00340600 */  sll        $a2, $a2, 16
/* A250 80019A50 03340600 */  sra        $a2, $a2, 16
/* A254 80019A54 2A10C500 */  slt        $v0, $a2, $a1
/* A258 80019A58 27004010 */  beqz       $v0, .L80019AF8
/* A25C 80019A5C 2000BFAF */   sw        $ra, 0x20($sp)
/* A260 80019A60 9C04828C */  lw         $v0, 0x49C($a0)
/* A264 80019A64 00000000 */  nop
/* A268 80019A68 38104230 */  andi       $v0, $v0, 0x1038
/* A26C 80019A6C 19004010 */  beqz       $v0, .L80019AD4
/* A270 80019A70 00140700 */   sll       $v0, $a3, 16
/* A274 80019A74 AC048284 */  lh         $v0, 0x4AC($a0)
/* A278 80019A78 BA048384 */  lh         $v1, 0x4BA($a0)
/* A27C 80019A7C 00000000 */  nop
/* A280 80019A80 2A104300 */  slt        $v0, $v0, $v1
/* A284 80019A84 12004014 */  bnez       $v0, .L80019AD0
/* A288 80019A88 2318A600 */   subu      $v1, $a1, $a2
/* A28C 80019A8C 08006004 */  bltz       $v1, .L80019AB0
/* A290 80019A90 00000000 */   nop
/* A294 80019A94 AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
/* A298 80019A98 ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
/* A29C 80019A9C 18006200 */  mult       $v1, $v0
/* A2A0 80019AA0 C3170300 */  sra        $v0, $v1, 31
/* A2A4 80019AA4 10480000 */  mfhi       $t1
/* A2A8 80019AA8 12670008 */  j          .L80019C48
/* A2AC 80019AAC 23102201 */   subu      $v0, $t1, $v0
.L80019AB0:
/* A2B0 80019AB0 AA2A033C */  lui        $v1, (0x2AAAAAAB >> 16)
/* A2B4 80019AB4 ABAA6334 */  ori        $v1, $v1, (0x2AAAAAAB & 0xFFFF)
/* A2B8 80019AB8 2310C500 */  subu       $v0, $a2, $a1
/* A2BC 80019ABC 18004300 */  mult       $v0, $v1
/* A2C0 80019AC0 C3170200 */  sra        $v0, $v0, 31
/* A2C4 80019AC4 10480000 */  mfhi       $t1
/* A2C8 80019AC8 12670008 */  j          .L80019C48
/* A2CC 80019ACC 23102201 */   subu      $v0, $t1, $v0
.L80019AD0:
/* A2D0 80019AD0 00140700 */  sll        $v0, $a3, 16
.L80019AD4:
/* A2D4 80019AD4 03240200 */  sra        $a0, $v0, 16
/* A2D8 80019AD8 00140800 */  sll        $v0, $t0, 16
/* A2DC 80019ADC 031C0200 */  sra        $v1, $v0, 16
/* A2E0 80019AE0 23108300 */  subu       $v0, $a0, $v1
/* A2E4 80019AE4 02004104 */  bgez       $v0, .L80019AF0
/* A2E8 80019AE8 00000000 */   nop
/* A2EC 80019AEC 23106400 */  subu       $v0, $v1, $a0
.L80019AF0:
/* A2F0 80019AF0 12670008 */  j          .L80019C48
/* A2F4 80019AF4 40100200 */   sll       $v0, $v0, 1
.L80019AF8:
/* A2F8 80019AF8 2310A600 */  subu       $v0, $a1, $a2
/* A2FC 80019AFC 05004004 */  bltz       $v0, .L80019B14
/* A300 80019B00 05004228 */   slti      $v0, $v0, 0x5
/* A304 80019B04 07004010 */  beqz       $v0, .L80019B24
/* A308 80019B08 00140700 */   sll       $v0, $a3, 16
/* A30C 80019B0C 1F670008 */  j          .L80019C7C
/* A310 80019B10 00000000 */   nop
.L80019B14:
/* A314 80019B14 2310C500 */  subu       $v0, $a2, $a1
/* A318 80019B18 05004228 */  slti       $v0, $v0, 0x5
/* A31C 80019B1C 57004014 */  bnez       $v0, .L80019C7C
/* A320 80019B20 00140700 */   sll       $v0, $a3, 16
.L80019B24:
/* A324 80019B24 9C04828C */  lw         $v0, 0x49C($a0)
/* A328 80019B28 00000000 */  nop
/* A32C 80019B2C 00014230 */  andi       $v0, $v0, 0x100
/* A330 80019B30 1B004010 */  beqz       $v0, .L80019BA0
/* A334 80019B34 00140700 */   sll       $v0, $a3, 16
/* A338 80019B38 03240200 */  sra        $a0, $v0, 16
/* A33C 80019B3C 00140800 */  sll        $v0, $t0, 16
/* A340 80019B40 03140200 */  sra        $v0, $v0, 16
/* A344 80019B44 23188200 */  subu       $v1, $a0, $v0
/* A348 80019B48 06006004 */  bltz       $v1, .L80019B64
/* A34C 80019B4C 00000000 */   nop
/* A350 80019B50 AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
/* A354 80019B54 ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
/* A358 80019B58 18006200 */  mult       $v1, $v0
/* A35C 80019B5C DE660008 */  j          .L80019B78
/* A360 80019B60 C3170300 */   sra       $v0, $v1, 31
.L80019B64:
/* A364 80019B64 AA2A033C */  lui        $v1, (0x2AAAAAAB >> 16)
/* A368 80019B68 ABAA6334 */  ori        $v1, $v1, (0x2AAAAAAB & 0xFFFF)
/* A36C 80019B6C 23104400 */  subu       $v0, $v0, $a0
/* A370 80019B70 18004300 */  mult       $v0, $v1
/* A374 80019B74 C3170200 */  sra        $v0, $v0, 31
.L80019B78:
/* A378 80019B78 10480000 */  mfhi       $t1
/* A37C 80019B7C 23102201 */  subu       $v0, $t1, $v0
/* A380 80019B80 628E82A7 */  sh         $v0, %gp_rel(roll_inc + 0xE)($gp)
/* A384 80019B84 628E8287 */  lh         $v0, %gp_rel(roll_inc + 0xE)($gp)
/* A388 80019B88 00000000 */  nop
/* A38C 80019B8C 32004228 */  slti       $v0, $v0, 0x32
/* A390 80019B90 16004010 */  beqz       $v0, .L80019BEC
/* A394 80019B94 32000224 */   addiu     $v0, $zero, 0x32
/* A398 80019B98 FA660008 */  j          .L80019BE8
/* A39C 80019B9C 00000000 */   nop
.L80019BA0:
/* A3A0 80019BA0 03240200 */  sra        $a0, $v0, 16
/* A3A4 80019BA4 00140800 */  sll        $v0, $t0, 16
/* A3A8 80019BA8 03140200 */  sra        $v0, $v0, 16
/* A3AC 80019BAC 23188200 */  subu       $v1, $a0, $v0
/* A3B0 80019BB0 06006004 */  bltz       $v1, .L80019BCC
/* A3B4 80019BB4 00000000 */   nop
/* A3B8 80019BB8 AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
/* A3BC 80019BBC ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
/* A3C0 80019BC0 18006200 */  mult       $v1, $v0
/* A3C4 80019BC4 F8660008 */  j          .L80019BE0
/* A3C8 80019BC8 C3170300 */   sra       $v0, $v1, 31
.L80019BCC:
/* A3CC 80019BCC AA2A033C */  lui        $v1, (0x2AAAAAAB >> 16)
/* A3D0 80019BD0 ABAA6334 */  ori        $v1, $v1, (0x2AAAAAAB & 0xFFFF)
/* A3D4 80019BD4 23104400 */  subu       $v0, $v0, $a0
/* A3D8 80019BD8 18004300 */  mult       $v0, $v1
/* A3DC 80019BDC C3170200 */  sra        $v0, $v0, 31
.L80019BE0:
/* A3E0 80019BE0 10480000 */  mfhi       $t1
/* A3E4 80019BE4 23102201 */  subu       $v0, $t1, $v0
.L80019BE8:
/* A3E8 80019BE8 628E82A7 */  sh         $v0, %gp_rel(roll_inc + 0xE)($gp)
.L80019BEC:
/* A3EC 80019BEC 628E8587 */  lh         $a1, %gp_rel(roll_inc + 0xE)($gp)
/* A3F0 80019BF0 00140700 */  sll        $v0, $a3, 16
/* A3F4 80019BF4 03240200 */  sra        $a0, $v0, 16
/* A3F8 80019BF8 00140800 */  sll        $v0, $t0, 16
/* A3FC 80019BFC 031C0200 */  sra        $v1, $v0, 16
/* A400 80019C00 23108300 */  subu       $v0, $a0, $v1
/* A404 80019C04 05004004 */  bltz       $v0, .L80019C1C
/* A408 80019C08 2A104500 */   slt       $v0, $v0, $a1
/* A40C 80019C0C 07004014 */  bnez       $v0, .L80019C2C
/* A410 80019C10 001C0700 */   sll       $v1, $a3, 16
/* A414 80019C14 14670008 */  j          .L80019C50
/* A418 80019C18 01000424 */   addiu     $a0, $zero, 0x1
.L80019C1C:
/* A41C 80019C1C 23106400 */  subu       $v0, $v1, $a0
/* A420 80019C20 2A104500 */  slt        $v0, $v0, $a1
/* A424 80019C24 09004010 */  beqz       $v0, .L80019C4C
/* A428 80019C28 001C0700 */   sll       $v1, $a3, 16
.L80019C2C:
/* A42C 80019C2C 031C0300 */  sra        $v1, $v1, 16
/* A430 80019C30 00140800 */  sll        $v0, $t0, 16
/* A434 80019C34 03140200 */  sra        $v0, $v0, 16
/* A438 80019C38 23186200 */  subu       $v1, $v1, $v0
/* A43C 80019C3C 02006104 */  bgez       $v1, .L80019C48
/* A440 80019C40 2310E800 */   subu      $v0, $a3, $t0
/* A444 80019C44 23100701 */  subu       $v0, $t0, $a3
.L80019C48:
/* A448 80019C48 628E82A7 */  sh         $v0, %gp_rel(roll_inc + 0xE)($gp)
.L80019C4C:
/* A44C 80019C4C 01000424 */  addiu      $a0, $zero, 0x1
.L80019C50:
/* A450 80019C50 1800A527 */  addiu      $a1, $sp, 0x18
/* A454 80019C54 00340800 */  sll        $a2, $t0, 16
/* A458 80019C58 03340600 */  sra        $a2, $a2, 16
/* A45C 80019C5C 5E8E8727 */  addiu      $a3, $gp, %gp_rel(roll_inc + 0xA)
/* A460 80019C60 628E8387 */  lh         $v1, %gp_rel(roll_inc + 0xE)($gp)
/* A464 80019C64 608E8227 */  addiu      $v0, $gp, %gp_rel(roll_inc + 0xC)
/* A468 80019C68 1000A2AF */  sw         $v0, 0x10($sp)
/* A46C 80019C6C 605C000C */  jal        CriticalDampValue
/* A470 80019C70 1400A3AF */   sw        $v1, 0x14($sp)
/* A474 80019C74 24670008 */  j          .L80019C90
/* A478 80019C78 00000000 */   nop
.L80019C7C:
/* A47C 80019C7C 5E8E80A7 */  sh         $zero, %gp_rel(roll_inc + 0xA)($gp)
/* A480 80019C80 608E80A7 */  sh         $zero, %gp_rel(roll_inc + 0xC)($gp)
/* A484 80019C84 628E80A7 */  sh         $zero, %gp_rel(roll_inc + 0xE)($gp)
/* A488 80019C88 25670008 */  j          .L80019C94
/* A48C 80019C8C 03140200 */   sra       $v0, $v0, 16
.L80019C90:
/* A490 80019C90 1800A287 */  lh         $v0, 0x18($sp)
.L80019C94:
/* A494 80019C94 2000BF8F */  lw         $ra, 0x20($sp)
/* A498 80019C98 00000000 */  nop
/* A49C 80019C9C 0800E003 */  jr         $ra
/* A4A0 80019CA0 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_update_z_damped, . - CAMERA_update_z_damped
