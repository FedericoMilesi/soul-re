.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RazielQuery
/* A1734 800B0F34 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* A1738 800B0F38 2800B0AF */  sw         $s0, 0x28($sp)
/* A173C 800B0F3C 21808000 */  addu       $s0, $a0, $zero
/* A1740 800B0F40 FFFFA324 */  addiu      $v1, $a1, -0x1
/* A1744 800B0F44 2E00622C */  sltiu      $v0, $v1, 0x2E
/* A1748 800B0F48 CC004010 */  beqz       $v0, .L800B127C
/* A174C 800B0F4C 2C00BFAF */   sw        $ra, 0x2C($sp)
/* A1750 800B0F50 0180023C */  lui        $v0, %hi(jtbl_80012344)
/* A1754 800B0F54 44234224 */  addiu      $v0, $v0, %lo(jtbl_80012344)
/* A1758 800B0F58 80180300 */  sll        $v1, $v1, 2
/* A175C 800B0F5C 21186200 */  addu       $v1, $v1, $v0
/* A1760 800B0F60 0000628C */  lw         $v0, 0x0($v1)
/* A1764 800B0F64 00000000 */  nop
/* A1768 800B0F68 08004000 */  jr         $v0
/* A176C 800B0F6C 00000000 */   nop
jlabel .L800B0F70
/* A1770 800B0F70 A0C40208 */  j          .L800B1280
/* A1774 800B0F74 01000224 */   addiu     $v0, $zero, 0x1
jlabel .L800B0F78
/* A1778 800B0F78 9CA6828F */  lw         $v0, %gp_rel(WaterStatus)($gp)
/* A177C 800B0F7C A0C40208 */  j          .L800B1280
/* A1780 800B0F80 00000000 */   nop
jlabel .L800B0F84
/* A1784 800B0F84 5C000486 */  lh         $a0, 0x5C($s0)
/* A1788 800B0F88 5E000586 */  lh         $a1, 0x5E($s0)
/* A178C 800B0F8C 60000686 */  lh         $a2, 0x60($s0)
/* A1790 800B0F90 3CC4010C */  jal        SetPositionData
/* A1794 800B0F94 00000000 */   nop
/* A1798 800B0F98 A0C40208 */  j          .L800B1280
/* A179C 800B0F9C 00000000 */   nop
jlabel .L800B0FA0
/* A17A0 800B0FA0 D0FC838F */  lw         $v1, %gp_rel(ExtraRot)($gp)
/* A17A4 800B0FA4 00000000 */  nop
/* A17A8 800B0FA8 B5006010 */  beqz       $v1, .L800B1280
/* A17AC 800B0FAC 21100000 */   addu      $v0, $zero, $zero
/* A17B0 800B0FB0 A0C40208 */  j          .L800B1280
/* A17B4 800B0FB4 21106000 */   addu      $v0, $v1, $zero
jlabel .L800B0FB8
/* A17B8 800B0FB8 B8F9838F */  lw         $v1, %gp_rel(Raziel + 0x388)($gp)
/* A17BC 800B0FBC 04000224 */  addiu      $v0, $zero, 0x4
/* A17C0 800B0FC0 08006214 */  bne        $v1, $v0, .L800B0FE4
/* A17C4 800B0FC4 00000000 */   nop
/* A17C8 800B0FC8 74000486 */  lh         $a0, 0x74($s0)
/* A17CC 800B0FCC 76000586 */  lh         $a1, 0x76($s0)
/* A17D0 800B0FD0 C0F9868F */  lw         $a2, %gp_rel(Raziel + 0x390)($gp)
/* A17D4 800B0FD4 3CC4010C */  jal        SetPositionData
/* A17D8 800B0FD8 00000000 */   nop
/* A17DC 800B0FDC A0C40208 */  j          .L800B1280
/* A17E0 800B0FE0 00000000 */   nop
.L800B0FE4:
/* A17E4 800B0FE4 74000486 */  lh         $a0, 0x74($s0)
/* A17E8 800B0FE8 76000586 */  lh         $a1, 0x76($s0)
/* A17EC 800B0FEC 78000686 */  lh         $a2, 0x78($s0)
/* A17F0 800B0FF0 3CC4010C */  jal        SetPositionData
/* A17F4 800B0FF4 00000000 */   nop
/* A17F8 800B0FF8 A0C40208 */  j          .L800B1280
/* A17FC 800B0FFC 00000000 */   nop
jlabel .L800B1000
/* A1800 800B1000 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A1804 800B1004 A0C40208 */  j          .L800B1280
/* A1808 800B1008 00000000 */   nop
jlabel .L800B100C
/* A180C 800B100C 68FA828F */  lw         $v0, %gp_rel(Raziel + 0x438)($gp)
/* A1810 800B1010 A0C40208 */  j          .L800B1280
/* A1814 800B1014 00000000 */   nop
jlabel .L800B1018
/* A1818 800B1018 4400048E */  lw         $a0, 0x44($s0)
/* A181C 800B101C 00000000 */  nop
/* A1820 800B1020 97008010 */  beqz       $a0, .L800B1280
/* A1824 800B1024 21100000 */   addu      $v0, $zero, $zero
/* A1828 800B1028 A0C40208 */  j          .L800B1280
/* A182C 800B102C 21108000 */   addu      $v0, $a0, $zero
jlabel .L800B1030
/* A1830 800B1030 4400028E */  lw         $v0, 0x44($s0)
/* A1834 800B1034 00000000 */  nop
/* A1838 800B1038 90004010 */  beqz       $v0, .L800B127C
/* A183C 800B103C E0014224 */   addiu     $v0, $v0, 0x1E0
/* A1840 800B1040 A0C40208 */  j          .L800B1280
/* A1844 800B1044 00000000 */   nop
jlabel .L800B1048
/* A1848 800B1048 6DC3010C */  jal        CIRC_Alloc
/* A184C 800B104C 08000424 */   addiu     $a0, $zero, 0x8
/* A1850 800B1050 21204000 */  addu       $a0, $v0, $zero
/* A1854 800B1054 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* A1858 800B1058 0400023C */  lui        $v0, (0x40000 >> 16)
/* A185C 800B105C 10006214 */  bne        $v1, $v0, .L800B10A0
/* A1860 800B1060 00000000 */   nop
/* A1864 800B1064 4000028E */  lw         $v0, 0x40($s0)
/* A1868 800B1068 00000000 */  nop
/* A186C 800B106C 24004294 */  lhu        $v0, 0x24($v0)
/* A1870 800B1070 00000000 */  nop
/* A1874 800B1074 000082A4 */  sh         $v0, 0x0($a0)
/* A1878 800B1078 4000028E */  lw         $v0, 0x40($s0)
/* A187C 800B107C 00000000 */  nop
/* A1880 800B1080 2A004294 */  lhu        $v0, 0x2A($v0)
/* A1884 800B1084 00000000 */  nop
/* A1888 800B1088 020082A4 */  sh         $v0, 0x2($a0)
/* A188C 800B108C 4000028E */  lw         $v0, 0x40($s0)
/* A1890 800B1090 00000000 */  nop
/* A1894 800B1094 30004294 */  lhu        $v0, 0x30($v0)
/* A1898 800B1098 3AC40208 */  j          .L800B10E8
/* A189C 800B109C 040082A4 */   sh        $v0, 0x4($a0)
.L800B10A0:
/* A18A0 800B10A0 4000028E */  lw         $v0, 0x40($s0)
/* A18A4 800B10A4 00000000 */  nop
/* A18A8 800B10A8 02004294 */  lhu        $v0, 0x2($v0)
/* A18AC 800B10AC 00000000 */  nop
/* A18B0 800B10B0 23100200 */  negu       $v0, $v0
/* A18B4 800B10B4 000082A4 */  sh         $v0, 0x0($a0)
/* A18B8 800B10B8 4000028E */  lw         $v0, 0x40($s0)
/* A18BC 800B10BC 00000000 */  nop
/* A18C0 800B10C0 08004294 */  lhu        $v0, 0x8($v0)
/* A18C4 800B10C4 00000000 */  nop
/* A18C8 800B10C8 23100200 */  negu       $v0, $v0
/* A18CC 800B10CC 020082A4 */  sh         $v0, 0x2($a0)
/* A18D0 800B10D0 4000028E */  lw         $v0, 0x40($s0)
/* A18D4 800B10D4 00000000 */  nop
/* A18D8 800B10D8 0E004294 */  lhu        $v0, 0xE($v0)
/* A18DC 800B10DC 00000000 */  nop
/* A18E0 800B10E0 23100200 */  negu       $v0, $v0
/* A18E4 800B10E4 040082A4 */  sh         $v0, 0x4($a0)
.L800B10E8:
/* A18E8 800B10E8 A0C40208 */  j          .L800B1280
/* A18EC 800B10EC 21108000 */   addu      $v0, $a0, $zero
jlabel .L800B10F0
/* A18F0 800B10F0 3800048E */  lw         $a0, 0x38($s0)
/* A18F4 800B10F4 1C66010C */  jal        STREAM_GetLevelWithID
/* A18F8 800B10F8 00000000 */   nop
/* A18FC 800B10FC FC01043C */  lui        $a0, (0x1FC0000 >> 16)
/* A1900 800B1100 38FA838F */  lw         $v1, %gp_rel(Raziel + 0x408)($gp)
/* A1904 800B1104 CC00428C */  lw         $v0, 0xCC($v0)
/* A1908 800B1108 00000000 */  nop
/* A190C 800B110C 00084230 */  andi       $v0, $v0, 0x800
/* A1910 800B1110 05004014 */  bnez       $v0, .L800B1128
/* A1914 800B1114 24806400 */   and       $s0, $v1, $a0
/* A1918 800B1118 1596020C */  jal        RAZIEL_OkToShift
/* A191C 800B111C 00000000 */   nop
/* A1920 800B1120 04004014 */  bnez       $v0, .L800B1134
/* A1924 800B1124 00000000 */   nop
.L800B1128:
/* A1928 800B1128 FFFE023C */  lui        $v0, (0xFEFFFFFF >> 16)
/* A192C 800B112C FFFF4234 */  ori        $v0, $v0, (0xFEFFFFFF & 0xFFFF)
/* A1930 800B1130 24800202 */  and        $s0, $s0, $v0
.L800B1134:
/* A1934 800B1134 90F9828F */  lw         $v0, %gp_rel(Raziel + 0x360)($gp)
/* A1938 800B1138 0400033C */  lui        $v1, (0x40000 >> 16)
/* A193C 800B113C 24104300 */  and        $v0, $v0, $v1
/* A1940 800B1140 05004014 */  bnez       $v0, .L800B1158
/* A1944 800B1144 0001023C */   lui       $v0, (0x1000000 >> 16)
/* A1948 800B1148 68FA838F */  lw         $v1, %gp_rel(Raziel + 0x438)($gp)
/* A194C 800B114C 02000224 */  addiu      $v0, $zero, 0x2
/* A1950 800B1150 02006214 */  bne        $v1, $v0, .L800B115C
/* A1954 800B1154 0001023C */   lui       $v0, (0x1000000 >> 16)
.L800B1158:
/* A1958 800B1158 24800202 */  and        $s0, $s0, $v0
.L800B115C:
/* A195C 800B115C A0C40208 */  j          .L800B1280
/* A1960 800B1160 21100002 */   addu      $v0, $s0, $zero
jlabel .L800B1164
/* A1964 800B1164 18000424 */  addiu      $a0, $zero, 0x18
/* A1968 800B1168 90C6010C */  jal        SetControlSaveDataData
/* A196C 800B116C 1000A527 */   addiu     $a1, $sp, 0x10
/* A1970 800B1170 38FA838F */  lw         $v1, %gp_rel(Raziel + 0x408)($gp)
/* A1974 800B1174 68FA848F */  lw         $a0, %gp_rel(Raziel + 0x438)($gp)
/* A1978 800B1178 28FA8587 */  lh         $a1, %gp_rel(Raziel + 0x3F8)($gp)
/* A197C 800B117C 2AFA8687 */  lh         $a2, %gp_rel(Raziel + 0x3FA)($gp)
/* A1980 800B1180 40FA8797 */  lhu        $a3, %gp_rel(Raziel + 0x410)($gp)
/* A1984 800B1184 42FA8897 */  lhu        $t0, %gp_rel(Raziel + 0x412)($gp)
/* A1988 800B1188 E0FB898F */  lw         $t1, %gp_rel(Raziel + 0x5B0)($gp)
/* A198C 800B118C 1000A3AF */  sw         $v1, 0x10($sp)
/* A1990 800B1190 1400A4AF */  sw         $a0, 0x14($sp)
/* A1994 800B1194 1800A5AF */  sw         $a1, 0x18($sp)
/* A1998 800B1198 1C00A6AF */  sw         $a2, 0x1C($sp)
/* A199C 800B119C 2000A7A7 */  sh         $a3, 0x20($sp)
/* A19A0 800B11A0 2200A8A7 */  sh         $t0, 0x22($sp)
/* A19A4 800B11A4 A0C40208 */  j          .L800B1280
/* A19A8 800B11A8 2400A9AF */   sw        $t1, 0x24($sp)
jlabel .L800B11AC
/* A19AC 800B11AC 2AFA8287 */  lh         $v0, %gp_rel(Raziel + 0x3FA)($gp)
/* A19B0 800B11B0 A0C40208 */  j          .L800B1280
/* A19B4 800B11B4 00000000 */   nop
jlabel .L800B11B8
/* A19B8 800B11B8 40FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x410)($gp)
/* A19BC 800B11BC A0C40208 */  j          .L800B1280
/* A19C0 800B11C0 00000000 */   nop
jlabel .L800B11C4
/* A19C4 800B11C4 42FA8297 */  lhu        $v0, %gp_rel(Raziel + 0x412)($gp)
/* A19C8 800B11C8 A0C40208 */  j          .L800B1280
/* A19CC 800B11CC 00000000 */   nop
jlabel .L800B11D0
/* A19D0 800B11D0 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* A19D4 800B11D4 00000000 */  nop
/* A19D8 800B11D8 40004230 */  andi       $v0, $v0, 0x40
/* A19DC 800B11DC 28004010 */  beqz       $v0, .L800B1280
/* A19E0 800B11E0 21100000 */   addu      $v0, $zero, $zero
/* A19E4 800B11E4 08FA828F */  lw         $v0, %gp_rel(Raziel + 0x3D8)($gp)
/* A19E8 800B11E8 00000000 */  nop
/* A19EC 800B11EC 3000428C */  lw         $v0, 0x30($v0)
/* A19F0 800B11F0 A0C40208 */  j          .L800B1280
/* A19F4 800B11F4 00000000 */   nop
jlabel .L800B11F8
/* A19F8 800B11F8 38FA828F */  lw         $v0, %gp_rel(Raziel + 0x408)($gp)
/* A19FC 800B11FC A0C40208 */  j          .L800B1280
/* A1A00 800B1200 00000000 */   nop
jlabel .L800B1204
/* A1A04 800B1204 E1C6010C */  jal        SetShadowSegmentData
/* A1A08 800B1208 02000424 */   addiu     $a0, $zero, 0x2
/* A1A0C 800B120C 0C000324 */  addiu      $v1, $zero, 0xC
/* A1A10 800B1210 040043A4 */  sh         $v1, 0x4($v0)
/* A1A14 800B1214 08000324 */  addiu      $v1, $zero, 0x8
/* A1A18 800B1218 A0C40208 */  j          .L800B1280
/* A1A1C 800B121C 060043A4 */   sh        $v1, 0x6($v0)
jlabel .L800B1220
/* A1A20 800B1220 0CFA828F */  lw         $v0, %gp_rel(Raziel + 0x3DC)($gp)
/* A1A24 800B1224 A0C40208 */  j          .L800B1280
/* A1A28 800B1228 00000000 */   nop
jlabel .L800B122C
/* A1A2C 800B122C DCFB828F */  lw         $v0, %gp_rel(Raziel + 0x5AC)($gp)
/* A1A30 800B1230 A0C40208 */  j          .L800B1280
/* A1A34 800B1234 00000000 */   nop
jlabel .L800B1238
/* A1A38 800B1238 E0FB828F */  lw         $v0, %gp_rel(Raziel + 0x5B0)($gp)
/* A1A3C 800B123C A0C40208 */  j          .L800B1280
/* A1A40 800B1240 00000000 */   nop
jlabel .L800B1244
/* A1A44 800B1244 0492020C */  jal        GetMaxHealth
/* A1A48 800B1248 00000000 */   nop
/* A1A4C 800B124C 2CFA838F */  lw         $v1, %gp_rel(Raziel + 0x3FC)($gp)
/* A1A50 800B1250 00000000 */  nop
/* A1A54 800B1254 26186200 */  xor        $v1, $v1, $v0
/* A1A58 800B1258 A0C40208 */  j          .L800B1280
/* A1A5C 800B125C 0100622C */   sltiu     $v0, $v1, 0x1
jlabel .L800B1260
/* A1A60 800B1260 2197020C */  jal        razGetHeldItem
/* A1A64 800B1264 00000000 */   nop
/* A1A68 800B1268 A0C40208 */  j          .L800B1280
/* A1A6C 800B126C 00000000 */   nop
jlabel .L800B1270
/* A1A70 800B1270 34FA828F */  lw         $v0, %gp_rel(Raziel + 0x404)($gp)
/* A1A74 800B1274 A0C40208 */  j          .L800B1280
/* A1A78 800B1278 00000000 */   nop
jlabel .L800B127C
/* A1A7C 800B127C 21100000 */  addu       $v0, $zero, $zero
.L800B1280:
/* A1A80 800B1280 2C00BF8F */  lw         $ra, 0x2C($sp)
/* A1A84 800B1284 2800B08F */  lw         $s0, 0x28($sp)
/* A1A88 800B1288 0800E003 */  jr         $ra
/* A1A8C 800B128C 3000BD27 */   addiu     $sp, $sp, 0x30
.size RazielQuery, . - RazielQuery
