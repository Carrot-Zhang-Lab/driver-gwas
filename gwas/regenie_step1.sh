#!/bin/bash

regenie --step 1 \
--pgen pancancer_all_samples \
--bt --ref-first \
--extract ./snplists/${ANCESTRY}_minMAC_100.snplist \
--phenoFile ./phenotypes_and_covariates/${ANCESTRY}_${CANCER}_pheno.tsv \
--covarFile ./phenotypes_and_covariates/${ANCESTRY}_${CANCER}_cov.tsv \
--minCaseCount ${MINIMUM_CASE_COUNT_5_PERCENT_CUTOFF} \
--covarColList  PC{1:10},PATIENT_CURRENT_AGE \
--catCovarList GENE_PANEL,SEX \
--bsize 1000 --threads 72 \
--lowmem --lowmem-prefix ${CANCER}/.${ANCESTRY}_${CANCER} \
--out ${CANCER}/${ANCESTRY}_${CANCER}_step1
