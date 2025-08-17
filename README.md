# Bioinformatics Project Template (Snakemake)

A clean, reproducible scaffold for sequencing-data analysis using **Snakemake**.

## Goals
- Keep raw data out of Git while making analysis fully reproducible.
- Use clear configs (`config/`) and metadata (`samples.tsv`).
- Separate intermediate (`analysis/`) and final (`results/`) outputs.
- Make the environment reproducible (`environment.yml`).

## Quickstart
```bash
# 1) Create & activate the environment (requires conda/mamba)
mamba env create -f environment.yml || conda env create -f environment.yml
conda activate bio-workflow

# 2) Put or symlink your FASTQ files under data/raw/
# Example (symlinks):
ln -s /absolute/path/to/*.fastq.gz data/raw/

# 3) Edit sample sheet & config
nano config/samples.tsv
nano config/config.yaml

# 4) Dry run
snakemake -n

# 5) Run
snakemake --use-conda -j 4

# 6) Open QC report
# Linux:
xdg-open results/qc/multiqc_report.html || true
# macOS:
open results/qc/multiqc_report.html || true
```

## Structure
```
.
├── README.md
├── .gitignore
├── environment.yml
├── config/
│   ├── config.yaml
│   └── samples.tsv
├── data/
│   ├── raw/                # symlink or place raw FASTQ/BAMs here (not committed)
│   └── reference/          # reference genomes/annotations (not committed)
├── scripts/
│   ├── python/
│   ├── R/
│   └── bash/
├── workflow/
│   ├── Snakefile
│   └── envs/
│       ├── fastqc.yaml
│       └── multiqc.yaml
├── analysis/               # intermediate files (ignored)
├── results/                # final outputs (commit small, essential results)
└── documentation/
    └── notes.md
```

## Data policy
- **Do not commit** large raw data or reference files. Use symlinks into `data/raw/` and `data/reference/`.
- Keep intermediate, regenerable files in `analysis/` (ignored by Git).
- Commit small, final, publication-ready artifacts to `results/` when feasible.

## Running on a cluster
Snakemake integrates with SLURM/SGE/etc. See Snakemake docs for `--cluster` / profiles.
You can add profiles later under `workflow/profiles/` if needed.

## Nextflow users
This template is Snakemake-first. If you want a Nextflow variant, ask and we can generate one.
