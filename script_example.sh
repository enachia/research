#!/bin/sh
#PBS -S /bin/sh
#PBS -N Haloshaper
#PBS -j oe
#PBS -l nodes=2:ppn=10,walltime=10:00:00

module () {
  eval $(/usr/bin/modulecmd bash $*)
}

module purge

#module load intel/17.0-python-3.6.0
#module load openmpi/1.8.7-ifort-15.0 
module load openmpi/4.1.2-gnu

ulimit -s unlimited
ulimit -v unlimited

cd /data78/welker/haloshaper_smooth/
mpirun -np 10 haloshapeNH -nzi 970 | tee hm6.log
exit 0

