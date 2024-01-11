.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ProcessTimers
/* A33D0 800B2BD0 78FB868F */  lw         $a2, %gp_rel(Raziel + 0x548)($gp)
/* A33D4 800B2BD4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* A33D8 800B2BD8 3400B3AF */  sw         $s3, 0x34($sp)
/* A33DC 800B2BDC 21988000 */  addu       $s3, $a0, $zero
/* A33E0 800B2BE0 3800BFAF */  sw         $ra, 0x38($sp)
/* A33E4 800B2BE4 3000B2AF */  sw         $s2, 0x30($sp)
/* A33E8 800B2BE8 2C00B1AF */  sw         $s1, 0x2C($sp)
/* A33EC 800B2BEC 0B00C018 */  blez       $a2, .L800B2C1C
/* A33F0 800B2BF0 2800B0AF */   sw        $s0, 0x28($sp)
/* A33F4 800B2BF4 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* A33F8 800B2BF8 00000000 */  nop
/* A33FC 800B2BFC 2330C200 */  subu       $a2, $a2, $v0
/* A3400 800B2C00 78FB86AF */  sw         $a2, %gp_rel(Raziel + 0x548)($gp)
/* A3404 800B2C04 0500C01C */  bgtz       $a2, .L800B2C1C
/* A3408 800B2C08 1000053C */   lui       $a1, (0x100015 >> 16)
/* A340C 800B2C0C 1500A534 */  ori        $a1, $a1, (0x100015 & 0xFFFF)
/* A3410 800B2C10 A1D1000C */  jal        INSTANCE_Post
/* A3414 800B2C14 23300600 */   negu      $a2, $a2
/* A3418 800B2C18 78FB80AF */  sw         $zero, %gp_rel(Raziel + 0x548)($gp)
.L800B2C1C:
/* A341C 800B2C1C C4FB838F */  lw         $v1, %gp_rel(Raziel + 0x594)($gp)
/* A3420 800B2C20 00000000 */  nop
/* A3424 800B2C24 20016018 */  blez       $v1, .L800B30A8
/* A3428 800B2C28 00000000 */   nop
/* A342C 800B2C2C 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* A3430 800B2C30 00000000 */  nop
/* A3434 800B2C34 23106200 */  subu       $v0, $v1, $v0
/* A3438 800B2C38 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A343C 800B2C3C 1A01401C */  bgtz       $v0, .L800B30A8
/* A3440 800B2C40 00000000 */   nop
/* A3444 800B2C44 C8FB828F */  lw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A3448 800B2C48 C4FB80AF */  sw         $zero, %gp_rel(Raziel + 0x594)($gp)
/* A344C 800B2C4C FFFF4324 */  addiu      $v1, $v0, -0x1
/* A3450 800B2C50 0A00622C */  sltiu      $v0, $v1, 0xA
/* A3454 800B2C54 0E014010 */  beqz       $v0, .L800B3090
/* A3458 800B2C58 0180023C */   lui       $v0, %hi(jtbl_800123FC)
/* A345C 800B2C5C FC234224 */  addiu      $v0, $v0, %lo(jtbl_800123FC)
/* A3460 800B2C60 80180300 */  sll        $v1, $v1, 2
/* A3464 800B2C64 21186200 */  addu       $v1, $v1, $v0
/* A3468 800B2C68 0000628C */  lw         $v0, 0x0($v1)
/* A346C 800B2C6C 00000000 */  nop
/* A3470 800B2C70 08004000 */  jr         $v0
/* A3474 800B2C74 00000000 */   nop
jlabel .L800B2C78
/* A3478 800B2C78 21206002 */  addu       $a0, $s3, $zero
/* A347C 800B2C7C 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A3480 800B2C80 13000624 */  addiu      $a2, $zero, 0x13
/* A3484 800B2C84 E8030724 */  addiu      $a3, $zero, 0x3E8
/* A3488 800B2C88 2110E000 */  addu       $v0, $a3, $zero
/* A348C 800B2C8C 78001024 */  addiu      $s0, $zero, 0x78
/* A3490 800B2C90 00101224 */  addiu      $s2, $zero, 0x1000
/* A3494 800B2C94 AC0D1124 */  addiu      $s1, $zero, 0xDAC
/* A3498 800B2C98 1000A2AF */  sw         $v0, 0x10($sp)
/* A349C 800B2C9C 1400B0AF */  sw         $s0, 0x14($sp)
/* A34A0 800B2CA0 1800B0AF */  sw         $s0, 0x18($sp)
/* A34A4 800B2CA4 1C00B2AF */  sw         $s2, 0x1C($sp)
/* A34A8 800B2CA8 509F020C */  jal        razSetupSoundRamp
/* A34AC 800B2CAC 2000B1AF */   sw        $s1, 0x20($sp)
/* A34B0 800B2CB0 21206002 */  addu       $a0, $s3, $zero
/* A34B4 800B2CB4 ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A34B8 800B2CB8 14000624 */  addiu      $a2, $zero, 0x14
/* A34BC 800B2CBC 06040724 */  addiu      $a3, $zero, 0x406
/* A34C0 800B2CC0 2110E000 */  addu       $v0, $a3, $zero
/* A34C4 800B2CC4 1000A2AF */  sw         $v0, 0x10($sp)
/* A34C8 800B2CC8 1400B0AF */  sw         $s0, 0x14($sp)
/* A34CC 800B2CCC 1800B0AF */  sw         $s0, 0x18($sp)
/* A34D0 800B2CD0 1C00B2AF */  sw         $s2, 0x1C($sp)
/* A34D4 800B2CD4 509F020C */  jal        razSetupSoundRamp
/* A34D8 800B2CD8 2000B1AF */   sw        $s1, 0x20($sp)
/* A34DC 800B2CDC 0100023C */  lui        $v0, (0x1E000 >> 16)
/* A34E0 800B2CE0 00E04234 */  ori        $v0, $v0, (0x1E000 & 0xFFFF)
/* A34E4 800B2CE4 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A34E8 800B2CE8 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A34EC 800B2CEC 8ACB0208 */  j          .L800B2E28
/* A34F0 800B2CF0 02000324 */   addiu     $v1, $zero, 0x2
jlabel .L800B2CF4
/* A34F4 800B2CF4 0300123C */  lui        $s2, (0x3C000 >> 16)
/* A34F8 800B2CF8 00C05236 */  ori        $s2, $s2, (0x3C000 & 0xFFFF)
/* A34FC 800B2CFC 21206002 */  addu       $a0, $s3, $zero
/* A3500 800B2D00 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A3504 800B2D04 13000624 */  addiu      $a2, $zero, 0x13
/* A3508 800B2D08 E8030724 */  addiu      $a3, $zero, 0x3E8
/* A350C 800B2D0C 2110E000 */  addu       $v0, $a3, $zero
/* A3510 800B2D10 78001124 */  addiu      $s1, $zero, 0x78
/* A3514 800B2D14 AC0D1024 */  addiu      $s0, $zero, 0xDAC
/* A3518 800B2D18 1000A2AF */  sw         $v0, 0x10($sp)
/* A351C 800B2D1C 1400B1AF */  sw         $s1, 0x14($sp)
/* A3520 800B2D20 1800A0AF */  sw         $zero, 0x18($sp)
/* A3524 800B2D24 1C00B2AF */  sw         $s2, 0x1C($sp)
/* A3528 800B2D28 509F020C */  jal        razSetupSoundRamp
/* A352C 800B2D2C 2000B0AF */   sw        $s0, 0x20($sp)
/* A3530 800B2D30 21206002 */  addu       $a0, $s3, $zero
/* A3534 800B2D34 ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A3538 800B2D38 14000624 */  addiu      $a2, $zero, 0x14
/* A353C 800B2D3C 06040724 */  addiu      $a3, $zero, 0x406
/* A3540 800B2D40 2110E000 */  addu       $v0, $a3, $zero
/* A3544 800B2D44 1000A2AF */  sw         $v0, 0x10($sp)
/* A3548 800B2D48 1400B1AF */  sw         $s1, 0x14($sp)
/* A354C 800B2D4C 1800A0AF */  sw         $zero, 0x18($sp)
/* A3550 800B2D50 1C00B2AF */  sw         $s2, 0x1C($sp)
/* A3554 800B2D54 1ECC0208 */  j          .L800B3078
/* A3558 800B2D58 2000B0AF */   sw        $s0, 0x20($sp)
jlabel .L800B2D5C
/* A355C 800B2D5C 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* A3560 800B2D60 00000000 */  nop
/* A3564 800B2D64 03008010 */  beqz       $a0, .L800B2D74
/* A3568 800B2D68 00000000 */   nop
/* A356C 800B2D6C 1C02010C */  jal        SndEndLoop
/* A3570 800B2D70 00000000 */   nop
.L800B2D74:
/* A3574 800B2D74 21206002 */  addu       $a0, $s3, $zero
/* A3578 800B2D78 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A357C 800B2D7C 0D000624 */  addiu      $a2, $zero, 0xD
/* A3580 800B2D80 21380000 */  addu       $a3, $zero, $zero
/* A3584 800B2D84 64000224 */  addiu      $v0, $zero, 0x64
/* A3588 800B2D88 1400A2AF */  sw         $v0, 0x14($sp)
/* A358C 800B2D8C 1800A2AF */  sw         $v0, 0x18($sp)
/* A3590 800B2D90 00100224 */  addiu      $v0, $zero, 0x1000
/* A3594 800B2D94 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A3598 800B2D98 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A359C 800B2D9C 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
/* A35A0 800B2DA0 1000A0AF */  sw         $zero, 0x10($sp)
/* A35A4 800B2DA4 509F020C */  jal        razSetupSoundRamp
/* A35A8 800B2DA8 2000A2AF */   sw        $v0, 0x20($sp)
/* A35AC 800B2DAC 00A00234 */  ori        $v0, $zero, 0xA000
/* A35B0 800B2DB0 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A35B4 800B2DB4 04000224 */  addiu      $v0, $zero, 0x4
/* A35B8 800B2DB8 C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A35BC 800B2DBC 2ACC0208 */  j          .L800B30A8
/* A35C0 800B2DC0 00000000 */   nop
jlabel .L800B2DC4
/* A35C4 800B2DC4 ACFB848F */  lw         $a0, %gp_rel(Raziel + 0x57C)($gp)
/* A35C8 800B2DC8 00000000 */  nop
/* A35CC 800B2DCC 03008010 */  beqz       $a0, .L800B2DDC
/* A35D0 800B2DD0 00000000 */   nop
/* A35D4 800B2DD4 1C02010C */  jal        SndEndLoop
/* A35D8 800B2DD8 00000000 */   nop
.L800B2DDC:
/* A35DC 800B2DDC 21206002 */  addu       $a0, $s3, $zero
/* A35E0 800B2DE0 ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A35E4 800B2DE4 0D000624 */  addiu      $a2, $zero, 0xD
/* A35E8 800B2DE8 32000724 */  addiu      $a3, $zero, 0x32
/* A35EC 800B2DEC 2110E000 */  addu       $v0, $a3, $zero
/* A35F0 800B2DF0 1000A2AF */  sw         $v0, 0x10($sp)
/* A35F4 800B2DF4 5F000224 */  addiu      $v0, $zero, 0x5F
/* A35F8 800B2DF8 1400A2AF */  sw         $v0, 0x14($sp)
/* A35FC 800B2DFC 1800A2AF */  sw         $v0, 0x18($sp)
/* A3600 800B2E00 00100224 */  addiu      $v0, $zero, 0x1000
/* A3604 800B2E04 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A3608 800B2E08 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A360C 800B2E0C ACFB80AF */  sw         $zero, %gp_rel(Raziel + 0x57C)($gp)
/* A3610 800B2E10 509F020C */  jal        razSetupSoundRamp
/* A3614 800B2E14 2000A2AF */   sw        $v0, 0x20($sp)
/* A3618 800B2E18 00700224 */  addiu      $v0, $zero, 0x7000
/* A361C 800B2E1C C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A3620 800B2E20 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A3624 800B2E24 05000324 */  addiu      $v1, $zero, 0x5
.L800B2E28:
/* A3628 800B2E28 C8FB83AF */  sw         $v1, %gp_rel(Raziel + 0x598)($gp)
/* A362C 800B2E2C 08004234 */  ori        $v0, $v0, 0x8
/* A3630 800B2E30 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A3634 800B2E34 2ACC0208 */  j          .L800B30A8
/* A3638 800B2E38 00000000 */   nop
jlabel .L800B2E3C
/* A363C 800B2E3C 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* A3640 800B2E40 00000000 */  nop
/* A3644 800B2E44 03008010 */  beqz       $a0, .L800B2E54
/* A3648 800B2E48 00000000 */   nop
/* A364C 800B2E4C 1C02010C */  jal        SndEndLoop
/* A3650 800B2E50 00000000 */   nop
.L800B2E54:
/* A3654 800B2E54 21206002 */  addu       $a0, $s3, $zero
/* A3658 800B2E58 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A365C 800B2E5C 0D000624 */  addiu      $a2, $zero, 0xD
/* A3660 800B2E60 ECFF0724 */  addiu      $a3, $zero, -0x14
/* A3664 800B2E64 2110E000 */  addu       $v0, $a3, $zero
/* A3668 800B2E68 1000A2AF */  sw         $v0, 0x10($sp)
/* A366C 800B2E6C 50000224 */  addiu      $v0, $zero, 0x50
/* A3670 800B2E70 1400A2AF */  sw         $v0, 0x14($sp)
/* A3674 800B2E74 1800A2AF */  sw         $v0, 0x18($sp)
/* A3678 800B2E78 00100224 */  addiu      $v0, $zero, 0x1000
/* A367C 800B2E7C 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A3680 800B2E80 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A3684 800B2E84 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
/* A3688 800B2E88 509F020C */  jal        razSetupSoundRamp
/* A368C 800B2E8C 2000A2AF */   sw        $v0, 0x20($sp)
/* A3690 800B2E90 00800234 */  ori        $v0, $zero, 0x8000
/* A3694 800B2E94 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A3698 800B2E98 06000224 */  addiu      $v0, $zero, 0x6
/* A369C 800B2E9C C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A36A0 800B2EA0 2ACC0208 */  j          .L800B30A8
/* A36A4 800B2EA4 00000000 */   nop
jlabel .L800B2EA8
/* A36A8 800B2EA8 ACFB848F */  lw         $a0, %gp_rel(Raziel + 0x57C)($gp)
/* A36AC 800B2EAC 00000000 */  nop
/* A36B0 800B2EB0 03008010 */  beqz       $a0, .L800B2EC0
/* A36B4 800B2EB4 00000000 */   nop
/* A36B8 800B2EB8 1C02010C */  jal        SndEndLoop
/* A36BC 800B2EBC 00000000 */   nop
.L800B2EC0:
/* A36C0 800B2EC0 21206002 */  addu       $a0, $s3, $zero
/* A36C4 800B2EC4 ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A36C8 800B2EC8 0D000624 */  addiu      $a2, $zero, 0xD
/* A36CC 800B2ECC 64000724 */  addiu      $a3, $zero, 0x64
/* A36D0 800B2ED0 2110E000 */  addu       $v0, $a3, $zero
/* A36D4 800B2ED4 1000A2AF */  sw         $v0, 0x10($sp)
/* A36D8 800B2ED8 4B000224 */  addiu      $v0, $zero, 0x4B
/* A36DC 800B2EDC 1400A2AF */  sw         $v0, 0x14($sp)
/* A36E0 800B2EE0 1800A2AF */  sw         $v0, 0x18($sp)
/* A36E4 800B2EE4 00100224 */  addiu      $v0, $zero, 0x1000
/* A36E8 800B2EE8 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A36EC 800B2EEC AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A36F0 800B2EF0 ACFB80AF */  sw         $zero, %gp_rel(Raziel + 0x57C)($gp)
/* A36F4 800B2EF4 509F020C */  jal        razSetupSoundRamp
/* A36F8 800B2EF8 2000A2AF */   sw        $v0, 0x20($sp)
/* A36FC 800B2EFC 00A00234 */  ori        $v0, $zero, 0xA000
/* A3700 800B2F00 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A3704 800B2F04 07000224 */  addiu      $v0, $zero, 0x7
/* A3708 800B2F08 C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A370C 800B2F0C 2ACC0208 */  j          .L800B30A8
/* A3710 800B2F10 00000000 */   nop
jlabel .L800B2F14
/* A3714 800B2F14 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* A3718 800B2F18 00000000 */  nop
/* A371C 800B2F1C 03008010 */  beqz       $a0, .L800B2F2C
/* A3720 800B2F20 00000000 */   nop
/* A3724 800B2F24 1C02010C */  jal        SndEndLoop
/* A3728 800B2F28 00000000 */   nop
.L800B2F2C:
/* A372C 800B2F2C 21206002 */  addu       $a0, $s3, $zero
/* A3730 800B2F30 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A3734 800B2F34 0D000624 */  addiu      $a2, $zero, 0xD
/* A3738 800B2F38 9CFF0724 */  addiu      $a3, $zero, -0x64
/* A373C 800B2F3C 2110E000 */  addu       $v0, $a3, $zero
/* A3740 800B2F40 1000A2AF */  sw         $v0, 0x10($sp)
/* A3744 800B2F44 41000224 */  addiu      $v0, $zero, 0x41
/* A3748 800B2F48 1400A2AF */  sw         $v0, 0x14($sp)
/* A374C 800B2F4C 1800A2AF */  sw         $v0, 0x18($sp)
/* A3750 800B2F50 00100224 */  addiu      $v0, $zero, 0x1000
/* A3754 800B2F54 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A3758 800B2F58 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A375C 800B2F5C 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
/* A3760 800B2F60 509F020C */  jal        razSetupSoundRamp
/* A3764 800B2F64 2000A2AF */   sw        $v0, 0x20($sp)
/* A3768 800B2F68 00500224 */  addiu      $v0, $zero, 0x5000
/* A376C 800B2F6C C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A3770 800B2F70 08000224 */  addiu      $v0, $zero, 0x8
/* A3774 800B2F74 C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A3778 800B2F78 2ACC0208 */  j          .L800B30A8
/* A377C 800B2F7C 00000000 */   nop
jlabel .L800B2F80
/* A3780 800B2F80 ACFB848F */  lw         $a0, %gp_rel(Raziel + 0x57C)($gp)
/* A3784 800B2F84 00000000 */  nop
/* A3788 800B2F88 03008010 */  beqz       $a0, .L800B2F98
/* A378C 800B2F8C 00000000 */   nop
/* A3790 800B2F90 1C02010C */  jal        SndEndLoop
/* A3794 800B2F94 00000000 */   nop
.L800B2F98:
/* A3798 800B2F98 21206002 */  addu       $a0, $s3, $zero
/* A379C 800B2F9C ACFB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x57C)
/* A37A0 800B2FA0 0D000624 */  addiu      $a2, $zero, 0xD
/* A37A4 800B2FA4 1E000724 */  addiu      $a3, $zero, 0x1E
/* A37A8 800B2FA8 2110E000 */  addu       $v0, $a3, $zero
/* A37AC 800B2FAC 1000A2AF */  sw         $v0, 0x10($sp)
/* A37B0 800B2FB0 3C000224 */  addiu      $v0, $zero, 0x3C
/* A37B4 800B2FB4 1400A2AF */  sw         $v0, 0x14($sp)
/* A37B8 800B2FB8 1800A2AF */  sw         $v0, 0x18($sp)
/* A37BC 800B2FBC 00100224 */  addiu      $v0, $zero, 0x1000
/* A37C0 800B2FC0 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A37C4 800B2FC4 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A37C8 800B2FC8 ACFB80AF */  sw         $zero, %gp_rel(Raziel + 0x57C)($gp)
/* A37CC 800B2FCC 509F020C */  jal        razSetupSoundRamp
/* A37D0 800B2FD0 2000A2AF */   sw        $v0, 0x20($sp)
/* A37D4 800B2FD4 00A00234 */  ori        $v0, $zero, 0xA000
/* A37D8 800B2FD8 C4FB82AF */  sw         $v0, %gp_rel(Raziel + 0x594)($gp)
/* A37DC 800B2FDC 09000224 */  addiu      $v0, $zero, 0x9
/* A37E0 800B2FE0 C8FB82AF */  sw         $v0, %gp_rel(Raziel + 0x598)($gp)
/* A37E4 800B2FE4 2ACC0208 */  j          .L800B30A8
/* A37E8 800B2FE8 00000000 */   nop
jlabel .L800B2FEC
/* A37EC 800B2FEC 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* A37F0 800B2FF0 00000000 */  nop
/* A37F4 800B2FF4 03008010 */  beqz       $a0, .L800B3004
/* A37F8 800B2FF8 00000000 */   nop
/* A37FC 800B2FFC 1C02010C */  jal        SndEndLoop
/* A3800 800B3000 00000000 */   nop
.L800B3004:
/* A3804 800B3004 ACFB848F */  lw         $a0, %gp_rel(Raziel + 0x57C)($gp)
/* A3808 800B3008 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
/* A380C 800B300C 03008010 */  beqz       $a0, .L800B301C
/* A3810 800B3010 00000000 */   nop
/* A3814 800B3014 1C02010C */  jal        SndEndLoop
/* A3818 800B3018 00000000 */   nop
.L800B301C:
/* A381C 800B301C 4CFB828F */  lw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A3820 800B3020 FBFF0324 */  addiu      $v1, $zero, -0x5
/* A3824 800B3024 ACFB80AF */  sw         $zero, %gp_rel(Raziel + 0x57C)($gp)
/* A3828 800B3028 24104300 */  and        $v0, $v0, $v1
/* A382C 800B302C F7FF0324 */  addiu      $v1, $zero, -0x9
/* A3830 800B3030 24104300 */  and        $v0, $v0, $v1
/* A3834 800B3034 4CFB82AF */  sw         $v0, %gp_rel(Raziel + 0x51C)($gp)
/* A3838 800B3038 2ACC0208 */  j          .L800B30A8
/* A383C 800B303C 00000000 */   nop
jlabel .L800B3040
/* A3840 800B3040 0300033C */  lui        $v1, (0x3C000 >> 16)
/* A3844 800B3044 00C06334 */  ori        $v1, $v1, (0x3C000 & 0xFFFF)
/* A3848 800B3048 21206002 */  addu       $a0, $s3, $zero
/* A384C 800B304C 94FB8527 */  addiu      $a1, $gp, %gp_rel(Raziel + 0x564)
/* A3850 800B3050 33000624 */  addiu      $a2, $zero, 0x33
/* A3854 800B3054 38FF0724 */  addiu      $a3, $zero, -0xC8
/* A3858 800B3058 2110E000 */  addu       $v0, $a3, $zero
/* A385C 800B305C 1000A2AF */  sw         $v0, 0x10($sp)
/* A3860 800B3060 78000224 */  addiu      $v0, $zero, 0x78
/* A3864 800B3064 1400A2AF */  sw         $v0, 0x14($sp)
/* A3868 800B3068 AC0D0224 */  addiu      $v0, $zero, 0xDAC
/* A386C 800B306C 1800A0AF */  sw         $zero, 0x18($sp)
/* A3870 800B3070 1C00A3AF */  sw         $v1, 0x1C($sp)
/* A3874 800B3074 2000A2AF */  sw         $v0, 0x20($sp)
.L800B3078:
/* A3878 800B3078 509F020C */  jal        razSetupSoundRamp
/* A387C 800B307C 00000000 */   nop
/* A3880 800B3080 C4FB80AF */  sw         $zero, %gp_rel(Raziel + 0x594)($gp)
/* A3884 800B3084 C8FB80AF */  sw         $zero, %gp_rel(Raziel + 0x598)($gp)
/* A3888 800B3088 2ACC0208 */  j          .L800B30A8
/* A388C 800B308C 00000000 */   nop
.L800B3090:
/* A3890 800B3090 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* A3894 800B3094 00000000 */  nop
/* A3898 800B3098 03008010 */  beqz       $a0, .L800B30A8
/* A389C 800B309C 00000000 */   nop
/* A38A0 800B30A0 1C02010C */  jal        SndEndLoop
/* A38A4 800B30A4 00000000 */   nop
.L800B30A8:
/* A38A8 800B30A8 3800BF8F */  lw         $ra, 0x38($sp)
/* A38AC 800B30AC 3400B38F */  lw         $s3, 0x34($sp)
/* A38B0 800B30B0 3000B28F */  lw         $s2, 0x30($sp)
/* A38B4 800B30B4 2C00B18F */  lw         $s1, 0x2C($sp)
/* A38B8 800B30B8 2800B08F */  lw         $s0, 0x28($sp)
/* A38BC 800B30BC 0800E003 */  jr         $ra
/* A38C0 800B30C0 4000BD27 */   addiu     $sp, $sp, 0x40
.size ProcessTimers, . - ProcessTimers
