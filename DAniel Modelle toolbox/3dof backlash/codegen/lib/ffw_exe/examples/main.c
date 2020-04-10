/*
 * Academic Student License -- for use by students to meet course
 * requirements and perform academic research at degree granting
 * institutions only.  Not for government, commercial, or other
 * organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 19-Mar-2020 12:57:10
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include Files */
#include "rt_nonfinite.h"
#include "ffw_exe.h"
#include "main.h"
#include "ffw_exe_terminate.h"
#include "ffw_exe_initialize.h"

/* Function Declarations */
static void argInit_1x2_real_T(double result[2]);
static void argInit_1x6_real_T(double result[6]);
static double argInit_real_T(void);
static void main_ffw_exe(void);

/* Function Definitions */

/*
 * Arguments    : double result[2]
 * Return Type  : void
 */
static void argInit_1x2_real_T(double result[2])
{
  double result_tmp;

  /* Loop over the array to initialize each element. */
  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result_tmp = argInit_real_T();
  result[0] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[1] = result_tmp;
}

/*
 * Arguments    : double result[6]
 * Return Type  : void
 */
static void argInit_1x6_real_T(double result[6])
{
  int idx1;

  /* Loop over the array to initialize each element. */
  for (idx1 = 0; idx1 < 6; idx1++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx1] = argInit_real_T();
  }
}

/*
 * Arguments    : void
 * Return Type  : double
 */
static double argInit_real_T(void)
{
  return 0.0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
static void main_ffw_exe(void)
{
  double next_x_in[6];
  double next_u_in[2];
  double t;
  double dv0[2];
  double dv1[6];
  double counter;
  double next_x_out[6];
  double next_u_out[2];
  double path_ref[2];

  /* Initialize function 'ffw_exe' input arguments. */
  /* Initialize function input argument 'next_x_in'. */
  argInit_1x6_real_T(next_x_in);

  /* Initialize function input argument 'next_u_in'. */
  argInit_1x2_real_T(next_u_in);
  t = argInit_real_T();

  /* Initialize function input argument 'parameters'. */
  /* Initialize function input argument 'p0pf'. */
  /* Call the entry-point 'ffw_exe'. */
  argInit_1x2_real_T(dv0);
  argInit_1x6_real_T(dv1);
  counter = argInit_real_T();
  ffw_exe(next_x_in, next_u_in, t, dv0, dv1, argInit_real_T(), argInit_real_T(),
          &counter, next_x_out, next_u_out, path_ref);
}

/*
 * Arguments    : int argc
 *                const char * const argv[]
 * Return Type  : int
 */
int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* Initialize the application.
     You do not need to do this more than one time. */
  ffw_exe_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_ffw_exe();

  /* Terminate the application.
     You do not need to do this more than one time. */
  ffw_exe_terminate();
  return 0;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
