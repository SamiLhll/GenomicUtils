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
