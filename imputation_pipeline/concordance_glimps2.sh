#!/bin/bash

GLIMPSE2_concordance \
--gt-val --af-tag RAF \
--bins 0.0000 0.0010 0.0020 0.0030 0.0050 0.0075 0.0100 0.0200 0.0300 0.0500 0.0750 0.1000 0.2000 0.3000 0.5000 \
--threads 4 \
--output benchmarking_chr${CHROM} \
--input concordance_chr${CHROM}.lst \
--out-r2-per-site --out-rej-sites --out-conc-sites --out-disc-sites 
