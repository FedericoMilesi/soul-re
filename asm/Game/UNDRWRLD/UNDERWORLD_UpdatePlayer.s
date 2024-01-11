.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel UNDERWORLD_UpdatePlayer
/* A5998 800B5198 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A599C 800B519C 2130A000 */  addu       $a2, $a1, $zero
/* A59A0 800B51A0 20008524 */  addiu      $a1, $a0, 0x20
/* A59A4 800B51A4 5C00C724 */  addiu      $a3, $a2, 0x5C
/* A59A8 800B51A8 1800BFAF */  sw         $ra, 0x18($sp)
/* A59AC 800B51AC 20008294 */  lhu        $v0, 0x20($a0)
/* A59B0 800B51B0 0200A394 */  lhu        $v1, 0x2($a1)
/* A59B4 800B51B4 0400A494 */  lhu        $a0, 0x4($a1)
/* A59B8 800B51B8 5C00C594 */  lhu        $a1, 0x5C($a2)
/* A59BC 800B51BC 0200E894 */  lhu        $t0, 0x2($a3)
/* A59C0 800B51C0 0400E794 */  lhu        $a3, 0x4($a3)
/* A59C4 800B51C4 23104500 */  subu       $v0, $v0, $a1
/* A59C8 800B51C8 1000A527 */  addiu      $a1, $sp, 0x10
/* A59CC 800B51CC 23186800 */  subu       $v1, $v1, $t0
/* A59D0 800B51D0 23208700 */  subu       $a0, $a0, $a3
/* A59D4 800B51D4 1000A2A7 */  sh         $v0, 0x10($sp)
/* A59D8 800B51D8 0400A4A4 */  sh         $a0, 0x4($a1)
/* A59DC 800B51DC 2120C000 */  addu       $a0, $a2, $zero
/* A59E0 800B51E0 8A70010C */  jal        STREAM_RelocateInstance
/* A59E4 800B51E4 0200A3A4 */   sh        $v1, 0x2($a1)
/* A59E8 800B51E8 1800BF8F */  lw         $ra, 0x18($sp)
/* A59EC 800B51EC 00000000 */  nop
/* A59F0 800B51F0 0800E003 */  jr         $ra
/* A59F4 800B51F4 2000BD27 */   addiu     $sp, $sp, 0x20
.size UNDERWORLD_UpdatePlayer, . - UNDERWORLD_UpdatePlayer
