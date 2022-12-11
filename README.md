Code club project: Assesing whether intra and inter-genomic variation
hinder utility of ASVs
================
2022-12-11

Developed over a series of *code club* episodes led by Pat Schloss to
answer an important question in microbiology and develop comfort using
tools to develop reproducible data analysis.

### Questions

- Within a genome, how many distinct sequences of the 16S rRNA gene were
  present relative to the number of copies per genome? Ho far aprt are
  these seuences from each other? How does this scale from a genome to
  kingdoms?
- Within a taxa (any level), how many ASVs from that taxa are shared
  with sister taxa? How does this cahnge with taxonomic level? Variable
  region?
- Make sure we have taxonomic data for all of our genomes
- Read .fasta files into R (do it on our own)
- `inner_join` with .tsv file
- `group_by` / `summarize` to count number of sequences and copies per
  genome

### Dependencies:

- [mothur
  v.1.48.0](https://github.com/mothur/mothur/releases/tag/v1.48.0)
- `wget`
- R version 4.1.2 (2021-11-01)
  - `tidyverse` (v. 1.3.2)
  - `data.table` (v. 1.14.4)
  - `rmarkdown` (v. 2.18)

### My computer

    ## R version 4.1.2 (2021-11-01)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 22.04.1 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
    ## LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.20.so
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] data.table_1.14.4 forcats_0.5.2     stringr_1.4.1     dplyr_1.0.10     
    ##  [5] purrr_0.3.5       readr_2.1.3       tidyr_1.2.1       tibble_3.1.8     
    ##  [9] ggplot2_3.4.0     tidyverse_1.3.2   rmarkdown_2.18   
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_1.2.0    xfun_0.34           haven_2.5.1        
    ##  [4] gargle_1.2.1        colorspace_2.0-3    vctrs_0.5.0        
    ##  [7] generics_0.1.3      htmltools_0.5.3     yaml_2.3.6         
    ## [10] utf8_1.2.2          rlang_1.0.6         pillar_1.8.1       
    ## [13] withr_2.5.0         glue_1.6.2          DBI_1.1.3          
    ## [16] dbplyr_2.2.1        modelr_0.1.10       readxl_1.4.1       
    ## [19] lifecycle_1.0.3     munsell_0.5.0       gtable_0.3.1       
    ## [22] cellranger_1.1.0    rvest_1.0.3         evaluate_0.17      
    ## [25] knitr_1.40          tzdb_0.3.0          fastmap_1.1.0      
    ## [28] fansi_1.0.3         broom_1.0.1         scales_1.2.1       
    ## [31] backports_1.4.1     googlesheets4_1.0.1 jsonlite_1.8.3     
    ## [34] fs_1.5.2            hms_1.1.2           digest_0.6.30      
    ## [37] stringi_1.7.8       grid_4.1.2          cli_3.4.1          
    ## [40] tools_4.1.2         magrittr_2.0.3      crayon_1.5.2       
    ## [43] pkgconfig_2.0.3     ellipsis_0.3.2      xml2_1.3.3         
    ## [46] reprex_2.0.2        googledrive_2.0.0   lubridate_1.9.0    
    ## [49] timechange_0.1.1    assertthat_0.2.1    httr_1.4.4         
    ## [52] R6_2.5.1            compiler_4.1.2
