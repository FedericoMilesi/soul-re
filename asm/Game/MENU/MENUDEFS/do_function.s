.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel do_function
/* A8E94 800B8694 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A8E98 800B8698 05000224 */  addiu      $v0, $zero, 0x5
/* A8E9C 800B869C 0300C210 */  beq        $a2, $v0, .L800B86AC
/* A8EA0 800B86A0 1000BFAF */   sw        $ra, 0x10($sp)
/* A8EA4 800B86A4 AEE10208 */  j          .L800B86B8
/* A8EA8 800B86A8 21100000 */   addu      $v0, $zero, $zero
.L800B86AC:
/* A8EAC 800B86AC 09F8A000 */  jalr       $a1
/* A8EB0 800B86B0 00000000 */   nop
/* A8EB4 800B86B4 01000224 */  addiu      $v0, $zero, 0x1
.L800B86B8:
/* A8EB8 800B86B8 1000BF8F */  lw         $ra, 0x10($sp)
/* A8EBC 800B86BC 00000000 */  nop
/* A8EC0 800B86C0 0800E003 */  jr         $ra
/* A8EC4 800B86C4 1800BD27 */   addiu     $sp, $sp, 0x18
.size do_function, . - do_function
