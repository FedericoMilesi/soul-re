.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C1E34
/* B2634 800C1E34 0882053C */  lui        $a1, (0x82082083 >> 16)
/* B2638 800C1E38 8320A534 */  ori        $a1, $a1, (0x82082083 & 0xFFFF)
/* B263C 800C1E3C 0E80023C */  lui        $v0, %hi(StRingSize)
/* B2640 800C1E40 40FD428C */  lw         $v0, %lo(StRingSize)($v0)
/* B2644 800C1E44 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B2648 800C1E48 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B264C 800C1E4C 40110200 */  sll        $v0, $v0, 5
/* B2650 800C1E50 21106200 */  addu       $v0, $v1, $v0
/* B2654 800C1E54 23208200 */  subu       $a0, $a0, $v0
/* B2658 800C1E58 83100400 */  sra        $v0, $a0, 2
/* B265C 800C1E5C 18004500 */  mult       $v0, $a1
/* B2660 800C1E60 C3270400 */  sra        $a0, $a0, 31
/* B2664 800C1E64 10380000 */  mfhi       $a3
/* B2668 800C1E68 2110E200 */  addu       $v0, $a3, $v0
/* B266C 800C1E6C 03120200 */  sra        $v0, $v0, 8
/* B2670 800C1E70 23284400 */  subu       $a1, $v0, $a0
/* B2674 800C1E74 40110500 */  sll        $v0, $a1, 5
/* B2678 800C1E78 21186200 */  addu       $v1, $v1, $v0
/* B267C 800C1E7C 04000424 */  addiu      $a0, $zero, 0x4
/* B2680 800C1E80 00006284 */  lh         $v0, 0x0($v1)
/* B2684 800C1E84 06006394 */  lhu        $v1, 0x6($v1)
/* B2688 800C1E88 13004414 */  bne        $v0, $a0, .L800C1ED8
/* B268C 800C1E8C 01000224 */   addiu     $v0, $zero, 0x1
/* B2690 800C1E90 00140300 */  sll        $v0, $v1, 16
/* B2694 800C1E94 03140200 */  sra        $v0, $v0, 16
/* B2698 800C1E98 0B004018 */  blez       $v0, .L800C1EC8
/* B269C 800C1E9C 21200000 */   addu      $a0, $zero, $zero
/* B26A0 800C1EA0 21304000 */  addu       $a2, $v0, $zero
.L800C1EA4:
/* B26A4 800C1EA4 21108500 */  addu       $v0, $a0, $a1
/* B26A8 800C1EA8 01008424 */  addiu      $a0, $a0, 0x1
/* B26AC 800C1EAC 0E80033C */  lui        $v1, %hi(StRingAddr)
/* B26B0 800C1EB0 30FD638C */  lw         $v1, %lo(StRingAddr)($v1)
/* B26B4 800C1EB4 40110200 */  sll        $v0, $v0, 5
/* B26B8 800C1EB8 21186200 */  addu       $v1, $v1, $v0
/* B26BC 800C1EBC 2A108600 */  slt        $v0, $a0, $a2
/* B26C0 800C1EC0 F8FF4014 */  bnez       $v0, .L800C1EA4
/* B26C4 800C1EC4 000060A4 */   sh        $zero, 0x0($v1)
.L800C1EC8:
/* B26C8 800C1EC8 21108500 */  addu       $v0, $a0, $a1
/* B26CC 800C1ECC 0E80013C */  lui        $at, %hi(StRingIdx3)
/* B26D0 800C1ED0 3CFD22AC */  sw         $v0, %lo(StRingIdx3)($at)
/* B26D4 800C1ED4 21100000 */  addu       $v0, $zero, $zero
.L800C1ED8:
/* B26D8 800C1ED8 0800E003 */  jr         $ra
/* B26DC 800C1EDC 00000000 */   nop
/* B26E0 800C1EE0 00000000 */  nop
.size func_800C1E34, . - func_800C1E34
