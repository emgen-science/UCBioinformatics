###########################################
#############TRINITY ASSEMBLY##############
############BIOINFORMATICS 2018############
###########EMILY JENNINGS MORGAN###########
# For Running on Oakley
#PBS -N NAME
#PBS -l nodes=1:ppn=12
#PBS -m abe -M EMAIL
#PBS -l walltime=48:00:00
#PBS -l mem=46GB
ulimit -s unlimited
##########################################
#Prepare to run
#make any directories here that you will need for your program to run #if you need a results folder, make that here
#if you need a folder in the scratch directory, make that here
#literally any folder you need, make it here.
mkdir /fs/lustre/PES0756/USERNAME/trinity

#if you have large files that you need to move, do that here.
cp /path/to/directory/of/file.extension /path/to/destination/folder/

#move to the working directory for project at hand
cd /path/to/your/scratch/folder/you/are/working/in/

#you will want to load modules of programs that are required to run your job here.
module load python/3.4.2
module load R/3.3.1
module load java/1.8.0_131
module load bioperl/1.6.1
module load samtools/1.6
module load bowtie1/1.1.2

#if you have programs that you installed locally, and your job needs them
#export the path to it so the computer can find it-do that here
export PATH=${PATH}:${HOME}/bin:$HOME/YOURPATHTOTRINITY:/bin:$PATH
export PATH=${PATH}:${HOME}/bin:$HOME/YOURPATHTOTRINITY/util:/bin:$PATH

#here is the actual executable part of the script
#see the user guide for whatever your program is you are running. #this is my old trinity script from another project

#this is the command that actually runs trinity
#specify sequence file type (fa or fq),
#specify single or paired end,
#name the file containing sequences,
#tell it where to put the output
#don't worry about the butterfly cpu and threads, etc.
# >$HOME...is creating a log that details the entire process.
$HOME/local/src/YOURPATHTOTRINITY/Trinity \
--seqType fq \
--samples_file samples.txt \
--max_memory 50G \
--output /fs/PES0756/USERNAME/trinity \
--SS_lib_type FR \
--min_contig_length 150 \
--CPU 16 \
--bflyCPU 16 \
--bflyGCThreads 16 \
> $HOME/YOURDIRECTORYOFCHOICE/trinity.log

#make sure you are back in the working directory that ocntains your working files--trinity always creates a .fasta file with your results
cd  /fs/lustre/PES0756/USERNAME/trinity
#copy and paste your fasta containing the assembly into your home directory folder that you specified above.
cp *.fasta $HOME/YOURDIRECTORYOFCHOICE/FILENAMEOFCHOICE.fasta
