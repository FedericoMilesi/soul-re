.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_GetSavedBlock
/* A5B84 800B5384 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A5B88 800B5388 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A5B8C 800B538C 21988000 */  addu       $s3, $a0, $zero
/* A5B90 800B5390 1000B0AF */  sw         $s0, 0x10($sp)
/* A5B94 800B5394 2180A000 */  addu       $s0, $a1, $zero
/* A5B98 800B5398 1800B2AF */  sw         $s2, 0x18($sp)
/* A5B9C 800B539C 21900000 */  addu       $s2, $zero, $zero
/* A5BA0 800B53A0 0A00622A */  slti       $v0, $s3, 0xA
/* A5BA4 800B53A4 2400BFAF */  sw         $ra, 0x24($sp)
/* A5BA8 800B53A8 2000B4AF */  sw         $s4, 0x20($sp)
/* A5BAC 800B53AC 05004014 */  bnez       $v0, .L800B53C4
/* A5BB0 800B53B0 1400B1AF */   sw        $s1, 0x14($sp)
/* A5BB4 800B53B4 0D80043C */  lui        $a0, %hi(SaveArraySize + 0x28)
/* A5BB8 800B53B8 0C1E8424 */  addiu      $a0, $a0, %lo(SaveArraySize + 0x28)
/* A5BBC 800B53BC 2B52000C */  jal        DEBUG_FatalError
/* A5BC0 800B53C0 21286002 */   addu      $a1, $s3, $zero
.L800B53C4:
/* A5BC4 800B53C4 80101300 */  sll        $v0, $s3, 2
/* A5BC8 800B53C8 4CA88327 */  addiu      $v1, $gp, %gp_rel(SaveArraySize)
/* A5BCC 800B53CC 21104300 */  addu       $v0, $v0, $v1
/* A5BD0 800B53D0 0000428C */  lw         $v0, 0x0($v0)
/* A5BD4 800B53D4 00000000 */  nop
/* A5BD8 800B53D8 21805000 */  addu       $s0, $v0, $s0
/* A5BDC 800B53DC 03000226 */  addiu      $v0, $s0, 0x3
/* A5BE0 800B53E0 83100200 */  sra        $v0, $v0, 2
/* A5BE4 800B53E4 80800200 */  sll        $s0, $v0, 2
/* A5BE8 800B53E8 FD03022A */  slti       $v0, $s0, 0x3FD
/* A5BEC 800B53EC 06004014 */  bnez       $v0, .L800B5408
/* A5BF0 800B53F0 21880000 */   addu      $s1, $zero, $zero
/* A5BF4 800B53F4 0D80043C */  lui        $a0, %hi(SaveArraySize + 0x40)
/* A5BF8 800B53F8 241E8424 */  addiu      $a0, $a0, %lo(SaveArraySize + 0x40)
/* A5BFC 800B53FC 21280002 */  addu       $a1, $s0, $zero
/* A5C00 800B5400 2B52000C */  jal        DEBUG_FatalError
/* A5C04 800B5404 21306002 */   addu      $a2, $s3, $zero
.L800B5408:
/* A5C08 800B5408 83A01000 */  sra        $s4, $s0, 2
.L800B540C:
/* A5C0C 800B540C E4FD848F */  lw         $a0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5C10 800B5410 E8FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0xC)($gp)
/* A5C14 800B5414 21109000 */  addu       $v0, $a0, $s0
/* A5C18 800B5418 2B104300 */  sltu       $v0, $v0, $v1
/* A5C1C 800B541C 0A004010 */  beqz       $v0, .L800B5448
/* A5C20 800B5420 00000000 */   nop
/* A5C24 800B5424 21908000 */  addu       $s2, $a0, $zero
/* A5C28 800B5428 000093A0 */  sb         $s3, 0x0($a0)
/* A5C2C 800B542C 010054A2 */  sb         $s4, 0x1($s2)
/* A5C30 800B5430 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5C34 800B5434 00000000 */  nop
/* A5C38 800B5438 21105000 */  addu       $v0, $v0, $s0
/* A5C3C 800B543C E4FD82AF */  sw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5C40 800B5440 1ED50208 */  j          .L800B5478
/* A5C44 800B5444 01001124 */   addiu     $s1, $zero, 0x1
.L800B5448:
/* A5C48 800B5448 28D5020C */  jal        SAVE_PurgeAMemoryBlock
/* A5C4C 800B544C 00000000 */   nop
/* A5C50 800B5450 09004014 */  bnez       $v0, .L800B5478
/* A5C54 800B5454 0D80043C */   lui       $a0, %hi(SaveArraySize + 0x60)
/* A5C58 800B5458 441E8424 */  addiu      $a0, $a0, %lo(SaveArraySize + 0x60)
/* A5C5C 800B545C 21280002 */  addu       $a1, $s0, $zero
/* A5C60 800B5460 01001124 */  addiu      $s1, $zero, 0x1
/* A5C64 800B5464 E8FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0xC)($gp)
/* A5C68 800B5468 E4FD868F */  lw         $a2, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A5C6C 800B546C 00600724 */  addiu      $a3, $zero, 0x6000
/* A5C70 800B5470 2B52000C */  jal        DEBUG_FatalError
/* A5C74 800B5474 23304600 */   subu      $a2, $v0, $a2
.L800B5478:
/* A5C78 800B5478 E4FF2012 */  beqz       $s1, .L800B540C
/* A5C7C 800B547C 21104002 */   addu      $v0, $s2, $zero
/* A5C80 800B5480 2400BF8F */  lw         $ra, 0x24($sp)
/* A5C84 800B5484 2000B48F */  lw         $s4, 0x20($sp)
/* A5C88 800B5488 1C00B38F */  lw         $s3, 0x1C($sp)
/* A5C8C 800B548C 1800B28F */  lw         $s2, 0x18($sp)
/* A5C90 800B5490 1400B18F */  lw         $s1, 0x14($sp)
/* A5C94 800B5494 1000B08F */  lw         $s0, 0x10($sp)
/* A5C98 800B5498 0800E003 */  jr         $ra
/* A5C9C 800B549C 2800BD27 */   addiu     $sp, $sp, 0x28
.size SAVE_GetSavedBlock, . - SAVE_GetSavedBlock
