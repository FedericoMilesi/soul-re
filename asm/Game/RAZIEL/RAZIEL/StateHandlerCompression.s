.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateHandlerCompression
/* 9BDAC 800AB5AC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 9BDB0 800AB5B0 1800B0AF */  sw         $s0, 0x18($sp)
/* 9BDB4 800AB5B4 21808000 */  addu       $s0, $a0, $zero
/* 9BDB8 800AB5B8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 9BDBC 800AB5BC 2188A000 */  addu       $s1, $a1, $zero
/* 9BDC0 800AB5C0 2800B4AF */  sw         $s4, 0x28($sp)
/* 9BDC4 800AB5C4 21A0C000 */  addu       $s4, $a2, $zero
/* 9BDC8 800AB5C8 C0101100 */  sll        $v0, $s1, 3
/* 9BDCC 800AB5CC 21105100 */  addu       $v0, $v0, $s1
/* 9BDD0 800AB5D0 C0100200 */  sll        $v0, $v0, 3
/* 9BDD4 800AB5D4 23105100 */  subu       $v0, $v0, $s1
/* 9BDD8 800AB5D8 80100200 */  sll        $v0, $v0, 2
/* 9BDDC 800AB5DC 08004224 */  addiu      $v0, $v0, 0x8
/* 9BDE0 800AB5E0 2400B3AF */  sw         $s3, 0x24($sp)
/* 9BDE4 800AB5E4 21980202 */  addu       $s3, $s0, $v0
/* 9BDE8 800AB5E8 2000B2AF */  sw         $s2, 0x20($sp)
/* 9BDEC 800AB5EC 01001224 */  addiu      $s2, $zero, 0x1
/* 9BDF0 800AB5F0 2C00BFAF */  sw         $ra, 0x2C($sp)
.L800AB5F4:
/* 9BDF4 800AB5F4 39C3010C */  jal        PeekMessageQueue
/* 9BDF8 800AB5F8 04006426 */   addiu     $a0, $s3, 0x4
/* 9BDFC 800AB5FC D4004010 */  beqz       $v0, .L800AB950
/* 9BE00 800AB600 0004043C */   lui       $a0, (0x4000001 >> 16)
/* 9BE04 800AB604 0000438C */  lw         $v1, 0x0($v0)
/* 9BE08 800AB608 01008434 */  ori        $a0, $a0, (0x4000001 & 0xFFFF)
/* 9BE0C 800AB60C CC006410 */  beq        $v1, $a0, .L800AB940
/* 9BE10 800AB610 2A108300 */   slt       $v0, $a0, $v1
/* 9BE14 800AB614 0C004014 */  bnez       $v0, .L800AB648
/* 9BE18 800AB618 0008023C */   lui       $v0, (0x8000000 >> 16)
/* 9BE1C 800AB61C 0080023C */  lui        $v0, (0x80000001 >> 16)
/* 9BE20 800AB620 01004234 */  ori        $v0, $v0, (0x80000001 & 0xFFFF)
/* 9BE24 800AB624 BD006210 */  beq        $v1, $v0, .L800AB91C
/* 9BE28 800AB628 2A106200 */   slt       $v0, $v1, $v0
/* 9BE2C 800AB62C C4004014 */  bnez       $v0, .L800AB940
/* 9BE30 800AB630 1000023C */   lui       $v0, (0x100001 >> 16)
/* 9BE34 800AB634 01004234 */  ori        $v0, $v0, (0x100001 & 0xFFFF)
/* 9BE38 800AB638 11006210 */  beq        $v1, $v0, .L800AB680
/* 9BE3C 800AB63C 21200002 */   addu      $a0, $s0, $zero
/* 9BE40 800AB640 4EAE0208 */  j          .L800AB938
/* 9BE44 800AB644 21282002 */   addu      $a1, $s1, $zero
.L800AB648:
/* 9BE48 800AB648 45006210 */  beq        $v1, $v0, .L800AB760
/* 9BE4C 800AB64C 2A104300 */   slt       $v0, $v0, $v1
/* 9BE50 800AB650 06004014 */  bnez       $v0, .L800AB66C
/* 9BE54 800AB654 0020023C */   lui       $v0, (0x20000001 >> 16)
/* 9BE58 800AB658 0204023C */  lui        $v0, (0x4020001 >> 16)
/* 9BE5C 800AB65C B8006210 */  beq        $v1, $v0, .L800AB940
/* 9BE60 800AB660 21200002 */   addu      $a0, $s0, $zero
/* 9BE64 800AB664 4EAE0208 */  j          .L800AB938
/* 9BE68 800AB668 21282002 */   addu      $a1, $s1, $zero
.L800AB66C:
/* 9BE6C 800AB66C 01004234 */  ori        $v0, $v0, (0x4020001 & 0xFFFF)
/* 9BE70 800AB670 A0006210 */  beq        $v1, $v0, .L800AB8F4
/* 9BE74 800AB674 21200002 */   addu      $a0, $s0, $zero
/* 9BE78 800AB678 4EAE0208 */  j          .L800AB938
/* 9BE7C 800AB67C 21282002 */   addu      $a1, $s1, $zero
.L800AB680:
/* 9BE80 800AB680 AF002016 */  bnez       $s1, .L800AB940
/* 9BE84 800AB684 21280000 */   addu      $a1, $zero, $zero
/* 9BE88 800AB688 08FD8427 */  addiu      $a0, $gp, %gp_rel(ExternalForces_dup1 + 0x28)
/* 9BE8C 800AB68C 2130A000 */  addu       $a2, $a1, $zero
/* 9BE90 800AB690 2138A000 */  addu       $a3, $a1, $zero
/* 9BE94 800AB694 11010224 */  addiu      $v0, $zero, 0x111
/* 9BE98 800AB698 C8FD82AF */  sw         $v0, %gp_rel(ControlFlag)($gp)
/* 9BE9C 800AB69C 1000B2AF */  sw         $s2, 0x10($sp)
/* 9BEA0 800AB6A0 2E69020C */  jal        SetExternalForce
/* 9BEA4 800AB6A4 1400A0AF */   sw        $zero, 0x14($sp)
/* 9BEA8 800AB6A8 1C0100AE */  sw         $zero, 0x11C($s0)
/* 9BEAC 800AB6AC 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9BEB0 800AB6B0 03000224 */  addiu      $v0, $zero, 0x3
/* 9BEB4 800AB6B4 30FD82AF */  sw         $v0, %gp_rel(PhysicsMode)($gp)
/* 9BEB8 800AB6B8 10000224 */  addiu      $v0, $zero, 0x10
/* 9BEBC 800AB6BC C4F980A7 */  sh         $zero, %gp_rel(Raziel + 0x394)($gp)
/* 9BEC0 800AB6C0 10006210 */  beq        $v1, $v0, .L800AB704
/* 9BEC4 800AB6C4 11006228 */   slti      $v0, $v1, 0x11
/* 9BEC8 800AB6C8 9D004014 */  bnez       $v0, .L800AB940
/* 9BECC 800AB6CC 20000224 */   addiu     $v0, $zero, 0x20
/* 9BED0 800AB6D0 9B006214 */  bne        $v1, $v0, .L800AB940
/* 9BED4 800AB6D4 00000000 */   nop
/* 9BED8 800AB6D8 0000048E */  lw         $a0, 0x0($s0)
/* 9BEDC 800AB6DC 938B020C */  jal        SteerSwitchMode
/* 9BEE0 800AB6E0 04000524 */   addiu     $a1, $zero, 0x4
/* 9BEE4 800AB6E4 0000028E */  lw         $v0, 0x0($s0)
/* 9BEE8 800AB6E8 00000000 */  nop
/* 9BEEC 800AB6EC 78004284 */  lh         $v0, 0x78($v0)
/* 9BEF0 800AB6F0 01000524 */  addiu      $a1, $zero, 0x1
/* 9BEF4 800AB6F4 C0F982AF */  sw         $v0, %gp_rel(Raziel + 0x390)($gp)
/* 9BEF8 800AB6F8 0000038E */  lw         $v1, 0x0($s0)
/* 9BEFC 800AB6FC CBAD0208 */  j          .L800AB72C
/* 9BF00 800AB700 15000224 */   addiu     $v0, $zero, 0x15
.L800AB704:
/* 9BF04 800AB704 0000048E */  lw         $a0, 0x0($s0)
/* 9BF08 800AB708 938B020C */  jal        SteerSwitchMode
/* 9BF0C 800AB70C 04000524 */   addiu     $a1, $zero, 0x4
/* 9BF10 800AB710 0000028E */  lw         $v0, 0x0($s0)
/* 9BF14 800AB714 00000000 */  nop
/* 9BF18 800AB718 78004284 */  lh         $v0, 0x78($v0)
/* 9BF1C 800AB71C 01000524 */  addiu      $a1, $zero, 0x1
/* 9BF20 800AB720 C0F982AF */  sw         $v0, %gp_rel(Raziel + 0x390)($gp)
/* 9BF24 800AB724 0000038E */  lw         $v1, 0x0($s0)
/* 9BF28 800AB728 28000224 */  addiu      $v0, $zero, 0x28
.L800AB72C:
/* 9BF2C 800AB72C 780162AC */  sw         $v0, 0x178($v1)
/* 9BF30 800AB730 0000048E */  lw         $a0, 0x0($s0)
/* 9BF34 800AB734 0E000624 */  addiu      $a2, $zero, 0xE
/* 9BF38 800AB738 E541020C */  jal        G2Anim_IsControllerActive
/* 9BF3C 800AB73C C8018424 */   addiu     $a0, $a0, 0x1C8
/* 9BF40 800AB740 7F004014 */  bnez       $v0, .L800AB940
/* 9BF44 800AB744 01000524 */   addiu     $a1, $zero, 0x1
/* 9BF48 800AB748 0000048E */  lw         $a0, 0x0($s0)
/* 9BF4C 800AB74C 0E000624 */  addiu      $a2, $zero, 0xE
/* 9BF50 800AB750 5641020C */  jal        G2Anim_EnableController
/* 9BF54 800AB754 C8018424 */   addiu     $a0, $a0, 0x1C8
/* 9BF58 800AB758 50AE0208 */  j          .L800AB940
/* 9BF5C 800AB75C 00000000 */   nop
.L800AB760:
/* 9BF60 800AB760 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9BF64 800AB764 08000224 */  addiu      $v0, $zero, 0x8
/* 9BF68 800AB768 05006210 */  beq        $v1, $v0, .L800AB780
/* 9BF6C 800AB76C 20000224 */   addiu     $v0, $zero, 0x20
/* 9BF70 800AB770 1A006210 */  beq        $v1, $v0, .L800AB7DC
/* 9BF74 800AB774 00000000 */   nop
/* 9BF78 800AB778 0FAE0208 */  j          .L800AB83C
/* 9BF7C 800AB77C 00000000 */   nop
.L800AB780:
/* 9BF80 800AB780 55002016 */  bnez       $s1, .L800AB8D8
/* 9BF84 800AB784 21200002 */   addu      $a0, $s0, $zero
/* 9BF88 800AB788 0000048E */  lw         $a0, 0x0($s0)
/* 9BF8C 800AB78C 04000524 */  addiu      $a1, $zero, 0x4
/* 9BF90 800AB790 21300000 */  addu       $a2, $zero, $zero
/* 9BF94 800AB794 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9BF98 800AB798 2138C000 */   addu      $a3, $a2, $zero
/* 9BF9C 800AB79C 06004010 */  beqz       $v0, .L800AB7B8
/* 9BFA0 800AB7A0 1B000524 */   addiu     $a1, $zero, 0x1B
/* 9BFA4 800AB7A4 1000B2AF */  sw         $s2, 0x10($sp)
/* 9BFA8 800AB7A8 21200002 */  addu       $a0, $s0, $zero
/* 9BFAC 800AB7AC 21300000 */  addu       $a2, $zero, $zero
/* 9BFB0 800AB7B0 FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9BFB4 800AB7B4 2138C000 */   addu      $a3, $a2, $zero
.L800AB7B8:
/* 9BFB8 800AB7B8 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9BFBC 800AB7BC 21300000 */  addu       $a2, $zero, $zero
/* 9BFC0 800AB7C0 9A000224 */  addiu      $v0, $zero, 0x9A
/* 9BFC4 800AB7C4 1000A2AF */  sw         $v0, 0x10($sp)
/* 9BFC8 800AB7C8 0000048E */  lw         $a0, 0x0($s0)
/* 9BFCC 800AB7CC 4E68020C */  jal        SetPhysics
/* 9BFD0 800AB7D0 53000724 */   addiu     $a3, $zero, 0x53
/* 9BFD4 800AB7D4 36AE0208 */  j          .L800AB8D8
/* 9BFD8 800AB7D8 21200002 */   addu      $a0, $s0, $zero
.L800AB7DC:
/* 9BFDC 800AB7DC 3E002016 */  bnez       $s1, .L800AB8D8
/* 9BFE0 800AB7E0 21200002 */   addu      $a0, $s0, $zero
/* 9BFE4 800AB7E4 0000048E */  lw         $a0, 0x0($s0)
/* 9BFE8 800AB7E8 24000524 */  addiu      $a1, $zero, 0x24
/* 9BFEC 800AB7EC 21300000 */  addu       $a2, $zero, $zero
/* 9BFF0 800AB7F0 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9BFF4 800AB7F4 2138C000 */   addu      $a3, $a2, $zero
/* 9BFF8 800AB7F8 06004010 */  beqz       $v0, .L800AB814
/* 9BFFC 800AB7FC 21200002 */   addu      $a0, $s0, $zero
/* 9C000 800AB800 1000B2AF */  sw         $s2, 0x10($sp)
/* 9C004 800AB804 27000524 */  addiu      $a1, $zero, 0x27
/* 9C008 800AB808 21300000 */  addu       $a2, $zero, $zero
/* 9C00C 800AB80C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9C010 800AB810 2138C000 */   addu      $a3, $a2, $zero
.L800AB814:
/* 9C014 800AB814 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9C018 800AB818 21300000 */  addu       $a2, $zero, $zero
/* 9C01C 800AB81C C3000224 */  addiu      $v0, $zero, 0xC3
/* 9C020 800AB820 1000A2AF */  sw         $v0, 0x10($sp)
/* 9C024 800AB824 0000048E */  lw         $a0, 0x0($s0)
/* 9C028 800AB828 4E68020C */  jal        SetPhysics
/* 9C02C 800AB82C 15000724 */   addiu     $a3, $zero, 0x15
/* 9C030 800AB830 0000028E */  lw         $v0, 0x0($s0)
/* 9C034 800AB834 35AE0208 */  j          .L800AB8D4
/* 9C038 800AB838 780140AC */   sw        $zero, 0x178($v0)
.L800AB83C:
/* 9C03C 800AB83C 26002016 */  bnez       $s1, .L800AB8D8
/* 9C040 800AB840 21200002 */   addu      $a0, $s0, $zero
/* 9C044 800AB844 0000048E */  lw         $a0, 0x0($s0)
/* 9C048 800AB848 14000524 */  addiu      $a1, $zero, 0x14
/* 9C04C 800AB84C 21300000 */  addu       $a2, $zero, $zero
/* 9C050 800AB850 2F9C020C */  jal        razSwitchVAnimCharacterGroup
/* 9C054 800AB854 2138C000 */   addu      $a3, $a2, $zero
/* 9C058 800AB858 06004010 */  beqz       $v0, .L800AB874
/* 9C05C 800AB85C 21200002 */   addu      $a0, $s0, $zero
/* 9C060 800AB860 1000B2AF */  sw         $s2, 0x10($sp)
/* 9C064 800AB864 23000524 */  addiu      $a1, $zero, 0x23
/* 9C068 800AB868 21300000 */  addu       $a2, $zero, $zero
/* 9C06C 800AB86C FCC8010C */  jal        G2EmulationSwitchAnimationCharacter
/* 9C070 800AB870 2138C000 */   addu      $a3, $a2, $zero
.L800AB874:
/* 9C074 800AB874 F0FF0524 */  addiu      $a1, $zero, -0x10
/* 9C078 800AB878 21300000 */  addu       $a2, $zero, $zero
/* 9C07C 800AB87C 9A000224 */  addiu      $v0, $zero, 0x9A
/* 9C080 800AB880 1000A2AF */  sw         $v0, 0x10($sp)
/* 9C084 800AB884 0000048E */  lw         $a0, 0x0($s0)
/* 9C088 800AB888 4E68020C */  jal        SetPhysics
/* 9C08C 800AB88C 28000724 */   addiu     $a3, $zero, 0x28
/* 9C090 800AB890 0000028E */  lw         $v0, 0x0($s0)
/* 9C094 800AB894 00000000 */  nop
/* 9C098 800AB898 780140AC */  sw         $zero, 0x178($v0)
/* 9C09C 800AB89C 1C01028E */  lw         $v0, 0x11C($s0)
/* 9C0A0 800AB8A0 00000000 */  nop
/* 9C0A4 800AB8A4 0C005214 */  bne        $v0, $s2, .L800AB8D8
/* 9C0A8 800AB8A8 21200002 */   addu      $a0, $s0, $zero
/* 9C0AC 800AB8AC 0000048E */  lw         $a0, 0x0($s0)
/* 9C0B0 800AB8B0 5555033C */  lui        $v1, (0x55555556 >> 16)
/* 9C0B4 800AB8B4 7C01828C */  lw         $v0, 0x17C($a0)
/* 9C0B8 800AB8B8 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
/* 9C0BC 800AB8BC 40100200 */  sll        $v0, $v0, 1
/* 9C0C0 800AB8C0 18004300 */  mult       $v0, $v1
/* 9C0C4 800AB8C4 C3170200 */  sra        $v0, $v0, 31
/* 9C0C8 800AB8C8 10400000 */  mfhi       $t0
/* 9C0CC 800AB8CC 23100201 */  subu       $v0, $t0, $v0
/* 9C0D0 800AB8D0 7C0182AC */  sw         $v0, 0x17C($a0)
.L800AB8D4:
/* 9C0D4 800AB8D4 21200002 */  addu       $a0, $s0, $zero
.L800AB8D8:
/* 9C0D8 800AB8D8 21282002 */  addu       $a1, $s1, $zero
/* 9C0DC 800AB8DC 0B80063C */  lui        $a2, %hi(StateHandlerJump)
/* 9C0E0 800AB8E0 70B9C624 */  addiu      $a2, $a2, %lo(StateHandlerJump)
/* 9C0E4 800AB8E4 C1CA010C */  jal        StateSwitchStateData
/* 9C0E8 800AB8E8 21380000 */   addu      $a3, $zero, $zero
/* 9C0EC 800AB8EC 50AE0208 */  j          .L800AB940
/* 9C0F0 800AB8F0 00000000 */   nop
.L800AB8F4:
/* 9C0F4 800AB8F4 12002016 */  bnez       $s1, .L800AB940
/* 9C0F8 800AB8F8 10000224 */   addiu     $v0, $zero, 0x10
/* 9C0FC 800AB8FC 90F9838F */  lw         $v1, %gp_rel(Raziel + 0x360)($gp)
/* 9C100 800AB900 00000000 */  nop
/* 9C104 800AB904 02006214 */  bne        $v1, $v0, .L800AB910
/* 9C108 800AB908 00000000 */   nop
/* 9C10C 800AB90C 1C0112AE */  sw         $s2, 0x11C($s0)
.L800AB910:
/* 9C110 800AB910 94000426 */  addiu      $a0, $s0, 0x94
/* 9C114 800AB914 49AE0208 */  j          .L800AB924
/* 9C118 800AB918 0020053C */   lui       $a1, (0x20000001 >> 16)
.L800AB91C:
/* 9C11C 800AB91C 8C006426 */  addiu      $a0, $s3, 0x8C
/* 9C120 800AB920 0080053C */  lui        $a1, (0x80000001 >> 16)
.L800AB924:
/* 9C124 800AB924 0100A534 */  ori        $a1, $a1, (0x80000001 & 0xFFFF)
/* 9C128 800AB928 4EC3010C */  jal        EnMessageQueueData
/* 9C12C 800AB92C 21300000 */   addu      $a2, $zero, $zero
/* 9C130 800AB930 50AE0208 */  j          .L800AB940
/* 9C134 800AB934 00000000 */   nop
.L800AB938:
/* 9C138 800AB938 B9BF020C */  jal        DefaultStateHandler
/* 9C13C 800AB93C 21308002 */   addu      $a2, $s4, $zero
.L800AB940:
/* 9C140 800AB940 27C3010C */  jal        DeMessageQueue
/* 9C144 800AB944 04006426 */   addiu     $a0, $s3, 0x4
/* 9C148 800AB948 7DAD0208 */  j          .L800AB5F4
/* 9C14C 800AB94C 00000000 */   nop
.L800AB950:
/* 9C150 800AB950 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 9C154 800AB954 2800B48F */  lw         $s4, 0x28($sp)
/* 9C158 800AB958 2400B38F */  lw         $s3, 0x24($sp)
/* 9C15C 800AB95C 2000B28F */  lw         $s2, 0x20($sp)
/* 9C160 800AB960 1C00B18F */  lw         $s1, 0x1C($sp)
/* 9C164 800AB964 1800B08F */  lw         $s0, 0x18($sp)
/* 9C168 800AB968 0800E003 */  jr         $ra
/* 9C16C 800AB96C 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateHandlerCompression, . - StateHandlerCompression
