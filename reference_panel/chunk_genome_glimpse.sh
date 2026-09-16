#!/bin/bash

GLIMPSE_chunk \
	--input 1000GP.chr${CHROM}.sites.vcf.gz \
	--region ${CHROM} \
	--window-size 1000000 \
	--buffer-size 200000 \
	--output chunks.chr${CHROM}.txt
