/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: rt_nonfinite.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

#ifndef RT_NONFINITE_H
#define RT_NONFINITE_H
#include <stddef.h>
#include "rtwtypes.h"

extern real_T rtInf;
extern real_T rtMinusInf;
extern real_T rtNaN;
extern real32_T rtInfF;
extern real32_T rtMinusInfF;
extern real32_T rtNaNF;
extern void rt_InitInfAndNaN(size_t realSize);
extern boolean_T rtIsInf(real_T value);
extern boolean_T rtIsInfF(real32_T value);
extern boolean_T rtIsNaN(real_T value);
extern boolean_T rtIsNaNF(real32_T value);

#endif

/*
 * File trailer for rt_nonfinite.h
 *
 * [EOF]
 */
