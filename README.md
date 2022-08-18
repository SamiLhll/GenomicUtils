# GenomicsUtils

A collection of custom-made scripts for genomics

# Functional Annotation

### AggregatePfam

This script takes as input a pfam annotation result  
(output of hmmsearch --domtable --noali options)  
It outputs a tab with protein ids and aggregated pfam domains  
formatted as following : protein_id    pfam_dom1(amount),pfam_dom2(amount),...   

-------------------------------------------------------

AggregatePfam - usage :   
-i input_path

-------------------------------------------------------

### Seek_mitochondrion

This scripts takes an assembly (mutifasta format) and do a tblastn of a set of mitochondrial
genes agains it. It outputs the contigs with significant hits (evalu < 1.e-10)
make sure to download the mitochondrial gene sequences from MITOs webserver :   
[http://mitos.bioinf.uni-leipzig.de/mito/RefSeq39.zip](http://mitos.bioinf.uni-leipzig.de/mito/RefSeq39.zip).  
Then replace in the script the value of the variable Mitochondrion_seq_path with the path where the sequences were downloaded.    

-------------------------------------------------------

Seek_mitochondrion - usage :   
-n RUN_NAME   
-a ASSEMBLY   
-t THREADS   

-------------------------------------------------------

# MacroSynteny

### Generate_MBH_table :

WARNING : It creates temporary files, so make sure that
if you run two jobs in parallel, it's in separate folders.

-------------------------------------------------------
generate blastp MBH - usage :   
-a path to the first specie proteins dataset (FASTA)   
-b path to the second specie proteins dataset (FASTA)   
-o name to give to the resulting table   
-t number of threads to dedicate to the blast jobs   
-h prints this message and exit   

The output is a tab delimited file formatted as follow :   
proteinID_specie_a  proteinID_specie_b
...

-------------------------------------------------------

# Miscellaneous

### NewBashScriptCanva :

This script outputs the canva for a bashscript featuring the text entered as argument.

-------------------------------------------------------
NewBashScript - usage :   
-a Author name   
-t Title of the script   
-o option names separated by "," as in "opt1,opt2,...,optn"   
-h prints this message and exit   

-------------------------------------------------------

**bash NewBashScriptCanva -a "Sami El Hilali" -t "Awesome bashscript" -o "Output,Bam,fasta,gtf"** gives the following output :

![image](https://user-images.githubusercontent.com/37333782/171440249-bff4ef67-1329-456b-a336-7e2dff09d471.png)


# Phylogenomics

This is a set of scripts to go from OrthoFinder's output to build a species tree using RAxML.
It takes as input the OrthoFinder's output (version 2.5.2) and the minimum amount of species
that has to be featured in the single copy orthogroups. The set of scripts requires that following tools intalled :
* RAxML
* Mafft
* trimAL
* GNU parallel
* seqtk
-------------------------------------------------------
QuickPhylogeny : from orthofinder to a tree using mafft,trimAl and RAxML - usage :
-t number of threads
-s amount of species that have to feature an orthologue
-i input == OrthoFinder output path
-o outgroups for RAxML as a list separated by commas. enter none fo no outgroup
-r run name

-------------------------------------------------------

# Sequence_utils :

### CalculateAAcomposition :

This script calculates the amino acid composition of protein sequences provided as input in multi-fasta format

---------------------------------------------    

CalculateAAcomposition - usage :   
-i INPUT_FILE

---------------------------------------------    


### CalculateGCWindows :

This script takes an assembly as input and calculates the GC content in windows of provided size.   
Output is formatted as bedgraph.   It uses [seqtk](https://github.com/lh3/seqtk) and [bedtools](https://bedtools.readthedocs.io/en/latest/) (makewindows and nuc)

---------------------------------------------   

CalculateGCWindows - usage :   
-a ASSEMBLY   
-s WINDOW_SIZE   
-k KEEP_SEQUENCES   

---------------------------------------------


### CalculateGeneDensityWindows :

This script takes an assembly and gene annotations (GFF3) and calculates the Gene density in windows of provided size.   
Output is formatted as a bedgraph.   It uses [seqtk](https://github.com/lh3/seqtk) and [bedtools](https://bedtools.readthedocs.io/en/latest/) (makewindows and intersect)

---------------------------------------------   

CalculateGeneDensityWindows - usage :   
-a ASSEMBLY   
-g GENES_GFF3   
-s WINDOW_SIZE   
-k KEEP_SEQUENCES     

---------------------------------------------

### Calculate N50 :

Script that uses [seqtk](https://github.com/lh3/seqtk) comp function to calculate the N50 of an assembly or binned metagenome (fasta)

---------------------------------------------

calculate N50 - usage :   
-i path to the genome assembly (FASTA)   
-h prints this message and exit   

---------------------------------------------

### Chunkify fasta :

Script intended at dividing multifasta file into chunks of a specified max amount of sequences.
It is supposed to adress the limitation of amount of queries when querying a database through a webserver.
It uses [seqtk](https://github.com/lh3/seqtk) subseq function.

---------------------------------------------

chunkify fasta - usage :   
-i path to the input file (FASTA)   
-c maximum chunk size (amount of sequences)   
-h prints this message and exit   

---------------------------------------------
