/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: Modell_3dof_smblsh_jacobi.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

#ifndef MODELL_3DOF_SMBLSH_JACOBI_H
#define MODELL_3DOF_SMBLSH_JACOBI_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "rtwtypes.h"
#include "ffw_exe_types.h"

/* Function Declarations */
extern void Modell_3dof_smblsh_jacobi(const double in1[6], const double in3[2],
  const double in5[2], double step_size_sym, double jacobi[64]);

#endif

/*
 * File trailer for Modell_3dof_smblsh_jacobi.h
 *
 * [EOF]
 */
