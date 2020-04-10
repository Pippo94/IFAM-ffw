/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: ffw_exe.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

/* Include Files */
#include <math.h>
#include <string.h>
#include "rt_nonfinite.h"
#include "ffw_exe.h"
#include "Modell_3dof_smblsh_ffw.h"
#include "Modell_3dof_smblsh_jacobi.h"
#include "path_file_Modell3dof_Testkreis.h"

/* Function Definitions */

/*
 * current: vector: previous result of the newton algorythm
 * t: scalar: current time
 * parameters: vector: parameters in the same format/order as the parameter file
 * p0pf: vector: [start_point,end_point]
 * type: scalar: which path of the path should be executed?
 * t_max: scalar: time to reach the end_point
 * Arguments    : const double next_x_in[6]
 *                const double next_u_in[2]
 *                double t
 *                const double parameters[2]
 *                const double p0pf[6]
 *                double type
 *                double t_max
 *                double *counter
 *                double next_x_out[6]
 *                double next_u_out[2]
 *                double path_ref[2]
 * Return Type  : void
 */
void ffw_exe(const double next_x_in[6], const double next_u_in[2], double t,
             const double parameters[2], const double p0pf[6], double type,
             double t_max, double *counter, double next_x_out[6], double
             next_u_out[2], double path_ref[2])
{
  int i0;
  double current[8];
  double next[8];
  boolean_T exitg1;
  double jacobi_value[64];
  int i;
  double b_next[8];
  double ffw_value[8];
  signed char ipiv[8];
  int j;
  int b;
  int jj;
  int k;
  int jp1j;
  double smax;
  int n;
  int jy;
  int ix;
  double s;
  boolean_T exitg2;

  /*  Beginning of Template */
  for (i0 = 0; i0 < 6; i0++) {
    next_x_out[i0] = next_x_in[i0];
  }

  next_u_out[0] = next_u_in[0];
  next_u_out[1] = next_u_in[1];
  for (i0 = 0; i0 < 6; i0++) {
    current[i0] = next_x_in[i0];
  }

  current[6] = next_u_in[0];
  current[7] = next_u_in[1];
  memcpy(&next[0], &current[0], sizeof(double) << 3);
  path_file_Modell3dof_Testkreis(type, t, t_max, p0pf, path_ref);

  /* read out path from the path file */
  *counter = 0.0;

  /* counts newton iterations */
  exitg1 = false;
  while ((!exitg1) && (*counter < 30.0)) {
    /* check wether the maximum iteration is reached */
    (*counter)++;

    /* evaluate jacobi file for the current jacobi matrix */
    Modell_3dof_smblsh_jacobi(next_x_out, next_u_out, parameters, 0.01,
      jacobi_value);

    /* evaluate ffw file for the current value of the function */
    for (i = 0; i < 8; i++) {
      b_next[i] = (next[i] - current[i]) / 0.01;
      ipiv[i] = (signed char)(1 + i);
    }

    Modell_3dof_smblsh_ffw(b_next, next_x_out, next_u_out, path_ref, parameters,
      ffw_value);

    /* Newton's method */
    for (j = 0; j < 7; j++) {
      b = j * 9;
      jj = j * 9;
      jp1j = b + 2;
      n = 8 - j;
      jy = 0;
      ix = b;
      smax = fabs(jacobi_value[b]);
      for (k = 2; k <= n; k++) {
        ix++;
        s = fabs(jacobi_value[ix]);
        if (s > smax) {
          jy = k - 1;
          smax = s;
        }
      }

      if (jacobi_value[jj + jy] != 0.0) {
        if (jy != 0) {
          i = j + jy;
          ipiv[j] = (signed char)(i + 1);
          ix = j;
          for (k = 0; k < 8; k++) {
            smax = jacobi_value[ix];
            jacobi_value[ix] = jacobi_value[i];
            jacobi_value[i] = smax;
            ix += 8;
            i += 8;
          }
        }

        i0 = (jj - j) + 8;
        for (i = jp1j; i <= i0; i++) {
          jacobi_value[i - 1] /= jacobi_value[jj];
        }
      }

      n = 6 - j;
      jy = b + 8;
      i = jj;
      for (b = 0; b <= n; b++) {
        smax = jacobi_value[jy];
        if (jacobi_value[jy] != 0.0) {
          ix = jj + 1;
          i0 = i + 10;
          jp1j = (i - j) + 16;
          for (k = i0; k <= jp1j; k++) {
            jacobi_value[k - 1] += jacobi_value[ix] * -smax;
            ix++;
          }
        }

        jy += 8;
        i += 8;
      }
    }

    for (i = 0; i < 7; i++) {
      if (ipiv[i] != i + 1) {
        smax = ffw_value[i];
        jy = ipiv[i] - 1;
        ffw_value[i] = ffw_value[jy];
        ffw_value[jy] = smax;
      }
    }

    for (k = 0; k < 8; k++) {
      jy = k << 3;
      if (ffw_value[k] != 0.0) {
        i0 = k + 2;
        for (i = i0; i < 9; i++) {
          ffw_value[i - 1] -= ffw_value[k] * jacobi_value[(i + jy) - 1];
        }
      }
    }

    for (k = 7; k >= 0; k--) {
      jy = k << 3;
      if (ffw_value[k] != 0.0) {
        ffw_value[k] /= jacobi_value[k + jy];
        for (i = 0; i < k; i++) {
          ffw_value[i] -= ffw_value[k] * jacobi_value[i + jy];
        }
      }
    }

    for (i0 = 0; i0 < 8; i0++) {
      next[i0] -= ffw_value[i0];
    }

    /* split up the solution of Newton's method into states (x) and system inputs (u) */
    for (i0 = 0; i0 < 6; i0++) {
      next_x_out[i0] = next[i0];
    }

    next_u_out[0] = next[6];
    next_u_out[1] = next[7];

    /* evaluate ffw file for the current value of the function */
    for (i = 0; i < 8; i++) {
      b_next[i] = (next[i] - current[i]) / 0.01;
    }

    Modell_3dof_smblsh_ffw(b_next, *(double (*)[6])&next[0], *(double (*)[2])&
      next[6], path_ref, parameters, ffw_value);
    for (k = 0; k < 8; k++) {
      b_next[k] = fabs(ffw_value[k]);
    }

    if (!rtIsNaN(b_next[0])) {
      i = 1;
    } else {
      i = 0;
      k = 2;
      exitg2 = false;
      while ((!exitg2) && (k < 9)) {
        if (!rtIsNaN(b_next[k - 1])) {
          i = k;
          exitg2 = true;
        } else {
          k++;
        }
      }
    }

    if (i == 0) {
      smax = b_next[0];
    } else {
      smax = b_next[i - 1];
      i0 = i + 1;
      for (k = i0; k < 9; k++) {
        s = b_next[k - 1];
        if (smax < s) {
          smax = s;
        }
      }
    }

    if (smax < 1.0E-9) {
      /* is the solution close enough to zero? */
      exitg1 = true;
    }
  }
}

/*
 * File trailer for ffw_exe.c
 *
 * [EOF]
 */
