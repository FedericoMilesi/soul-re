.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_SetFog
/* 4E9F8 8005E1F8 6210033C */  lui        $v1, (0x10624DD3 >> 16)
/* 4E9FC 8005E1FC D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4EA00 8005E200 D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
/* 4EA04 8005E204 00130200 */  sll        $v0, $v0, 12
/* 4EA08 8005E208 18004300 */  mult       $v0, $v1
/* 4EA0C 8005E20C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4EA10 8005E210 1000BFAF */  sw         $ra, 0x10($sp)
/* 4EA14 8005E214 C3170200 */  sra        $v0, $v0, 31
/* 4EA18 8005E218 10480000 */  mfhi       $t1
/* 4EA1C 8005E21C 83190900 */  sra        $v1, $t1, 6
/* 4EA20 8005E220 23186200 */  subu       $v1, $v1, $v0
/* 4EA24 8005E224 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4EA28 8005E228 0800868C */  lw         $a2, 0x8($a0)
/* 4EA2C 8005E22C 03004014 */  bnez       $v0, .L8005E23C
/* 4EA30 8005E230 2140A000 */   addu      $t0, $a1, $zero
/* 4EA34 8005E234 00100224 */  addiu      $v0, $zero, 0x1000
/* 4EA38 8005E238 23184300 */  subu       $v1, $v0, $v1
.L8005E23C:
/* 4EA3C 8005E23C A600C294 */  lhu        $v0, 0xA6($a2)
/* 4EA40 8005E240 4A00C594 */  lhu        $a1, 0x4A($a2)
/* 4EA44 8005E244 00000000 */  nop
/* 4EA48 8005E248 23104500 */  subu       $v0, $v0, $a1
/* 4EA4C 8005E24C 18004300 */  mult       $v0, $v1
/* 4EA50 8005E250 12380000 */  mflo       $a3
/* 4EA54 8005E254 0200E104 */  bgez       $a3, .L8005E260
/* 4EA58 8005E258 00000000 */   nop
/* 4EA5C 8005E25C FF0FE724 */  addiu      $a3, $a3, 0xFFF
.L8005E260:
/* 4EA60 8005E260 A400C294 */  lhu        $v0, 0xA4($a2)
/* 4EA64 8005E264 4800C694 */  lhu        $a2, 0x48($a2)
/* 4EA68 8005E268 00000000 */  nop
/* 4EA6C 8005E26C 23104600 */  subu       $v0, $v0, $a2
/* 4EA70 8005E270 18004300 */  mult       $v0, $v1
/* 4EA74 8005E274 03130700 */  sra        $v0, $a3, 12
/* 4EA78 8005E278 12180000 */  mflo       $v1
/* 4EA7C 8005E27C 02006104 */  bgez       $v1, .L8005E288
/* 4EA80 8005E280 21284500 */   addu      $a1, $v0, $a1
/* 4EA84 8005E284 FF0F6324 */  addiu      $v1, $v1, 0xFFF
.L8005E288:
/* 4EA88 8005E288 03130300 */  sra        $v0, $v1, 12
/* 4EA8C 8005E28C 06000011 */  beqz       $t0, .L8005E2A8
/* 4EA90 8005E290 21104600 */   addu      $v0, $v0, $a2
/* 4EA94 8005E294 360085A4 */  sh         $a1, 0x36($a0)
/* 4EA98 8005E298 3A0085A4 */  sh         $a1, 0x3A($a0)
/* 4EA9C 8005E29C 340082A4 */  sh         $v0, 0x34($a0)
/* 4EAA0 8005E2A0 AF780108 */  j          .L8005E2BC
/* 4EAA4 8005E2A4 380082A4 */   sh        $v0, 0x38($a0)
.L8005E2A8:
/* 4EAA8 8005E2A8 002C0500 */  sll        $a1, $a1, 16
/* 4EAAC 8005E2AC 00340200 */  sll        $a2, $v0, 16
/* 4EAB0 8005E2B0 032C0500 */  sra        $a1, $a1, 16
/* 4EAB4 8005E2B4 CC66010C */  jal        STREAM_SetStreamFog
/* 4EAB8 8005E2B8 03340600 */   sra       $a2, $a2, 16
.L8005E2BC:
/* 4EABC 8005E2BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 4EAC0 8005E2C0 00000000 */  nop
/* 4EAC4 8005E2C4 0800E003 */  jr         $ra
/* 4EAC8 8005E2C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MORPH_SetFog, . - MORPH_SetFog
