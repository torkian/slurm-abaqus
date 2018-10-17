#!/bin/sh
#SBATCH -o aba_out%j.out
#SBATCH -e aba_err%j.err
#SBATCH --ntasks-per-node=28
#SBATCH -N 1
#SBATCH -p defq

## this example simulates the impact of a tennis ball onto a racket 

## creates a directory to throw all the files in, since there are a lot
dir=abaqus_test$SLURM_JOB_ID
mkdir $dir

## error checking to confirm necessary files exist
## if not, fetch them from abaqus
if [ ! -e "tennis_surfcav.inp" ]; then
        abaqus fetch job=tennis_surfcav.inp
fi

if [ ! -e "tennis_ef1.inp" ]; then
        abaqus fetch job=tennis_ef1.inp
fi

if [ ! -e "tennis_ef2.inp" ]; then
        abaqus fetch job=tennis_ef2.inp
fi

## move these files into the new directory
cp tennis_surfcav.inp tennis_ef1.inp tennis_ef2.inp $dir 

## opens that directory
cd $dir

## loads the matlab module
module load abaqus
## runs the abaqus job, giving it the name testP and using the tennis_surfcav file
abaqus job=aba_test input=tennis_surfcav.inp interactive

echo 'done'
