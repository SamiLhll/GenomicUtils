#!/usr/bin/env bash

#######################################################
# OF_to_macrosyntR
# Sami El Hilali
# 2023_March_01
#######################################################

# It converts OrthoFinder's output to pairwise ortholog tables
# as expected for macrosyntR input.

####### PARSE parameters
Help() {
 echo "OF_to_macrosyntR - usage :"
 echo "-i INPUT_DIR, path to the OrthoFinder's result directory, omitting the last \"/ \""
 echo "-o OUTPUT_DIR, path where to write the resulting tables, omitting the last \"/\", default is current dir"
}

while getopts i:o:h option
do
	case "${option}"
	in
	i) INPUT_DIR=${OPTARG};;
	o) OUTPUT_DIR=${OPTARG};;
	h) Help;
	   exit;;
	?) Help;
	   exit;;
	esac
done

#########################
# exit if a command fails
set -e
########

if [ -z "$INPUT_DIR" ]
then
  Help;
  exit;
fi

if [ -z "$OUTPUT_DIR" ]
then
  OUTPUT_DIR=.
fi

######################### RUN

TEMP_SINGLE_ORTHOLOGS=$OUTPUT_DIR/temp.single_copy_orthologs.tab

# Get the header for the final table :
head -n 1 $INPUT_DIR/Orthogroups/Orthogroups.tsv | cut -f2- > $TEMP_SINGLE_ORTHOLOGS

# subset Orthologs.tsv with only the orthogroups in Single_copy_orthologs.txt
fgrep -f $INPUT_DIR/Orthogroups/Orthogroups_SingleCopyOrthologues.txt $INPUT_DIR/Orthogroups/Orthogroups.tsv | cut -f2- >> $TEMP_SINGLE_ORTHOLOGS

### Create all pairwise combinations :
SPECIES=($(head -n 1 $TEMP_SINGLE_ORTHOLOGS| tr -d '\r'))
for i in "${!SPECIES[@]}" ; do
  for ii in "${!SPECIES[@]}" ; do
    if [ "${SPECIES[$i]}" \< "${SPECIES[$ii]}" ]
    then
      FILENAME=$OUTPUT_DIR/${SPECIES[$i]}_vs_${SPECIES[$ii]}.tab;
      echo "$FILENAME";
      awk -v n="$i" -v m="$ii" '{na = n+1;ma = m + 1; print $na"\t"$ma}' $TEMP_SINGLE_ORTHOLOGS | tail -n +2 > $FILENAME
    fi
  done
done

rm $TEMP_SINGLE_ORTHOLOGS

######################### DONE
