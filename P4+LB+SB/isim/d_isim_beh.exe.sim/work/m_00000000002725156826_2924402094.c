/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Administrator.DESKTOP-E5KEEAC/Desktop/CPU/P4+LB+SB/DM.v";
static int ng1[] = {0, 0};
static int ng2[] = {3071, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static const char *ng5 = "@%h: *%h <= %h";
static int ng6[] = {2, 0};
static int ng7[] = {3, 0};
static const char *ng8 = "@%h: *%h <== %h";
static int ng9[] = {7, 0};
static int ng10[] = {15, 0};
static int ng11[] = {8, 0};
static int ng12[] = {23, 0};
static int ng13[] = {16, 0};
static int ng14[] = {31, 0};
static int ng15[] = {24, 0};
static unsigned int ng16[] = {16777215U, 0U};



static void Initial_34_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(35, ng0);

LAB2:    xsi_set_current_line(36, ng0);
    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3528);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3528);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_leq(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 3848);
    t16 = (t0 + 3848);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 3848);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 3528);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 3528);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 3528);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB6:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, *((unsigned int *)t15), t35, 0LL);
    goto LAB7;

}

static void Always_41_1(char *t0)
{
    char t6[8];
    char t30[8];
    char t31[8];
    char t83[8];
    char t85[8];
    char t86[8];
    char t87[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    int t42;
    int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    int t84;
    char *t88;
    char *t89;
    char *t90;
    int t91;
    int t92;
    char *t93;
    int t94;
    int t95;
    int t96;
    int t97;
    int t98;
    int t99;

LAB0:    t1 = (t0 + 5016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 6576);
    *((int *)t2) = 1;
    t3 = (t0 + 5048);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);

LAB5:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB22;

LAB19:    if (t18 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t6) = 1;

LAB22:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(44, ng0);

LAB13:    xsi_set_current_line(45, ng0);
    xsi_set_current_line(45, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 3688);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 32);

LAB14:    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_leq(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB15;

LAB16:    goto LAB12;

LAB15:    xsi_set_current_line(45, ng0);
    t8 = ((char*)((ng4)));
    t21 = (t0 + 3848);
    t22 = (t0 + 3848);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 3848);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 3688);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t37, 32, 1);
    t38 = (t30 + 4);
    t14 = *((unsigned int *)t38);
    t39 = (!(t14));
    t40 = (t31 + 4);
    t15 = *((unsigned int *)t40);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 3688);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB14;

LAB17:    t16 = *((unsigned int *)t30);
    t17 = *((unsigned int *)t31);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t21, t8, 0, *((unsigned int *)t31), t44, 0LL);
    goto LAB18;

LAB21:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(48, ng0);

LAB26:    xsi_set_current_line(49, ng0);
    t21 = (t0 + 1528U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng1)));
    memset(t30, 0, 8);
    t28 = (t22 + 4);
    t29 = (t21 + 4);
    t45 = *((unsigned int *)t22);
    t46 = *((unsigned int *)t21);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t28);
    t49 = *((unsigned int *)t29);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t28);
    t53 = *((unsigned int *)t29);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB30;

LAB27:    if (t54 != 0)
        goto LAB29;

LAB28:    *((unsigned int *)t30) = 1;

LAB30:    t33 = (t30 + 4);
    t57 = *((unsigned int *)t33);
    t58 = (~(t57));
    t59 = *((unsigned int *)t30);
    t60 = (t59 & t58);
    t61 = (t60 != 0);
    if (t61 > 0)
        goto LAB31;

LAB32:    xsi_set_current_line(63, ng0);

LAB68:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = (t0 + 2168U);
    t7 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    xsi_vlogfile_write(1, 0, 0, ng8, 4, t0, (char)118, t4, 32, (char)118, t5, 32, (char)118, t6, 8);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2648U);
    t4 = *((char **)t2);

LAB69:    t2 = ((char*)((ng1)));
    t39 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t39 == 1)
        goto LAB70;

LAB71:    t2 = ((char*)((ng3)));
    t39 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t39 == 1)
        goto LAB72;

LAB73:    t2 = ((char*)((ng6)));
    t39 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t39 == 1)
        goto LAB74;

LAB75:    t2 = ((char*)((ng7)));
    t39 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t39 == 1)
        goto LAB76;

LAB77:
LAB78:
LAB33:    goto LAB25;

LAB29:    t32 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB30;

LAB31:    xsi_set_current_line(49, ng0);

LAB34:    xsi_set_current_line(50, ng0);
    t34 = (t0 + 1688U);
    t35 = *((char **)t34);
    t34 = ((char*)((ng1)));
    memset(t31, 0, 8);
    t36 = (t35 + 4);
    t37 = (t34 + 4);
    t62 = *((unsigned int *)t35);
    t63 = *((unsigned int *)t34);
    t64 = (t62 ^ t63);
    t65 = *((unsigned int *)t36);
    t66 = *((unsigned int *)t37);
    t67 = (t65 ^ t66);
    t68 = (t64 | t67);
    t69 = *((unsigned int *)t36);
    t70 = *((unsigned int *)t37);
    t71 = (t69 | t70);
    t72 = (~(t71));
    t73 = (t68 & t72);
    if (t73 != 0)
        goto LAB38;

LAB35:    if (t71 != 0)
        goto LAB37;

LAB36:    *((unsigned int *)t31) = 1;

LAB38:    t40 = (t31 + 4);
    t74 = *((unsigned int *)t40);
    t75 = (~(t74));
    t76 = *((unsigned int *)t31);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(54, ng0);

LAB45:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);

LAB46:    t2 = ((char*)((ng1)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t39 == 1)
        goto LAB47;

LAB48:    t2 = ((char*)((ng3)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t39 == 1)
        goto LAB49;

LAB50:    t2 = ((char*)((ng6)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t39 == 1)
        goto LAB51;

LAB52:    t2 = ((char*)((ng7)));
    t39 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 32);
    if (t39 == 1)
        goto LAB53;

LAB54:
LAB55:
LAB41:    goto LAB33;

LAB37:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB38;

LAB39:    xsi_set_current_line(50, ng0);

LAB42:    xsi_set_current_line(51, ng0);
    t79 = (t0 + 2328U);
    t80 = *((char **)t79);
    t79 = (t0 + 2008U);
    t81 = *((char **)t79);
    t79 = (t0 + 2168U);
    t82 = *((char **)t79);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t80, 32, (char)118, t81, 32, (char)118, t82, 32);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 3848);
    t4 = (t0 + 3848);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = (t0 + 3848);
    t21 = (t8 + 64U);
    t22 = *((char **)t21);
    t28 = (t0 + 2008U);
    t29 = *((char **)t28);
    memset(t31, 0, 8);
    t28 = (t31 + 4);
    t32 = (t29 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (t9 >> 2);
    *((unsigned int *)t31) = t10;
    t11 = *((unsigned int *)t32);
    t12 = (t11 >> 2);
    *((unsigned int *)t28) = t12;
    t13 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t13 & 1073741823U);
    t14 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t14 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t6, t30, t7, t22, 2, 1, t31, 30, 2);
    t33 = (t6 + 4);
    t15 = *((unsigned int *)t33);
    t39 = (!(t15));
    t34 = (t30 + 4);
    t16 = *((unsigned int *)t34);
    t41 = (!(t16));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB43;

LAB44:    goto LAB41;

LAB43:    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t30);
    t43 = (t17 - t18);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t30), t44, 0LL);
    goto LAB44;

LAB47:    xsi_set_current_line(56, ng0);

LAB56:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t6 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 4294967295U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 4294967295U);
    t8 = (t0 + 3848);
    t21 = (t0 + 3848);
    t22 = (t21 + 72U);
    t28 = *((char **)t22);
    t29 = (t0 + 3848);
    t32 = (t29 + 64U);
    t33 = *((char **)t32);
    t34 = (t0 + 2008U);
    t35 = *((char **)t34);
    memset(t83, 0, 8);
    t34 = (t83 + 4);
    t36 = (t35 + 4);
    t15 = *((unsigned int *)t35);
    t16 = (t15 >> 2);
    *((unsigned int *)t83) = t16;
    t17 = *((unsigned int *)t36);
    t18 = (t17 >> 2);
    *((unsigned int *)t34) = t18;
    t19 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t20 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t28, t33, 2, 1, t83, 30, 2);
    t37 = (t30 + 4);
    t23 = *((unsigned int *)t37);
    t41 = (!(t23));
    t38 = (t31 + 4);
    t24 = *((unsigned int *)t38);
    t42 = (!(t24));
    t43 = (t41 && t42);
    if (t43 == 1)
        goto LAB57;

LAB58:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = (t0 + 2168U);
    t7 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t4, 32, (char)118, t5, 32, (char)118, t7, 32);
    goto LAB55;

LAB49:    xsi_set_current_line(57, ng0);

LAB59:    xsi_set_current_line(57, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    memset(t30, 0, 8);
    t4 = (t30 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 8);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 8);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 16777215U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 16777215U);
    t8 = (t0 + 2168U);
    t21 = *((char **)t8);
    memset(t31, 0, 8);
    t8 = (t31 + 4);
    t22 = (t21 + 4);
    t15 = *((unsigned int *)t21);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t22);
    t18 = (t17 >> 0);
    *((unsigned int *)t8) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 255U);
    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 255U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 8, t30, 24);
    t28 = (t0 + 3848);
    t29 = (t0 + 3848);
    t32 = (t29 + 72U);
    t33 = *((char **)t32);
    t34 = (t0 + 3848);
    t35 = (t34 + 64U);
    t36 = *((char **)t35);
    t37 = (t0 + 2008U);
    t38 = *((char **)t37);
    memset(t86, 0, 8);
    t37 = (t86 + 4);
    t40 = (t38 + 4);
    t23 = *((unsigned int *)t38);
    t24 = (t23 >> 2);
    *((unsigned int *)t86) = t24;
    t25 = *((unsigned int *)t40);
    t26 = (t25 >> 2);
    *((unsigned int *)t37) = t26;
    t27 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t27 & 1073741823U);
    t45 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t45 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t83, t85, t33, t36, 2, 1, t86, 30, 2);
    t79 = (t83 + 4);
    t46 = *((unsigned int *)t79);
    t41 = (!(t46));
    t80 = (t85 + 4);
    t47 = *((unsigned int *)t80);
    t42 = (!(t47));
    t43 = (t41 && t42);
    if (t43 == 1)
        goto LAB60;

LAB61:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = (t0 + 2168U);
    t7 = *((char **)t2);
    memset(t30, 0, 8);
    t2 = (t30 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 8);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 8);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 16777215U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 16777215U);
    t21 = (t0 + 2168U);
    t22 = *((char **)t21);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t28 = (t22 + 4);
    t15 = *((unsigned int *)t22);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t28);
    t18 = (t17 >> 0);
    *((unsigned int *)t21) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 255U);
    t20 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t20 & 255U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 8, t30, 24);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t4, 32, (char)118, t5, 32, (char)118, t6, 32);
    goto LAB55;

LAB51:    xsi_set_current_line(58, ng0);

LAB62:    xsi_set_current_line(58, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    memset(t30, 0, 8);
    t4 = (t30 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 16);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 16);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 65535U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 65535U);
    t8 = (t0 + 2168U);
    t21 = *((char **)t8);
    memset(t31, 0, 8);
    t8 = (t31 + 4);
    t22 = (t21 + 4);
    t15 = *((unsigned int *)t21);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t22);
    t18 = (t17 >> 0);
    *((unsigned int *)t8) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 65535U);
    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 65535U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 16, t30, 16);
    t28 = (t0 + 3848);
    t29 = (t0 + 3848);
    t32 = (t29 + 72U);
    t33 = *((char **)t32);
    t34 = (t0 + 3848);
    t35 = (t34 + 64U);
    t36 = *((char **)t35);
    t37 = (t0 + 2008U);
    t38 = *((char **)t37);
    memset(t86, 0, 8);
    t37 = (t86 + 4);
    t40 = (t38 + 4);
    t23 = *((unsigned int *)t38);
    t24 = (t23 >> 2);
    *((unsigned int *)t86) = t24;
    t25 = *((unsigned int *)t40);
    t26 = (t25 >> 2);
    *((unsigned int *)t37) = t26;
    t27 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t27 & 1073741823U);
    t45 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t45 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t83, t85, t33, t36, 2, 1, t86, 30, 2);
    t79 = (t83 + 4);
    t46 = *((unsigned int *)t79);
    t41 = (!(t46));
    t80 = (t85 + 4);
    t47 = *((unsigned int *)t80);
    t42 = (!(t47));
    t43 = (t41 && t42);
    if (t43 == 1)
        goto LAB63;

LAB64:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = (t0 + 2168U);
    t7 = *((char **)t2);
    memset(t30, 0, 8);
    t2 = (t30 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 16);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 16);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 65535U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 65535U);
    t21 = (t0 + 2168U);
    t22 = *((char **)t21);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t28 = (t22 + 4);
    t15 = *((unsigned int *)t22);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t28);
    t18 = (t17 >> 0);
    *((unsigned int *)t21) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 65535U);
    t20 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t20 & 65535U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 16, t30, 16);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t4, 32, (char)118, t5, 32, (char)118, t6, 32);
    goto LAB55;

LAB53:    xsi_set_current_line(59, ng0);

LAB65:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 2168U);
    t5 = *((char **)t4);
    memset(t30, 0, 8);
    t4 = (t30 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 24);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 24);
    *((unsigned int *)t4) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 255U);
    t14 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t14 & 255U);
    t8 = (t0 + 2168U);
    t21 = *((char **)t8);
    memset(t31, 0, 8);
    t8 = (t31 + 4);
    t22 = (t21 + 4);
    t15 = *((unsigned int *)t21);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t22);
    t18 = (t17 >> 0);
    *((unsigned int *)t8) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 16777215U);
    t20 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t20 & 16777215U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 24, t30, 8);
    t28 = (t0 + 3848);
    t29 = (t0 + 3848);
    t32 = (t29 + 72U);
    t33 = *((char **)t32);
    t34 = (t0 + 3848);
    t35 = (t34 + 64U);
    t36 = *((char **)t35);
    t37 = (t0 + 2008U);
    t38 = *((char **)t37);
    memset(t86, 0, 8);
    t37 = (t86 + 4);
    t40 = (t38 + 4);
    t23 = *((unsigned int *)t38);
    t24 = (t23 >> 2);
    *((unsigned int *)t86) = t24;
    t25 = *((unsigned int *)t40);
    t26 = (t25 >> 2);
    *((unsigned int *)t37) = t26;
    t27 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t27 & 1073741823U);
    t45 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t45 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t83, t85, t33, t36, 2, 1, t86, 30, 2);
    t79 = (t83 + 4);
    t46 = *((unsigned int *)t79);
    t41 = (!(t46));
    t80 = (t85 + 4);
    t47 = *((unsigned int *)t80);
    t42 = (!(t47));
    t43 = (t41 && t42);
    if (t43 == 1)
        goto LAB66;

LAB67:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2328U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    t2 = (t0 + 2168U);
    t7 = *((char **)t2);
    memset(t30, 0, 8);
    t2 = (t30 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 24);
    *((unsigned int *)t30) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 24);
    *((unsigned int *)t2) = t12;
    t13 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t13 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t21 = (t0 + 2168U);
    t22 = *((char **)t21);
    memset(t31, 0, 8);
    t21 = (t31 + 4);
    t28 = (t22 + 4);
    t15 = *((unsigned int *)t22);
    t16 = (t15 >> 0);
    *((unsigned int *)t31) = t16;
    t17 = *((unsigned int *)t28);
    t18 = (t17 >> 0);
    *((unsigned int *)t21) = t18;
    t19 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t19 & 16777215U);
    t20 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t20 & 16777215U);
    xsi_vlogtype_concat(t6, 32, 32, 2U, t31, 24, t30, 8);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t4, 32, (char)118, t5, 32, (char)118, t6, 32);
    goto LAB55;

LAB57:    t25 = *((unsigned int *)t30);
    t26 = *((unsigned int *)t31);
    t44 = (t25 - t26);
    t84 = (t44 + 1);
    xsi_vlogvar_wait_assign_value(t8, t6, 0, *((unsigned int *)t31), t84, 0LL);
    goto LAB58;

LAB60:    t48 = *((unsigned int *)t83);
    t49 = *((unsigned int *)t85);
    t44 = (t48 - t49);
    t84 = (t44 + 1);
    xsi_vlogvar_wait_assign_value(t28, t6, 0, *((unsigned int *)t85), t84, 0LL);
    goto LAB61;

LAB63:    t48 = *((unsigned int *)t83);
    t49 = *((unsigned int *)t85);
    t44 = (t48 - t49);
    t84 = (t44 + 1);
    xsi_vlogvar_wait_assign_value(t28, t6, 0, *((unsigned int *)t85), t84, 0LL);
    goto LAB64;

LAB66:    t48 = *((unsigned int *)t83);
    t49 = *((unsigned int *)t85);
    t44 = (t48 - t49);
    t84 = (t44 + 1);
    xsi_vlogvar_wait_assign_value(t28, t6, 0, *((unsigned int *)t85), t84, 0LL);
    goto LAB67;

LAB70:    xsi_set_current_line(66, ng0);
    t5 = (t0 + 2168U);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 255U);
    t21 = (t0 + 3848);
    t22 = (t0 + 3848);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 3848);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 2008U);
    t36 = *((char **)t35);
    memset(t83, 0, 8);
    t35 = (t83 + 4);
    t37 = (t36 + 4);
    t15 = *((unsigned int *)t36);
    t16 = (t15 >> 2);
    *((unsigned int *)t83) = t16;
    t17 = *((unsigned int *)t37);
    t18 = (t17 >> 2);
    *((unsigned int *)t35) = t18;
    t19 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t20 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t83, 30, 2);
    t38 = (t0 + 3848);
    t40 = (t38 + 72U);
    t79 = *((char **)t40);
    t80 = ((char*)((ng9)));
    t81 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t85, t86, t87, ((int*)(t79)), 2, t80, 32, 1, t81, 32, 1);
    t82 = (t30 + 4);
    t23 = *((unsigned int *)t82);
    t41 = (!(t23));
    t88 = (t31 + 4);
    t24 = *((unsigned int *)t88);
    t42 = (!(t24));
    t43 = (t41 && t42);
    t89 = (t85 + 4);
    t25 = *((unsigned int *)t89);
    t44 = (!(t25));
    t84 = (t43 && t44);
    t90 = (t86 + 4);
    t26 = *((unsigned int *)t90);
    t91 = (!(t26));
    t92 = (t84 && t91);
    t93 = (t87 + 4);
    t27 = *((unsigned int *)t93);
    t94 = (!(t27));
    t95 = (t92 && t94);
    if (t95 == 1)
        goto LAB79;

LAB80:    goto LAB78;

LAB72:    xsi_set_current_line(67, ng0);
    t5 = (t0 + 2168U);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 255U);
    t21 = (t0 + 3848);
    t22 = (t0 + 3848);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 3848);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 2008U);
    t36 = *((char **)t35);
    memset(t83, 0, 8);
    t35 = (t83 + 4);
    t37 = (t36 + 4);
    t15 = *((unsigned int *)t36);
    t16 = (t15 >> 2);
    *((unsigned int *)t83) = t16;
    t17 = *((unsigned int *)t37);
    t18 = (t17 >> 2);
    *((unsigned int *)t35) = t18;
    t19 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t20 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t83, 30, 2);
    t38 = (t0 + 3848);
    t40 = (t38 + 72U);
    t79 = *((char **)t40);
    t80 = ((char*)((ng10)));
    t81 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t85, t86, t87, ((int*)(t79)), 2, t80, 32, 1, t81, 32, 1);
    t82 = (t30 + 4);
    t23 = *((unsigned int *)t82);
    t41 = (!(t23));
    t88 = (t31 + 4);
    t24 = *((unsigned int *)t88);
    t42 = (!(t24));
    t43 = (t41 && t42);
    t89 = (t85 + 4);
    t25 = *((unsigned int *)t89);
    t44 = (!(t25));
    t84 = (t43 && t44);
    t90 = (t86 + 4);
    t26 = *((unsigned int *)t90);
    t91 = (!(t26));
    t92 = (t84 && t91);
    t93 = (t87 + 4);
    t27 = *((unsigned int *)t93);
    t94 = (!(t27));
    t95 = (t92 && t94);
    if (t95 == 1)
        goto LAB81;

LAB82:    goto LAB78;

LAB74:    xsi_set_current_line(68, ng0);
    t5 = (t0 + 2168U);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 255U);
    t21 = (t0 + 3848);
    t22 = (t0 + 3848);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 3848);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 2008U);
    t36 = *((char **)t35);
    memset(t83, 0, 8);
    t35 = (t83 + 4);
    t37 = (t36 + 4);
    t15 = *((unsigned int *)t36);
    t16 = (t15 >> 2);
    *((unsigned int *)t83) = t16;
    t17 = *((unsigned int *)t37);
    t18 = (t17 >> 2);
    *((unsigned int *)t35) = t18;
    t19 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t20 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t83, 30, 2);
    t38 = (t0 + 3848);
    t40 = (t38 + 72U);
    t79 = *((char **)t40);
    t80 = ((char*)((ng12)));
    t81 = ((char*)((ng13)));
    xsi_vlog_convert_partindices(t85, t86, t87, ((int*)(t79)), 2, t80, 32, 1, t81, 32, 1);
    t82 = (t30 + 4);
    t23 = *((unsigned int *)t82);
    t41 = (!(t23));
    t88 = (t31 + 4);
    t24 = *((unsigned int *)t88);
    t42 = (!(t24));
    t43 = (t41 && t42);
    t89 = (t85 + 4);
    t25 = *((unsigned int *)t89);
    t44 = (!(t25));
    t84 = (t43 && t44);
    t90 = (t86 + 4);
    t26 = *((unsigned int *)t90);
    t91 = (!(t26));
    t92 = (t84 && t91);
    t93 = (t87 + 4);
    t27 = *((unsigned int *)t93);
    t94 = (!(t27));
    t95 = (t92 && t94);
    if (t95 == 1)
        goto LAB83;

LAB84:    goto LAB78;

LAB76:    xsi_set_current_line(69, ng0);
    t5 = (t0 + 2168U);
    t7 = *((char **)t5);
    memset(t6, 0, 8);
    t5 = (t6 + 4);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t5) = t12;
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t13 & 255U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 255U);
    t21 = (t0 + 3848);
    t22 = (t0 + 3848);
    t28 = (t22 + 72U);
    t29 = *((char **)t28);
    t32 = (t0 + 3848);
    t33 = (t32 + 64U);
    t34 = *((char **)t33);
    t35 = (t0 + 2008U);
    t36 = *((char **)t35);
    memset(t83, 0, 8);
    t35 = (t83 + 4);
    t37 = (t36 + 4);
    t15 = *((unsigned int *)t36);
    t16 = (t15 >> 2);
    *((unsigned int *)t83) = t16;
    t17 = *((unsigned int *)t37);
    t18 = (t17 >> 2);
    *((unsigned int *)t35) = t18;
    t19 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t20 & 1073741823U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t83, 30, 2);
    t38 = (t0 + 3848);
    t40 = (t38 + 72U);
    t79 = *((char **)t40);
    t80 = ((char*)((ng14)));
    t81 = ((char*)((ng15)));
    xsi_vlog_convert_partindices(t85, t86, t87, ((int*)(t79)), 2, t80, 32, 1, t81, 32, 1);
    t82 = (t30 + 4);
    t23 = *((unsigned int *)t82);
    t41 = (!(t23));
    t88 = (t31 + 4);
    t24 = *((unsigned int *)t88);
    t42 = (!(t24));
    t43 = (t41 && t42);
    t89 = (t85 + 4);
    t25 = *((unsigned int *)t89);
    t44 = (!(t25));
    t84 = (t43 && t44);
    t90 = (t86 + 4);
    t26 = *((unsigned int *)t90);
    t91 = (!(t26));
    t92 = (t84 && t91);
    t93 = (t87 + 4);
    t27 = *((unsigned int *)t93);
    t94 = (!(t27));
    t95 = (t92 && t94);
    if (t95 == 1)
        goto LAB85;

LAB86:    goto LAB78;

LAB79:    t45 = *((unsigned int *)t87);
    t96 = (t45 + 0);
    t46 = *((unsigned int *)t31);
    t47 = *((unsigned int *)t86);
    t97 = (t46 + t47);
    t48 = *((unsigned int *)t85);
    t49 = *((unsigned int *)t86);
    t98 = (t48 - t49);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t21, t6, t96, t97, t99, 0LL);
    goto LAB80;

LAB81:    t45 = *((unsigned int *)t87);
    t96 = (t45 + 0);
    t46 = *((unsigned int *)t31);
    t47 = *((unsigned int *)t86);
    t97 = (t46 + t47);
    t48 = *((unsigned int *)t85);
    t49 = *((unsigned int *)t86);
    t98 = (t48 - t49);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t21, t6, t96, t97, t99, 0LL);
    goto LAB82;

LAB83:    t45 = *((unsigned int *)t87);
    t96 = (t45 + 0);
    t46 = *((unsigned int *)t31);
    t47 = *((unsigned int *)t86);
    t97 = (t46 + t47);
    t48 = *((unsigned int *)t85);
    t49 = *((unsigned int *)t86);
    t98 = (t48 - t49);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t21, t6, t96, t97, t99, 0LL);
    goto LAB84;

LAB85:    t45 = *((unsigned int *)t87);
    t96 = (t45 + 0);
    t46 = *((unsigned int *)t31);
    t47 = *((unsigned int *)t86);
    t97 = (t46 + t47);
    t48 = *((unsigned int *)t85);
    t49 = *((unsigned int *)t86);
    t98 = (t48 - t49);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t21, t6, t96, t97, t99, 0LL);
    goto LAB86;

}

static void Cont_75_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 5264U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2008U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 3U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 3U);
    t12 = (t0 + 6736);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 3U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 1);
    t25 = (t0 + 6592);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Cont_76_3(char *t0)
{
    char t5[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3848);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 3848);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 3848);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t13 = (t0 + 2008U);
    t14 = *((char **)t13);
    memset(t12, 0, 8);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 2);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 2);
    *((unsigned int *)t13) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 1073741823U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 1073741823U);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t12, 30, 2);
    t22 = (t0 + 6800);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t5, 8);
    xsi_driver_vfirst_trans(t22, 0, 31);
    t27 = (t0 + 6608);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Cont_77_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t33[8];
    char t47[8];
    char t48[8];
    char t51[8];
    char t78[8];
    char t92[8];
    char t93[8];
    char t96[8];
    char t123[8];
    char t137[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t94;
    char *t95;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t124;
    char *t125;
    char *t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    char *t138;
    char *t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    char *t147;
    char *t148;
    char *t149;
    char *t150;
    char *t151;
    unsigned int t152;
    unsigned int t153;
    char *t154;
    unsigned int t155;
    unsigned int t156;
    char *t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;

LAB0:    t1 = (t0 + 5760U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2648U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t43 = *((unsigned int *)t4);
    t44 = (~(t43));
    t45 = *((unsigned int *)t29);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t47, 8);

LAB20:    t147 = (t0 + 6864);
    t148 = (t147 + 56U);
    t149 = *((char **)t148);
    t150 = (t149 + 56U);
    t151 = *((char **)t150);
    memset(t151, 0, 8);
    t152 = 255U;
    t153 = t152;
    t154 = (t3 + 4);
    t155 = *((unsigned int *)t3);
    t152 = (t152 & t155);
    t156 = *((unsigned int *)t154);
    t153 = (t153 & t156);
    t157 = (t151 + 4);
    t158 = *((unsigned int *)t151);
    *((unsigned int *)t151) = (t158 | t152);
    t159 = *((unsigned int *)t157);
    *((unsigned int *)t157) = (t159 | t153);
    xsi_driver_vfirst_trans(t147, 0, 7);
    t160 = (t0 + 6624);
    *((int *)t160) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 2968U);
    t35 = *((char **)t34);
    memset(t33, 0, 8);
    t34 = (t33 + 4);
    t36 = (t35 + 4);
    t37 = *((unsigned int *)t35);
    t38 = (t37 >> 0);
    *((unsigned int *)t33) = t38;
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 0);
    *((unsigned int *)t34) = t40;
    t41 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t41 & 255U);
    t42 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t42 & 255U);
    goto LAB13;

LAB14:    t49 = (t0 + 2648U);
    t50 = *((char **)t49);
    t49 = ((char*)((ng3)));
    memset(t51, 0, 8);
    t52 = (t50 + 4);
    t53 = (t49 + 4);
    t54 = *((unsigned int *)t50);
    t55 = *((unsigned int *)t49);
    t56 = (t54 ^ t55);
    t57 = *((unsigned int *)t52);
    t58 = *((unsigned int *)t53);
    t59 = (t57 ^ t58);
    t60 = (t56 | t59);
    t61 = *((unsigned int *)t52);
    t62 = *((unsigned int *)t53);
    t63 = (t61 | t62);
    t64 = (~(t63));
    t65 = (t60 & t64);
    if (t65 != 0)
        goto LAB24;

LAB21:    if (t63 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t51) = 1;

LAB24:    memset(t48, 0, 8);
    t67 = (t51 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (~(t68));
    t70 = *((unsigned int *)t51);
    t71 = (t70 & t69);
    t72 = (t71 & 1U);
    if (t72 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t67) != 0)
        goto LAB27;

LAB28:    t74 = (t48 + 4);
    t75 = *((unsigned int *)t48);
    t76 = *((unsigned int *)t74);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB29;

LAB30:    t88 = *((unsigned int *)t48);
    t89 = (~(t88));
    t90 = *((unsigned int *)t74);
    t91 = (t89 || t90);
    if (t91 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t74) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t48) > 0)
        goto LAB35;

LAB36:    memcpy(t47, t92, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 8, t33, 8, t47, 8);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t66 = (t51 + 4);
    *((unsigned int *)t51) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t48) = 1;
    goto LAB28;

LAB27:    t73 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t73) = 1;
    goto LAB28;

LAB29:    t79 = (t0 + 2968U);
    t80 = *((char **)t79);
    memset(t78, 0, 8);
    t79 = (t78 + 4);
    t81 = (t80 + 4);
    t82 = *((unsigned int *)t80);
    t83 = (t82 >> 8);
    *((unsigned int *)t78) = t83;
    t84 = *((unsigned int *)t81);
    t85 = (t84 >> 8);
    *((unsigned int *)t79) = t85;
    t86 = *((unsigned int *)t78);
    *((unsigned int *)t78) = (t86 & 255U);
    t87 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t87 & 255U);
    goto LAB30;

LAB31:    t94 = (t0 + 2648U);
    t95 = *((char **)t94);
    t94 = ((char*)((ng6)));
    memset(t96, 0, 8);
    t97 = (t95 + 4);
    t98 = (t94 + 4);
    t99 = *((unsigned int *)t95);
    t100 = *((unsigned int *)t94);
    t101 = (t99 ^ t100);
    t102 = *((unsigned int *)t97);
    t103 = *((unsigned int *)t98);
    t104 = (t102 ^ t103);
    t105 = (t101 | t104);
    t106 = *((unsigned int *)t97);
    t107 = *((unsigned int *)t98);
    t108 = (t106 | t107);
    t109 = (~(t108));
    t110 = (t105 & t109);
    if (t110 != 0)
        goto LAB41;

LAB38:    if (t108 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t96) = 1;

LAB41:    memset(t93, 0, 8);
    t112 = (t96 + 4);
    t113 = *((unsigned int *)t112);
    t114 = (~(t113));
    t115 = *((unsigned int *)t96);
    t116 = (t115 & t114);
    t117 = (t116 & 1U);
    if (t117 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t112) != 0)
        goto LAB44;

LAB45:    t119 = (t93 + 4);
    t120 = *((unsigned int *)t93);
    t121 = *((unsigned int *)t119);
    t122 = (t120 || t121);
    if (t122 > 0)
        goto LAB46;

LAB47:    t133 = *((unsigned int *)t93);
    t134 = (~(t133));
    t135 = *((unsigned int *)t119);
    t136 = (t134 || t135);
    if (t136 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t119) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t93) > 0)
        goto LAB52;

LAB53:    memcpy(t92, t137, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t47, 8, t78, 8, t92, 8);
    goto LAB37;

LAB35:    memcpy(t47, t78, 8);
    goto LAB37;

LAB40:    t111 = (t96 + 4);
    *((unsigned int *)t96) = 1;
    *((unsigned int *)t111) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t93) = 1;
    goto LAB45;

LAB44:    t118 = (t93 + 4);
    *((unsigned int *)t93) = 1;
    *((unsigned int *)t118) = 1;
    goto LAB45;

LAB46:    t124 = (t0 + 2968U);
    t125 = *((char **)t124);
    memset(t123, 0, 8);
    t124 = (t123 + 4);
    t126 = (t125 + 4);
    t127 = *((unsigned int *)t125);
    t128 = (t127 >> 16);
    *((unsigned int *)t123) = t128;
    t129 = *((unsigned int *)t126);
    t130 = (t129 >> 16);
    *((unsigned int *)t124) = t130;
    t131 = *((unsigned int *)t123);
    *((unsigned int *)t123) = (t131 & 255U);
    t132 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t132 & 255U);
    goto LAB47;

LAB48:    t138 = (t0 + 2968U);
    t139 = *((char **)t138);
    memset(t137, 0, 8);
    t138 = (t137 + 4);
    t140 = (t139 + 4);
    t141 = *((unsigned int *)t139);
    t142 = (t141 >> 24);
    *((unsigned int *)t137) = t142;
    t143 = *((unsigned int *)t140);
    t144 = (t143 >> 24);
    *((unsigned int *)t138) = t144;
    t145 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t145 & 255U);
    t146 = *((unsigned int *)t138);
    *((unsigned int *)t138) = (t146 & 255U);
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t92, 8, t123, 8, t137, 8);
    goto LAB54;

LAB52:    memcpy(t92, t123, 8);
    goto LAB54;

}

static void Cont_82_5(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t11[8];
    char t38[8];
    char t45[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;

LAB0:    t1 = (t0 + 6008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2808U);
    t5 = *((char **)t2);
    t2 = (t0 + 2768U);
    t7 = (t2 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng9)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t5, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng3)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB7;

LAB4:    if (t23 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t11) = 1;

LAB7:    memset(t4, 0, 8);
    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t27) != 0)
        goto LAB10;

LAB11:    t34 = (t4 + 4);
    t35 = *((unsigned int *)t4);
    t36 = *((unsigned int *)t34);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB12;

LAB13:    t41 = *((unsigned int *)t4);
    t42 = (~(t41));
    t43 = *((unsigned int *)t34);
    t44 = (t42 || t43);
    if (t44 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t34) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t45, 8);

LAB20:    t48 = (t0 + 6928);
    t49 = (t48 + 56U);
    t50 = *((char **)t49);
    t51 = (t50 + 56U);
    t52 = *((char **)t51);
    memcpy(t52, t3, 8);
    xsi_driver_vfirst_trans(t48, 0, 31);
    t53 = (t0 + 6640);
    *((int *)t53) = 1;

LAB1:    return;
LAB6:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t33 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB11;

LAB12:    t39 = (t0 + 2808U);
    t40 = *((char **)t39);
    t39 = ((char*)((ng16)));
    xsi_vlogtype_concat(t38, 32, 32, 2U, t39, 24, t40, 8);
    goto LAB13;

LAB14:    t46 = (t0 + 2808U);
    t47 = *((char **)t46);
    t46 = ((char*)((ng4)));
    xsi_vlogtype_concat(t45, 32, 32, 2U, t46, 24, t47, 8);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t38, 32, t45, 32);
    goto LAB20;

LAB18:    memcpy(t3, t38, 8);
    goto LAB20;

}

static void Cont_83_6(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;

LAB0:    t1 = (t0 + 6256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t39, 8);

LAB20:    t33 = (t0 + 6992);
    t40 = (t33 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memcpy(t43, t3, 8);
    xsi_driver_vfirst_trans(t33, 0, 31);
    t44 = (t0 + 6656);
    *((int *)t44) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 3128U);
    t34 = *((char **)t33);
    goto LAB13;

LAB14:    t33 = (t0 + 2968U);
    t39 = *((char **)t33);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t34, 32, t39, 32);
    goto LAB20;

LAB18:    memcpy(t3, t34, 8);
    goto LAB20;

}


extern void work_m_00000000002725156826_2924402094_init()
{
	static char *pe[] = {(void *)Initial_34_0,(void *)Always_41_1,(void *)Cont_75_2,(void *)Cont_76_3,(void *)Cont_77_4,(void *)Cont_82_5,(void *)Cont_83_6};
	xsi_register_didat("work_m_00000000002725156826_2924402094", "isim/d_isim_beh.exe.sim/work/m_00000000002725156826_2924402094.didat");
	xsi_register_executes(pe);
}
