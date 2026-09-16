#!/bin/bash

#since all sites are bi-allelic, --maf 0.05 (default, nonmajor) behaves identically to --maf 0.05 freq:minor
for CHROM in {1..22}; \
	do plink2 --make-pgen \
  --pfile pancancer_all_samples_unfiltered_chr${CHROM} \
  --threads 16 \
	--maf 0.01 \
	--out pancancer_all_samples_chr${CHROM}; \
done

for CHROM in {1..22}; \
do echo pancancer_all_samples_chr${CHROM}; \
done > pancancer_plink_merge.list

plink2 --make-pgen \
--pmerge-list pancancer_plink_merge.list \
--threads 16 \
--out pancancer_all_samples
