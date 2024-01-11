.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_CalcAccel
/* 7E5EC 8008DDEC 05008018 */  blez       $a0, .L8008DE04
/* 7E5F0 8008DDF0 00000000 */   nop
/* 7E5F4 8008DDF4 0700A104 */  bgez       $a1, .L8008DE14
/* 7E5F8 8008DDF8 00000000 */   nop
/* 7E5FC 8008DDFC 87370208 */  j          .L8008DE1C
/* 7E600 8008DE00 00110400 */   sll       $v0, $a0, 4
.L8008DE04:
/* 7E604 8008DE04 0300A018 */  blez       $a1, .L8008DE14
/* 7E608 8008DE08 00000000 */   nop
/* 7E60C 8008DE0C 87370208 */  j          .L8008DE1C
/* 7E610 8008DE10 00110400 */   sll       $v0, $a0, 4
.L8008DE14:
/* 7E614 8008DE14 80100400 */  sll        $v0, $a0, 2
/* 7E618 8008DE18 21104400 */  addu       $v0, $v0, $a0
.L8008DE1C:
/* 7E61C 8008DE1C 1A004600 */  div        $zero, $v0, $a2
/* 7E620 8008DE20 12300000 */  mflo       $a2
/* 7E624 8008DE24 0800E003 */  jr         $ra
/* 7E628 8008DE28 2110C000 */   addu      $v0, $a2, $zero
.size SOUL_CalcAccel, . - SOUL_CalcAccel
