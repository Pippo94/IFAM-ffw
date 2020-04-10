/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: path_file_Modell3dof_Testkreis.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

/* Include Files */
#include <math.h>
#include "rt_nonfinite.h"
#include "ffw_exe.h"
#include "path_file_Modell3dof_Testkreis.h"

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
 * Daten für Kreisbahn
 * Arguments    : double type
 *                double t
 *                double t_max
 *                const double p0pf[6]
 *                double path[2]
 * Return Type  : void
 */
void path_file_Modell3dof_Testkreis(double type, double t, double t_max, const
  double p0pf[6], double path[2])
{
  double r;
  double path_tmp;
  r = p0pf[0] * 0.15000000000000002;

  /* Path function */
  path[0] = 0.0;
  path[1] = 0.0;
  if (type == 1.0) {
    path_tmp = 6.2831853071795862 * (rt_powd_snf(t, 5.0) * ((((70.0 *
      rt_powd_snf(t, 4.0) - 315.0 * rt_powd_snf(t, 3.0) * t_max) + 540.0 * (t *
      t) * (t_max * t_max)) - 420.0 * t * rt_powd_snf(t_max, 3.0)) + 126.0 *
      rt_powd_snf(t_max, 4.0)) / rt_powd_snf(t_max, 9.0)) + p0pf[1];
    path[0] = cos(p0pf[1]) * 0.85 * p0pf[0] + cos(path_tmp) * r;
    path[1] = sin(p0pf[1]) * 0.85 * p0pf[0] + sin(path_tmp) * r;
  }
}

/*
 * File trailer for path_file_Modell3dof_Testkreis.c
 *
 * [EOF]
 */
