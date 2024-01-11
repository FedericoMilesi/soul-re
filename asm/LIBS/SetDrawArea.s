.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetDrawArea
/* AB698 800BAE98 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AB69C 800BAE9C 1400B1AF */  sw         $s1, 0x14($sp)
/* AB6A0 800BAEA0 21888000 */  addu       $s1, $a0, $zero
/* AB6A4 800BAEA4 1000B0AF */  sw         $s0, 0x10($sp)
/* AB6A8 800BAEA8 2180A000 */  addu       $s0, $a1, $zero
/* AB6AC 800BAEAC 02000224 */  addiu      $v0, $zero, 0x2
/* AB6B0 800BAEB0 1800BFAF */  sw         $ra, 0x18($sp)
/* AB6B4 800BAEB4 030022A2 */  sb         $v0, 0x3($s1)
/* AB6B8 800BAEB8 00000486 */  lh         $a0, 0x0($s0)
/* AB6BC 800BAEBC 02000586 */  lh         $a1, 0x2($s0)
/* AB6C0 800BAEC0 E8EC020C */  jal        func_800BB3A0
/* AB6C4 800BAEC4 00000000 */   nop
/* AB6C8 800BAEC8 040022AE */  sw         $v0, 0x4($s1)
/* AB6CC 800BAECC 00000496 */  lhu        $a0, 0x0($s0)
/* AB6D0 800BAED0 04000296 */  lhu        $v0, 0x4($s0)
/* AB6D4 800BAED4 02000596 */  lhu        $a1, 0x2($s0)
/* AB6D8 800BAED8 21208200 */  addu       $a0, $a0, $v0
/* AB6DC 800BAEDC FFFF8424 */  addiu      $a0, $a0, -0x1
/* AB6E0 800BAEE0 00240400 */  sll        $a0, $a0, 16
/* AB6E4 800BAEE4 06000296 */  lhu        $v0, 0x6($s0)
/* AB6E8 800BAEE8 03240400 */  sra        $a0, $a0, 16
/* AB6EC 800BAEEC 2128A200 */  addu       $a1, $a1, $v0
/* AB6F0 800BAEF0 FFFFA524 */  addiu      $a1, $a1, -0x1
/* AB6F4 800BAEF4 002C0500 */  sll        $a1, $a1, 16
/* AB6F8 800BAEF8 0EED020C */  jal        func_800BB438
/* AB6FC 800BAEFC 032C0500 */   sra       $a1, $a1, 16
/* AB700 800BAF00 080022AE */  sw         $v0, 0x8($s1)
/* AB704 800BAF04 1800BF8F */  lw         $ra, 0x18($sp)
/* AB708 800BAF08 1400B18F */  lw         $s1, 0x14($sp)
/* AB70C 800BAF0C 1000B08F */  lw         $s0, 0x10($sp)
/* AB710 800BAF10 0800E003 */  jr         $ra
/* AB714 800BAF14 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetDrawArea, . - SetDrawArea
