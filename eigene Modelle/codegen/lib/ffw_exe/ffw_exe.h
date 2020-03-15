/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: ffw_exe.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 24-Feb-2020 21:35:30
 */

#ifndef FFW_EXE_H
#define FFW_EXE_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "ffw_exe_types.h"

/* Function Declarations */
extern void ffw_exe(const double x_old[8], const double u_old[2], double t,
                    const double parameters[14], const double p0pf[6], double
                    type, double t_max, double *counter, double x_out[8], double
                    u_out[2], double path_ref_data[], int path_ref_size[2]);

#endif

/*
 * File trailer for ffw_exe.h
 *
 * [EOF]
 */
