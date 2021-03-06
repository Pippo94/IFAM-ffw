/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: Modell_3dof_smblsh_ffw.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

/* Include Files */
#include <math.h>
#include "rt_nonfinite.h"
#include "ffw_exe.h"
#include "Modell_3dof_smblsh_ffw.h"

/* Function Definitions */

/*
 * MODELL_3DOF_SMBLSH_FFW
 *     FFW_SYM = MODELL_3DOF_SMBLSH_FFW(IN1,IN2,IN3,IN4,IN5)
 * Arguments    : const double in1[8]
 *                const double in2[6]
 *                const double in3[2]
 *                const double in4[2]
 *                const double in5[2]
 *                double ffw_sym[8]
 * Return Type  : void
 */
void Modell_3dof_smblsh_ffw(const double in1[8], const double in2[6], const
  double in3[2], const double in4[2], const double in5[2], double ffw_sym[8])
{
  double a;
  double t4;
  double t14;
  double t15;
  double t16;
  double t17;
  double t18;
  double t19;
  double t20;
  double t21;
  double t27;
  double t34;
  double t35;
  double ffw_sym_tmp;
  double b_ffw_sym_tmp;
  double c_ffw_sym_tmp;

  /*     This function was generated by the Symbolic Math Toolbox version 8.2. */
  /*     19-Mar-2020 12:55:59 */
  a = in2[0] - in2[1];
  a *= a;
  t4 = sin(in2[2]);
  t14 = sin(in2[1]);
  t15 = cos(in2[1]);
  t16 = in2[4] * in2[4];
  t17 = in2[1] + in2[2];
  t18 = cos(t17);
  t19 = cos(in2[2]);
  t20 = in2[5] * in2[5];
  t21 = sin(t17);
  t27 = 1.0 / (t19 * t19 * 1.2853778820274581E+58 - 1.602335986409662E+59);
  t34 = ((t15 * t16 * 0.305 + t16 * t18 * 0.037834046692607) + t18 * t20 *
         0.037834046692607) + t18 * in2[4] * in2[5] * 0.075668093385214;
  t35 = t15 * t19 * 0.0388934;
  t17 = ((t14 * t16 * 0.305 + t16 * t21 * 0.037834046692607) + t20 * t21 *
         0.037834046692607) + t21 * in2[4] * in2[5] * 0.075668093385214;
  t16 = t4 * t15 * 0.0388934 + t14 * t19 * 0.0388934;
  t20 = t4 * t14 * 0.0388934;
  ffw_sym[0] = in1[0] - in2[3];
  ffw_sym[1] = in1[1] - in2[4];
  ffw_sym[2] = in1[2] - in2[5];
  a = tanh(a * a * 6.7355109572983932E+9) * ((in2[1] * 313.5 + tanh(in2[0] *
    286.47889756541161 - in2[1] * 286.47889756541161) * 3.1415926535897931 *
    0.34833333333333333) - in2[0] * 313.5);
  ffw_sym[3] = ((((in1[3] - in3[0] * 713.62306429743808) + in2[0] *
                  11774.78056090773) - in2[1] * 11774.78056090773) + in2[3] *
                99.907229001641326) - a * 713.62306429743808;
  ffw_sym_tmp = (t19 * 1.5398388496127559E+36 + 8.5316964853194154E+35) * t27;
  b_ffw_sym_tmp = t34 * (t16 + t14 * 0.31354);
  c_ffw_sym_tmp = t17 * ((t35 + t15 * 0.31354) - t20);
  t16 = (in2[5] * 0.048 + t34 * t16) - t17 * (t35 - t20);
  ffw_sym[4] = ((in1[4] + (((((in2[0] * -9.9060186617191325E+60 + in2[1] *
    9.9060186617191325E+60) + in2[4] * 9.7090239724235816E+58) + a *
    6.0036476737691712E+59) + b_ffw_sym_tmp * 6.0036476737691712E+59) -
    c_ffw_sym_tmp * 6.0036476737691712E+59) / (t4 * t4 * 1.2853778820274581E+58
    + 1.473798198206916E+59)) + ffw_sym_tmp * t16 * 7.0368744177664E+23) -
    ffw_sym_tmp * in3[1] * 7.0368744177664E+23;
  t17 = t27 * (t19 * 2.4059982025199309E+41 + 2.77327796509712E+42);
  ffw_sym[5] = ((in1[5] + ffw_sym_tmp * (((((in2[0] * -16.5 + in2[1] * 16.5) +
    in2[4] * 0.16171875) + a) + b_ffw_sym_tmp) - c_ffw_sym_tmp) *
                 7.0368744177664E+23) - t17 * t16 * 9.007199254740992E+18) + t17
    * in3[1] * 9.007199254740992E+18;
  ffw_sym[6] = (-in4[0] + in5[0] * t15) + in5[1] * t18;
  ffw_sym[7] = (-in4[1] + in5[0] * t14) + in5[1] * t21;
}

/*
 * File trailer for Modell_3dof_smblsh_ffw.c
 *
 * [EOF]
 */
