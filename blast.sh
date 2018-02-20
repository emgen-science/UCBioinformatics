###########################################
# For Running on Oakley
#PBS -N NAME
#PBS -l nodes=1:ppn=12
#PBS -m abe -M jenninec@mail.uc.edu
#PBS -l walltime=48:00:00
#PBS -l mem=46GB
#THIS IS A BLASTX SCRIPT#
ulimit -s unlimited

#let's prepare the lustre for this adventure
mkdir /fs/lustre/PES0756/USERNAME/blast
mkdir $HOME/projects/Diploptera/Tobe/blastresults
#let's move the cds there
cp $HOME/projects/Diploptera/Tobe/Tobe.fasta.transdecoder.cds /fs/lustre/PES0756/USERNAME/blast/Tobe.cds.fasta


cd /fs/lustre/PES0756/USERNAME/blast

module load python/2.7.1
module load R/3.0.1
module load java/1.7.0_17
module load bioperl/1.6.1
module load samtools/0.1.18

# This is the the script for Blast
# Change query to name of fasta file to blast
# Change out to what you want output file called
# Change db to database you want to blast against

export PATH=${PATH}:${HOME}/bin:$HOME/local/src/ncbi-blast-2.7.1+/bin:/bin:$PATH
export BLASTDB=/fs/lustre/PES0756/USERNAME/BLASTDB

$HOME/local/src/ncbi-blast-2.7.1+/bin/blastx \
-query /fs/lustre/PES0756/USERNAME/blast/Tobe.cds.fasta \
-out Tobe.blast.xml \
-outfmt 5 \
-db nr \
-max_target_seqs 20 \
>$HOME/projects/Diploptera/Tobe/blastx.log


# prepare folder for storage and transfer of results


cd /fs/lustre/PES0756/USERNAME/blast/

mv *Tobe.blast.* $HOME/projects/Diploptera/Tobe/blastresults
