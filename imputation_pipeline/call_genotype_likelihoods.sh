#!/bin/bash

bcftools mpileup \
-f ${REFERENCE_GENOME} \
	-A -I -E -a 'FORMAT/DP' -Ou \
	-T 1000GP.chr${CHROM}.sites.vcf.gz -r ${CHROM} \
	${PATIENT_TUMOR_BAM}.bam \
	${PATIENT_NORMAL_BAM}.bam | \
	bcftools call -Aim -C alleles -T 1000GP.chr${CHROM}.sites.tsv.gz \
	-Ob -o ${PATIENT_GENOTYPE_LIKELIHOODS}.chr${CHROM}.bcf
