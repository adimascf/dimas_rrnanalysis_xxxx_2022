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

### Dependencies:

- [mothur
  v.1.48.0](https://github.com/mothur/mothur/releases/tag/v1.48.0)
- `wget`
- R version 4.2.2 (2022-10-31 ucrt)
  - `tidyverse` (v. 1.3.2)
  - `data.table` (v. 1.14.4)
  - `rmarkdown` (v. 2.17)

### My computer

    ## R version 4.2.2 (2022-10-31 ucrt)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 22621)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_Indonesia.utf8  LC_CTYPE=English_Indonesia.utf8   
    ## [3] LC_MONETARY=English_Indonesia.utf8 LC_NUMERIC=C                      
    ## [5] LC_TIME=English_Indonesia.utf8    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] rmarkdown_2.17    data.table_1.14.4 forcats_0.5.2     stringr_1.4.1    
    ##  [5] dplyr_1.0.10      purrr_0.3.5       readr_2.1.3       tidyr_1.2.1      
    ##  [9] tibble_3.1.8      ggplot2_3.4.0     tidyverse_1.3.2  
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_1.2.0    xfun_0.34           haven_2.5.1        
    ##  [4] gargle_1.2.1        colorspace_2.0-3    vctrs_0.5.0        
    ##  [7] generics_0.1.3      htmltools_0.5.4     yaml_2.3.6         
    ## [10] utf8_1.2.2          rlang_1.0.6         pillar_1.8.1       
    ## [13] withr_2.5.0         glue_1.6.2          DBI_1.1.3          
    ## [16] dbplyr_2.2.1        modelr_0.1.9        readxl_1.4.1       
    ## [19] lifecycle_1.0.3     munsell_0.5.0       gtable_0.3.1       
    ## [22] cellranger_1.1.0    rvest_1.0.3         evaluate_0.17      
    ## [25] knitr_1.40          tzdb_0.3.0          fastmap_1.1.0      
    ## [28] fansi_1.0.3         broom_1.0.1         scales_1.2.1       
    ## [31] backports_1.4.1     googlesheets4_1.0.1 jsonlite_1.8.3     
    ## [34] fs_1.5.2            hms_1.1.2           digest_0.6.30      
    ## [37] stringi_1.7.8       grid_4.2.2          cli_3.4.1          
    ## [40] tools_4.2.2         magrittr_2.0.3      crayon_1.5.2       
    ## [43] pkgconfig_2.0.3     ellipsis_0.3.2      xml2_1.3.3         
    ## [46] reprex_2.0.2        googledrive_2.0.0   lubridate_1.9.0    
    ## [49] timechange_0.1.1    assertthat_0.2.1    httr_1.4.4         
    ## [52] rstudioapi_0.14     R6_2.5.1            compiler_4.2.2
