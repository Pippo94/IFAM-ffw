/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: ffw_exe.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 24-Feb-2020 21:35:30
 */

/* Include Files */
#include <math.h>
#include "rt_nonfinite.h"
#include <string.h>
#include "ffw_exe.h"
#include "MKS_4dof_ffw.h"
#include "MKS_4dof_jacobi.h"

/* Function Declarations */
static double rt_powd_snf(double u0, double u1);

/* Function Definitions */

/*
 * Arguments    : double u0
 *                double u1
 * Return Type  : double
 */
static double rt_powd_snf(double u0, double u1)
{
  double y;
  double d0;
  double d1;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = rtNaN;
  } else {
    d0 = fabs(u0);
    d1 = fabs(u1);
    if (rtIsInf(u1)) {
      if (d0 == 1.0) {
        y = 1.0;
      } else if (d0 > 1.0) {
        if (u1 > 0.0) {
          y = rtInf;
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = rtInf;
      }
    } else if (d1 == 0.0) {
      y = 1.0;
    } else if (d1 == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = rtNaN;
    } else {
      y = pow(u0, u1);
    }
  }

  return y;
}

/*
 * current: vector: previous result of the newton algorythm
 * t: scalar: current time
 * parameters: vector: parameters in the same format/order as the parameter file
 * p0pf: vector: [start_point,end_point]
 * type: scalar: which path of the path should be executed?
 * t_max: scalar: time to reach the end_point
 * Arguments    : const double x_old[8]
 *                const double u_old[2]
 *                double t
 *                const double parameters[14]
 *                const double p0pf[6]
 *                double type
 *                double t_max
 *                double *counter
 *                double x_out[8]
 *                double u_out[2]
 *                double path_ref_data[]
 *                int path_ref_size[2]
 * Return Type  : void
 */
void ffw_exe(const double x_old[8], const double u_old[2], double t, const
             double parameters[14], const double p0pf[6], double type, double
             t_max, double *counter, double x_out[8], double u_out[2], double
             path_ref_data[], int path_ref_size[2])
{
  double current[10];
  double next[10];
  double s;
  int i;
  double zd_data[4];
  double p0pf_idx_0_tmp;
  double smax;
  boolean_T exitg1;
  double jacobi_value[100];
  double b_next[10];
  double ffw_value[10];
  signed char ipiv[10];
  int j;
  int b;
  int jj;
  int k;
  int jp1j;
  int n;
  int jy;
  int ix;
  int i0;
  boolean_T exitg2;

  /*  Beginning of Template */
  memcpy(&x_out[0], &x_old[0], sizeof(double) << 3);
  u_out[0] = u_old[0];
  u_out[1] = u_old[1];
  memcpy(&current[0], &x_old[0], sizeof(double) << 3);
  current[8] = u_old[0];
  current[9] = u_old[1];
  memcpy(&next[0], &current[0], 10U * sizeof(double));

  /* Mapping */
  /* Path function */
  s = rt_powd_snf(t, 5.0) * ((((70.0 * rt_powd_snf(t, 4.0) - 315.0 * rt_powd_snf
    (t, 3.0) * t_max) + 540.0 * (t * t) * (t_max * t_max)) - 420.0 * t *
    rt_powd_snf(t_max, 3.0)) + 126.0 * rt_powd_snf(t_max, 4.0)) / rt_powd_snf
    (t_max, 9.0);
  i = 2;
  zd_data[0] = 0.0;
  zd_data[1] = 0.0;

  /* straight line */
  if (type == 1.0) {
    /* soll nach 90grad enden! */
    /* p0(1) sollte L1+L2 entsprechen!! */
    p0pf_idx_0_tmp = cos(1.5707963267948966 * s);
    smax = sin(1.5707963267948966 * s);
    i = 4;
    zd_data[0] = p0pf[0] * p0pf_idx_0_tmp;
    zd_data[1] = p0pf[0] * smax;
    zd_data[2] = -p0pf[0] * 1.5707963267948966 * smax;
    zd_data[3] = p0pf[0] * 1.5707963267948966 * p0pf_idx_0_tmp;
  }

  path_ref_size[0] = 1;
  path_ref_size[1] = i;
  memcpy(&path_ref_data[0], &zd_data[0], (unsigned int)(i * (int)sizeof(double)));

  /* read out path from the path file */
  *counter = 0.0;

  /* counts newton iterations */
  exitg1 = false;
  while ((!exitg1) && (*counter < 30.0)) {
    /* check wether the maximum iteration is reached */
    (*counter)++;

    /* evaluate jacobi file for the current jacobi matrix */
    MKS_4dof_jacobi(x_out, u_out, parameters, jacobi_value);

    /* evaluate ffw file for the current value of the function */
    for (i = 0; i < 10; i++) {
      b_next[i] = (next[i] - current[i]) / 0.01;
      ipiv[i] = (signed char)(1 + i);
    }

    MKS_4dof_ffw(b_next, x_out, u_out, path_ref_data, parameters, ffw_value);

    /* Newton's method */
    for (j = 0; j < 9; j++) {
      b = j * 11;
      jj = j * 11;
      jp1j = b + 2;
      n = 10 - j;
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
          for (k = 0; k < 10; k++) {
            smax = jacobi_value[ix];
            jacobi_value[ix] = jacobi_value[i];
            jacobi_value[i] = smax;
            ix += 10;
            i += 10;
          }
        }

        i0 = (jj - j) + 10;
        for (i = jp1j; i <= i0; i++) {
          jacobi_value[i - 1] /= jacobi_value[jj];
        }
      }

      n = 8 - j;
      jy = b + 10;
      i = jj;
      for (b = 0; b <= n; b++) {
        smax = jacobi_value[jy];
        if (jacobi_value[jy] != 0.0) {
          ix = jj;
          i0 = i + 12;
          jp1j = (i - j) + 20;
          for (k = i0; k <= jp1j; k++) {
            jacobi_value[k - 1] += jacobi_value[ix + 1] * -smax;
            ix++;
          }
        }

        jy += 10;
        i += 10;
      }
    }

    for (i = 0; i < 9; i++) {
      if (ipiv[i] != i + 1) {
        smax = ffw_value[i];
        jy = ipiv[i] - 1;
        ffw_value[i] = ffw_value[jy];
        ffw_value[jy] = smax;
      }
    }

    for (k = 0; k < 10; k++) {
      jy = 10 * k;
      if (ffw_value[k] != 0.0) {
        for (i = k + 2; i < 11; i++) {
          ffw_value[i - 1] -= ffw_value[k] * jacobi_value[(i + jy) - 1];
        }
      }
    }

    for (k = 9; k >= 0; k--) {
      jy = 10 * k;
      if (ffw_value[k] != 0.0) {
        ffw_value[k] /= jacobi_value[k + jy];
        for (i = 0; i < k; i++) {
          ffw_value[i] -= ffw_value[k] * jacobi_value[i + jy];
        }
      }
    }

    for (i0 = 0; i0 < 10; i0++) {
      next[i0] -= ffw_value[i0];
    }

    /* split up the solution of Newton's method into states (x) and system inputs (u) */
    memcpy(&x_out[0], &next[0], sizeof(double) << 3);
    u_out[0] = next[8];
    u_out[1] = next[9];

    /* evaluate ffw file for the current value of the function */
    for (i = 0; i < 10; i++) {
      b_next[i] = (next[i] - current[i]) / 0.01;
    }

    MKS_4dof_ffw(b_next, *(double (*)[8])&next[0], *(double (*)[2])&next[8],
                 path_ref_data, parameters, ffw_value);
    for (k = 0; k < 10; k++) {
      b_next[k] = fabs(ffw_value[k]);
    }

    if (!rtIsNaN(b_next[0])) {
      i = 1;
    } else {
      i = 0;
      k = 2;
      exitg2 = false;
      while ((!exitg2) && (k < 11)) {
        if (!rtIsNaN(b_next[k - 1])) {
          i = k;
          exitg2 = true;
        } else {
          k++;
        }
      }
    }

    if (i == 0) {
      p0pf_idx_0_tmp = b_next[0];
    } else {
      p0pf_idx_0_tmp = b_next[i - 1];
      i0 = i + 1;
      for (k = i0; k < 11; k++) {
        smax = b_next[k - 1];
        if (p0pf_idx_0_tmp < smax) {
          p0pf_idx_0_tmp = smax;
        }
      }
    }

    if (p0pf_idx_0_tmp < 0.001) {
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
