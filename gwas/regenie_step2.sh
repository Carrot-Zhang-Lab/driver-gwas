#!/bin/bash

regenie --step 2 \
--pgen pancancer_all_samples \
--bt --ref-first --firth --approx --pThresh 0.01 \
--phenoFile ./phenotypes_and_covariates/${ANCESTRY}_${CANCER}_pheno.tsv \
--covarFile ./phenotypes_and_covariates/${ANCESTRY}_${CANCER}_cov.tsv \
--minCaseCount ${MINIMUM_CASE_COUNT_5_PERCENT_CUTOFF} \
--covarColList  PC{1:10},PATIENT_CURRENT_AGE \
--catCovarList GENE_PANEL,SEX \
--bsize 1000 --threads 72 \
--pred ${CANCER}/${ANCESTRY}_${CANCER}_step1_pred.list \
--out ${CANCER}/${ANCESTRY}_${CANCER}_step2
