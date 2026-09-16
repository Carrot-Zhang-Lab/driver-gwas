#!/bin/bash

bcftools view \
-m 2 -M 2 -v snps --threads 4 -Ob -o 1000GP.chr${CHROM}.bcf \
	ALL.chr${CHROM}.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz

bcftools index -f 1000GP.chr${CHROM}.bcf

bcftools view -G -m 2 -M 2 -v snps 1000GP.chr${CHROM}.bcf -Oz -o 1000GP.chr${CHROM}.sites.vcf.gz

bcftools index -f 1000GP.chr${CHROM}.sites.vcf.gz

bcftools query \
 -f '%CHROM\t%POS\t%REF,%ALT\n' \
1000GP.chr${CHROM}sites.vcf.gz | bgzip -c > 1000GP.chr${CHROM}.sites.tsv.gz

tabix -s1 -b2 -e2 1000GP.chr${CHROM}.sites.tsv.gz

