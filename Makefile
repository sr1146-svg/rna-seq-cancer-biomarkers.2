ENV_NAME = bio-workflow

create-env:
	mamba env create -f environment.yml || conda env create -f environment.yml

activate:
	@echo "Run: conda activate $(ENV_NAME)"

dryrun:
	snakemake -n

run:
	snakemake --use-conda -j 4

clean:
	snakemake --delete-all-output
