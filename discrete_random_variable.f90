subroutine cumulated( x, y, n )
  
  integer, intent( in ) :: n 
  double precision, intent( in ) :: x( n )
  double precision, intent( inout )  :: y(n+1)
  integer :: i
  
  y(1) = 0.0D0
  do i = 1, n
    y(i+1) = y(i) + x(i)
  end do

end subroutine cumulated

subroutine sample( v, x, m, n )
  
  integer, intent( in ) :: m, n
  double precision, intent( in ) :: x( n )
  double precision, intent( out ) :: v( m )
  
  double precision :: y( n + 1 )
  double precision :: u
  integer :: i, j
  
  integer(8) :: cnt, count_max, count_rate

  
  call cumulated( x, y, n )

  do j = 1,m
	call SYSTEM_CLOCK( cnt, count_rate, count_max )
	!write( *, * ) cnt, count_rate, count_max 
	call sleep( 1 )
	u = rand( INT( cnt ) )
	do i = 1,n
		if ( u >= y(i) .and. u < y(i+1) ) then
			v(j) = DBLE( i )
		end if
	end do
  end do
  
end subroutine sample


program discrete
  
  integer :: i, n, m
  double precision, dimension(:), allocatable :: x
  double precision, dimension(:), allocatable :: v
  
  n = 10
  m = 20
  allocate(x(n),v(m))
    
  do i = 1,n
	x(i) = 1.0/DBLE(n)
  end do
  
  call sample( v, x, m, n )
  
  do i = 1,m
	write( *, * ) v(i)
  end do
    
  deallocate(x)
  stop
end program discrete



