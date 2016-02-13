      program main

      include 'mpif.h'

      integer i, rank, nprocs, count, start, stop, nloops
      integer err

      call MPI_Init(err)

c     get the number of processes, and the id of this process
      call MPI_Comm_rank(MPI_COMM_WORLD, rank, err)
      call MPI_Comm_size(MPI_COMM_WORLD, nprocs, err)

c     we want to perform 1000 iterations in total. Work out the 
c     number of iterations to perform per process...
      count = 1000 / nprocs

c     we use the rank of this process to work out which
c     iterations to perform.
      start = rank * count
      stop = start + count - 1

c     now perform the loop
      nloops = 0

      do i=start,stop
        nloops = nloops + 1
      enddo

      print *,"Process ",rank," performed ",nloops,
     .        " iterations of the loop."

      call MPI_Finalize();

      end