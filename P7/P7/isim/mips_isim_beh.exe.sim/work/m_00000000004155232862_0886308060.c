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
static const char *ng0 = "C:/Users/Administrator.DESKTOP-E5KEEAC/Desktop/P7/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {5U, 0U};
static unsigned int ng7[] = {6U, 0U};
static unsigned int ng8[] = {7U, 0U};
static int ng9[] = {0, 0};



static void Cont_29_0(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng1)));
    xsi_vlogtype_concat(t3, 33, 33, 2U, t2, 1, t4, 32);
    t5 = (t0 + 3936);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t3, 0, 33);
    xsi_driver_vfirst_trans(t5, 0, 32);
    t10 = (t0 + 3824);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_30_1(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng1)));
    xsi_vlogtype_concat(t3, 33, 33, 2U, t2, 1, t4, 32);
    t5 = (t0 + 4000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t3, 0, 33);
    xsi_driver_vfirst_trans(t5, 0, 32);
    t10 = (t0 + 3840);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Always_31_2(char *t0)
{
    char t10[8];
    char t38[8];
    char t45[8];
    char t46[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;

LAB0:    t1 = (t0 + 3504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3856);
    *((int *)t2) = 1;
    t3 = (t0 + 3536);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(34, ng0);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    t7 = (t0 + 1208U);
    t9 = *((char **)t7);
    t11 = *((unsigned int *)t8);
    t12 = *((unsigned int *)t9);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t7 = (t8 + 4);
    t14 = (t9 + 4);
    t15 = (t10 + 4);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t14);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t19 = *((unsigned int *)t15);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB24;

LAB25:
LAB26:    t37 = (t0 + 2088);
    xsi_vlogvar_assign_value(t37, t10, 0, 0, 32);
    goto LAB23;

LAB9:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1208U);
    t7 = *((char **)t4);
    memset(t38, 0, 8);
    t4 = (t38 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t38) = t12;
    t13 = *((unsigned int *)t8);
    t16 = (t13 >> 0);
    *((unsigned int *)t4) = t16;
    t17 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t17 & 65535U);
    t18 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t18 & 65535U);
    xsi_vlogtype_concat(t10, 32, 32, 2U, t38, 16, t3, 16);
    t9 = (t0 + 2088);
    xsi_vlogvar_assign_value(t9, t10, 0, 0, 32);
    goto LAB23;

LAB11:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB23;

LAB13:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB23;

LAB15:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 & t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t16 = *((unsigned int *)t3);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    *((unsigned int *)t9) = t18;
    t19 = *((unsigned int *)t9);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB27;

LAB28:
LAB29:    t23 = (t0 + 2088);
    xsi_vlogvar_assign_value(t23, t10, 0, 0, 32);
    goto LAB23;

LAB17:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t45, 0, 8);
    xsi_vlog_signed_less(t45, 32, t4, 32, t7, 32);
    memset(t38, 0, 8);
    t3 = (t45 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t45);
    t16 = (t13 & t12);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t3) != 0)
        goto LAB32;

LAB33:    t9 = (t38 + 4);
    t18 = *((unsigned int *)t38);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB34;

LAB35:    t21 = *((unsigned int *)t38);
    t22 = (~(t21));
    t25 = *((unsigned int *)t9);
    t26 = (t22 || t25);
    if (t26 > 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t9) > 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t38) > 0)
        goto LAB40;

LAB41:    memcpy(t10, t15, 8);

LAB42:    t23 = (t0 + 2088);
    xsi_vlogvar_assign_value(t23, t10, 0, 0, 32);
    goto LAB23;

LAB19:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 1688U);
    t7 = *((char **)t3);
    xsi_vlog_unsigned_less(t46, 33, t4, 33, t7, 33);
    memset(t38, 0, 8);
    t3 = (t46 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t46);
    t16 = (t13 & t12);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t3) != 0)
        goto LAB45;

LAB46:    t9 = (t38 + 4);
    t18 = *((unsigned int *)t38);
    t19 = *((unsigned int *)t9);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB47;

LAB48:    t21 = *((unsigned int *)t38);
    t22 = (~(t21));
    t25 = *((unsigned int *)t9);
    t26 = (t22 || t25);
    if (t26 > 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t9) > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t38) > 0)
        goto LAB53;

LAB54:    memcpy(t10, t15, 8);

LAB55:    t23 = (t0 + 2088);
    xsi_vlogvar_assign_value(t23, t10, 0, 0, 32);
    goto LAB23;

LAB21:    xsi_set_current_line(48, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    goto LAB23;

LAB24:    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t10) = (t21 | t22);
    t23 = (t8 + 4);
    t24 = (t9 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = *((unsigned int *)t24);
    t30 = (~(t29));
    t31 = *((unsigned int *)t9);
    t32 = (t31 & t30);
    t33 = (~(t28));
    t34 = (~(t32));
    t35 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t35 & t33);
    t36 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t36 & t34);
    goto LAB26;

LAB27:    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t21 | t22);
    t14 = (t4 + 4);
    t15 = (t7 + 4);
    t25 = *((unsigned int *)t4);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t29 = (~(t27));
    t30 = *((unsigned int *)t7);
    t31 = (~(t30));
    t33 = *((unsigned int *)t15);
    t34 = (~(t33));
    t28 = (t26 & t29);
    t32 = (t31 & t34);
    t35 = (~(t28));
    t36 = (~(t32));
    t39 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t39 & t35);
    t40 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t40 & t36);
    t41 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t41 & t35);
    t42 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t42 & t36);
    goto LAB29;

LAB30:    *((unsigned int *)t38) = 1;
    goto LAB33;

LAB32:    t8 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB33;

LAB34:    t14 = ((char*)((ng2)));
    goto LAB35;

LAB36:    t15 = ((char*)((ng1)));
    goto LAB37;

LAB38:    xsi_vlog_unsigned_bit_combine(t10, 32, t14, 32, t15, 32);
    goto LAB42;

LAB40:    memcpy(t10, t14, 8);
    goto LAB42;

LAB43:    *((unsigned int *)t38) = 1;
    goto LAB46;

LAB45:    t8 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB46;

LAB47:    t14 = ((char*)((ng2)));
    goto LAB48;

LAB49:    t15 = ((char*)((ng1)));
    goto LAB50;

LAB51:    xsi_vlog_unsigned_bit_combine(t10, 32, t14, 32, t15, 32);
    goto LAB55;

LAB53:    memcpy(t10, t14, 8);
    goto LAB55;

}


extern void work_m_00000000004155232862_0886308060_init()
{
	static char *pe[] = {(void *)Cont_29_0,(void *)Cont_30_1,(void *)Always_31_2};
	xsi_register_didat("work_m_00000000004155232862_0886308060", "isim/mips_isim_beh.exe.sim/work/m_00000000004155232862_0886308060.didat");
	xsi_register_executes(pe);
}
