.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_DeleteInstance
/* A6AE0 800B62E0 21308000 */  addu       $a2, $a0, $zero
/* A6AE4 800B62E4 E0FD848F */  lw         $a0, %gp_rel(savedInfoTracker + 0x4)($gp)
/* A6AE8 800B62E8 E4FD828F */  lw         $v0, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6AEC 800B62EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6AF0 800B62F0 2B108200 */  sltu       $v0, $a0, $v0
/* A6AF4 800B62F4 2A004010 */  beqz       $v0, .L800B63A0
/* A6AF8 800B62F8 1000BFAF */   sw        $ra, 0x10($sp)
.L800B62FC:
/* A6AFC 800B62FC 00008590 */  lbu        $a1, 0x0($a0)
/* A6B00 800B6300 01000224 */  addiu      $v0, $zero, 0x1
/* A6B04 800B6304 0600A214 */  bne        $a1, $v0, .L800B6320
/* A6B08 800B6308 07000224 */   addiu     $v0, $zero, 0x7
/* A6B0C 800B630C 0C008384 */  lh         $v1, 0xC($a0)
/* A6B10 800B6310 3C00C28C */  lw         $v0, 0x3C($a2)
/* A6B14 800B6314 00000000 */  nop
/* A6B18 800B6318 16006210 */  beq        $v1, $v0, .L800B6374
/* A6B1C 800B631C 07000224 */   addiu     $v0, $zero, 0x7
.L800B6320:
/* A6B20 800B6320 0600A214 */  bne        $a1, $v0, .L800B633C
/* A6B24 800B6324 05000224 */   addiu     $v0, $zero, 0x5
/* A6B28 800B6328 08008384 */  lh         $v1, 0x8($a0)
/* A6B2C 800B632C 3C00C28C */  lw         $v0, 0x3C($a2)
/* A6B30 800B6330 00000000 */  nop
/* A6B34 800B6334 0F006210 */  beq        $v1, $v0, .L800B6374
/* A6B38 800B6338 05000224 */   addiu     $v0, $zero, 0x5
.L800B633C:
/* A6B3C 800B633C 0600A214 */  bne        $a1, $v0, .L800B6358
/* A6B40 800B6340 08000224 */   addiu     $v0, $zero, 0x8
/* A6B44 800B6344 02008384 */  lh         $v1, 0x2($a0)
/* A6B48 800B6348 3C00C28C */  lw         $v0, 0x3C($a2)
/* A6B4C 800B634C 00000000 */  nop
/* A6B50 800B6350 08006210 */  beq        $v1, $v0, .L800B6374
/* A6B54 800B6354 08000224 */   addiu     $v0, $zero, 0x8
.L800B6358:
/* A6B58 800B6358 0A00A214 */  bne        $a1, $v0, .L800B6384
/* A6B5C 800B635C 00000000 */   nop
/* A6B60 800B6360 02008384 */  lh         $v1, 0x2($a0)
/* A6B64 800B6364 3C00C28C */  lw         $v0, 0x3C($a2)
/* A6B68 800B6368 00000000 */  nop
/* A6B6C 800B636C 05006214 */  bne        $v1, $v0, .L800B6384
/* A6B70 800B6370 00000000 */   nop
.L800B6374:
/* A6B74 800B6374 08D8020C */  jal        SAVE_DeleteBlock
/* A6B78 800B6378 00000000 */   nop
/* A6B7C 800B637C E8D80208 */  j          .L800B63A0
/* A6B80 800B6380 00000000 */   nop
.L800B6384:
/* A6B84 800B6384 01008290 */  lbu        $v0, 0x1($a0)
/* A6B88 800B6388 E4FD838F */  lw         $v1, %gp_rel(savedInfoTracker + 0x8)($gp)
/* A6B8C 800B638C 80100200 */  sll        $v0, $v0, 2
/* A6B90 800B6390 21208200 */  addu       $a0, $a0, $v0
/* A6B94 800B6394 2B188300 */  sltu       $v1, $a0, $v1
/* A6B98 800B6398 D8FF6014 */  bnez       $v1, .L800B62FC
/* A6B9C 800B639C 00000000 */   nop
.L800B63A0:
/* A6BA0 800B63A0 1000BF8F */  lw         $ra, 0x10($sp)
/* A6BA4 800B63A4 00000000 */  nop
/* A6BA8 800B63A8 0800E003 */  jr         $ra
/* A6BAC 800B63AC 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_DeleteInstance, . - SAVE_DeleteInstance
