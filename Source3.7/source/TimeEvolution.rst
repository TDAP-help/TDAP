Input File Description
##############################
Time Evolution
******************************

Propagation
====================


TDAP is aimed at carrying out real time simulations of electron and nuclear dynamics from first principles. The solution method is to solve a time-evolving Schr\"odinger equation :math:`\psi(t+dt)=\exp(-idtH)\psi(t)`, instead of diagonalize :math:`H` with :math:`H\psi=E\psi`. For this purpose, a set of parameters specified below are needed for real time evolution of quantum states.

SolutionMethod ( *String* )
""""""""""""""""""""""""""""""""""
Character string to chose between diagonalization (**diagon**) or Order-N (**OrderN** ) solution of the LDA Hamiltonian or the TDDFT solver ( **evolve** ).

.. note::

    Always use **evolve**  to do the TDDFT calculation, otherwise all the parameters listed below will not be read.

:samp:`Default value: diagon`

TD.NewInv ( *Logical* )
""""""""""""""""""""""""""""""""""

If set this parameter to be true, the TD evolve operator is :math:`\frac{S-iHdt/2}{S+iHdt/2}`, else  :math:`\frac{1-iS^{-1}Hdt/2}{1+iS^{-1}Hdt/2}` .
The old version of TDAP use  :math:`\frac{1-iS^{-1}Hdt/2}{1+iS^{-1}Hdt/2}`. 
Now you can use the new faster method by set it to be true. 
:samp:`Default value: False`

TD.FinalTimeStep ( *Integer* )
""""""""""""""""""""""""""""""""""""""""
Final time step of the TD simulation.

.. note::

    The number of BOMD steps is max( MD.FinalTimeStep - TD.FinalTimeStep , 1)

:samp:`Default value: 1`

TD.LengthTimeStep ( *Real Time* )
""""""""""""""""""""""""""""""""""""""""""""""
Length of the time step of the TD simulation.

.. note::

    Best to be the same as MD.LengthTimeStep. Unit in fs.

:samp:`Default value: 1.0 fs`

TD.EmptyBands ( *Integer* )
""""""""""""""""""""""""""""""""""
The number of unoccupied bands to be considered in density matrix calculation, etc.

:samp:`Default value: 5`

Population switch
========================================================
To prepare an initial excited state to start a time-dependent simulation, one can choose in which states electrons are pumped to another (empty) states. The population switch method allows such electronic transitions from a given set of initial and final states to occur in the simulated systems, with features specified by the user.


TD.PopulationTransition ( *data block* )
"""""""""""""""""""""""""""""""""""""""""""
Includes arbitrary number of lines. Each line with the format :

.. code-block:: none

    Start Band -- End band -- Jumped Electrons

Start Band is The band from which the electron is excited. If :math:`\geq` 0, no excitation occurs.
End band is The band to which the electron is excited.
Jumped Electrons is the number of electrons pumped from Start Band to End band.

For instance:

.. code-block:: none

    %block TD.PopulationTransition
    -1 2  0.5
    -1 1  0.5
    %endblock TD.PopulationTransition

Means that 0.5 electrons are pumped each from the HOMO band to the LUMO band and the band higher than LUMO.

:samp:`Default value: No default values`

Tuned electric field
========================================================

The electric field can be tuned to vary across z direction of the cell or to change with time. For basic concepts and cautions in applying electric field in the simulations, please refer to the **ExternalElectricField** tag, which control the value of field intensity :math:`E_0`.  You also can apply vector field by  **TD.GaugeField** tag.

Time-dependent electric field
--------------------------------------------
For the time-dependent changes, a Gaussian form wavepackage is implemented as: 
:math:`E(t)=E_0\cos(2\pi f t)\exp(-\frac{(t-t_0)^2}{2\sigma^2})`

ExternalElectricField ( *data block* )
"""""""""""""""""""""""""""""""""""""""""""""""
It specifies an external electric field.
For instance:

.. code-block:: none

    %block ExternalElectricField
    0.000  0.000  0.0500  V/Ang
    %endblock ExternalElectricField

:samp:`Default value: No default values`


TD.GaugeField ( *data block* )
"""""""""""""""""""""""""""""""""""""""""""""
It specifies an external vector gauge field.
For instance:

.. code-block:: none

    %block TD.GaugeField
    0.000  0.000  0.0500  V/Ang
    %endblock TD.GaugeField

.. warning::

    This function is highly experimental. Do not use it now.
    
:samp:`Default value: No default values`


TD.DeltaElectricField ( *Logical* )
"""""""""""""""""""""""""""""""""""""""""""
Specify a delta electric field. Then gaussian electric field will be ignored.

:samp:`Default value: .False.`


TD.LightFrequency ( *Real Frequency* )
""""""""""""""""""""""""""""""""""""""""""""""
The frequency :math:`f` of the electric field.
:samp:`Default value: 0.5 fs`

TD.LightInitialTime ( *Real time* )
""""""""""""""""""""""""""""""""""""""""""""""
The initial time :math:`t_0` to introduce the electric field.

:samp:`Default value: 100.0 fs`

TD.LightTimeScale ( *Real time* )
"""""""""""""""""""""""""""""""""""""""""""""
The peak width :math:`\sigma` of the wavepackage.

:samp:`Default value: 25.0 fs`


Spatially nonuniform electric field
---------------------------------------------------
For spatially nonhomogeneous fields, only a function with nonzero values in the selected slab :math:`z_{max}` to :math:`z_{min}` is implemented.
Therefore, 

:math:`E(t,z)=E(t) \theta(z-z_{min})(z_{max} -z)`


TD.EfZmin ( *Real* )
""""""""""""""""""""""""""""""""""""""""""
The lower boundary of the electric field. Unit in the percentage of the cell vector.

:samp:`Default value: 0.333`

TD.EfZmax ( *Real* )
"""""""""""""""""""""""""""""""""""""""""
The upper boundary of the electric field. Unit in percentage of the cell vector.

:samp:`Default value: 0.666`


.. --------------------------------------------------------------
.. ----------------Anallysis-------------------------------------


Analysis
****************************
Band projection 
=======================================
 
 
TD.WriteDMOfSelectiveOrbitals ( *Logical* )
""""""""""""""""""""""""""""""""""""""""""""""""""
Whether to output the partial DM of centain band and orbital projection.

:samp:`Default value: false`

TD.PartialDMBand ( *data block* )
""""""""""""""""""""""""""""""""""""""""""""""""""""
Specify the band to output and orbital projection. See also **TD.PartialDMSumOrbitals**.

Multiple lines with each of them include one band index. The corresponding charge density will be projected to the selected orbital blocks, and output to file: chg*Band Index*.txt

For instance:

.. code-block:: none

    %block TD.PartialDMBand
    1
    2
    %endblock TD.PartialDMBand

will analysis the band 1-2 and projected them to the orbital blocks.

:samp:`Default value: No default values`


TD.PartialDMSumOrbitals ( *data block* )
""""""""""""""""""""""""""""""""""""""""""""""
Specify orbital blocks for projection. See also **TD.PartialDMBand**.

Multiple lines with each of them include the start index and the end index of the orbital. The corresponding charge density will be projected to the selected orbital blocks, and output to file: chg*Band Index*.txt

For instance:

.. code-block:: none

    %block TD.PartialDMSumOrbitals
    1 10
    11 22
    %endblock TD.PartialDMSumOrbitals

will analysis the selected band (using **TD.PartialDMBand** ) and projected them to the two orbital blocks: 1 to 10 and 11 to 22.

:samp:`Default value: No default values`


.. -----------------------------------------------------------------
.. ---------------------Restart a TDDFT-MD calculation--------------


Restart a TDDFT-MD calculation
*****************************************

To restart a calculation, the wavefunction and the atomic positions are needed. The atomic positions can be obtained in the file systemLabel.XV, and the wavefunction should be output using the following tag,

TD.WriteWaveFunctionStep ( *Integer* )
"""""""""""""""""""""""""""""""""""""""""""""""""

If TD.WriteWaveFunctionStep = x, it means to output the wavefunction every x step to the file **systemLabel.step.TDWFSX**. **step** is the certain step at which the wavefunction is output.

:samp:`Default value: 1000`

TD.ReadWaveFunction ( *Logical* )
""""""""""""""""""""""""""""""""""""""""""""""

Whether to read wavefunction from the file **systemLabel.TDWFSX**.

:samp:`Default value: false`

.. note::

    Note: the systemLabel is not followed by **step**.


For instance:

.. code-block:: bash

    mkdir restartdir
    cp H.psf  O.psf  siesta.EIG  siesta.PAR  input.fdf  structure.fdf  siesta.XV \
    siesta.VERLET_RESTART siesta.TDWFSX  restartdir


Add this in restartdir/input.fdf

.. code-block:: none

    TD.ReadWaveFunction              T   
    MD.UsesaveXV T




