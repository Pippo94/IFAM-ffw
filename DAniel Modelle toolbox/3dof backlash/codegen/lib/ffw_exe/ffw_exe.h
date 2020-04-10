/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: ffw_exe.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

#ifndef FFW_EXE_H
#define FFW_EXE_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "ffw_exe_types.h"

/* Function Declarations */
extern void ffw_exe(const double next_x_in[6], const double next_u_in[2], double
                    t, const double parameters[2], const double p0pf[6], double
                    type, double t_max, double *counter, double next_x_out[6],
                    double next_u_out[2], double path_ref[2]);

#endif

/*
 * File trailer for ffw_exe.h
 *
 * [EOF]
 */
