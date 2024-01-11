.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StateSwitchStateData
/* 63304 80072B04 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 63308 80072B08 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6330C 80072B0C 21988000 */  addu       $s3, $a0, $zero
/* 63310 80072B10 1800B2AF */  sw         $s2, 0x18($sp)
/* 63314 80072B14 2190A000 */  addu       $s2, $a1, $zero
/* 63318 80072B18 2400B5AF */  sw         $s5, 0x24($sp)
/* 6331C 80072B1C 21A8C000 */  addu       $s5, $a2, $zero
/* 63320 80072B20 2000B4AF */  sw         $s4, 0x20($sp)
/* 63324 80072B24 21A0E000 */  addu       $s4, $a3, $zero
/* 63328 80072B28 1000B0AF */  sw         $s0, 0x10($sp)
/* 6332C 80072B2C C0801200 */  sll        $s0, $s2, 3
/* 63330 80072B30 21801202 */  addu       $s0, $s0, $s2
/* 63334 80072B34 C0801000 */  sll        $s0, $s0, 3
/* 63338 80072B38 23801202 */  subu       $s0, $s0, $s2
/* 6333C 80072B3C 80801000 */  sll        $s0, $s0, 2
/* 63340 80072B40 1400B1AF */  sw         $s1, 0x14($sp)
/* 63344 80072B44 21881302 */  addu       $s1, $s0, $s3
/* 63348 80072B48 0C003126 */  addiu      $s1, $s1, 0xC
/* 6334C 80072B4C 2800BFAF */  sw         $ra, 0x28($sp)
/* 63350 80072B50 36C3010C */  jal        PurgeMessageQueue
/* 63354 80072B54 21202002 */   addu      $a0, $s1, $zero
/* 63358 80072B58 21202002 */  addu       $a0, $s1, $zero
/* 6335C 80072B5C 1000053C */  lui        $a1, (0x100001 >> 16)
/* 63360 80072B60 0100A534 */  ori        $a1, $a1, (0x100001 & 0xFFFF)
/* 63364 80072B64 4EC3010C */  jal        EnMessageQueueData
/* 63368 80072B68 21308002 */   addu      $a2, $s4, $zero
/* 6336C 80072B6C 21807002 */  addu       $s0, $s3, $s0
/* 63370 80072B70 21206002 */  addu       $a0, $s3, $zero
/* 63374 80072B74 21284002 */  addu       $a1, $s2, $zero
/* 63378 80072B78 21300000 */  addu       $a2, $zero, $zero
/* 6337C 80072B7C 09F8A002 */  jalr       $s5
/* 63380 80072B80 080015AE */   sw        $s5, 0x8($s0)
/* 63384 80072B84 21202002 */  addu       $a0, $s1, $zero
/* 63388 80072B88 1000053C */  lui        $a1, (0x100004 >> 16)
/* 6338C 80072B8C 0400A534 */  ori        $a1, $a1, (0x100004 & 0xFFFF)
/* 63390 80072B90 4EC3010C */  jal        EnMessageQueueData
/* 63394 80072B94 21300000 */   addu      $a2, $zero, $zero
/* 63398 80072B98 21202002 */  addu       $a0, $s1, $zero
/* 6339C 80072B9C 1000053C */  lui        $a1, (0x100004 >> 16)
/* 633A0 80072BA0 0400A534 */  ori        $a1, $a1, (0x100004 & 0xFFFF)
/* 633A4 80072BA4 4EC3010C */  jal        EnMessageQueueData
/* 633A8 80072BA8 21300000 */   addu      $a2, $zero, $zero
/* 633AC 80072BAC 2800BF8F */  lw         $ra, 0x28($sp)
/* 633B0 80072BB0 2400B58F */  lw         $s5, 0x24($sp)
/* 633B4 80072BB4 2000B48F */  lw         $s4, 0x20($sp)
/* 633B8 80072BB8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 633BC 80072BBC 1800B28F */  lw         $s2, 0x18($sp)
/* 633C0 80072BC0 1400B18F */  lw         $s1, 0x14($sp)
/* 633C4 80072BC4 1000B08F */  lw         $s0, 0x10($sp)
/* 633C8 80072BC8 0800E003 */  jr         $ra
/* 633CC 80072BCC 3000BD27 */   addiu     $sp, $sp, 0x30
.size StateSwitchStateData, . - StateSwitchStateData
