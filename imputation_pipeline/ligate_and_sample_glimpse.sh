#!/bin/bash

ls pancancer_all_samples_chr${CHROM}/imputed/imputed.*.bcf > chr${CHROM}imputed_files.list

GLIMPSE_ligate \
--thread 24 --input chr${CHROM}imputed_files.list \
 --output pancancer_all_samples_imputed_dosages.chr${CHROM}.bcf

GLIMPSE_sample \
--thread 24 --input pancancer_all_samples_imputed_dosages.chr${CHROM}.bcf \
--solve --output pancancer_all_samples_sampled_haplotypes.chr${CHROM}.bcf
