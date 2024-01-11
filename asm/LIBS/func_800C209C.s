.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C209C
/* B289C 800C209C 0D80023C */  lui        $v0, %hi(Vcount + 0x10)
/* B28A0 800C20A0 BCE8428C */  lw         $v0, %lo(Vcount + 0x10)($v0)
/* B28A4 800C20A4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* B28A8 800C20A8 2800BFAF */  sw         $ra, 0x28($sp)
/* B28AC 800C20AC 2400B5AF */  sw         $s5, 0x24($sp)
/* B28B0 800C20B0 2000B4AF */  sw         $s4, 0x20($sp)
/* B28B4 800C20B4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* B28B8 800C20B8 1800B2AF */  sw         $s2, 0x18($sp)
/* B28BC 800C20BC 1400B1AF */  sw         $s1, 0x14($sp)
/* B28C0 800C20C0 1000B0AF */  sw         $s0, 0x10($sp)
/* B28C4 800C20C4 0000428C */  lw         $v0, 0x0($v0)
/* B28C8 800C20C8 00000000 */  nop
/* B28CC 800C20CC 02160200 */  srl        $v0, $v0, 24
/* B28D0 800C20D0 7F005130 */  andi       $s1, $v0, 0x7F
/* B28D4 800C20D4 28002012 */  beqz       $s1, .L800C2178
/* B28D8 800C20D8 00000000 */   nop
/* B28DC 800C20DC 01001424 */  addiu      $s4, $zero, 0x1
/* B28E0 800C20E0 FF00133C */  lui        $s3, (0xFFFFFF >> 16)
/* B28E4 800C20E4 FFFF7336 */  ori        $s3, $s3, (0xFFFFFF & 0xFFFF)
/* B28E8 800C20E8 0D80153C */  lui        $s5, %hi(Vcount + 0x14)
/* B28EC 800C20EC C0E8B526 */  addiu      $s5, $s5, %lo(Vcount + 0x14)
.L800C20F0:
/* B28F0 800C20F0 18002012 */  beqz       $s1, .L800C2154
/* B28F4 800C20F4 21800000 */   addu      $s0, $zero, $zero
/* B28F8 800C20F8 2190A002 */  addu       $s2, $s5, $zero
.L800C20FC:
/* B28FC 800C20FC 0700022A */  slti       $v0, $s0, 0x7
/* B2900 800C2100 14004010 */  beqz       $v0, .L800C2154
/* B2904 800C2104 01002232 */   andi      $v0, $s1, 0x1
/* B2908 800C2108 0E004010 */  beqz       $v0, .L800C2144
/* B290C 800C210C 18000226 */   addiu     $v0, $s0, 0x18
/* B2910 800C2110 0D80043C */  lui        $a0, %hi(Vcount + 0x10)
/* B2914 800C2114 BCE8848C */  lw         $a0, %lo(Vcount + 0x10)($a0)
/* B2918 800C2118 04105400 */  sllv       $v0, $s4, $v0
/* B291C 800C211C 0000838C */  lw         $v1, 0x0($a0)
/* B2920 800C2120 25105300 */  or         $v0, $v0, $s3
/* B2924 800C2124 24186200 */  and        $v1, $v1, $v0
/* B2928 800C2128 000083AC */  sw         $v1, 0x0($a0)
/* B292C 800C212C 0000428E */  lw         $v0, 0x0($s2)
/* B2930 800C2130 00000000 */  nop
/* B2934 800C2134 03004010 */  beqz       $v0, .L800C2144
/* B2938 800C2138 00000000 */   nop
/* B293C 800C213C 09F84000 */  jalr       $v0
/* B2940 800C2140 00000000 */   nop
.L800C2144:
/* B2944 800C2144 04005226 */  addiu      $s2, $s2, 0x4
/* B2948 800C2148 42881100 */  srl        $s1, $s1, 1
/* B294C 800C214C EBFF2016 */  bnez       $s1, .L800C20FC
/* B2950 800C2150 01001026 */   addiu     $s0, $s0, 0x1
.L800C2154:
/* B2954 800C2154 0D80023C */  lui        $v0, %hi(Vcount + 0x10)
/* B2958 800C2158 BCE8428C */  lw         $v0, %lo(Vcount + 0x10)($v0)
/* B295C 800C215C 00000000 */  nop
/* B2960 800C2160 0000428C */  lw         $v0, 0x0($v0)
/* B2964 800C2164 00000000 */  nop
/* B2968 800C2168 02160200 */  srl        $v0, $v0, 24
/* B296C 800C216C 7F005130 */  andi       $s1, $v0, 0x7F
/* B2970 800C2170 DFFF2016 */  bnez       $s1, .L800C20F0
/* B2974 800C2174 00000000 */   nop
.L800C2178:
/* B2978 800C2178 0D80053C */  lui        $a1, %hi(Vcount + 0x10)
/* B297C 800C217C BCE8A58C */  lw         $a1, %lo(Vcount + 0x10)($a1)
/* B2980 800C2180 00000000 */  nop
/* B2984 800C2184 0000A28C */  lw         $v0, 0x0($a1)
/* B2988 800C2188 00FF033C */  lui        $v1, (0xFF000000 >> 16)
/* B298C 800C218C 24104300 */  and        $v0, $v0, $v1
/* B2990 800C2190 0080033C */  lui        $v1, (0x80000000 >> 16)
/* B2994 800C2194 06004310 */  beq        $v0, $v1, .L800C21B0
/* B2998 800C2198 00000000 */   nop
/* B299C 800C219C 0000A28C */  lw         $v0, 0x0($a1)
/* B29A0 800C21A0 00000000 */  nop
/* B29A4 800C21A4 00804230 */  andi       $v0, $v0, 0x8000
/* B29A8 800C21A8 13004010 */  beqz       $v0, .L800C21F8
/* B29AC 800C21AC 00000000 */   nop
.L800C21B0:
/* B29B0 800C21B0 0180043C */  lui        $a0, %hi(D_80012A24)
/* B29B4 800C21B4 242A8424 */  addiu      $a0, $a0, %lo(D_80012A24)
/* B29B8 800C21B8 0000A58C */  lw         $a1, 0x0($a1)
/* B29BC 800C21BC 06D1010C */  jal        printf
/* B29C0 800C21C0 21800000 */   addu      $s0, $zero, $zero
.L800C21C4:
/* B29C4 800C21C4 0180043C */  lui        $a0, %hi(D_80012A40)
/* B29C8 800C21C8 402A8424 */  addiu      $a0, $a0, %lo(D_80012A40)
/* B29CC 800C21CC 21280002 */  addu       $a1, $s0, $zero
/* B29D0 800C21D0 0D80023C */  lui        $v0, %hi(Vcount + 0x34)
/* B29D4 800C21D4 E0E8428C */  lw         $v0, %lo(Vcount + 0x34)($v0)
/* B29D8 800C21D8 00191000 */  sll        $v1, $s0, 4
/* B29DC 800C21DC 21186200 */  addu       $v1, $v1, $v0
/* B29E0 800C21E0 0000668C */  lw         $a2, 0x0($v1)
/* B29E4 800C21E4 06D1010C */  jal        printf
/* B29E8 800C21E8 01001026 */   addiu     $s0, $s0, 0x1
/* B29EC 800C21EC 0700022A */  slti       $v0, $s0, 0x7
/* B29F0 800C21F0 F4FF4014 */  bnez       $v0, .L800C21C4
/* B29F4 800C21F4 00000000 */   nop
.L800C21F8:
/* B29F8 800C21F8 2800BF8F */  lw         $ra, 0x28($sp)
/* B29FC 800C21FC 2400B58F */  lw         $s5, 0x24($sp)
/* B2A00 800C2200 2000B48F */  lw         $s4, 0x20($sp)
/* B2A04 800C2204 1C00B38F */  lw         $s3, 0x1C($sp)
/* B2A08 800C2208 1800B28F */  lw         $s2, 0x18($sp)
/* B2A0C 800C220C 1400B18F */  lw         $s1, 0x14($sp)
/* B2A10 800C2210 1000B08F */  lw         $s0, 0x10($sp)
/* B2A14 800C2214 0800E003 */  jr         $ra
/* B2A18 800C2218 3000BD27 */   addiu     $sp, $sp, 0x30
.size func_800C209C, . - func_800C209C
