Introduction
============================


Time-Dependent DFT
---------------------------------


The Time-Dependent Ab-initio Package, or in its acronym ‘`TDAP <http://tdap.iphy.ac.cn/>`_’, is aimed at carrying out real-time ( rt ) time-dependent density functional theory (TDDFT) calculations in efficient  atomic bases. Such calculations allow first principles treatment of both electron and ion dynamics with non-adiabatic effects  fully taken in account, by solving many-electron time-dependent Schr\"odinger equation. It enables large-scale  first principles simulations of quantum dynamics in finite and extended systems including atoms, clusters, molecules, nanoparticles, solids, defects, interfaces, and two-dimensional materials, significantly  reducing the heavy computational cost of typical rt-TDDFT simulations.

Be aware that since the time-dependent Schr\"odinger equation is a one-order partial differential  equation, it is a initial value problem instead of an eigenvalue problem with specific boundary conditions. Thus, the solution method is to solve a time-evolving equation :math:`\psi(t+dt)=\exp(-idtH)\psi(t)`, instead of diagonalizing :math:`H` with :math:`H\psi=E\psi` . Some important features of the current `TDAP <http://tdap.iphy.ac.cn/>`_ code include:
Both finite and extended systems can be simulated.
Both electronic and ionic degree of freedoms are evolved, therefore a complete information on electronic wavefunctions and ionic movements during real time evolution can be provided for simulations of complex materials and rich phenomena far from equilibrium.
Momentum-resolved real-time evolution of electrons can be simulated, which yields the important momentum resolution and a new degree of freedom, essential to describe key quantities and important physics in photoexcited molecules and condensed matter materials. It also significantly  improves the computational efficiency of rt-TDDFT calculations for solids.
Different from approaches using real space grids and all-electron full-potential linearized augmented-planewaves, the adoption of local atomic basis reduces the number of required basis functions, making rt-TDDFT computation of realistic large systems plausible. In addition, the bases can be defined by users. With a relatively small real-space cutoff for atomic bases, the order-:math:`N` linear scaling with respect to the system size can be achieved.
