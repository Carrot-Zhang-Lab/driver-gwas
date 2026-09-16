#!/bin/bash

bcftools annotate \
-a dbsnp_134_b37.leftAligned.vcf.gz \
	-Ob -c ID --threads 24 \
	-o  pancancer_all_samples_annotated.chr${CHROM}.bcf \
	 pancancer_all_samples_imputed_dosages.chr${CHROM}.bcf

bcftools index --threads 8  pancancer_all_samples_annotated.chr${CHROM}.bcf

plink2 --make-pgen \
	--bcf  pancancer_all_samples_annotated.chr${CHROM}.bcf  dosage=DS \
  --threads 48 --double-id \
	--set-missing-var-ids @_#_\$r_\$a \
	--out pancancer_all_samples_unfiltered_chr${CHROM}
