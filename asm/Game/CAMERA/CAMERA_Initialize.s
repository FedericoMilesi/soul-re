.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_Initialize
/* 66EC 80015EEC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 66F0 80015EF0 1400B1AF */  sw         $s1, 0x14($sp)
/* 66F4 80015EF4 21888000 */  addu       $s1, $a0, $zero
/* 66F8 80015EF8 21280000 */  addu       $a1, $zero, $zero
/* 66FC 80015EFC C4040624 */  addiu      $a2, $zero, 0x4C4
/* 6700 80015F00 2000BFAF */  sw         $ra, 0x20($sp)
/* 6704 80015F04 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6708 80015F08 1800B2AF */  sw         $s2, 0x18($sp)
/* 670C 80015F0C 2EF2020C */  jal        func_800BC8B8
/* 6710 80015F10 1000B0AF */   sw        $s0, 0x10($sp)
/* 6714 80015F14 21900000 */  addu       $s2, $zero, $zero
.L80015F18:
/* 6718 80015F18 3AF2020C */  jal        func_800BC8E8
/* 671C 80015F1C 00000000 */   nop
/* 6720 80015F20 21204000 */  addu       $a0, $v0, $zero
/* 6724 80015F24 21288000 */  addu       $a1, $a0, $zero
/* 6728 80015F28 C0181200 */  sll        $v1, $s2, 3
/* 672C 80015F2C E4AB8227 */  addiu      $v0, $gp, %gp_rel(camera_shakeOffset)
/* 6730 80015F30 02008104 */  bgez       $a0, .L80015F3C
/* 6734 80015F34 21806200 */   addu      $s0, $v1, $v0
/* 6738 80015F38 FF008524 */  addiu      $a1, $a0, 0xFF
.L80015F3C:
/* 673C 80015F3C 03120500 */  sra        $v0, $a1, 8
/* 6740 80015F40 00120200 */  sll        $v0, $v0, 8
/* 6744 80015F44 23108200 */  subu       $v0, $a0, $v0
/* 6748 80015F48 80FF4224 */  addiu      $v0, $v0, -0x80
/* 674C 80015F4C 3AF2020C */  jal        func_800BC8E8
/* 6750 80015F50 000002A6 */   sh        $v0, 0x0($s0)
/* 6754 80015F54 21184000 */  addu       $v1, $v0, $zero
/* 6758 80015F58 03006104 */  bgez       $v1, .L80015F68
/* 675C 80015F5C 03120200 */   sra       $v0, $v0, 8
/* 6760 80015F60 FF006224 */  addiu      $v0, $v1, 0xFF
/* 6764 80015F64 03120200 */  sra        $v0, $v0, 8
.L80015F68:
/* 6768 80015F68 00120200 */  sll        $v0, $v0, 8
/* 676C 80015F6C 23106200 */  subu       $v0, $v1, $v0
/* 6770 80015F70 80FF4224 */  addiu      $v0, $v0, -0x80
/* 6774 80015F74 3AF2020C */  jal        func_800BC8E8
/* 6778 80015F78 020002A6 */   sh        $v0, 0x2($s0)
/* 677C 80015F7C 21184000 */  addu       $v1, $v0, $zero
/* 6780 80015F80 03006104 */  bgez       $v1, .L80015F90
/* 6784 80015F84 03120200 */   sra       $v0, $v0, 8
/* 6788 80015F88 FF006224 */  addiu      $v0, $v1, 0xFF
/* 678C 80015F8C 03120200 */  sra        $v0, $v0, 8
.L80015F90:
/* 6790 80015F90 00120200 */  sll        $v0, $v0, 8
/* 6794 80015F94 23106200 */  subu       $v0, $v1, $v0
/* 6798 80015F98 80FF4224 */  addiu      $v0, $v0, -0x80
/* 679C 80015F9C 040002A6 */  sh         $v0, 0x4($s0)
/* 67A0 80015FA0 01005226 */  addiu      $s2, $s2, 0x1
/* 67A4 80015FA4 1000422A */  slti       $v0, $s2, 0x10
/* 67A8 80015FA8 DBFF4014 */  bnez       $v0, .L80015F18
/* 67AC 80015FAC 0100043C */   lui       $a0, (0x13240 >> 16)
/* 67B0 80015FB0 40328434 */  ori        $a0, $a0, (0x13240 & 0xFFFF)
/* 67B4 80015FB4 C70F0224 */  addiu      $v0, $zero, 0xFC7
/* 67B8 80015FB8 DC050324 */  addiu      $v1, $zero, 0x5DC
/* 67BC 80015FBC B00022A6 */  sh         $v0, 0xB0($s1)
/* 67C0 80015FC0 A00122A6 */  sh         $v0, 0x1A0($s1)
/* 67C4 80015FC4 3C0122A6 */  sh         $v0, 0x13C($s1)
/* 67C8 80015FC8 B20122A6 */  sh         $v0, 0x1B2($s1)
/* 67CC 80015FCC CA080224 */  addiu      $v0, $zero, 0x8CA
/* 67D0 80015FD0 2C0223AE */  sw         $v1, 0x22C($s1)
/* 67D4 80015FD4 380223AE */  sw         $v1, 0x238($s1)
/* 67D8 80015FD8 D0070324 */  addiu      $v1, $zero, 0x7D0
/* 67DC 80015FDC 300222AE */  sw         $v0, 0x230($s1)
/* 67E0 80015FE0 3C0223AE */  sw         $v1, 0x23C($s1)
/* 67E4 80015FE4 4C0223AE */  sw         $v1, 0x24C($s1)
/* 67E8 80015FE8 30022396 */  lhu        $v1, 0x230($s1)
/* 67EC 80015FEC 800C0224 */  addiu      $v0, $zero, 0xC80
/* 67F0 80015FF0 340222AE */  sw         $v0, 0x234($s1)
/* 67F4 80015FF4 280A0224 */  addiu      $v0, $zero, 0xA28
/* 67F8 80015FF8 400222AE */  sw         $v0, 0x240($s1)
/* 67FC 80015FFC B0040224 */  addiu      $v0, $zero, 0x4B0
/* 6800 80016000 440222AE */  sw         $v0, 0x244($s1)
/* 6804 80016004 40060224 */  addiu      $v0, $zero, 0x640
/* 6808 80016008 480222AE */  sw         $v0, 0x248($s1)
/* 680C 8001600C C70F0224 */  addiu      $v0, $zero, 0xFC7
/* 6810 80016010 500222AE */  sw         $v0, 0x250($s1)
/* 6814 80016014 540222AE */  sw         $v0, 0x254($s1)
/* 6818 80016018 580222AE */  sw         $v0, 0x258($s1)
/* 681C 8001601C 5C0222AE */  sw         $v0, 0x25C($s1)
/* 6820 80016020 600222AE */  sw         $v0, 0x260($s1)
/* 6824 80016024 640222AE */  sw         $v0, 0x264($s1)
/* 6828 80016028 680222AE */  sw         $v0, 0x268($s1)
/* 682C 8001602C 6C0222AE */  sw         $v0, 0x26C($s1)
/* 6830 80016030 700222AE */  sw         $v0, 0x270($s1)
/* 6834 80016034 18010224 */  addiu      $v0, $zero, 0x118
/* 6838 80016038 E00124AE */  sw         $a0, 0x1E0($s1)
/* 683C 8001603C D40124AE */  sw         $a0, 0x1D4($s1)
/* 6840 80016040 EC0124AE */  sw         $a0, 0x1EC($s1)
/* 6844 80016044 40010424 */  addiu      $a0, $zero, 0x140
/* 6848 80016048 DE0122A6 */  sh         $v0, 0x1DE($s1)
/* 684C 8001604C D20122A6 */  sh         $v0, 0x1D2($s1)
/* 6850 80016050 EA0122A6 */  sh         $v0, 0x1EA($s1)
/* 6854 80016054 32000224 */  addiu      $v0, $zero, 0x32
/* 6858 80016058 6C0022AE */  sw         $v0, 0x6C($s1)
/* 685C 8001605C E02E0224 */  addiu      $v0, $zero, 0x2EE0
/* 6860 80016060 680024AE */  sw         $a0, 0x68($s1)
/* 6864 80016064 A80123A6 */  sh         $v1, 0x1A8($s1)
/* 6868 80016068 060123A6 */  sh         $v1, 0x106($s1)
/* 686C 8001606C 640022AE */  sw         $v0, 0x64($s1)
/* 6870 80016070 F0000224 */  addiu      $v0, $zero, 0xF0
/* 6874 80016074 AC0022AE */  sw         $v0, 0xAC($s1)
/* 6878 80016078 74AB8227 */  addiu      $v0, $gp, %gp_rel(wcTransformX)
/* 687C 8001607C 600022AE */  sw         $v0, 0x60($s1)
/* 6880 80016080 94AB8227 */  addiu      $v0, $gp, %gp_rel(wcTransform2X)
/* 6884 80016084 700022AE */  sw         $v0, 0x70($s1)
/* 6888 80016088 B4AB8227 */  addiu      $v0, $gp, %gp_rel(cwTransform2X)
/* 688C 8001608C 740022AE */  sw         $v0, 0x74($s1)
/* 6890 80016090 10000224 */  addiu      $v0, $zero, 0x10
/* 6894 80016094 C40122A6 */  sh         $v0, 0x1C4($s1)
/* 6898 80016098 C8000224 */  addiu      $v0, $zero, 0xC8
/* 689C 8001609C A00020AE */  sw         $zero, 0xA0($s1)
/* 68A0 800160A0 A40024AE */  sw         $a0, 0xA4($s1)
/* 68A4 800160A4 A80020AE */  sw         $zero, 0xA8($s1)
/* 68A8 800160A8 940122A6 */  sh         $v0, 0x194($s1)
/* 68AC 800160AC AE0420A6 */  sh         $zero, 0x4AE($s1)
/* 68B0 800160B0 B00420A6 */  sh         $zero, 0x4B0($s1)
/* 68B4 800160B4 0301278A */  lwl        $a3, 0x103($s1)
/* 68B8 800160B8 0001279A */  lwr        $a3, 0x100($s1)
/* 68BC 800160BC 04012886 */  lh         $t0, 0x104($s1)
/* 68C0 800160C0 AB0427AA */  swl        $a3, 0x4AB($s1)
/* 68C4 800160C4 A80427BA */  swr        $a3, 0x4A8($s1)
/* 68C8 800160C8 AC0428A6 */  sh         $t0, 0x4AC($s1)
/* 68CC 800160CC 04012396 */  lhu        $v1, 0x104($s1)
/* 68D0 800160D0 00020224 */  addiu      $v0, $zero, 0x200
/* 68D4 800160D4 FC0122AE */  sw         $v0, 0x1FC($s1)
/* 68D8 800160D8 E800228E */  lw         $v0, 0xE8($s1)
/* 68DC 800160DC 00101324 */  addiu      $s3, $zero, 0x1000
/* 68E0 800160E0 200420AE */  sw         $zero, 0x420($s1)
/* 68E4 800160E4 1C0420AE */  sw         $zero, 0x41C($s1)
/* 68E8 800160E8 448E80A7 */  sh         $zero, %gp_rel(shorten_count)($gp)
/* 68EC 800160EC 468E80A7 */  sh         $zero, %gp_rel(shorten_flag)($gp)
/* 68F0 800160F0 000233AE */  sw         $s3, 0x200($s1)
/* 68F4 800160F4 BA0423A6 */  sh         $v1, 0x4BA($s1)
/* 68F8 800160F8 0801238E */  lw         $v1, 0x108($s1)
/* 68FC 800160FC 00084234 */  ori        $v0, $v0, 0x800
/* 6900 80016100 03006010 */  beqz       $v1, .L80016110
/* 6904 80016104 E80022AE */   sw        $v0, 0xE8($s1)
/* 6908 80016108 8970000C */  jal        CAMERA_EndLook
/* 690C 8001610C 21202002 */   addu      $a0, $s1, $zero
.L80016110:
/* 6910 80016110 21202002 */  addu       $a0, $s1, $zero
/* 6914 80016114 02001224 */  addiu      $s2, $zero, 0x2
/* 6918 80016118 7891858F */  lw         $a1, %gp_rel(playerCameraMode)($gp)
/* 691C 8001611C 01001024 */  addiu      $s0, $zero, 0x1
/* 6920 80016120 F40130A6 */  sh         $s0, 0x1F4($s1)
/* 6924 80016124 8F56000C */  jal        CAMERA_SetMode
/* 6928 80016128 F00020A6 */   sh        $zero, 0xF0($s1)
/* 692C 8001612C 08002426 */  addiu      $a0, $s1, 0x8
/* 6930 80016130 B80B0224 */  addiu      $v0, $zero, 0xBB8
/* 6934 80016134 1C0222AE */  sw         $v0, 0x21C($s1)
/* 6938 80016138 E800228E */  lw         $v0, 0xE8($s1)
/* 693C 8001613C FFFF0324 */  addiu      $v1, $zero, -0x1
/* 6940 80016140 180220AE */  sw         $zero, 0x218($s1)
/* 6944 80016144 0C0430A6 */  sh         $s0, 0x40C($s1)
/* 6948 80016148 BE0033A6 */  sh         $s3, 0xBE($s1)
/* 694C 8001614C BC0033A6 */  sh         $s3, 0xBC($s1)
/* 6950 80016150 BA0033A6 */  sh         $s3, 0xBA($s1)
/* 6954 80016154 780223A6 */  sh         $v1, 0x278($s1)
/* 6958 80016158 7A0223A6 */  sh         $v1, 0x27A($s1)
/* 695C 8001615C 00804234 */  ori        $v0, $v0, 0x8000
/* 6960 80016160 E80022AE */  sw         $v0, 0xE8($s1)
.L80016164:
/* 6964 80016164 7C0280AC */  sw         $zero, 0x27C($a0)
/* 6968 80016168 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 696C 8001616C FDFF4106 */  bgez       $s2, .L80016164
/* 6970 80016170 FCFF8424 */   addiu     $a0, $a0, -0x4
/* 6974 80016174 21202002 */  addu       $a0, $s1, $zero
/* 6978 80016178 40010524 */  addiu      $a1, $zero, 0x140
/* 697C 8001617C 2110A000 */  addu       $v0, $a1, $zero
/* 6980 80016180 CB53000C */  jal        CAMERA_SetProjDistance
/* 6984 80016184 680022AE */   sw        $v0, 0x68($s1)
/* 6988 80016188 360420A6 */  sh         $zero, 0x436($s1)
/* 698C 8001618C 2000BF8F */  lw         $ra, 0x20($sp)
/* 6990 80016190 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6994 80016194 1800B28F */  lw         $s2, 0x18($sp)
/* 6998 80016198 1400B18F */  lw         $s1, 0x14($sp)
/* 699C 8001619C 1000B08F */  lw         $s0, 0x10($sp)
/* 69A0 800161A0 00020224 */  addiu      $v0, $zero, 0x200
/* 69A4 800161A4 8CAC82A7 */  sh         $v0, %gp_rel(Camera_lookHeight)($gp)
/* 69A8 800161A8 8A020224 */  addiu      $v0, $zero, 0x28A
/* 69AC 800161AC 8EAC82A7 */  sh         $v0, %gp_rel(Camera_lookDist)($gp)
/* 69B0 800161B0 0A000224 */  addiu      $v0, $zero, 0xA
/* 69B4 800161B4 5CB182AF */  sw         $v0, %gp_rel(CameraCenterDelay)($gp)
/* 69B8 800161B8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 69BC 800161BC DCAB82A7 */  sh         $v0, %gp_rel(CenterFlag)($gp)
/* 69C0 800161C0 B80B0224 */  addiu      $v0, $zero, 0xBB8
/* 69C4 800161C4 D4AB82A7 */  sh         $v0, %gp_rel(combat_cam_distance)($gp)
/* 69C8 800161C8 00100224 */  addiu      $v0, $zero, 0x1000
/* 69CC 800161CC 4C8E80AF */  sw         $zero, %gp_rel(roll_target)($gp)
/* 69D0 800161D0 508E80AF */  sw         $zero, %gp_rel(current_roll_amount)($gp)
/* 69D4 800161D4 548E80AF */  sw         $zero, %gp_rel(roll_inc)($gp)
/* 69D8 800161D8 D6AB80A7 */  sh         $zero, %gp_rel(combat_cam_angle)($gp)
/* 69DC 800161DC D8AB82A7 */  sh         $v0, %gp_rel(combat_cam_weight)($gp)
/* 69E0 800161E0 DAAB80A7 */  sh         $zero, %gp_rel(combat_cam_debounce)($gp)
/* 69E4 800161E4 0800E003 */  jr         $ra
/* 69E8 800161E8 2800BD27 */   addiu     $sp, $sp, 0x28
.size CAMERA_Initialize, . - CAMERA_Initialize
