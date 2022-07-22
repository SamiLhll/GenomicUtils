# Sequence_utils :

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
