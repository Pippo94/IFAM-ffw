/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: ffw_exe_initialize.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 24-Feb-2020 21:35:30
 */

/* Include Files */
#include "rt_nonfinite.h"
#include "ffw_exe.h"
#include "ffw_exe_initialize.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void ffw_exe_initialize(void)
{
  rt_InitInfAndNaN(8U);
}

/*
 * File trailer for ffw_exe_initialize.c
 *
 * [EOF]
 */
