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
