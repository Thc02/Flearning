program vertical
     !
     ! Vertical motion under gravity
     !
     real :: g		! acceleration due to gravity
     real :: s		! displacement
     real :: t 		! time
     real :: u          ! initial speed ( m / s )

     ! set values of variables
     g = 9.8
     t = 6.0
     u = 60

     ! calculate displacement
     s = u * t - g * (t**2) / 2

     ! output results
     s = u * t - g * (t**2) / 2

     ! output results
     write(*,*) 'Time = ',t, 'Displacement= ',s

end program vertical 			 				    				
