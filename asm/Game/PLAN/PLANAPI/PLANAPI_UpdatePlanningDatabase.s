.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_UpdatePlanningDatabase
/* 88AD0 800982D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 88AD4 800982D4 1800B0AF */  sw         $s0, 0x18($sp)
/* 88AD8 800982D8 2180A000 */  addu       $s0, $a1, $zero
/* 88ADC 800982DC 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 88AE0 800982E0 2800B4AF */  sw         $s4, 0x28($sp)
/* 88AE4 800982E4 2400B3AF */  sw         $s3, 0x24($sp)
/* 88AE8 800982E8 2000B2AF */  sw         $s2, 0x20($sp)
/* 88AEC 800982EC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 88AF0 800982F0 1002938C */  lw         $s3, 0x210($a0)
/* 88AF4 800982F4 EBF4020C */  jal        GetRCnt
/* 88AF8 800982F8 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 88AFC 800982FC 01000324 */  addiu      $v1, $zero, 0x1
/* 88B00 80098300 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 88B04 80098304 01001224 */  addiu      $s2, $zero, 0x1
/* 88B08 80098308 8EBF83A3 */  sb         $v1, %gp_rel(gameTrackerX + 0x1C6)($gp)
/* 88B0C 8009830C 5890838F */  lw         $v1, %gp_rel(gameTimer)($gp)
/* 88B10 80098310 ECF5848F */  lw         $a0, %gp_rel(poolManagementData)($gp)
/* 88B14 80098314 001C0300 */  sll        $v1, $v1, 16
/* 88B18 80098318 00008690 */  lbu        $a2, 0x0($a0)
/* 88B1C 8009831C 00000000 */  nop
/* 88B20 80098320 1300D210 */  beq        $a2, $s2, .L80098370
/* 88B24 80098324 25A04300 */   or        $s4, $v0, $v1
/* 88B28 80098328 0200C228 */  slti       $v0, $a2, 0x2
/* 88B2C 8009832C 05004010 */  beqz       $v0, .L80098344
/* 88B30 80098330 02000224 */   addiu     $v0, $zero, 0x2
/* 88B34 80098334 0900C010 */  beqz       $a2, .L8009835C
/* 88B38 80098338 21206002 */   addu      $a0, $s3, $zero
/* 88B3C 8009833C B7610208 */  j          .L800986DC
/* 88B40 80098340 00000000 */   nop
.L80098344:
/* 88B44 80098344 1000C210 */  beq        $a2, $v0, .L80098388
/* 88B48 80098348 03000224 */   addiu     $v0, $zero, 0x3
/* 88B4C 8009834C 9400C210 */  beq        $a2, $v0, .L800985A0
/* 88B50 80098350 00000000 */   nop
/* 88B54 80098354 B7610208 */  j          .L800986DC
/* 88B58 80098358 00000000 */   nop
.L8009835C:
/* 88B5C 8009835C 9B5E020C */  jal        PLAN_AddInitialNodes
/* 88B60 80098360 21280002 */   addu      $a1, $s0, $zero
/* 88B64 80098364 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88B68 80098368 BA610208 */  j          .L800986E8
/* 88B6C 8009836C 000052A0 */   sb        $s2, 0x0($v0)
.L80098370:
/* 88B70 80098370 21206002 */  addu       $a0, $s3, $zero
/* 88B74 80098374 CA5E020C */  jal        PLAN_AddOrRemoveNodes
/* 88B78 80098378 21280002 */   addu      $a1, $s0, $zero
/* 88B7C 8009837C ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88B80 80098380 B9610208 */  j          .L800986E4
/* 88B84 80098384 02000224 */   addiu     $v0, $zero, 0x2
.L80098388:
/* 88B88 80098388 045F020C */  jal        PLAN_FindNodeMostInNeedOfConnectivityExpansion
/* 88B8C 8009838C 21206002 */   addu      $a0, $s3, $zero
/* 88B90 80098390 21804000 */  addu       $s0, $v0, $zero
/* 88B94 80098394 21200002 */  addu       $a0, $s0, $zero
/* 88B98 80098398 3C66020C */  jal        PLANPOOL_GetClosestUnexploredValidNeighbor
/* 88B9C 8009839C 21286002 */   addu      $a1, $s3, $zero
/* 88BA0 800983A0 ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88BA4 800983A4 21884000 */  addu       $s1, $v0, $zero
/* 88BA8 800983A8 CF000012 */  beqz       $s0, .L800986E8
/* 88BAC 800983AC 000072A0 */   sb        $s2, 0x0($v1)
/* 88BB0 800983B0 CE002012 */  beqz       $s1, .L800986EC
/* 88BB4 800983B4 21208002 */   addu      $a0, $s4, $zero
/* 88BB8 800983B8 00000286 */  lh         $v0, 0x0($s0)
/* 88BBC 800983BC 00002486 */  lh         $a0, 0x0($s1)
/* 88BC0 800983C0 02000386 */  lh         $v1, 0x2($s0)
/* 88BC4 800983C4 02002586 */  lh         $a1, 0x2($s1)
/* 88BC8 800983C8 04002686 */  lh         $a2, 0x4($s1)
/* 88BCC 800983CC 23204400 */  subu       $a0, $v0, $a0
/* 88BD0 800983D0 04000286 */  lh         $v0, 0x4($s0)
/* 88BD4 800983D4 23286500 */  subu       $a1, $v1, $a1
/* 88BD8 800983D8 B7E6000C */  jal        MATH3D_LengthXYZ
/* 88BDC 800983DC 23304600 */   subu      $a2, $v0, $a2
/* 88BE0 800983E0 70174228 */  slti       $v0, $v0, 0x1770
/* 88BE4 800983E4 65004010 */  beqz       $v0, .L8009857C
/* 88BE8 800983E8 21200002 */   addu      $a0, $s0, $zero
/* 88BEC 800983EC 8760020C */  jal        PLANAPI_PairType
/* 88BF0 800983F0 21282002 */   addu      $a1, $s1, $zero
/* 88BF4 800983F4 ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88BF8 800983F8 00000000 */  nop
/* 88BFC 800983FC 140062A4 */  sh         $v0, 0x14($v1)
/* 88C00 80098400 FFFF4330 */  andi       $v1, $v0, 0xFFFF
/* 88C04 80098404 03000224 */  addiu      $v0, $zero, 0x3
/* 88C08 80098408 1E006210 */  beq        $v1, $v0, .L80098484
/* 88C0C 8009840C 04006228 */   slti      $v0, $v1, 0x4
/* 88C10 80098410 05004010 */  beqz       $v0, .L80098428
/* 88C14 80098414 02020224 */   addiu     $v0, $zero, 0x202
/* 88C18 80098418 05006010 */  beqz       $v1, .L80098430
/* 88C1C 8009841C 21200002 */   addu      $a0, $s0, $zero
/* 88C20 80098420 42610208 */  j          .L80098508
/* 88C24 80098424 00000000 */   nop
.L80098428:
/* 88C28 80098428 37006214 */  bne        $v1, $v0, .L80098508
/* 88C2C 8009842C 21200002 */   addu      $a0, $s0, $zero
.L80098430:
/* 88C30 80098430 21200002 */  addu       $a0, $s0, $zero
/* 88C34 80098434 9960020C */  jal        PLANAPI_PassThroughHit
/* 88C38 80098438 21282002 */   addu      $a1, $s1, $zero
/* 88C3C 8009843C 21200002 */  addu       $a0, $s0, $zero
/* 88C40 80098440 21282002 */  addu       $a1, $s1, $zero
/* 88C44 80098444 21300000 */  addu       $a2, $zero, $zero
/* 88C48 80098448 21384000 */  addu       $a3, $v0, $zero
/* 88C4C 8009844C 00010224 */  addiu      $v0, $zero, 0x100
/* 88C50 80098450 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88C54 80098454 1000A2AF */   sw        $v0, 0x10($sp)
/* 88C58 80098458 21904000 */  addu       $s2, $v0, $zero
/* 88C5C 8009845C 21200002 */  addu       $a0, $s0, $zero
/* 88C60 80098460 9960020C */  jal        PLANAPI_PassThroughHit
/* 88C64 80098464 21282002 */   addu      $a1, $s1, $zero
/* 88C68 80098468 21200002 */  addu       $a0, $s0, $zero
/* 88C6C 8009846C 21282002 */  addu       $a1, $s1, $zero
/* 88C70 80098470 21300000 */  addu       $a2, $zero, $zero
/* 88C74 80098474 21384000 */  addu       $a3, $v0, $zero
/* 88C78 80098478 00FF0224 */  addiu      $v0, $zero, -0x100
/* 88C7C 8009847C 3E610208 */  j          .L800984F8
/* 88C80 80098480 1000A2AF */   sw        $v0, 0x10($sp)
.L80098484:
/* 88C84 80098484 14000296 */  lhu        $v0, 0x14($s0)
/* 88C88 80098488 00000000 */  nop
/* 88C8C 8009848C C2100200 */  srl        $v0, $v0, 3
/* 88C90 80098490 03004230 */  andi       $v0, $v0, 0x3
/* 88C94 80098494 05004314 */  bne        $v0, $v1, .L800984AC
/* 88C98 80098498 21200002 */   addu      $a0, $s0, $zero
/* 88C9C 8009849C 21100002 */  addu       $v0, $s0, $zero
/* 88CA0 800984A0 21802002 */  addu       $s0, $s1, $zero
/* 88CA4 800984A4 21884000 */  addu       $s1, $v0, $zero
/* 88CA8 800984A8 21200002 */  addu       $a0, $s0, $zero
.L800984AC:
/* 88CAC 800984AC 9960020C */  jal        PLANAPI_PassThroughHit
/* 88CB0 800984B0 21282002 */   addu      $a1, $s1, $zero
/* 88CB4 800984B4 21200002 */  addu       $a0, $s0, $zero
/* 88CB8 800984B8 21282002 */  addu       $a1, $s1, $zero
/* 88CBC 800984BC ECF5878F */  lw         $a3, %gp_rel(poolManagementData)($gp)
/* 88CC0 800984C0 21300000 */  addu       $a2, $zero, $zero
/* 88CC4 800984C4 1000A2AF */  sw         $v0, 0x10($sp)
/* 88CC8 800984C8 2764020C */  jal        PLANCOLL_DoesWaterPathUpExist
/* 88CCC 800984CC 1600E724 */   addiu     $a3, $a3, 0x16
/* 88CD0 800984D0 21904000 */  addu       $s2, $v0, $zero
/* 88CD4 800984D4 21200002 */  addu       $a0, $s0, $zero
/* 88CD8 800984D8 9960020C */  jal        PLANAPI_PassThroughHit
/* 88CDC 800984DC 21282002 */   addu      $a1, $s1, $zero
/* 88CE0 800984E0 21202002 */  addu       $a0, $s1, $zero
/* 88CE4 800984E4 21300000 */  addu       $a2, $zero, $zero
/* 88CE8 800984E8 ECF5858F */  lw         $a1, %gp_rel(poolManagementData)($gp)
/* 88CEC 800984EC 21384000 */  addu       $a3, $v0, $zero
/* 88CF0 800984F0 1000A0AF */  sw         $zero, 0x10($sp)
/* 88CF4 800984F4 1600A524 */  addiu      $a1, $a1, 0x16
.L800984F8:
/* 88CF8 800984F8 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88CFC 800984FC 00000000 */   nop
/* 88D00 80098500 4C610208 */  j          .L80098530
/* 88D04 80098504 21184000 */   addu      $v1, $v0, $zero
.L80098508:
/* 88D08 80098508 9960020C */  jal        PLANAPI_PassThroughHit
/* 88D0C 8009850C 21282002 */   addu      $a1, $s1, $zero
/* 88D10 80098510 1000A0AF */  sw         $zero, 0x10($sp)
/* 88D14 80098514 21200002 */  addu       $a0, $s0, $zero
/* 88D18 80098518 21282002 */  addu       $a1, $s1, $zero
/* 88D1C 8009851C 21300000 */  addu       $a2, $zero, $zero
/* 88D20 80098520 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88D24 80098524 21384000 */   addu      $a3, $v0, $zero
/* 88D28 80098528 21184000 */  addu       $v1, $v0, $zero
/* 88D2C 8009852C 21906000 */  addu       $s2, $v1, $zero
.L80098530:
/* 88D30 80098530 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 88D34 80098534 00000000 */  nop
/* 88D38 80098538 080050AC */  sw         $s0, 0x8($v0)
/* 88D3C 8009853C 08004012 */  beqz       $s2, .L80098560
/* 88D40 80098540 0C0051AC */   sw        $s1, 0xC($v0)
/* 88D44 80098544 06006010 */  beqz       $v1, .L80098560
/* 88D48 80098548 21200002 */   addu      $a0, $s0, $zero
/* 88D4C 8009854C 21282002 */  addu       $a1, $s1, $zero
/* 88D50 80098550 E665020C */  jal        PLANPOOL_MarkTwoNodesAsConnected
/* 88D54 80098554 21306002 */   addu      $a2, $s3, $zero
/* 88D58 80098558 5C610208 */  j          .L80098570
/* 88D5C 8009855C 00000000 */   nop
.L80098560:
/* 88D60 80098560 21200002 */  addu       $a0, $s0, $zero
/* 88D64 80098564 21282002 */  addu       $a1, $s1, $zero
/* 88D68 80098568 2566020C */  jal        PLANPOOL_MarkTwoNodesAsNotConnected
/* 88D6C 8009856C 21306002 */   addu      $a2, $s3, $zero
.L80098570:
/* 88D70 80098570 ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88D74 80098574 B9610208 */  j          .L800986E4
/* 88D78 80098578 03000224 */   addiu     $v0, $zero, 0x3
.L8009857C:
/* 88D7C 8009857C 21282002 */  addu       $a1, $s1, $zero
/* 88D80 80098580 2566020C */  jal        PLANPOOL_MarkTwoNodesAsNotConnected
/* 88D84 80098584 21306002 */   addu      $a2, $s3, $zero
/* 88D88 80098588 21202002 */  addu       $a0, $s1, $zero
/* 88D8C 8009858C 21280002 */  addu       $a1, $s0, $zero
/* 88D90 80098590 2566020C */  jal        PLANPOOL_MarkTwoNodesAsNotConnected
/* 88D94 80098594 21306002 */   addu      $a2, $s3, $zero
/* 88D98 80098598 BB610208 */  j          .L800986EC
/* 88D9C 8009859C 21208002 */   addu      $a0, $s4, $zero
.L800985A0:
/* 88DA0 800985A0 0800908C */  lw         $s0, 0x8($a0)
/* 88DA4 800985A4 14008394 */  lhu        $v1, 0x14($a0)
/* 88DA8 800985A8 0C00918C */  lw         $s1, 0xC($a0)
/* 88DAC 800985AC 1E006610 */  beq        $v1, $a2, .L80098628
/* 88DB0 800985B0 04006228 */   slti      $v0, $v1, 0x4
/* 88DB4 800985B4 05004010 */  beqz       $v0, .L800985CC
/* 88DB8 800985B8 02020224 */   addiu     $v0, $zero, 0x202
/* 88DBC 800985BC 05006010 */  beqz       $v1, .L800985D4
/* 88DC0 800985C0 21202002 */   addu      $a0, $s1, $zero
/* 88DC4 800985C4 A2610208 */  j          .L80098688
/* 88DC8 800985C8 00000000 */   nop
.L800985CC:
/* 88DCC 800985CC 2E006214 */  bne        $v1, $v0, .L80098688
/* 88DD0 800985D0 21202002 */   addu      $a0, $s1, $zero
.L800985D4:
/* 88DD4 800985D4 21202002 */  addu       $a0, $s1, $zero
/* 88DD8 800985D8 9960020C */  jal        PLANAPI_PassThroughHit
/* 88DDC 800985DC 21280002 */   addu      $a1, $s0, $zero
/* 88DE0 800985E0 21202002 */  addu       $a0, $s1, $zero
/* 88DE4 800985E4 21280002 */  addu       $a1, $s0, $zero
/* 88DE8 800985E8 21300000 */  addu       $a2, $zero, $zero
/* 88DEC 800985EC 21384000 */  addu       $a3, $v0, $zero
/* 88DF0 800985F0 00010224 */  addiu      $v0, $zero, 0x100
/* 88DF4 800985F4 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88DF8 800985F8 1000A2AF */   sw        $v0, 0x10($sp)
/* 88DFC 800985FC 21904000 */  addu       $s2, $v0, $zero
/* 88E00 80098600 21202002 */  addu       $a0, $s1, $zero
/* 88E04 80098604 9960020C */  jal        PLANAPI_PassThroughHit
/* 88E08 80098608 21280002 */   addu      $a1, $s0, $zero
/* 88E0C 8009860C 21202002 */  addu       $a0, $s1, $zero
/* 88E10 80098610 21280002 */  addu       $a1, $s0, $zero
/* 88E14 80098614 21300000 */  addu       $a2, $zero, $zero
/* 88E18 80098618 21384000 */  addu       $a3, $v0, $zero
/* 88E1C 8009861C 00FF0224 */  addiu      $v0, $zero, -0x100
/* 88E20 80098620 9E610208 */  j          .L80098678
/* 88E24 80098624 1000A2AF */   sw        $v0, 0x10($sp)
.L80098628:
/* 88E28 80098628 21202002 */  addu       $a0, $s1, $zero
/* 88E2C 8009862C 9960020C */  jal        PLANAPI_PassThroughHit
/* 88E30 80098630 21280002 */   addu      $a1, $s0, $zero
/* 88E34 80098634 21202002 */  addu       $a0, $s1, $zero
/* 88E38 80098638 21280002 */  addu       $a1, $s0, $zero
/* 88E3C 8009863C ECF5878F */  lw         $a3, %gp_rel(poolManagementData)($gp)
/* 88E40 80098640 21300000 */  addu       $a2, $zero, $zero
/* 88E44 80098644 1000A2AF */  sw         $v0, 0x10($sp)
/* 88E48 80098648 2764020C */  jal        PLANCOLL_DoesWaterPathUpExist
/* 88E4C 8009864C 1600E724 */   addiu     $a3, $a3, 0x16
/* 88E50 80098650 21904000 */  addu       $s2, $v0, $zero
/* 88E54 80098654 21202002 */  addu       $a0, $s1, $zero
/* 88E58 80098658 9960020C */  jal        PLANAPI_PassThroughHit
/* 88E5C 8009865C 21280002 */   addu      $a1, $s0, $zero
/* 88E60 80098660 21200002 */  addu       $a0, $s0, $zero
/* 88E64 80098664 21300000 */  addu       $a2, $zero, $zero
/* 88E68 80098668 ECF5858F */  lw         $a1, %gp_rel(poolManagementData)($gp)
/* 88E6C 8009866C 21384000 */  addu       $a3, $v0, $zero
/* 88E70 80098670 1000A0AF */  sw         $zero, 0x10($sp)
/* 88E74 80098674 1600A524 */  addiu      $a1, $a1, 0x16
.L80098678:
/* 88E78 80098678 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88E7C 8009867C 00000000 */   nop
/* 88E80 80098680 AC610208 */  j          .L800986B0
/* 88E84 80098684 21184000 */   addu      $v1, $v0, $zero
.L80098688:
/* 88E88 80098688 9960020C */  jal        PLANAPI_PassThroughHit
/* 88E8C 8009868C 21280002 */   addu      $a1, $s0, $zero
/* 88E90 80098690 1000A0AF */  sw         $zero, 0x10($sp)
/* 88E94 80098694 21202002 */  addu       $a0, $s1, $zero
/* 88E98 80098698 21280002 */  addu       $a1, $s0, $zero
/* 88E9C 8009869C 21300000 */  addu       $a2, $zero, $zero
/* 88EA0 800986A0 B862020C */  jal        PLANCOLL_DoesLOSExistFinal
/* 88EA4 800986A4 21384000 */   addu      $a3, $v0, $zero
/* 88EA8 800986A8 21184000 */  addu       $v1, $v0, $zero
/* 88EAC 800986AC 21906000 */  addu       $s2, $v1, $zero
.L800986B0:
/* 88EB0 800986B0 07004012 */  beqz       $s2, .L800986D0
/* 88EB4 800986B4 21202002 */   addu      $a0, $s1, $zero
/* 88EB8 800986B8 06006010 */  beqz       $v1, .L800986D4
/* 88EBC 800986BC 21280002 */   addu      $a1, $s0, $zero
/* 88EC0 800986C0 E665020C */  jal        PLANPOOL_MarkTwoNodesAsConnected
/* 88EC4 800986C4 21306002 */   addu      $a2, $s3, $zero
/* 88EC8 800986C8 B7610208 */  j          .L800986DC
/* 88ECC 800986CC 00000000 */   nop
.L800986D0:
/* 88ED0 800986D0 21280002 */  addu       $a1, $s0, $zero
.L800986D4:
/* 88ED4 800986D4 2566020C */  jal        PLANPOOL_MarkTwoNodesAsNotConnected
/* 88ED8 800986D8 21306002 */   addu      $a2, $s3, $zero
.L800986DC:
/* 88EDC 800986DC ECF5838F */  lw         $v1, %gp_rel(poolManagementData)($gp)
/* 88EE0 800986E0 01000224 */  addiu      $v0, $zero, 0x1
.L800986E4:
/* 88EE4 800986E4 000062A0 */  sb         $v0, 0x0($v1)
.L800986E8:
/* 88EE8 800986E8 21208002 */  addu       $a0, $s4, $zero
.L800986EC:
/* 88EEC 800986EC 825F020C */  jal        PLANAPI_DoTimingCalcsAndDrawing
/* 88EF0 800986F0 21286002 */   addu      $a1, $s3, $zero
/* 88EF4 800986F4 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 88EF8 800986F8 2800B48F */  lw         $s4, 0x28($sp)
/* 88EFC 800986FC 2400B38F */  lw         $s3, 0x24($sp)
/* 88F00 80098700 2000B28F */  lw         $s2, 0x20($sp)
/* 88F04 80098704 1C00B18F */  lw         $s1, 0x1C($sp)
/* 88F08 80098708 1800B08F */  lw         $s0, 0x18($sp)
/* 88F0C 8009870C 8EBF80A3 */  sb         $zero, %gp_rel(gameTrackerX + 0x1C6)($gp)
/* 88F10 80098710 0800E003 */  jr         $ra
/* 88F14 80098714 3000BD27 */   addiu     $sp, $sp, 0x30
.size PLANAPI_UpdatePlanningDatabase, . - PLANAPI_UpdatePlanningDatabase
