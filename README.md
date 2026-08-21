# Calcium Reshapes Aβ Aggregation at Anionic Lipid Membranes

This repository is the public simulation-resource archive accompanying the published study:

> **Calcium Reshapes Aβ Aggregation at Anionic Lipid Membranes**<br>
> Meenal Jain and Silvina Matysiak<br>
> *The Journal of Physical Chemistry B* (2026)<br>
> [https://doi.org/10.1021/acs.jpcb.6c02606](https://doi.org/10.1021/acs.jpcb.6c02606)

> [!IMPORTANT]
> This public repository contains the force-field files, starting structures, simulation parameters, restraints, and setup utilities needed to recreate the simulated systems.

This work builds on our previous study of Aβ16–22 aggregation at mixed PC/PS bilayers ([Jain & Matysiak, 2024](https://doi.org/10.1021/acs.jpcb.4c05636)). For a step-by-step tutorial on setting up the mixed lipid bilayer and inserting peptides, see the [previous repository](https://github.com/meenaljainumd/PCPS_amyloid_aggregation).

## Simulation Conditions
We simulated the Aβ16–22 fragment (K₁₆LVFFAE₂₂) on a 70% POPC: 30% POPS bilayer under three conditions:

| Condition | Peptides | Ca²⁺ | Description |
|---|---|---|---|
| `no_calcium` | 16 | No | Control — no calcium ions |
| `with_calcium` | 16 | ~69 mM | CaCl₂ at Ca²⁺:lipid ≈ 0.24 |
| `calcium_only` | 0 | ~69 mM | Peptide-free calcium control |

Three independent replicas per condition were run for 3000 ns using GROMACS 2019.4. Peptides were modeled with the WEPPROM forcefield, lipids with WEPMEM, and solvent with polarizable MARTINI water.

## Repository Contents

```
.
├── ITP_files/                      
│   ├── ff.itp                        Nonbonded interactions
│   │                                
│   ├── popc.itp                      POPC lipid topology
│   ├── pops.itp                      POPS lipid topology
│   ├── abeta.itp                     Aβ16–22 peptide topology
│   ├── ions.itp                      Ion parameters (Ca²⁺, Na⁺, Cl⁻)
│   ├── water.em.itp                  (water topology for energy minimization)
│   └── water.md.itp                  (water topology for equilibration/production)
│
├── Initial_molecular_structures/   Starting configurations for production runs
│   ├── no_calcium.gro
│   ├── with_calcium.gro
│   └── calcium_only.gro
│
├── TOP_files/                      System topologies for each condition
│   ├── no_calcium.top
│   ├── with_calcium.top
│   └── calcium_only.top
│
├── mdp_files/                      GROMACS run parameter files
│   ├── em.mdp                        Energy minimization
│   ├── eq.mdp                        NPT equilibration
│   └── run.mdp                       Production run (3000 ns)
│
├── Position_restraint_files/       
│   ├── popc_po4.itp                  POPC phosphate restraints
│   ├── pops_po4.itp                  POPS phosphate restraints
│   └── phe_bb.itp                    Peptide backbone restraints
│
├── setup_scripts/                  Scripts for building the simulation system
│   ├── insane_genBL.py               Modified insane script for WEPMEM bilayers
│   ├── add_pep.py                    Insert 16 peptides around the bilayer
│   ├── abeta.gro                     Single Aβ16–22 peptide structure
│   ├── setup.sh                      bash script to setup the system
│   └── MT_compute.sh                 calculate membrane thickness using FATSLIM
│
└── README.md
```

## Trajectory Data

Molecular trajectories and portable binary run input files are available in the [published Zenodo dataset](https://doi.org/10.5281/zenodo.19673671).

## Software Requirements

- [GROMACS 2019.4](https://www.gromacs.org/) — simulation engine
- [Python 3.9+](https://www.python.org/)
- [MDAnalysis 2.x](https://www.mdanalysis.org/) — trajectory analysis
- [FATSLiM](https://fatslim.github.io/) — area per lipid calculations

## Usage

### Setting up new simulations

For a detailed tutorial on building the mixed lipid bilayer and inserting peptides, see the [previous repository README](https://github.com/meenaljainumd/PCPS_amyloid_aggregation#tutorial-setting-up-a-mixed-lipid-bilayer-with-16-peptides). The same procedure applies here, with the additional step of adding CaCl₂ ions to the aqueous phase for the `with_calcium` and `calcium_only` conditions.

## Citation

If you use these files, please cite:

```bibtex
@article{jain2026calcium,
  title={Calcium Reshapes A$\beta$ Aggregation at Anionic Lipid Membranes},
  author={Jain, Meenal and Matysiak, Silvina},
  journal={The Journal of Physical Chemistry B},
  year={2026},
  doi={10.1021/acs.jpcb.6c02606}
}
```

## Contact

For questions, please contact [mjain123@umd.edu](mailto:mjain123@umd.edu).

## License

This project is licensed under the MIT License.
