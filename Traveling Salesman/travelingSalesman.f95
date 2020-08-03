!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! PROGRAM P4
! Traveling Salesman Problem in FORTRAN 95
! CS320
! 10/30/2019
! @ReymondPamelar
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
PROGRAM P4

IMPLICIT NONE

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Variable declarations
CHARACTER(50) :: filename
INTEGER :: numCities, i, j, k, perms, dist, best_dist,n
character(15), dimension(:),ALLOCATABLE :: cities
integer, dimension(:),ALLOCATABLE :: path, bestPath
integer, dimension(:,:),ALLOCATABLE :: dist_table
perms=0
best_dist=99999
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Open the file and read number of cities
print *, "Enter filename:"
read(*,*) filename
open(unit = 10, file=filename)
read(10,*) numCities
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Allocate memory for all needed arrays
Allocate(cities(numCities))
Allocate(path(numCities))
Allocate(bestPath(numCities))
Allocate(dist_table(numCities,numCities))
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Fill in arrays from data file
Do i=1,numCities
    read(10,*)cities(i)
    path(i)=i
    Do j=1, numCities
        read(10,*)
    End Do
End Do
Close(10)

bestPath=path

open(unit = 11, file=filename)
read(11,*)
Do i=1, numCities
    read(11,*)
    Do j=1, numCities
        read(11,*)dist_table(i,j)
    End Do
End Do
Close(11)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Use recursion to find minimal distance
call permute(2,numCities)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Print formatted output
Do i=1, numCities-1
    write(*, '(4A20, I5, A6)')cities(bestpath(i)),"to", cities(bestpath(i+1)), "--", dist_table(bestPath(i),bestPath(i+1))
end Do
n=numCities
write(*, '(4A20, I5, A6)')cities(bestpath(n)),"to", cities(bestpath(1)), "--", dist_table(bestPath(n),bestPath(1))
write(*,*)"Best Distance:",best_dist
write(*,*)"Number of permutations",perms
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!Format labels
100 FORMAT (I6)
200 FORMAT (A)


CONTAINS
!Permute function
RECURSIVE SUBROUTINE permute(first, last)

integer :: first, last, temp, i
If (first==last) Then
    !Add distances
    dist = dist_table(path(1),path(2))
    Do i=2, last-1
        dist = dist + dist_table(path(i),path(i+1))
    End Do
    dist = dist + dist_table(path(last),path(1))
    perms= perms+1
    !save best distances
    If(dist<best_dist) then
        best_dist=dist
        bestPath=path
    end if
ELSE
    Do i=first, last
    	!swap
        temp=path(first)
        path(first)=path(i)
        path(i)=temp
	
	!Recursion reduction step
        call permute(first+1, last)
	
	!swap
        path(i)=path(first)
        path(first)=temp
    end Do
end if
END SUBROUTINE permute

END PROGRAM P4
