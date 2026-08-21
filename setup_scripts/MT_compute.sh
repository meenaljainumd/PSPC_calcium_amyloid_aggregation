#!/bin/bash
# Set the -e option 
set -e

Directories=("CONTROL" "LOW_CA_LIP_RATIO")
# Create directories and modify files
for i in "${!Directories[@]}"; do

    dir="${Directories[i]}"
    cd $dir

    replicas=("rep4" "rep2" "rep3");
    for r in "${!replicas[@]}"; do
        rep="${replicas[r]}"
        cd $rep
        pwd
 
        fatslim thickness -c run.gro -t run_skip10.xtc -n index.ndx --export-thickness-raw MT.xvg

        cd ../
        done
cd ../
done

