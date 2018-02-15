#######################################################
#####Installing BLAST DBs for Bioinformatics 2018######
##############by emily jennings morgan#################
#PBS -N installdbs
#PBS -m abe -M youremailhere
#PBS -l nodes=1:ppn=4
#PBS -l mem=16GB
#PBS -l walltime=12:00:00
#PBS -A PES0756
ulimit -s unlimited
#######################################################

mkdir -p /fs/lustre/PES0756/YOURUSERNAMEHERE/BLASTDB/tars
cd /fs/lustre/PES0756/YOURUSERNAMEHERE/BLASTDB/tars

module load bioperl/1.6.1
module load python/2.7.1
module load java/1.7.0_55

export PATH=${PATH}:${HOME}/bin:$HOME/local/src/ncbi-blast-2.7.1+:/bin:$PATH
export PATH=${PATH}:${HOME}/bin:$HOME/local/src/ncbi-blast-2.7.1+/bin:/bin:$PATH

perl $HOME/local/src/ncbi-blast-2.7.1+/bin/update_blastdb.pl nr
perl $HOME/local/src/ncbi-blast-2.7.1+/bin/update_blastdb.pl taxdb

for file in /fs/lustre/PES0756/YOURUSERNAMEHERE/BLASTDB/tars/*.tar.gz

do
gunzip -cd $file | (cd /fs/lustre/PES0756/YOURUSERNAMEHERE/BLASTDB; tar xvf - )
done

$HOME/local/src/ncbi-blast-2.7.1+/bin/blastdbcheck -dir /fs/lustre/PES0756/YOURUSERNAMEHERE/BLASTDB
