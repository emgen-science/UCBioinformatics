###########################################
#For Running on Oakley
#PBS -N trimmingfastqs
#PBS -l nodes=1:ppn=12
#PBS -m abe
#PBS -M jenninec@mail.uc.edu
#PBS -l walltime=2:00:00
#PBS -j oe
#PBS -S /bin/bash
###########################################

module load java/1.8.0_131

export PATH=${PATH}:${HOME}/bin:$HOME/local/src/Trimmomatic-0.36/ #export paths in environment
export PATH=${PATH}:${HOME}/bin:$HOME/local/src/Trimmomatic-0.36/trimmomatic-0.3.6.jar #export paths in environment

#file1
java -jar $HOME/local/src/Trimmomatic-0.36/trimmomatic-0.36.jar \
SE \
-trimlog file1.log \
file1.fastq \
file1.trim.fastq \
HEADCROP:10 \
SLIDINGWINDOW:4:15

#file2
java -jar $HOME/local/src/Trimmomatic-0.36/trimmomatic-0.36.jar \
SE \
-trimlog file2.log \
file2.fastq \
file2.trim.fastq \
HEADCROP:10 \
SLIDINGWINDOW:4:15
