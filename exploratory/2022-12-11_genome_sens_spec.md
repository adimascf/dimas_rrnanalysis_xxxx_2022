Analyzing the sensitivity and specifity of ASVs for descriminating
between genomes
================
2022-12-11

``` r
library(tidyverse)
library(here)
```

### Need to determine the number of *rrn* operons across genomes

Our analysis will use full length sequnces

``` r
fl <- read_tsv(here("data/v19/rrnDB.count_tibble"))
```

We want to count and plot the number of copies per genome

``` r
fl %>% 
    group_by(genome) %>%
    summarize(n_rrn = sum(count), .groups = "drop") %>%
    ggplot(aes(x=n_rrn)) + geom_histogram(binwidth = 1)
```

![](2022-12-11_genome_sens_spec_files/figure-gfm/rrn-1.png)<!-- -->

``` r
fl %>% 
    group_by(genome) %>%
    summarize(n_rrn = sum(count), .groups = "drop") %>%
    count(n_rrn) %>%
    mutate(fraction = n / sum(n))
```

    ## # A tibble: 20 × 3
    ##    n_rrn     n  fraction
    ##    <dbl> <int>     <dbl>
    ##  1     1  1565 0.102    
    ##  2     2  1741 0.113    
    ##  3     3  2143 0.139    
    ##  4     4  1769 0.115    
    ##  5     5  1232 0.0801   
    ##  6     6  2120 0.138    
    ##  7     7  2671 0.174    
    ##  8     8   964 0.0626   
    ##  9     9   364 0.0237   
    ## 10    10   321 0.0209   
    ## 11    11   139 0.00903  
    ## 12    12   157 0.0102   
    ## 13    13    68 0.00442  
    ## 14    14   100 0.00650  
    ## 15    15    23 0.00149  
    ## 16    16     5 0.000325 
    ## 17    17     4 0.000260 
    ## 18    18     1 0.0000650
    ## 19    19     1 0.0000650
    ## 20    21     1 0.0000650

We see that most genomes actually have more than one copy of the *rrn*
operon. I wonder whether those different copies are the same sequence /
ASV..

### Determine number of ASVs per genoem

Considering most genomes have multiple copies of the *rrn* operon, we
need to know whether the all have the same ASVs. Otherwise we run the
risk of splitting a single genome into multiple ASVs.

``` r
fl %>%
    group_by(genome) %>%
    summarize(n_asv = n(), n_rrn = sum(count), .groups = "drop") %>%
    group_by(n_rrn) %>%
    summarize(med_n_asv = median(n_asv),
              lq_n_asv = quantile(n_asv, prob=0.25),
              uq_n_asv = quantile(n_asv, prob=0.75))
```

    ## # A tibble: 20 × 4
    ##    n_rrn med_n_asv lq_n_asv uq_n_asv
    ##    <dbl>     <dbl>    <dbl>    <dbl>
    ##  1     1       1       1         1  
    ##  2     2       1       1         2  
    ##  3     3       1       1         2  
    ##  4     4       2       1         2  
    ##  5     5       3       1         4  
    ##  6     6       3       1         4  
    ##  7     7       5       3         6  
    ##  8     8       6       4         7  
    ##  9     9       7       5         8  
    ## 10    10       7       5         9  
    ## 11    11       8       6         9  
    ## 12    12       9       7        10  
    ## 13    13       9       7        11  
    ## 14    14       9       7.75     11  
    ## 15    15      11       9        14  
    ## 16    16      10       9        14  
    ## 17    17      14.5    12.5      16.2
    ## 18    18      14      14        14  
    ## 19    19      17      17        17  
    ## 20    21      11      11        11

``` r
fl %>%
    group_by(genome) %>%
    summarize(n_asv = n(), n_rrn = sum(count), .groups = "drop") %>%
    ggplot(aes(x=n_rrn, y=n_asv)) + geom_smooth(method = "lm")
```

    ## `geom_smooth()` using formula = 'y ~ x'

![](2022-12-11_genome_sens_spec_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

Suprisingly (or not!) the number of ASVs increases at a rate of about 2
ASVs per 3 copies of *rrn* operon in the genome.

### Determine whether an ASV is unique to genomes they are found in

Instead of looking at the number of ASVs per genome, we want to see the
number of genomes per ASV

``` r
fl %>%
    group_by(asv) %>%
    summarize(n_genomes = n()) %>%
    count(n_genomes) %>%
    mutate(fraction = n/sum(n))
```

    ## # A tibble: 98 × 3
    ##    n_genomes     n fraction
    ##        <int> <int>    <dbl>
    ##  1         1 19247  0.824  
    ##  2         2  2037  0.0872 
    ##  3         3   675  0.0289 
    ##  4         4   354  0.0152 
    ##  5         5   234  0.0100 
    ##  6         6   116  0.00497
    ##  7         7    99  0.00424
    ##  8         8    71  0.00304
    ##  9         9    73  0.00312
    ## 10        10    44  0.00188
    ## # … with 88 more rows

We see that with full length sequences, thAT 82% of the ASVs were unique
to a genome.

### Do the sensitivity and specifity change if we look at a shorter region

We know that V4 region is less diverse thatn full length sequence. So
does the number of ASVs per genome differ than full length? Are ASVs as
specific when using the V4 region compared to full length sequences?

``` r
v_four <- read_tsv(here("data/v4/rrnDB.count_tibble"))

# What is the number of ASVs per genome
v_four %>%
    group_by(genome) %>%
    summarize(n_asv = n(), n_rrn = sum(count), .groups = "drop") %>%
    group_by(n_rrn) %>%
    summarize(mean_n_asv = mean(n_asv),
              lq_n_asv = quantile(n_asv, prob=0.25),
              uq_n_asv = quantile(n_asv, prob=0.75))
```

    ## # A tibble: 20 × 4
    ##    n_rrn mean_n_asv lq_n_asv uq_n_asv
    ##    <dbl>      <dbl>    <dbl>    <dbl>
    ##  1     1       1           1      1  
    ##  2     2       1.07        1      1  
    ##  3     3       1.08        1      1  
    ##  4     4       1.16        1      1  
    ##  5     5       1.34        1      2  
    ##  6     6       1.23        1      1  
    ##  7     7       1.37        1      1  
    ##  8     8       1.66        1      2  
    ##  9     9       1.53        1      2  
    ## 10    10       1.82        1      2  
    ## 11    11       2.01        1      2  
    ## 12    12       1.83        1      2  
    ## 13    13       1.90        1      2  
    ## 14    14       2.38        1      3  
    ## 15    15       2.65        1      3.5
    ## 16    16       1.6         1      2  
    ## 17    17       3.6         1      4  
    ## 18    18       2           2      2  
    ## 19    19       3           3      3  
    ## 20    21       1           1      1

``` r
v_four %>%
    group_by(genome) %>%
    summarize(n_asv = n(), n_rrn = sum(count), .groups = "drop") %>%
    ggplot(aes(x=n_rrn, y=n_asv)) + geom_smooth(method = "lm")
```

![](2022-12-11_genome_sens_spec_files/figure-gfm/read_v4-1.png)<!-- -->

The number of ASV per copy of *rrn* operon is lower than for full length
sequences. We find 1.5 ASV per 10 copies of the *rrn* operon.

Next, let’s look at the specifity of an ASV for a genome

``` r
v_four %>%
    group_by(asv) %>%
    summarize(n_genomes = n()) %>%
    count(n_genomes) %>%
    mutate(fraction = n/sum(n))
```

    ## # A tibble: 79 × 3
    ##    n_genomes     n fraction
    ##        <int> <int>    <dbl>
    ##  1         1  4581  0.758  
    ##  2         2   643  0.106  
    ##  3         3   257  0.0425 
    ##  4         4   118  0.0195 
    ##  5         5    81  0.0134 
    ##  6         6    49  0.00811
    ##  7         7    41  0.00678
    ##  8         8    29  0.00480
    ##  9         9    25  0.00414
    ## 10        10    23  0.00381
    ## # … with 69 more rows

We find that about 76% of ASVs using the V4 region were specific to a
genome.

### To be determined…

- Can we correct for over-representation?
- Consider analysis at species, genus, family, etc. levels
- Consider looking at more broad definition of an ASV
