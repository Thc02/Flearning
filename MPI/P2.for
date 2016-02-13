      subroutine times_table(n)
      implicit none
 
      include "mpif.h"

      integer i, n, i_times_n
      integer rank, err

      call MPI_Comm_rank(MPI_COMM_WORLD, rank, err)

      do 100 i=1,n
          i_times_n = i * n

          print *,"Process ",rank," says ",
     .            i," times ",n," equals ",i_times_n

          call sleep(1)
100   continue

      end

      
      subroutine countdown
      implicit none

      include "mpif.h"

      integer i, rank, err

      call MPI_Comm_rank(MPI_COMM_WORLD, rank, err)

      do 200 i=10,1,-1
          print *,"Process ",rank," says ",i,"..."

          call sleep(1)
200   continue

      print *,"Process ",rank," says Blast off!"

      end


      subroutine long_loop
      implicit none

      include "mpif.h"

      integer i, rank, err
      double precision sum

      call MPI_Comm_rank(MPI_COMM_WORLD, rank, err)

      sum = 0

      do 300 i=1,10
          sum = sum + (i*i)
          call sleep(1)
300   continue

      print *,"Process ",rank," says the sum of the long ",
     .        "loop equals ",sum

      end


      program main
      implicit none

      include "mpif.h"

      integer rank, err

      call MPI_Init(err)

      call MPI_Comm_rank(MPI_COMM_WORLD, rank, err)

      if (rank .eq. 0) then
          print *,"This is the main process"
          call times_table(12)

      else if (rank .eq. 1) then
          call countdown()

      else if (rank .eq. 2) then
          call long_loop()

      else
          print *,"I am not needed..."
      
      endif

      call MPI_Finalize(err)

      end