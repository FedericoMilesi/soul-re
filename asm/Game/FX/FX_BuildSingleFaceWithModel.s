.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_BuildSingleFaceWithModel
/* 33620 80042E20 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 33624 80042E24 4000A38F */  lw         $v1, 0x40($sp)
/* 33628 80042E28 4400A88F */  lw         $t0, 0x44($sp)
/* 3362C 80042E2C 4800A98F */  lw         $t1, 0x48($sp)
/* 33630 80042E30 4C00AA8F */  lw         $t2, 0x4C($sp)
/* 33634 80042E34 5000A28F */  lw         $v0, 0x50($sp)
/* 33638 80042E38 2800BFAF */  sw         $ra, 0x28($sp)
/* 3363C 80042E3C 2000A0AF */  sw         $zero, 0x20($sp)
/* 33640 80042E40 00140200 */  sll        $v0, $v0, 16
/* 33644 80042E44 03140200 */  sra        $v0, $v0, 16
/* 33648 80042E48 1000A3AF */  sw         $v1, 0x10($sp)
/* 3364C 80042E4C 1400A8AF */  sw         $t0, 0x14($sp)
/* 33650 80042E50 1800A9AF */  sw         $t1, 0x18($sp)
/* 33654 80042E54 1C00AAAF */  sw         $t2, 0x1C($sp)
/* 33658 80042E58 490B010C */  jal        _FX_BuildSingleFaceWithModel
/* 3365C 80042E5C 2400A2AF */   sw        $v0, 0x24($sp)
/* 33660 80042E60 2800BF8F */  lw         $ra, 0x28($sp)
/* 33664 80042E64 00000000 */  nop
/* 33668 80042E68 0800E003 */  jr         $ra
/* 3366C 80042E6C 3000BD27 */   addiu     $sp, $sp, 0x30
.size FX_BuildSingleFaceWithModel, . - FX_BuildSingleFaceWithModel
