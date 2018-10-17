## Running Abaqus

Abaqus is a finite element analysis software used for engineering simulations. Here is a demonstration of running an Abaqus example problem through a batch script, adapted from the Abaqus example provided in the documentation [here](http://ivt-abaqusdoc.ivt.ntnu.no:2080/v6.14/books/exa/default.htm?startat=ch01s01aex01.html). 

1. Create an Abaqus input file. This repository provides the file <i>tennis_surfcav.inp</i>, which performs analysis on the impact of a tennis ball onto a racket, as well as the files <i>tennis_ef1.inp</i> and <i>tennis_ef2.inp</i>, which are referenced in the analysis.

Abaqus input files, ending with the extension <i>*.inp</i>, describe the model and simulation to be performed.

2. Prepare the submission script, which is the script that is submitted to the Slurm scheduler in order to run the Abaqus job. This repository provides the script <i>job.sh</i> as an example.

Because the Abaqus job results in many output files, a new directory is created in the <i>job.sh</i> script in order to organize the output files into one central location. 

3. Submit the job using
        `sbatch job.sh`

4. Examine the results by opening the new directory, <i>abaqus_test</i>. More information about what each file contains can be found in the [Abaqus User’s Manual](https://www.sharcnet.ca/Software/Abaqus610/Documentation/docs/v6.10/books/usb/default.htm?startat=pt01ch03s06aus34.html)
