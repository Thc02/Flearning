!  P1.f90 
!
!  FUNCTIONS:
!  P1 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: P1
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

      program functions

      include "mpif.h"

      integer nprocs
      integer rank
      integer err

!     Initialise MPI
      call MPI_INIT(err)

!     Get the number of cores in the MPI cluster
      call MPI_Comm_size( MPI_COMM_WORLD, nprocs, err )

!     Get the ID of this core in the MPI cluster
      call MPI_Comm_rank( MPI_COMM_WORLD, rank, err )

      print *,"I am process ",rank,". The number of processes is ",
        .       nprocs

!     Shut down MPI
      call MPI_Finalize(err)

      end 