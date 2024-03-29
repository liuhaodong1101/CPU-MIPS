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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002955081478_3245280214_init();
    work_m_00000000003391171344_3224323566_init();
    work_m_00000000001608936652_0621066737_init();
    work_m_00000000001608269579_1989334135_init();
    work_m_00000000002152360825_0886308060_init();
    work_m_00000000003078133379_2924402094_init();
    work_m_00000000000722991407_0286994093_init();
    work_m_00000000000329345125_3979377396_init();
    work_m_00000000000585794278_3877310806_init();
    work_m_00000000002047498008_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
