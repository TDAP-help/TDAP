Compilation
=======================================================
Rather than using the top-level Src directory as building directory,
the user has to use an ad-hoc building directory (by default the
top-level **Obj** directory, but it can be any (new) directory in
the top level).  The building directory will hold the object files,
module files, and libraries resulting from the compilation of the
sources in **Src**.  The **VPATH** mechanism of modern **make** 
programs is used. This scheme has many advantages. Among them:

* The Src directory is kept pristine.
* Many different object directories can be used concurrently to compile the program with different compilers or optimization levels.



The compilation of TDAP is similar to siesta. But there are some tips:


* Use **gcc + Open MPI/MVAPICH** . In some computer compatibility problems will come out if you use
  Intel compiler. It's a safely strategy by using **Open MPI/MVAPICH** .
* We recommend that you use the ScaLAPACK from Netlib  instead of MKL.
* TDAP is parallel version. Don't use a serial compiler.
* If you use Intel’s compiler, please remember to change 299th line’s code **probe=rand() **  into  **call random number(probe)**   in decay_test.F90. Different compilers use different standard functions. Nevertheless, incompatibility happens in some machine using Intel compiler.


If you just want to compile the program, go to **Obj**  and issue the
command:

.. code-block:: none

   sh ../Src/obj_setup.sh


Then configure the install environment:

.. code-block:: shell

    ../Src/configure --enable-mpi

to populate this directory with the minimal scaffolding of makefiles, and then make sure that you create or generate an appropriate arch.make file.
Specify the libraries in parallel mode and make sure you are using the right compiler in arch.make file:

.. code-block:: makefile

    FC=mpif90
    BLAS_LIBS=~/librefblas.a
    LAPACK_LIBS=~/libreflapack.a
    BLACS_LIBS=
    SCALAPACK_LIBS=~/libscalapack.a

Then, type

.. code-block:: shell

    make

Now the TDAP program is compiled. To compile utility programs (those living in Util), you can just simply use the provided makefiles, typing 

.. code-block:: shell

    make 

as appropriate.

