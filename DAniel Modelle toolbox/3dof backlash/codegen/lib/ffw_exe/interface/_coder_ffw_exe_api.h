/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: _coder_ffw_exe_api.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

#ifndef _CODER_FFW_EXE_API_H
#define _CODER_FFW_EXE_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_ffw_exe_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void ffw_exe(real_T next_x_in[6], real_T next_u_in[2], real_T t, real_T
                    parameters[2], real_T p0pf[6], real_T type, real_T t_max,
                    real_T *counter, real_T next_x_out[6], real_T next_u_out[2],
                    real_T path_ref[2]);
extern void ffw_exe_api(const mxArray * const prhs[8], int32_T nlhs, const
  mxArray *plhs[4]);
extern void ffw_exe_atexit(void);
extern void ffw_exe_initialize(void);
extern void ffw_exe_terminate(void);
extern void ffw_exe_xil_terminate(void);

#endif

/*
 * File trailer for _coder_ffw_exe_api.h
 *
 * [EOF]
 */
