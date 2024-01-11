.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetInstanceFocus
/* 69EC 800161EC E800828C */  lw         $v0, 0xE8($a0)
/* 69F0 800161F0 080185AC */  sw         $a1, 0x108($a0)
/* 69F4 800161F4 00084234 */  ori        $v0, $v0, 0x800
/* 69F8 800161F8 E80082AC */  sw         $v0, 0xE8($a0)
/* 69FC 800161FC 5F00A388 */  lwl        $v1, 0x5F($a1)
/* 6A00 80016200 5C00A398 */  lwr        $v1, 0x5C($a1)
/* 6A04 80016204 6000A684 */  lh         $a2, 0x60($a1)
/* 6A08 80016208 150183A8 */  swl        $v1, 0x115($a0)
/* 6A0C 8001620C 120183B8 */  swr        $v1, 0x112($a0)
/* 6A10 80016210 160186A4 */  sh         $a2, 0x116($a0)
/* 6A14 80016214 1C00A28C */  lw         $v0, 0x1C($a1)
/* 6A18 80016218 00000000 */  nop
/* 6A1C 8001621C 09004010 */  beqz       $v0, .L80016244
/* 6A20 80016220 00000000 */   nop
/* 6A24 80016224 F4BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 6A28 80016228 00000000 */  nop
/* 6A2C 8001622C 0200A214 */  bne        $a1, $v0, .L80016238
/* 6A30 80016230 00020224 */   addiu     $v0, $zero, 0x200
/* 6A34 80016234 60010224 */  addiu      $v0, $zero, 0x160
.L80016238:
/* 6A38 80016238 360180A4 */  sh         $zero, 0x136($a0)
/* 6A3C 8001623C 380180A4 */  sh         $zero, 0x138($a0)
/* 6A40 80016240 3A0182A4 */  sh         $v0, 0x13A($a0)
.L80016244:
/* 6A44 80016244 0800E003 */  jr         $ra
/* 6A48 80016248 00000000 */   nop
.size CAMERA_SetInstanceFocus, . - CAMERA_SetInstanceFocus
