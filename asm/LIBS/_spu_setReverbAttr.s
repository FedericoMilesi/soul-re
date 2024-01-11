.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _spu_setReverbAttr
/* B7700 800C6F00 0000858C */  lw         $a1, 0x0($a0)
/* B7704 800C6F04 00000000 */  nop
/* B7708 800C6F08 0100A62C */  sltiu      $a2, $a1, 0x1
/* B770C 800C6F0C 0300C014 */  bnez       $a2, .L800C6F1C
/* B7710 800C6F10 0100A230 */   andi      $v0, $a1, 0x1
/* B7714 800C6F14 06004010 */  beqz       $v0, .L800C6F30
/* B7718 800C6F18 00000000 */   nop
.L800C6F1C:
/* B771C 800C6F1C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7720 800C6F20 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7724 800C6F24 04008294 */  lhu        $v0, 0x4($a0)
/* B7728 800C6F28 00000000 */  nop
/* B772C 800C6F2C C00162A4 */  sh         $v0, 0x1C0($v1)
.L800C6F30:
/* B7730 800C6F30 0300C014 */  bnez       $a2, .L800C6F40
/* B7734 800C6F34 0200A230 */   andi      $v0, $a1, 0x2
/* B7738 800C6F38 06004010 */  beqz       $v0, .L800C6F54
/* B773C 800C6F3C 00000000 */   nop
.L800C6F40:
/* B7740 800C6F40 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7744 800C6F44 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7748 800C6F48 06008294 */  lhu        $v0, 0x6($a0)
/* B774C 800C6F4C 00000000 */  nop
/* B7750 800C6F50 C20162A4 */  sh         $v0, 0x1C2($v1)
.L800C6F54:
/* B7754 800C6F54 0300C014 */  bnez       $a2, .L800C6F64
/* B7758 800C6F58 0400A230 */   andi      $v0, $a1, 0x4
/* B775C 800C6F5C 06004010 */  beqz       $v0, .L800C6F78
/* B7760 800C6F60 00000000 */   nop
.L800C6F64:
/* B7764 800C6F64 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7768 800C6F68 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B776C 800C6F6C 08008294 */  lhu        $v0, 0x8($a0)
/* B7770 800C6F70 00000000 */  nop
/* B7774 800C6F74 C40162A4 */  sh         $v0, 0x1C4($v1)
.L800C6F78:
/* B7778 800C6F78 0300C014 */  bnez       $a2, .L800C6F88
/* B777C 800C6F7C 0800A230 */   andi      $v0, $a1, 0x8
/* B7780 800C6F80 06004010 */  beqz       $v0, .L800C6F9C
/* B7784 800C6F84 00000000 */   nop
.L800C6F88:
/* B7788 800C6F88 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B778C 800C6F8C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7790 800C6F90 0A008294 */  lhu        $v0, 0xA($a0)
/* B7794 800C6F94 00000000 */  nop
/* B7798 800C6F98 C60162A4 */  sh         $v0, 0x1C6($v1)
.L800C6F9C:
/* B779C 800C6F9C 0300C014 */  bnez       $a2, .L800C6FAC
/* B77A0 800C6FA0 1000A230 */   andi      $v0, $a1, 0x10
/* B77A4 800C6FA4 06004010 */  beqz       $v0, .L800C6FC0
/* B77A8 800C6FA8 00000000 */   nop
.L800C6FAC:
/* B77AC 800C6FAC 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B77B0 800C6FB0 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B77B4 800C6FB4 0C008294 */  lhu        $v0, 0xC($a0)
/* B77B8 800C6FB8 00000000 */  nop
/* B77BC 800C6FBC C80162A4 */  sh         $v0, 0x1C8($v1)
.L800C6FC0:
/* B77C0 800C6FC0 0300C014 */  bnez       $a2, .L800C6FD0
/* B77C4 800C6FC4 2000A230 */   andi      $v0, $a1, 0x20
/* B77C8 800C6FC8 06004010 */  beqz       $v0, .L800C6FE4
/* B77CC 800C6FCC 00000000 */   nop
.L800C6FD0:
/* B77D0 800C6FD0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B77D4 800C6FD4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B77D8 800C6FD8 0E008294 */  lhu        $v0, 0xE($a0)
/* B77DC 800C6FDC 00000000 */  nop
/* B77E0 800C6FE0 CA0162A4 */  sh         $v0, 0x1CA($v1)
.L800C6FE4:
/* B77E4 800C6FE4 0300C014 */  bnez       $a2, .L800C6FF4
/* B77E8 800C6FE8 4000A230 */   andi      $v0, $a1, 0x40
/* B77EC 800C6FEC 06004010 */  beqz       $v0, .L800C7008
/* B77F0 800C6FF0 00000000 */   nop
.L800C6FF4:
/* B77F4 800C6FF4 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B77F8 800C6FF8 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B77FC 800C6FFC 10008294 */  lhu        $v0, 0x10($a0)
/* B7800 800C7000 00000000 */  nop
/* B7804 800C7004 CC0162A4 */  sh         $v0, 0x1CC($v1)
.L800C7008:
/* B7808 800C7008 0300C014 */  bnez       $a2, .L800C7018
/* B780C 800C700C 8000A230 */   andi      $v0, $a1, 0x80
/* B7810 800C7010 06004010 */  beqz       $v0, .L800C702C
/* B7814 800C7014 00000000 */   nop
.L800C7018:
/* B7818 800C7018 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B781C 800C701C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7820 800C7020 12008294 */  lhu        $v0, 0x12($a0)
/* B7824 800C7024 00000000 */  nop
/* B7828 800C7028 CE0162A4 */  sh         $v0, 0x1CE($v1)
.L800C702C:
/* B782C 800C702C 0300C014 */  bnez       $a2, .L800C703C
/* B7830 800C7030 0001A230 */   andi      $v0, $a1, 0x100
/* B7834 800C7034 06004010 */  beqz       $v0, .L800C7050
/* B7838 800C7038 00000000 */   nop
.L800C703C:
/* B783C 800C703C 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7840 800C7040 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7844 800C7044 14008294 */  lhu        $v0, 0x14($a0)
/* B7848 800C7048 00000000 */  nop
/* B784C 800C704C D00162A4 */  sh         $v0, 0x1D0($v1)
.L800C7050:
/* B7850 800C7050 0300C014 */  bnez       $a2, .L800C7060
/* B7854 800C7054 0002A230 */   andi      $v0, $a1, 0x200
/* B7858 800C7058 06004010 */  beqz       $v0, .L800C7074
/* B785C 800C705C 00000000 */   nop
.L800C7060:
/* B7860 800C7060 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7864 800C7064 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7868 800C7068 16008294 */  lhu        $v0, 0x16($a0)
/* B786C 800C706C 00000000 */  nop
/* B7870 800C7070 D20162A4 */  sh         $v0, 0x1D2($v1)
.L800C7074:
/* B7874 800C7074 0300C014 */  bnez       $a2, .L800C7084
/* B7878 800C7078 0004A230 */   andi      $v0, $a1, 0x400
/* B787C 800C707C 06004010 */  beqz       $v0, .L800C7098
/* B7880 800C7080 00000000 */   nop
.L800C7084:
/* B7884 800C7084 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7888 800C7088 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B788C 800C708C 18008294 */  lhu        $v0, 0x18($a0)
/* B7890 800C7090 00000000 */  nop
/* B7894 800C7094 D40162A4 */  sh         $v0, 0x1D4($v1)
.L800C7098:
/* B7898 800C7098 0300C014 */  bnez       $a2, .L800C70A8
/* B789C 800C709C 0008A230 */   andi      $v0, $a1, 0x800
/* B78A0 800C70A0 06004010 */  beqz       $v0, .L800C70BC
/* B78A4 800C70A4 00000000 */   nop
.L800C70A8:
/* B78A8 800C70A8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B78AC 800C70AC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B78B0 800C70B0 1A008294 */  lhu        $v0, 0x1A($a0)
/* B78B4 800C70B4 00000000 */  nop
/* B78B8 800C70B8 D60162A4 */  sh         $v0, 0x1D6($v1)
.L800C70BC:
/* B78BC 800C70BC 0300C014 */  bnez       $a2, .L800C70CC
/* B78C0 800C70C0 0010A230 */   andi      $v0, $a1, 0x1000
/* B78C4 800C70C4 06004010 */  beqz       $v0, .L800C70E0
/* B78C8 800C70C8 00000000 */   nop
.L800C70CC:
/* B78CC 800C70CC 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B78D0 800C70D0 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B78D4 800C70D4 1C008294 */  lhu        $v0, 0x1C($a0)
/* B78D8 800C70D8 00000000 */  nop
/* B78DC 800C70DC D80162A4 */  sh         $v0, 0x1D8($v1)
.L800C70E0:
/* B78E0 800C70E0 0300C014 */  bnez       $a2, .L800C70F0
/* B78E4 800C70E4 0020A230 */   andi      $v0, $a1, 0x2000
/* B78E8 800C70E8 06004010 */  beqz       $v0, .L800C7104
/* B78EC 800C70EC 00000000 */   nop
.L800C70F0:
/* B78F0 800C70F0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B78F4 800C70F4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B78F8 800C70F8 1E008294 */  lhu        $v0, 0x1E($a0)
/* B78FC 800C70FC 00000000 */  nop
/* B7900 800C7100 DA0162A4 */  sh         $v0, 0x1DA($v1)
.L800C7104:
/* B7904 800C7104 0300C014 */  bnez       $a2, .L800C7114
/* B7908 800C7108 0040A230 */   andi      $v0, $a1, 0x4000
/* B790C 800C710C 06004010 */  beqz       $v0, .L800C7128
/* B7910 800C7110 00000000 */   nop
.L800C7114:
/* B7914 800C7114 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7918 800C7118 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B791C 800C711C 20008294 */  lhu        $v0, 0x20($a0)
/* B7920 800C7120 00000000 */  nop
/* B7924 800C7124 DC0162A4 */  sh         $v0, 0x1DC($v1)
.L800C7128:
/* B7928 800C7128 0300C014 */  bnez       $a2, .L800C7138
/* B792C 800C712C 0080A230 */   andi      $v0, $a1, 0x8000
/* B7930 800C7130 06004010 */  beqz       $v0, .L800C714C
/* B7934 800C7134 00000000 */   nop
.L800C7138:
/* B7938 800C7138 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B793C 800C713C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7940 800C7140 22008294 */  lhu        $v0, 0x22($a0)
/* B7944 800C7144 00000000 */  nop
/* B7948 800C7148 DE0162A4 */  sh         $v0, 0x1DE($v1)
.L800C714C:
/* B794C 800C714C 0400C014 */  bnez       $a2, .L800C7160
/* B7950 800C7150 0100023C */   lui       $v0, (0x10000 >> 16)
/* B7954 800C7154 2410A200 */  and        $v0, $a1, $v0
/* B7958 800C7158 06004010 */  beqz       $v0, .L800C7174
/* B795C 800C715C 00000000 */   nop
.L800C7160:
/* B7960 800C7160 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7964 800C7164 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7968 800C7168 24008294 */  lhu        $v0, 0x24($a0)
/* B796C 800C716C 00000000 */  nop
/* B7970 800C7170 E00162A4 */  sh         $v0, 0x1E0($v1)
.L800C7174:
/* B7974 800C7174 0400C014 */  bnez       $a2, .L800C7188
/* B7978 800C7178 0200023C */   lui       $v0, (0x20000 >> 16)
/* B797C 800C717C 2410A200 */  and        $v0, $a1, $v0
/* B7980 800C7180 06004010 */  beqz       $v0, .L800C719C
/* B7984 800C7184 00000000 */   nop
.L800C7188:
/* B7988 800C7188 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B798C 800C718C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7990 800C7190 26008294 */  lhu        $v0, 0x26($a0)
/* B7994 800C7194 00000000 */  nop
/* B7998 800C7198 E20162A4 */  sh         $v0, 0x1E2($v1)
.L800C719C:
/* B799C 800C719C 0400C014 */  bnez       $a2, .L800C71B0
/* B79A0 800C71A0 0400023C */   lui       $v0, (0x40000 >> 16)
/* B79A4 800C71A4 2410A200 */  and        $v0, $a1, $v0
/* B79A8 800C71A8 06004010 */  beqz       $v0, .L800C71C4
/* B79AC 800C71AC 00000000 */   nop
.L800C71B0:
/* B79B0 800C71B0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B79B4 800C71B4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B79B8 800C71B8 28008294 */  lhu        $v0, 0x28($a0)
/* B79BC 800C71BC 00000000 */  nop
/* B79C0 800C71C0 E40162A4 */  sh         $v0, 0x1E4($v1)
.L800C71C4:
/* B79C4 800C71C4 0400C014 */  bnez       $a2, .L800C71D8
/* B79C8 800C71C8 0800023C */   lui       $v0, (0x80000 >> 16)
/* B79CC 800C71CC 2410A200 */  and        $v0, $a1, $v0
/* B79D0 800C71D0 06004010 */  beqz       $v0, .L800C71EC
/* B79D4 800C71D4 00000000 */   nop
.L800C71D8:
/* B79D8 800C71D8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B79DC 800C71DC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B79E0 800C71E0 2A008294 */  lhu        $v0, 0x2A($a0)
/* B79E4 800C71E4 00000000 */  nop
/* B79E8 800C71E8 E60162A4 */  sh         $v0, 0x1E6($v1)
.L800C71EC:
/* B79EC 800C71EC 0400C014 */  bnez       $a2, .L800C7200
/* B79F0 800C71F0 1000023C */   lui       $v0, (0x100000 >> 16)
/* B79F4 800C71F4 2410A200 */  and        $v0, $a1, $v0
/* B79F8 800C71F8 06004010 */  beqz       $v0, .L800C7214
/* B79FC 800C71FC 00000000 */   nop
.L800C7200:
/* B7A00 800C7200 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7A04 800C7204 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7A08 800C7208 2C008294 */  lhu        $v0, 0x2C($a0)
/* B7A0C 800C720C 00000000 */  nop
/* B7A10 800C7210 E80162A4 */  sh         $v0, 0x1E8($v1)
.L800C7214:
/* B7A14 800C7214 0400C014 */  bnez       $a2, .L800C7228
/* B7A18 800C7218 2000023C */   lui       $v0, (0x200000 >> 16)
/* B7A1C 800C721C 2410A200 */  and        $v0, $a1, $v0
/* B7A20 800C7220 06004010 */  beqz       $v0, .L800C723C
/* B7A24 800C7224 00000000 */   nop
.L800C7228:
/* B7A28 800C7228 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7A2C 800C722C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7A30 800C7230 2E008294 */  lhu        $v0, 0x2E($a0)
/* B7A34 800C7234 00000000 */  nop
/* B7A38 800C7238 EA0162A4 */  sh         $v0, 0x1EA($v1)
.L800C723C:
/* B7A3C 800C723C 0400C014 */  bnez       $a2, .L800C7250
/* B7A40 800C7240 4000023C */   lui       $v0, (0x400000 >> 16)
/* B7A44 800C7244 2410A200 */  and        $v0, $a1, $v0
/* B7A48 800C7248 06004010 */  beqz       $v0, .L800C7264
/* B7A4C 800C724C 00000000 */   nop
.L800C7250:
/* B7A50 800C7250 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7A54 800C7254 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7A58 800C7258 30008294 */  lhu        $v0, 0x30($a0)
/* B7A5C 800C725C 00000000 */  nop
/* B7A60 800C7260 EC0162A4 */  sh         $v0, 0x1EC($v1)
.L800C7264:
/* B7A64 800C7264 0400C014 */  bnez       $a2, .L800C7278
/* B7A68 800C7268 8000023C */   lui       $v0, (0x800000 >> 16)
/* B7A6C 800C726C 2410A200 */  and        $v0, $a1, $v0
/* B7A70 800C7270 06004010 */  beqz       $v0, .L800C728C
/* B7A74 800C7274 00000000 */   nop
.L800C7278:
/* B7A78 800C7278 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7A7C 800C727C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7A80 800C7280 32008294 */  lhu        $v0, 0x32($a0)
/* B7A84 800C7284 00000000 */  nop
/* B7A88 800C7288 EE0162A4 */  sh         $v0, 0x1EE($v1)
.L800C728C:
/* B7A8C 800C728C 0400C014 */  bnez       $a2, .L800C72A0
/* B7A90 800C7290 0001023C */   lui       $v0, (0x1000000 >> 16)
/* B7A94 800C7294 2410A200 */  and        $v0, $a1, $v0
/* B7A98 800C7298 06004010 */  beqz       $v0, .L800C72B4
/* B7A9C 800C729C 00000000 */   nop
.L800C72A0:
/* B7AA0 800C72A0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7AA4 800C72A4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7AA8 800C72A8 34008294 */  lhu        $v0, 0x34($a0)
/* B7AAC 800C72AC 00000000 */  nop
/* B7AB0 800C72B0 F00162A4 */  sh         $v0, 0x1F0($v1)
.L800C72B4:
/* B7AB4 800C72B4 0400C014 */  bnez       $a2, .L800C72C8
/* B7AB8 800C72B8 0002023C */   lui       $v0, (0x2000000 >> 16)
/* B7ABC 800C72BC 2410A200 */  and        $v0, $a1, $v0
/* B7AC0 800C72C0 06004010 */  beqz       $v0, .L800C72DC
/* B7AC4 800C72C4 00000000 */   nop
.L800C72C8:
/* B7AC8 800C72C8 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7ACC 800C72CC 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7AD0 800C72D0 36008294 */  lhu        $v0, 0x36($a0)
/* B7AD4 800C72D4 00000000 */  nop
/* B7AD8 800C72D8 F20162A4 */  sh         $v0, 0x1F2($v1)
.L800C72DC:
/* B7ADC 800C72DC 0400C014 */  bnez       $a2, .L800C72F0
/* B7AE0 800C72E0 0004023C */   lui       $v0, (0x4000000 >> 16)
/* B7AE4 800C72E4 2410A200 */  and        $v0, $a1, $v0
/* B7AE8 800C72E8 06004010 */  beqz       $v0, .L800C7304
/* B7AEC 800C72EC 00000000 */   nop
.L800C72F0:
/* B7AF0 800C72F0 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7AF4 800C72F4 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7AF8 800C72F8 38008294 */  lhu        $v0, 0x38($a0)
/* B7AFC 800C72FC 00000000 */  nop
/* B7B00 800C7300 F40162A4 */  sh         $v0, 0x1F4($v1)
.L800C7304:
/* B7B04 800C7304 0400C014 */  bnez       $a2, .L800C7318
/* B7B08 800C7308 0008023C */   lui       $v0, (0x8000000 >> 16)
/* B7B0C 800C730C 2410A200 */  and        $v0, $a1, $v0
/* B7B10 800C7310 06004010 */  beqz       $v0, .L800C732C
/* B7B14 800C7314 00000000 */   nop
.L800C7318:
/* B7B18 800C7318 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7B1C 800C731C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7B20 800C7320 3A008294 */  lhu        $v0, 0x3A($a0)
/* B7B24 800C7324 00000000 */  nop
/* B7B28 800C7328 F60162A4 */  sh         $v0, 0x1F6($v1)
.L800C732C:
/* B7B2C 800C732C 0400C014 */  bnez       $a2, .L800C7340
/* B7B30 800C7330 0010023C */   lui       $v0, (0x10000000 >> 16)
/* B7B34 800C7334 2410A200 */  and        $v0, $a1, $v0
/* B7B38 800C7338 06004010 */  beqz       $v0, .L800C7354
/* B7B3C 800C733C 00000000 */   nop
.L800C7340:
/* B7B40 800C7340 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7B44 800C7344 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7B48 800C7348 3C008294 */  lhu        $v0, 0x3C($a0)
/* B7B4C 800C734C 00000000 */  nop
/* B7B50 800C7350 F80162A4 */  sh         $v0, 0x1F8($v1)
.L800C7354:
/* B7B54 800C7354 0400C014 */  bnez       $a2, .L800C7368
/* B7B58 800C7358 0020023C */   lui       $v0, (0x20000000 >> 16)
/* B7B5C 800C735C 2410A200 */  and        $v0, $a1, $v0
/* B7B60 800C7360 06004010 */  beqz       $v0, .L800C737C
/* B7B64 800C7364 00000000 */   nop
.L800C7368:
/* B7B68 800C7368 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7B6C 800C736C 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7B70 800C7370 3E008294 */  lhu        $v0, 0x3E($a0)
/* B7B74 800C7374 00000000 */  nop
/* B7B78 800C7378 FA0162A4 */  sh         $v0, 0x1FA($v1)
.L800C737C:
/* B7B7C 800C737C 0400C014 */  bnez       $a2, .L800C7390
/* B7B80 800C7380 0040023C */   lui       $v0, (0x40000000 >> 16)
/* B7B84 800C7384 2410A200 */  and        $v0, $a1, $v0
/* B7B88 800C7388 06004010 */  beqz       $v0, .L800C73A4
/* B7B8C 800C738C 00000000 */   nop
.L800C7390:
/* B7B90 800C7390 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7B94 800C7394 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7B98 800C7398 40008294 */  lhu        $v0, 0x40($a0)
/* B7B9C 800C739C 00000000 */  nop
/* B7BA0 800C73A0 FC0162A4 */  sh         $v0, 0x1FC($v1)
.L800C73A4:
/* B7BA4 800C73A4 0300C014 */  bnez       $a2, .L800C73B4
/* B7BA8 800C73A8 00000000 */   nop
/* B7BAC 800C73AC 0600A104 */  bgez       $a1, .L800C73C8
/* B7BB0 800C73B0 00000000 */   nop
.L800C73B4:
/* B7BB4 800C73B4 0D80033C */  lui        $v1, %hi(_spu_RXX)
/* B7BB8 800C73B8 5CED638C */  lw         $v1, %lo(_spu_RXX)($v1)
/* B7BBC 800C73BC 42008294 */  lhu        $v0, 0x42($a0)
/* B7BC0 800C73C0 00000000 */  nop
/* B7BC4 800C73C4 FE0162A4 */  sh         $v0, 0x1FE($v1)
.L800C73C8:
/* B7BC8 800C73C8 0800E003 */  jr         $ra
/* B7BCC 800C73CC 00000000 */   nop
.size _spu_setReverbAttr, . - _spu_setReverbAttr
