# SamiGenomicsBashScripts
A collection of custom-made bash scripts to make my Genomics data analyses easily reproducible 

# MacroSynteny

### Generate_MBH_table :

-------------------------------------------------------
generate blastp MBH (proteins only!) - usage :   
-a path to the first specie proteins dataset (FASTA)   
-b path to the second specie proteins dataset (FASTA)   
-n name to give to the resulting table   
-t number of threads to dedicate to the blast jobs   
-h prints this message and exit   

The output is a tab delimited file formatted as follow :   
proteinID_specie_a  proteinID_specie_b
...

-------------------------------------------------------

# Sequence_utils :

### Chunkify fasta :

Small script to divide multifasta file into chunks of a specified maximum amount of sequences.
It is supposed to adress the limitation of amount of queries when querying a database through a webserver.
It uses seqtk subseq function.

---------------------------------------------

chunkify fasta - usage :   
-i path to the input file (FASTA)   
-c maximum chunk size (amount of sequences)   
-h prints this message and exit   

---------------------------------------------

