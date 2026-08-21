#!/bin/bash
# Set the -e option 
set -e
replicas=("rep4" "rep2" "rep3");
for r in "${!replicas[@]}"; do
    rep="${replicas[r]}"
    mkdir $rep
    cd $rep
    
    #Check the APL
    #gmx analyze -f area.xvg -b 15000
    
    #Create a BL index group and transfer the BL to a bigger box
    #gmx make_ndx -f eq.part0002.gro -o index.ndx
    #gmx traj -f eq.part0002.gro -s eq.tpr -n index.ndx -oxt bl.gro

    #Add NA ions
    #gmx grompp -f ../Lipid_Cal_Abeta/em.mdp -p *.top -c eq2.gro -o ions2.tpr -maxwarn 1
    #gmx genion -s ions2.tpr -p *.top -o ions2.gro -pname CA -np 320 -nname CL -nn 640
    
    #EM 
    #sed -i 's:water.md.itp:water.em.itp:g' *.top
    #grompp -f ../em.mdp -p *.top -c *.gro -o em1.tpr -maxwarn 1
    #mdrun -deffnm em1 -v 

    #EQ 
    #sed -i 's:water.em.itp:water.md.itp:g' *.top
    #gmx make_ndx -f em1.gro -o index.ndx 
    #grompp -f apl.mdp -p *.top -c em1.gro -n index.ndx -o apl.tpr -maxwarn 1

    #Adding peptides 
    #python ../Lipid_Cal_Abeta/add_pep.py -c eq3.gro -f with_pep.gro -conf ../abeta.gro -n 16  	

    #echo 'Protein         16' 
    #PW=$(grep WP with_pep.gro |  wc -l)
    #echo 'PW          ' $PW 
    #CA=$(grep CA with_pep.gro |  wc -l)
    #echo 'CA          ' $CA
    #CL=$(grep CL with_pep.gro |  wc -l)
    #echo 'CL          ' $CL
    #sleep 10 
   
    #sed -i 's:water.md.itp:water.em.itp:g' topol.top
    #gmx grompp -f ../em.mdp -p topol.top -c with_pep.gro -r with_pep.gro -o em2.tpr
    #gmx mdrun -deffnm em2 -v
    #sed -i 's:water.em.itp:water.md.itp:g' ./topol.top
    #gmx grompp -f ../eq.mdp -p topol.top -c em2.gro -r em2.gro -o eq2.tpr -maxwarn 1

    #NPT  
    #grompp -f ../npt.mdp -p *.top -n index.ndx -c eq4.gro -o run.tpr -maxwarn 1
    
    #Generating PDB file
    #cp ../createpsf.py .
    #python createpsf.py

    #Postprocessing the files
    #gmx make_ndx -f run.tpr -o index.ndx
    #gmx convert-tpr -s run.tpr -n index.ndx -o red.tpr
    #gmx trjconv -s run.tpr -n index.ndx -f run.xtc -o full_trj_pbc.xtc -pbc mol -center

    #scp -rp rep*/ mjain123@login.zaratan.umd.edu:/home/mjain123/scratch/Calcium_Abeta/
    cd ../
done	
