#/bin/bash

VCF=pancancer_all_samples_merged_genotype_likelihoods.chr${CHROM}.bcf

LINE=$(sed -n ${CHUNK_NUMBER}p chunks.chr${CHROM}.txt)
printf -v ID "%03d" $(echo $LINE | cut -d " " -f1)
INPUT_REGION=$(echo $LINE | cut -d " " -f3)
OUTPUT_REGION=$(echo $LINE | cut -d " " -f4)
OUTPUT_DIRECTORY=pancancer_all_samples_chr${CHROM}/imputed

GLIMPSE_phase \
	--input ${VCF} \
	--reference 1000GP.chr${CHROM}.bcf \
	--map genetic_maps.b37/chr${CHROM}.b37.gmap.gz \
	--input-region ${INPUT_REGION} \
	--output-region ${OUTPUT_REGION} \
	--thread 40 \
	--output ${OUTPUT_DIRECTORY}/imputed.${ID}.bcf
